'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.0/routing
|
*/

const Route = use('Route')

Route.get('/sds', 'PostController.index')
// Route.get('logout', 'SessionController.delete')

// Those routes should be only accessible
// when you are not logged in
Route.group(() => {
  Route.get('login', 'SessionController.create')
  Route.post('login', 'SessionController.store')

  Route.get('register', 'UserController.create')
  Route.get('test', 'UserController.test')
  Route.post('register', 'UserController.store')

  Route.get('forgotPassword', 'UserController.forgotPassword')
  Route.post('forgotPassword', 'UserController.forgotPasswordEmail')

  Route.get('resetPassword/:token', 'UserController.resetPassword')
  
  Route.post('resetPassword', 'UserController.resetPasswordSubmit')


}).middleware(['guest'])


// Those routes should be all accessibleshow
/*Start Side bar Route Front end*/
  Route.get('/', 'HomeController.index')
  Route.get('showCourseNavigation', 'HomeController.showCourseNavigation')
  Route.get('showSectionNavigation/:id', 'HomeController.showSectionNavigation')
  Route.get('showTopicNavigation/:id', 'HomeController.showTopicNavigation')
/*End Side bar Route Front end*/

///end Route   


// for infintie sroll testing
Route.get('/index_new/', 'HomeController.index_new')
Route.get('/index_new/:page', 'HomeController.index_new')



// Those routes should be only accessible
// when you are logged in
Route.group(() => {

  Route.get('logout', 'SessionController.delete')

  /*Post Route start*/
  Route.get('posts/create', 'PostController.create')
  Route.post('posts', 'PostController.store')
  Route.get('posts/:id/edit', 'PostController.edit')
  Route.get('posts/:id/delete', 'PostController.delete')
  Route.put('posts/:id', 'PostController.update')
  Route.post('ComentOnPost', 'HomeController.ComentOnPost')
  Route.get('LikeOnPost', 'HomeController.LikeOnPost')
  /*Post Route END*/


  Route.get('profile', 'UserController.profile')

  Route.get('changePassword', 'UserController.changePassword')

  Route.get('settings/password', 'UserController.changePassword')
  Route.get('settings/profile', 'UserController.profile')
  Route.post('settings/profile', 'UserController.update')

  Route.post('changePassword', 'UserController.changePasswordSubmit')

}).middleware(['auth'])




//Admin Routing

// Route.group('admin', function () {
//  Route.get('loginView', 'AdminUserController.index')
//  Route.post('adminLogin', 'SessionController.adminLogin')
// }).middleware(['guest'])




Route.group(() => {

    Route.get('logout', 'SessionController.delete')


    Route.get('login', 'Admin/UserController.login').middleware(['guest']);
   // Route.post('adminLogin', 'SessionController.adminLogin')
    Route.post('authenticate', 'Admin/UserController.authenticate');

    // admin logged in user access
    Route.get('/', 'Admin/DashboardController.index').middleware(['isAdmin']);
    Route.get('/dashboard', 'Admin/DashboardController.index').middleware(['isAdmin']);

    // user listing
    Route.get('user/listing', 'Admin/UserController.listing').middleware(['isAdmin']);
    Route.get('userDelete/:id', 'Admin/UserController.deleteUser').middleware(['isAdmin']);
    Route.get('/userCreate', 'AdminUserController.createUser').middleware(['isAdmin']);
    Route.post('/userStore', 'AdminUserController.store').middleware(['isAdmin']);
    Route.get('userEdit/:id','AdminUserController.edit').middleware(['isAdmin']);
    Route.post('userUpdate/:id','AdminUserController.update').middleware(['isAdmin']);

    Route.resource('/posts', 'Admin/PostController');
     /*start Section Route*/
    Route.resource('/sections', 'Admin/SectionController').middleware(['isAdmin']);
    Route.get('/addSectionCreate', 'Admin/SectionController.create').middleware(['isAdmin']);
    Route.post('/sectionStore', 'Admin/SectionController.store').middleware(['isAdmin']);
    Route.get('/viewSection/:id', 'Admin/SectionController.show').middleware(['isAdmin']);
     Route.post('/updateSection/:id', 'Admin/SectionController.update').middleware(['isAdmin']);
    Route.get('/sectionDestroy/:id', 'Admin/SectionController.destroy').middleware(['isAdmin']);
    /*End Section route*/
    /*start Topic route*/
    Route.resource('/topics', 'Admin/TopicController').middleware(['isAdmin']);
    Route.get('/topicsCreate', 'Admin/TopicController.create').middleware(['isAdmin']);
    Route.post('/topicStore', 'Admin/TopicController.store').middleware(['isAdmin']);
    Route.get('/viewTopic/:id', 'Admin/TopicController.show').middleware(['isAdmin']);
    Route.post('/updateTopic/:id', 'Admin/TopicController.update').middleware(['isAdmin']);
    Route.get('/topicDestroy/:id', 'Admin/TopicController.destroy').middleware(['isAdmin']);
    /*End Topic rout*/

    /*start Course Routing */
    Route.resource('/courses', 'Admin/CourseController')
    Route.post('/courseStore', 'Admin/CourseController.store').middleware(['isAdmin']);
    Route.resource('/courses/create', 'Admin/CourseController/create').middleware(['isAdmin']);
    Route.get('/updateStatus/:id', 'Admin/CourseController.updateStatus').middleware(['isAdmin']);
    Route.post('/updateCourse/:id', 'Admin/CourseController.update').middleware(['isAdmin']);
    Route.get('/viewCourse/:id', 'Admin/CourseController.show').middleware(['isAdmin']);
    Route.get('/courseDestroy/:id', 'Admin/CourseController.destroy').middleware(['isAdmin']);
    /*End Course Routing*/

    /*Start Comments*/
     Route.resource('/comments', 'Admin/CommentController')
      Route.get('/commentDestroy/:id', 'Admin/CommentController.destroy').middleware(['isAdmin']);
    /*End  Comments*/
    
    Route.resource('/followers', 'Admin/FollowerController').middleware(['isAdmin']);
    Route.resource('/likes', 'Admin/LikesController').middleware(['isAdmin']);
    Route.resource('/settings', 'Admin/SettingController').middleware(['isAdmin']);
    Route.resource('/reports', 'Admin/ReportController').middleware(['isAdmin']);
    

  })
  .prefix('admin')

//End admin controller routing


