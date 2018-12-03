'use strict'
const Course = use('App/Models/Course')
const Database = use('Database')
const { validateAll } = use('Validator')
/**
 * Resourceful controller for interacting with courses
 */
class CourseController {
  /**
   * Show a list of all courses.
   * GET courses
   */
  async index ({ request, response, view }) {
     const courses  = await Course.CourseList()
           return view.render('admin.courses.index', {courses})
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
    /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
      description: 'required',
      media_url:'required',
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

     const courseInsert = await Course.StoreCourse(data)
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
  async show ({ params, request, response, view }) {
     const course = await Course.ShowCourse(params)
           return view.render('admin.courses.view', {course})
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
      /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
      description: 'required',
      media_url:'required',
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

      const courseUpdate = await Course.UpdateCourse({params,data})
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
    const Deletesections = await Course.DeleteCourse(params)
        if(Deletesections){
        session.flash({ notification: 'Courses deleted successfully' })
        return response.redirect('/admin/courses/')
       }else{
        session.flash({ notification: 'Something went wrong' })
        return response.redirect('back')
       }
  }
}

module.exports = CourseController
