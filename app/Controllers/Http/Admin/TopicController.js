'use strict'
const Section = use('App/Models/Section')
const Topic = use('App/Models/Topic')
const Database = use('Database')
const { validateAll } = use('Validator')
/**
 * Resourceful controller for interacting with topics
 */
class TopicController {
	/**
	 * Show a list of all topics.
	 * GET topics
	 */
	async index ({ request, response, view }) {
		const topics  = await Topic.TopicList()
		return view.render('admin.topics.index', {topics})
	}

	/**
	 * Render a form to be used for creating a new topic.
	 * GET topics/create
	 */
	async create ({ request, response, view }) {
		const sections  = await Section.SectionList()
	return view.render('admin.topics.create',{sections})
	}

	/**
	 * Create/save a new topic.
	 * POST topics
	 */
	async store ({ request, response,session }) {
		const data = request.only(['name', 'description', 'section_id'])
		/**
		 * Validating our data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/validator
		 */
		const validation = await validateAll(data, {
		name: 'required',
		description: 'required',
		section_id:'required',
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


		const topicInsert = await Topic.StoreTopic(data)
		if(topicInsert){
			session.flash({ notification: 'Topic created successfully' })
			return response.redirect('/admin/topics/')
		}else{
			session.flash({ notification: 'Something went wrong' })
			return response.redirect('back')
		}
	}

	/**
	 * Display a single topic.
	 * GET topics/:id
	 */
	async show ({ params, request, response, view }) {
		const topics = await Topic.ShowTopic(params)
		const sections  = await Section.SectionList()
			return view.render('admin.topics.view', {topics,sections})
	}


	/**
	 * Render a form to update an existing topic.
	 * GET topics/:id/edit
	 */
	async edit ({ params, request, response, view }) {
	}

	/**
	 * Update topic details.
	 * PUT or PATCH topics/:id
	 */
	async update ({ params, request, response,session }) {
		const data =request.only(['name', 'section_id', 'description'])

			/**
		 * Validating our data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/validator
		 */
		const validation = await validateAll(data, {
			name: 'required',
			description: 'required',
			section_id:'required',
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


		const sectionUpdate = await Topic.UpdateTopic({params,data})

		if(sectionUpdate){
			session.flash({ notification: 'Topic updated successfully' })
			return response.redirect('/admin/topics/')
		}else{
			session.flash({ notification: 'Something went wrong' })
			return response.redirect('back')
		}

	}

	/**
	 * Delete a topic with id.
	 * DELETE topics/:id
	 */
	async destroy ({ params, request, response,session }) {
		const Deletesections = await Database
			.table('topics')
			.where('id', params.id)
			.delete()
			if(Deletesections){
			session.flash({ notification: 'Topic deleted successfully' })
			return response.redirect('/admin/topics/')
		}else{
			session.flash({ notification: 'Something went wrong' })
			return response.redirect('back')
		}
	}
  
}

module.exports = TopicController