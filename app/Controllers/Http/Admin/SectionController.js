'use strict'
const Database = use('Database')
/**
 * Resourceful controller for interacting with sections
 */
class SectionController {
  /**
   * Show a list of all sections.
   * GET sections
   */
  async index ({ request, response, view }) {
    const sections  = await Database
            .table('sections')
            .select('sections.*' , 'courses.name as course_name')
            .leftJoin('courses', 'courses.id', 'sections.course_id')

           return view.render('admin.sections.index', {sections})
  }

  /**
   * Render a form to be used for creating a new section.
   * GET sections/create
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new section.
   * POST sections
   */
  async store ({ request, response }) {
  }

  /**
   * Display a single section.
   * GET sections/:id
   */
  async show ({ params, request, response, view }) {
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
  async update ({ params, request, response }) {
  }

  /**
   * Delete a section with id.
   * DELETE sections/:id
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = SectionController
