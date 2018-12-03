'use strict'

const User = use('App/Models/User')
const { validateAll } = use('Validator')
const Mail = use('Mail')
const Env = use('Env') 
const Course = use('App/Models/Course')
const Topic = use('App/Models/Topic')
const Section = use('App/Models/Section')
const Hash = use('Hash')
const crypto = use('crypto')
const Database = use('Database')

class UserController {

	create ({ view }) {
		/**
		 * Render the view 'user.create'.
		 *
		 * ref: http://adonisjs.com/docs/4.1/views
		 */
		return view.render('user.create')
	}


	async store ({ auth, session, request, response }) {
		/**
		 * Getting needed parameters.
		 *
		 * ref: http://adonisjs.com/docs/4.1/request#_only
		 */
		const data = request.only(['name','username', 'email', 'password', 'password_confirmation'])

		const profilePics = request.file('profile_image', {
			types: ['image'],
			size: '10mb'
		})
		//console.log(profilePics);
		var image_name = `${new Date().getTime()}.${profilePics.subtype}`
		await profilePics.move(('public/uploads/users_profile_images/'), {
				name: image_name
		})

		if (!profilePics.moved()) {
			return profilePics.errors()
		}else{
			
		}

		/**
		 * Validating our data.
		 *
		 * ref: http://adonisjs.com/docs/4.1/validator
		 */
		const validation = await validateAll(data, {
			name: 'required',
			username: 'required|unique:users',
			email: 'required|email|unique:users',
			password: 'required',
			password_confirmation: 'required_if:password|same:password',
			// profile_image: 'required',
		},{
			'username.unique': 'Username already exist.',
			'email.unique':'Email already exist.',
		})

		/**
		 * If validation fails, early returns with validation message.
		 */
		if (validation.fails()) {
			session
				.withErrors(validation.messages())
				.flashExcept(['password'])

			return response.redirect('back')
		}

		// Deleting the confirmation field since we don't
		// want to save it
		delete data.password_confirmation

		/**
		 * Creating a new user into the database.
		 *
		 * ref: http://adonisjs.com/docs/4.1/lucid#_create
		 */
		data['profile_image'] = image_name;

		const user = await User.create(data)
			/**
		 * Sending mail to a new user.
		 *
		 */
		await Mail.send('emails.welcome_mail', user.toJSON(), (message) => {
		message
			.to(user.email)
			.from(Env.get('ADMIN_MAIL'))
			.subject('Welcome to Vision 365')
		})
		// Authenticate the user
		await auth.login(user)
		return response.redirect('/')
	}

	/**
	 * Show Profile 
	 * @param {auth} param0
	 *  
	 */
	async profile ({ auth, view }) {

		const navigationCourses = await Course.CourseListByStatus()
		const navigationSections = await Section.SectionListByStatus()
		const navigationTopics = await Topic.TopicListByStatus()
		const navigationData = { navigationCourses, navigationSections, navigationTopics }
		
		return view.render('user.profile', { navigationData })
	}

	/**
	 * Change password 
	 * @method Get
	 * @return View
	 * 
	 */
	async changePassword ({ view }) {
		const navigationCourses = await Course.CourseListByStatus()
		const navigationSections = await Section.SectionListByStatus()
		const navigationTopics = await Topic.TopicListByStatus()
		const navigationData = { navigationCourses, navigationSections, navigationTopics }
		return view.render('user.change_password', { navigationData })
	}


	/**
	 * Change password 
	 * @method POST
	 * @return Boolean
	 * 
	 */
	async changePasswordSubmit({auth,request, response, session }){
		try {
			const data = request.only(['current_password','password', 'password_confirmation'])
			
			const validation = await validateAll(data, {
				current_password: 'required',
				password: 'required',
				password_confirmation: 'required_if:password|same:password',
			},
			{
				'current_password.required' : 'Current password is required.',
				'password.required': 'Password is required.',
				'password_confirmation.same': 'Password and confirm password does not matched.',

			})

			/**
			 * If validation fails, early returns with validation message.
			 */
			if (validation.fails()) {
				session
					.withErrors(validation.messages())
					.flashExcept(['password'])

				return response.redirect('back')
			}

			 // get currently authenticated user
			 const user = auth.current.user

			 // verify if current password matches
			 const verifyPassword = await Hash.verify(
				 request.input('current_password'),
				 user.password
			 )
		 
			 // display appropriate message
			 if (!verifyPassword) {
				session.flash({ type:'danger', error: 'Current password could not be verified! Please try again.' });
				return response.redirect('/changePassword')
			 }
		 
			 // hash and save new password
			 user.password = await Hash.make(request.input('password'))
			 await user.save()

			
		 
			
			session.flash({ type:'success', error: 'Password updated!' });
			return response.redirect('/changePassword')

		} catch (e) {
			session.flash({  type:'danger', error: e.message });
			return response.redirect('/changePassword')
		}
	}

	
	async forgotPassword({ view }){
		return view.render('user.forgot_password');
	}



