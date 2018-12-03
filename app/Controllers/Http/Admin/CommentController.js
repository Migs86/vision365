'use strict'
const Comment = use('App/Models/Comment')
const Database = use('Database')
/**
 * Resourceful controller for interacting with topics
 */
class CommentController {
  /**
   * Show a list of all topics.
   * GET topics
   */
  async index ({ request, response, view }) {
      const comments  = await Comment.CommentList()
        
      return view.render('admin.comments.index', {comments})
  }

 


  /**
   * Display a single Comments.
   * GET Comments/:id
   */
  async show ({ params, request, response, view }) {
  }

  /**
   * Render a form to update an existing topic.
   * GET Comments/:id/edit
   */
  async edit ({ params, request, response, view }) {
  }

  /**
   * Update Comments details.
   * PUT or PATCH Comments/:id
   */
  async update ({ params, request, response }) {
  }

  /**
   * Delete a Comments with id.
   * DELETE Comments/:id
   */
  async destroy ({ params, request, response,session }) {
    const deleteComments  = await Comment.DeleteComment(params)
    
        if(deleteComments){
        session.flash({ notification: 'Comments deleted successfully' })
        return response.redirect('/admin/comments/')
       }else{
        session.flash({ notification: 'Something went wrong' })
        return response.redirect('back')
       }
  }
  
}

module.exports = CommentController
