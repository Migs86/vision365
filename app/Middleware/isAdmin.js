'use strict'

class isAdmin {
  async handle ({ auth, request, response }, next) {
    /**
     * Verify if we are logged in.
     *
     * ref: http://adonisjs.com/docs/4.0/authentication#_check
     */
    try {
      await auth.check()

      let user =  auth.user;

      if(user.role_type == 1){
      	return await next()
      }
      return response.redirect('/admin/login')

    } catch (e) {
    	console.log('here not login');
    	return response.redirect('/admin/login')

    }
    //await next()
  }
}

module.exports = isAdmin
