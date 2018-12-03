'use strict'

const Model = use('Model')
const Database = use('Database')


class Like extends Model {
  
static LikeSubmit(data){
	 	const Like = Database
            .table('likes')
            .insert(data)

	       return Like;
	}

static LikeCheck(data){
	//return data.user_id
	 	const Like = Database
            .table('likes')
            .select("*")
            .where('user_id',data.user_id)
            .where('post_id',data.post_id)
            .first()
	       return Like
	}

	static LikeUpdate(data,status){
	 	const Like = Database
            .table('likes')
            .where('user_id',data.user_id)
            .where('post_id',data.post_id)
            .update('status',status)
	       return Like;
	}

	user () {
    	return this.belongsTo('App/Models/User')
  	}
}

module.exports = Like
