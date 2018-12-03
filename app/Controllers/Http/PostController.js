'use strict'

const Helpers = use('Helpers')
const Database = use('Database')
const Post = use('App/Models/Post')
const Course = use('App/Models/Course')
const Topic = use('App/Models/Topic')
const Section = use('App/Models/Section')
const { validateAll } = use('Validator')

class PostController {
	async index({ view }) {
		/**
		 * Fetch all posts inside our database.
		 *
		 * ref: http://adonisjs.com/docs/4.1/lucid#_all
		 */
		const posts = await Post.all()


		/**
		 * Render the view 'posts.index'
		 * with the posts fetched as data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/views
		 */
		//return posts.toJSON()


		return view.render('posts.index', { posts: posts.toJSON() })
	}

	async create({ request, response, view }) {
		/**
		 * Render the view 'posts.create'.
		 *
		 * ref: http://adonisjs.com/docs/4.1/views
		 */
		const navigationCourses = await Course.CourseListByStatus()
		const navigationSections = await Section.SectionListByStatus()
		const navigationTopics = await Topic.TopicListByStatus()
		const navigationData = { navigationCourses, navigationSections, navigationTopics }
		return view.render('posts.create', { navigationData })
	}

	async store({ session, request, response }) {
		/**
		 * Getting needed parameters.
		 *
		 * ref: http://adonisjs.com/docs/4.1/request#_only
		 */

		const data = request.only(['title', 'body', 'course_id', 'section_id', 'topic_id', 'user_id'])

		const profilePics = request.file('post_image', {
			types: ['image'],
			size: '10mb'
		})
		var image_name = `${new Date().getTime()}.${profilePics.subtype}`
		await profilePics.move(('public/uploads/posts/'), {
			name: image_name
		})

		if (!profilePics.moved()) {
			return profilePics.errors()
		} else {

		}

		//return data
		/**
		 * Validating our data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/validator
		 */
		const validation = await validateAll(data, {
			title: 'required',
			body: 'required',
			course_id: 'required',
			section_id: 'required',
			topic_id: 'required',
		})

		/**
		 * If validation fails, early returns with validation message.
		 */
		if (validation.fails()) {
			session
				.withErrors(validation.messages())
				.flashAll()

			return response.redirect('back')
		}

		data['post_image'] = image_name;
		/**
		 * Creating a new post into the database.
		 *
		 * ref: http://adonisjs.com/docs/4.1/lucid#_create
		 */
		console.log(data);
		await Post.create(data)

		return response.redirect('/')
	}

	async edit({ params, view, auth }) {
		try {
			const post = await Post.findOrFail(params.id)

			if (post.user_id != auth.user.id) {
				return "invalid request.";
			}
			
			const navigationCourses = await Course.CourseListByStatus()
			const navigationSections = await Section.SectionListByStatus()
			const navigationTopics = await Topic.TopicListByStatus()
			const navigationData = { navigationCourses, navigationSections, navigationTopics }

			return view.render('posts.edit', { post: post.toJSON(), navigationData })
		} catch (error) {
			return error.message

		}

	}




	async update({ params, session, request, response }) {
		/**
		 * Getting needed parameters.
		 *
		 * ref: http://adonisjs.com/docs/4.1/request#_only
		 */
		const data = request.only(['title', 'course_id','section_id','topic_id','body'])

		/**
		 * Validating our data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/validator
		 */
		const validation = await validateAll(data, {
			title: 'required',
			course_id: 'required',
			section_id: 'required',
			topic_id: 'required',
			body: 'required',
		})

		/**
		 * If validation fails, early returns with validation message.
		 */
		if (validation.fails()) {
			session
				.withErrors(validation.messages())
				.flashAll()

			return response.redirect('back')
		}

		/**
		 * Finding the post and updating fields on it
		 * before saving it to the database.
		 *
		 * ref: http://adonisjs.com/docs/4.1/lucid#_inserts_updates
		 */
		const post = await Post.findOrFail(params.id)
		post.merge(data)
		await post.save()

		return response.redirect('/')
	}

	async delete({ params, response }) {
		/**
		 * Finding the post and deleting it
		 *
		 * ref: http://adonisjs.com/docs/4.1/lucid#_deletes
		 */
		const post = await Post.findOrFail(params.id)
		await post.delete()

		return response.redirect('/')
	}
}

module.exports = PostController