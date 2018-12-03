'use strict'

const Database  = use('Database')
const Post      = use('App/Models/Post')
const Course    = use('App/Models/Course')
const Comment   = use('App/Models/Comment')
const Like      = use('App/Models/Like')
const Topic     = use('App/Models/Topic')
const Section   = use('App/Models/Section')

/**
 * Resourceful controller for interacting with courses
 */

class HomeController {
    /**
    * Show a list of all courses.
    * GET courses
    */

    async index ({ request, view }) {
        /**
         * Fetch all posts inside our database.
         *
         * ref: http://adonisjs.com/docs/4.1/lucid#_all
         */

        // return auth.user.profile_image
        // return ( auth.user.profile_image ) ? auth.user.profile_image : 'profile.png';

        const data = request.only(['v'])

        const posts = await Post
                .query().with('comments')
                .with('comments.user')
                .with('user.post')
                .with('likes.user')
                .with('likes', (builder) => {
                        builder.where('status', 1)
                        })
                .where((builder) => {
                    if (data.v) {
                        builder
                            .where('title', 'LIKE', '%' + data.v + '%') //.orWhere()
                    }
                })
                .orderBy('id', 'desc')
                .paginate(1, 20)
               
            // return posts.toJSON()

            const navigationCourses     = await Course.CourseListByStatus()
            const navigationSections    = await Section.SectionListByStatus()
            const navigationTopics      = await Topic.TopicListByStatus()
            const navigationData        = {navigationCourses,navigationSections,navigationTopics}
    
            //return    navigationData.navigationCourses
            return view.render('posts.index', { posts: posts.toJSON(), navigationData })
    }




    async index_new ({ params, request, view }) {

        const data = request.only(['v','course','section','topic','pageNumber'])
        const pageNumber = (data.pageNumber && data.pageNumber > 0)?data.pageNumber:'1';


        const posts = await Post
                .query().with('comments')
                .with('comments.user')
                .with('user.post')
                .with('likes.user')
                .with('likes', (builder) => {
                        builder.where('status', 1)
                        })
                .where((builder) => {
                    if (data.v) {
                        builder
                            .where('title', 'LIKE', '%' + data.v + '%') //.orWhere()
                    }
                })
                .where((builder) => {
                    if (data.course) {
                        builder
                            .where('course_id', data.course) //
                    }
                })
                .where((builder) => {
                    if (data.section) {
                        builder
                            .where('section_id', data.section) //
                    }
                })
                .where((builder) => {
                    if (data.topic) {
                        builder
                            .where('topic_id', data.topic) //
                    }
                })

                .orderBy('id', 'desc')
                .paginate(pageNumber , 3)
               
            //return posts.toJSON()
            
            data['nextPage'] = parseInt(pageNumber) + 1;

            // data['link'] = '?v='+ data.v +'&course='+data.course+'&section='+data.section+'&topic='+data.topic+'&pageNumber='+data['nextPage'];
            data['link'] = "?";

            if(data.v){
                data['link'] += "v="+ data.v;
            }else{
                data['link'] += "v=";
            }


            if(data.course){
                data['link'] += "&course="+ data.course;
            }else{
                data['link'] += "&course=";
            }

            if(data.section){
                data['link'] += "&section="+ data.course;
            }else{
                data['link'] += "&section=";
            }

            if(data.topic){
                data['link'] += "&topic="+ data.course;
            }else{
                data['link'] += "&topic=";
            }

            data['link'] += "&pageNumber="+ data['nextPage'];

            //return data;

            const navigationCourses     = await Course.CourseListByStatus()
            const navigationSections    = await Section.SectionListByStatus()
            const navigationTopics      = await Topic.TopicListByStatus()
            const navigationData        = {navigationCourses,navigationSections,navigationTopics}
    
            //return    navigationData.navigationCourses
            return view.render('posts.index_new', { posts: posts.toJSON(), navigationData, data  })
    }


    
    


    



    /**
    * Render a form to be used for creating a new course.
    * GET courses/create
    */
    async create ({ request, response, view }) {
        return view.render('admin.courses.create')
    }



    /**
    * Create/save a new course.
    * POST courses
    */
    async store ({ request, response,session }) {
        const data = request.only(['name', 'media_url', 'description'])
        const courseInsert = await Database
            .table('courses')
            .insert(data)
        if(courseInsert){
            session.flash({ notification: 'courses created successfully' })
            return response.redirect('/admin/courses/')
        }else{
            session.flash({ notification: 'Something went wrong' })
            return response.redirect('back')
        }
    }


    /**
     * Display a single course.
     * GET courses/:id
     */
    async showCourseNavigation ({ params, request, response, view }) {
        const navigationCourses = await Course.CourseListByStatus()
            return navigationCourses
        return view.render('layout.partials.navigation', {navigationCourses})
    }


