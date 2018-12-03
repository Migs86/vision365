'use strict'
const Database = use('Database')
const Model = use('Model')

class Comment extends Model {

	user () {
	    return this.belongsTo('App/Models/User')
	}


	static CommentList(){
	 	const comments = Database
            .select('comments.*','users.username','posts.title as post_title')
            .table('comments')
            .leftJoin('users', 'users.id', 'comments.user_id')
            .leftJoin('posts', 'posts.id', 'comments.post_id')

	       return comments;
	}
	static DeleteComment(params)
	{
		const comment = Database
          .table('comments')
          .where('id', params.id)
          .delete()
          
          return comment;
	}
	static CommentListByPostId(id){
	 	const comments = Database
            .select('comments.*')
            .table('comments')
            .where('post_id', id)

	       return comments;
	}
	static CommentSubmit(data){
	 	const comments = Database
            .table('comments')
            .insert(data)

	       return comments;
	}
}

module.exports = Comment
