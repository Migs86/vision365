'use strict'
const Database = use('Database')
/**
 * Resourceful controller for interacting with topics
 */
class TopicController {
  /**
   * Show a list of all topics.
   * GET topics
   */
  async index ({ request, response, view }) {
      const topics  = await Database
            .table('topics')
            .select('topics.*' , 'sections.name as section_name')
            .leftJoin('sections', 'sections.id', 'topics.section_id')
            return view.render('admin.topics.index', {topics})
  }

  /**
   * Render a form to be used for creating a new topic.
   * GET topics/create
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new topic.
   * POST topics
   */
  async store ({ request, response }) {
  }

  /**
   * Display a single topic.
   * GET topics/:id
   */
  async show ({ params, request, response, view }) {
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
  async update ({ params, request, response }) {
  }

  /**
   * Delete a topic with id.
   * DELETE topics/:id
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = TopicController