	async forgotPasswordEmail({ request, view, response, session }){
		try {

			const data = request.only(['email'])
			
			const validation = await validateAll(data, {
				email: 'required|email|unique:users',
			});

			/**
			 * If validation fails, early returns with validation message.
			 */
			if (validation.fails()) {
				
				this._sendResetLink(data.email)				
				session.flash({  type:'success', error: 'Reset Password email sended to you . Check your email.' });

			}else{
				session.flash({  type:'danger', error: 'Email does not exist in system.' });
			}
			return response.redirect('back')
		} catch (e) {
			session.flash({  type:'danger', error: e.message });
			return response.redirect('back')
		}
	}



	async _sendResetLink (email) {
		const reset_token = await this.storeResetToken(email)
	
		if (reset_token.length) {

			  const user = await User.getUser(email);
			  const app_url = Env.get('APP_URL')

			await Mail.send('emails.forgot_password_email',{ user,app_url } , (message) => {
			message
				.to(user.email)
				.from(Env.get('ADMIN_MAIL'))
				.subject('Password Reset')
			});
		}
	  }
	
	  	async storeResetToken (email) {
			const random_str = crypto.randomBytes(20).toString('hex')
			const token1 = await Hash.make(random_str)
			const token = token1.replace('/', ''); 
			const reset_token = await User.findOrCreate({ email })
			
			reset_token.merge({ token })
			await reset_token.save()
		
			return random_str
	  	}




		/**
		 * 
		 * @param {*} param0 
		 */
		async resetPassword ({ params, response, view, session }) {
			try {
				const users  = await Database
									.table('users')
									.where('token', params.token)
									.first()
				if(users){
					return view.render('user.reset_password', {users});
				}
				
				session.flash({  type:'danger', error: 'Token invalid.' });
				return response.redirect('/login')

			} catch (e) {
				return 'here'+ e.message;
			}
		}
		  


		/**
		 * 
		 * @param 
		 */
		async resetPasswordSubmit({ request, session, response }) {
			try{
				const data = request.only(['password', 'password_confirmation', 'token'])
				
				//data.password = Hash.make(data.password)
				//return data.password

				const validation = await validateAll(data, {
					password: 'required',
					password_confirmation : 'required_if:password|same:password'
				});

				if (validation.fails()) {
					session
						.withErrors(validation.messages())
						.flashExcept(['password'])

					return response.redirect('back')
				}

				const user = await User.query().where('token', data.token).firstOrFail()
				user.password = await Hash.make(data.password)
				user.token = null

				if(await user.save()){

					this._sendResetPasswordEmail(user.email);

					session.flash({  type:'success', error: 'Reset password sucessfull. ' });
					return response.redirect('/login')

				}else{
					session.flash({  type:'danger', error: 'Something went wrong.' });
					return response.redirect('back');

				}
			} catch (e) {
				session.flash({  type:'danger', error: e.message });
				return response.redirect('back');
			}
		}




		async _sendResetPasswordEmail (email) {
			const user = await User.getUser(email);
			const app_url = Env.get('APP_URL')

			await Mail.send('emails.reset_password_email', { user, app_url } , (message) => {
				message
					.to(user.email)
					.from(Env.get('ADMIN_MAIL'))
					.subject('Password Reset Successfull')
				});
		}
		
		


		/**
		 * 
		 * @param {update profile} param0 
		 */
		async update ({ auth, session, request, response }) {

			try{

				const data = request.only(['name','username', 'email','profile_image','old_profile_image'])

				const profilePics = request.file('profile_image', {
					types: ['image'],
					size: '10mb'
				})

				if(profilePics.clientName){
					var image_name = `${new Date().getTime()}.${profilePics.subtype}`
					await profilePics.move(('public/uploads/users_profile_images/'), {
							name: image_name
					})
			
					if (!profilePics.moved()) {
						session.flash({  type:'success', error: 'image error.' });
						return response.redirect('back')
					}
				}else{
					var image_name = data.old_profile_image;
				}

				
				const validation = await validateAll(data, {
					name: 'required'
				})
		
				if (validation.fails()) {
					session
						.withErrors(validation.messages())
						.flashExcept(['password'])
						session.flash({  type:'success', error: 'name error.' });
					return response.redirect('back')
				}
		
				// Deleting the confirmation field since we don't
				// want to save it
				delete data.email
				delete data.username
				delete data.old_profile_image

				const user = await User.query().where('id', auth.user.id).firstOrFail()
				user.profile_image = image_name;
				user.name 		   = data.name;
				// await user.save()

				
				if(await user.save()){
					session.flash({  type:'success', error: 'updated' });
					return response.redirect('back')
				}else{
					session.flash({  type:'success', error: 'updated' });
					return response.redirect('back')
				}
				
				
			}catch(e){
				return e.messages;

			}
			
			
		}


}

module.exports = UserController