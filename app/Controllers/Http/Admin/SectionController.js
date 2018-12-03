'use strict'
const Section = use('App/Models/Section')
const Course = use('App/Models/Course')
const Database = use('Database')
const { validateAll } = use('Validator')
/**
 * Resourceful controller for interacting with sections
 */
class SectionController {
  /**
   * Show a list of all sections.
   * GET sections
   */
  async index ({ request, response, view }) {

    const sections  = await Section.SectionList()

    return view.render('admin.sections.index', {sections})
  }

  /**
   * Render a form to be used for creating a new section.
   * GET sections/create
   */
  async create ({ request, response, view }) {
    const courses  = await Course.CourseList()
   return view.render('admin.sections.create',{courses})

  }

  /**
   * Create/save a new section.
   * POST sections
   */
  async store ({ request, response,session }) {
    const data = request.only(['name', 'course_id', 'description'])
    /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
      description: 'required',
      course_id:'required',
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
    const sectionInsert = await Section.StoreSection(data)
       if(sectionInsert){
        session.flash({ notification: 'Section created successfully' })
        return response.redirect('/admin/sections/')
       }else{
        session.flash({ notification: 'Something went wrong' })
        return response.redirect('back')
       }
    }

  /**
   * Display a single section.
   * GET sections/:id
   */
  async show ({ params, request, response, view }) {
     const section = await Section.ShowSection(params)
       const courses  = await Course.CourseList()     
      return view.render('admin.sections.view',{section,courses})

  }

  /**
   * Render a form to update an existing section.
   * GET sections/:id/edit
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update section details.
   * PUT or PATCH sections/:id
   */
  async update ({ params, request, response,session }) {
     const data =request.only(['name', 'course_id', 'description'])
      /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
      description: 'required',
      course_id:'required',
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

      const sectionUpdate = await Section.UpdateSection({params,data}) 

      if(sectionUpdate){
        session.flash({ notification: 'Section updated successfully' })
        return response.redirect('/admin/sections/')
       }else{
        session.flash({ notification: 'Something went wrong' })
        return response.redirect('back')
       }

  }


  /**
   * Delete a section with id.
   * DELETE sections/:id
   */
  async destroy ({ params, request, response,session }) {
    const Deletesections = await Section.DeleteSection(params)
        if(Deletesections){
        session.flash({ notification: 'Section deleted successfully' })
        return response.redirect('/admin/sections/')
       }else{
        session.flash({ notification: 'Something went wrong' })
        return response.redirect('back')
       }
  }
}

module.exports = SectionController
