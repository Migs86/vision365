'use strict'

const Model = use('Model')
const Database = use('Database')
class User extends Model {
	static boot() {
		super.boot()
		/**
		 * A hook to bash the user password before saving
		 * it to the database.
		 *
		 * Look at `app/Models/Hooks/User.js` file to
		 * check the hashPassword method
		 */
		this.addHook('beforeCreate', 'User.hashPassword')
	}
	post() {
		return this.hasOne('App/Models/Post')
	}
	likes() {
		return this.hasMany('App/Models/Like')
	}

	static getUser( email ){
		
		const users = Database
			.table('users')
			.where('email', email)
			.first()
		return users;
	}

	static getUserByToken( token ){
		const users = Database
			.table('users')
			.where('token', token)
			.first()
		return users;
	}


	static ShowUser(params) {
		const user = Database
			.table('users')
			.where('id', params.id)
			.first()

		return user;
	}

	static UpdateUser({ params, data }) {
		const users = Database
			.table('users')
			.where('id', params.id)
			.update(data)

		return users;
	}

	static random() {
		var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');
		var length = 8;
		var str = '';
		for (var i = 0; i < length; i++) {
			str += chars[Math.floor(Math.random() * chars.length)];
		}
		return str;
	}
}

module.exports = User