    /**
     *
     *
     */
    async showSectionNavigation ({ params, request, response, view }) {
        const navigationSections = await Database
            .table('sections')
            .select('sections.name','sections.id')
            .where('status','1')
            .andWhere('sections.course_id', params.id)

        return navigationSections
    }




    async showTopicNavigation ({ params, request, response, view }) {
        const navigation = await Database
            .table('topics')
            .select('topics.name','topics.id')
            .where('status', '1')
            .andWhere('topics.section_id', params.id)
        return navigation
        // return view.render('admin.courses.view', {course})
    }




    /**
    * Render a form to update an existing course.
    * GET courses/:id/edit
    */
    async edit ({ params, request, response, view }) {

    }

    /**
    * Update course details.
    * PUT or PATCH courses/:id
    */
    async update ({ params, request, response,session }) {
        const data =request.only(['name', 'media_url', 'description'])
        
        const courseUpdate = await Database
            .table('courses')
            .where('id', params.id)
            .update(data)
      
        if(courseUpdate){
            session.flash({ notification: 'Course updated successfully' })
            return response.redirect('/admin/courses/')
        }else{
            session.flash({ notification: 'Something went wrong' })
            return response.redirect('back')
        }
    }


    /**
    * Update Status details.
    * PUT or PATCH courses/:id
    */
    async updateStatus ({ params, request, response }) {
        const data = request.only(['id', 'status','table'])
        //return data.status
        
        const updateStatus = await Database
            .table(data.table)
            .where('id', params.id)
            .update({ status: data.status})
    }

    /**
    * Delete a course with id.
    * DELETE courses/:id
    */
    async destroy ({ params, request, response ,session }) {
        const Deletesections = await Database
            .table('courses')
            .where('id', params.id)
            .delete()
        
        if(Deletesections){
            session.flash({ notification: 'Courses deleted successfully' })
            return response.redirect('/admin/courses/')
        }else{
            session.flash({ notification: 'Something went wrong' })
            return response.redirect('back')
        }
    }

    /**
    * 
    *
    */  
    async ComentOnPost({ params, request, response ,session , auth}){
        const data = request.only(['user_id', 'post_id','content'])
        const CommentSubmit = await Comment.CommentSubmit(data)
        
        if (CommentSubmit) {

            var response = '<li>';
            if(auth.user.profile_image == null ){
                response += '<span><img src="../images/profile.png"></span>';    
            }else{
                response += '<span><img src="../uploads/users_profile_images/'+ auth.user.profile_image +'"></span>';
            }
            response += '<div class="comment-wrap">'+
                    '<h4>'+ auth.user.username +'</h4>'+
                    '<p>'+ data.content +'</p>'+
                '</div>'+

                '<div class="action-btn-wrap">'+
                    '<a href="javascript:void(0);" class="toggle-action-btn"><i class="fa fa-ellipsis-v"></i></a>'+
                    '<ol>'+
                        '<li><a href="#" class="text-warning"><i class="fa fa-flag"></i></a></li>'+
                        '<li><a href="#" class="text-danger"><i class="fa fa-trash"></i></a></li>'+
                    '</ol>'+
                '</div>'+
            '</li>';
            return response;
        }else{
          return "false"
        }
    }


    /**
     * 
     * @param {user_id} param0
     * @param {post_id} param1
     */
    async LikeOnPost_org({ params, request, response ,session , auth}){
        let data = request.only(['user_id', 'post_id'])
        // return data 
        const likeCheck = await Like.LikeCheck(data)
        if(likeCheck)
        {
            if(likeCheck != "" && likeCheck.status==1){
                const likePost = await Like.LikeUpdate(data,0)
                return likeCheck
            }else if(likeCheck.status==0){
                const likePost = await Like.LikeUpdate(data,1)
                return likePost
            }
        }
        else{
            const likePost = await Like.LikeSubmit(data)
            return likePost
        }
    }



    /**
     * 
     */
    async LikeOnPost({ params, request, response ,session , auth, view }){
        let data = request.only(['user_id', 'post_id'])

        const likeCheck = await Like.LikeCheck(data)
        if(likeCheck)
        {
            if(likeCheck != "" && likeCheck.status==1){
                const likePost = await Like.LikeUpdate(data,0)
            }else if(likeCheck.status==0){
                const likePost = await Like.LikeUpdate(data,1)
            }
        }
        else{
            const likePost = await Like.LikeSubmit(data)
        }

        
        const posts = await Post
                .query()
                .with('user.post')
                .with('likes.user')
                .with('likes', (builder) => {
                        builder.where('status', 1)
                        })
                .where('id', data.post_id)
                .first()
        

        return view.render('posts.partials.post_like_row', { posts: posts.toJSON() })
    }


}

module.exports = HomeController