'use strict'
const Database = use('Database')
const User = use('App/Models/User')
const Mail = use('Mail')
const { validateAll } = use('Validator')
const Env = use('Env')

class AdminUserController {
  async index ({ view }) {
    /**
     * Render the view 'admin.user.listUser'.
     *
     * ref: http://adonisjs.com/docs/4.1/views
     */
    return view.render('admin.login')
  }

  async createUser ({ view }) {
    /**
     * Render the view 'user.create'.
     *
     * ref: http://adonisjs.com/docs/4.1/views
     */
    return view.render('admin.user.create')
  }

  async store ({ auth, session, request, response }) {
    /**
     * Getting needed parameters.
     *
     * ref: http://adonisjs.com/docs/4.1/request#_only
     */
    const data = request.only(['name','username', 'email', 'password'])
    
    const profilePics = request.file('profile_image', {
    types: ['image'],
    size: '10mb'
    })
    /*console.log(profilePics);*/
     var image_name = `${new Date().getTime()}.${profilePics.subtype}`
     await profilePics.move(('public/uploads/users_profile_images/'), {
        name: image_name
     })

     if (!profilePics.moved()) {
        return profilePics.errors()
     }
     var password = User.random()
    /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
      username: 'required|unique:users',
      email: 'required|email|unique:users',
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

   /* // Deleting the confirmation field since we don't
    // want to save it
    delete data.password_confirmation*/
    
    /**
     * Creating a new user into the database.
     *
     * ref: http://adonisjs.com/docs/4.1/lucid#_create
     */
     data.password = password
     /*return data*/
    const user = await User.create(data)
    /**
     * Sending mail to a new user.
     *
     */
     var dcryptPassword = password
     
    await Mail.send('emails.NewUserMail', data,(message) => {
      message
        .to(user.email) 
        .from(Env.get('ADMIN_MAIL'))
        .subject('Welcome to Vision 365')
    })
    // Authenticate the user
    /*await auth.login(user)*/

    return response.redirect('user/listing')
  }

  async userList ({view}){
    const users  = await Database
      .table('users')
      .where('role_type', 2)
      return view.render('admin.user.listUser', { users: users })
  }

  async edit({ params, request, response, view }) {
     const user = await User.ShowUser(params)
    return view.render('admin.user.edit',{ user: user })
  }

  async update ({ params, request, response,session }) {
    /**
     * Getting needed parameters.
     *
     * ref: http://adonisjs.com/docs/4.1/request#_only
     */
    const data = request.only(['name', 'password'])
    
    const profilePics = request.file('profile_image', {
    types: ['image'],
    size: '10mb'
    })
    /*console.log(profilePics);*/
     var image_name = `${new Date().getTime()}.${profilePics.subtype}`
     await profilePics.move(('public/uploads/users_profile_images/'), {
        name: image_name
     })

     if (!profilePics.moved()) {
        return profilePics.errors()
     }
     var userId = params.id
     
    /**
     * Validating our data.
     *
     * ref: http://adonisjs.com/docs/4.1/validator
     */
    const validation = await validateAll(data, {
      name: 'required',
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

   /* // Deleting the confirmation field since we don't
    // want to save it
    delete data.password_confirmation*/
    
    /**
     * Creating a new user into the database.
     *
     * ref: http://adonisjs.com/docs/4.1/lucid#_create
     */
     
    // Authenticate the user
    /*await auth.login(user)*/

    const sectionUpdate = await User.UpdateUser({params,data})

    if(sectionUpdate){
      session.flash({ notification: 'User updated successfully' })
      return response.redirect('/admin/user/listing')
     }else{
      session.flash({ notification: 'Something went wrong' })
      return response.redirect('back')
     }
  }
}

module.exports = AdminUserController