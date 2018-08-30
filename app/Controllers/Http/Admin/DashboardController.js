'use strict'

const User = use('App/Models/User')
const { validateAll } = use('Validator')

class DashboardController {

    /**
     * Login View
     *
     * @method GET
     */
    index ({ auth, view }) {
        let user = auth.user

        //return user
        return view.render('admin.dashboard', { user })
    }





}

module.exports = DashboardController