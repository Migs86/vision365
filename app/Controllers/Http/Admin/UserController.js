'use strict'
const Database = use('Database')
const User = use('App/Models/User')
const { validateAll } = use('Validator')

class UserController {

    /**
     * Login View
     *
     * @method GET
     */
    login ({ view }) {
        return view.render('admin.login')
    }


    /**
     *
     *
     */
    async authenticate ({ auth, request, response, session }) {
        /**
         * Getting needed parameters.
         *
         * ref: http://adonisjs.com/docs/4.0/request#_all
         */
        const { username, password, role_type } = request.all()

        /**
         * Wrapping the authentication in order to
         * handle errors when authentication fail.
         *
         * ref: http://adonisjs.com/docs/4.1/authentication#_attempt_uid_password
         */
        try {
            // console.log( username, password, role_type );


            await auth.attempt(username, password,role_type)
        } catch (e) {
              /**
               * Add flash message to the session with the content of
               * the form except password field.
               *
               * ref: http://adonisjs.com/docs/4.1/sessions#_flash_messages
               */
              session.flashExcept(['password'])

              /**
               * Add a custom object to the session store.
               *
               * ref: http://adonisjs.com/docs/4.1/sessions#_flash
               */
              session.flash({ error: 'We cannot find any account with these credentials.' })

              /**
               * Since the authentication failed we redirect
               * our user back to the form.
               *
               * ref: http://adonisjs.com/docs/4.1/response#_redirects
               */
            return response.redirect('/admin/login')
        }

        /**
         * We are authenticated.
         */

        return response.redirect('/admin/dashboard')
      }



      /**
       * User Listing
       *
       */

    async listing ({auth,view,session}){
        const users  = await Database
            .table('users')
            .where('role_type', 2)
        return view.render('admin.user.listUser', { users: users })
    }
/* Delete user 

*/
     async deleteUser ({ params,request, response ,session}){
          const id = params.id
          const users  = await Database
            .table('users')
            .where('id', id)
            .delete()
            await session.flash({ notification: 'user deleted successful!' })
          return response.redirect('user/listing')
    }

  async addUser({params,request, response ,session}){
     return request.name
  }  
}

module.exports = UserController