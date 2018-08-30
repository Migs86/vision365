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

Route.get('/', 'PostController.index')
// Route.get('logout', 'SessionController.delete')

// Those routes should be only accessible
// when you are not logged in
Route.group(() => {
  Route.get('login', 'SessionController.create')
  Route.post('login', 'SessionController.store')

  Route.get('register', 'UserController.create')
  Route.get('test', 'UserController.test')
  Route.post('register', 'UserController.store')
}).middleware(['guest'])





// Those routes should be only accessible
// when you are logged in
Route.group(() => {
  Route.get('logout', 'SessionController.delete')
  Route.get('posts/create', 'PostController.create')
  Route.post('posts', 'PostController.store')
  Route.get('posts/:id/edit', 'PostController.edit')
  Route.get('posts/:id/delete', 'PostController.delete')
  Route.put('posts/:id', 'PostController.update')

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


    Route.resource('/posts', 'Admin/PostController');
    Route.resource('/sections', 'Admin/SectionController').middleware(['isAdmin']);
    Route.resource('/topics', 'Admin/TopicController').middleware(['isAdmin']);

    Route.resource('/courses', 'Admin/CourseController').middleware(['isAdmin']);
    Route.resource('/courses/create', 'Admin/CourseController/create').middleware(['isAdmin']);
    
    Route.resource('/followers', 'Admin/FollowerController').middleware(['isAdmin']);
    Route.resource('/likes', 'Admin/LikesController').middleware(['isAdmin']);
    Route.resource('/settings', 'Admin/SettingController').middleware(['isAdmin']);
    Route.resource('/reports', 'Admin/ReportController').middleware(['isAdmin']);
    

  })
  .prefix('admin')

//End admin controller routing


