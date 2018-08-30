'use strict'

class isUser {
  async handle ({ auth, request, response }, next) {
    /**
     * Verify if we are logged in.
     *
     * ref: http://adonisjs.com/docs/4.0/authentication#_check
     */
    try {
      await auth.check()

      let user =  auth.user;


      if(user.role_type == 2){
      	return await next()
      }

      // return response.redirect('/')

    } catch (e) {
    	//console.log('here not login'+ e);
    	return response.redirect('/')

    }
    await next()
  }
}

module.exports = isUser
