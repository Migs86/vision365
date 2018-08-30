'use strict'

/**
 * Resourceful controller for interacting with settings
 */
class SettingController {
  /**
   * Show a list of all settings.
   * GET settings
   */
  async index ({ request, response, view }) {
  }

  /**
   * Render a form to be used for creating a new setting.
   * GET settings/create
   */
  async create ({ request, response, view }) {
  }

  /**
   * Create/save a new setting.
   * POST settings
   */
  async store ({ request, response }) {
  }

  /**
   * Display a single setting.
   * GET settings/:id
   */
  async show ({ params, request, response, view }) {
  }

  /**
   * Render a form to update an existing setting.
   * GET settings/:id/edit
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update setting details.
   * PUT or PATCH settings/:id
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a setting with id.
   * DELETE settings/:id
   */
  async destroy ({ params, request, response }) {
  }
}

module.exports = SettingController
