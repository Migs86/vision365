'use strict'
const Database = use('Database')
/**
 * Resourceful controller for interacting with followers
 */
class FollowerController {
  /**
   * Show a list of all followers.
   * GET followers
   */
  async index ({ request, response, view }) {
    
    const followers  = await Database
            .table('followers')
          return view.render('admin.followers.index', {followers})
  }

  /**
   * Render a form to be used for creating a new follower.
   * GET followers/create
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new follower.
   * POST followers
   */
  async store ({ request, response }) {
  }

  /**
   * Display a single follower.
   * GET followers/:id
   */
  async show ({ params, request, response, view }) {
  }

  /**
   * Render a form to update an existing follower.
   * GET followers/:id/edit
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update follower details.
   * PUT or PATCH followers/:id
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a follower with id.
   * DELETE followers/:id
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = FollowerController
