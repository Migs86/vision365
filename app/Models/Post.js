'use strict'

const Model = use('Model')
const Database = use('Database')
class Post extends Model {

  comments () {
    return this.hasMany('App/Models/Comment')
  }

  user () {
    return this.belongsTo('App/Models/User')
  }

  likes () {
    return this.hasMany('App/Models/Like')
  }


  
}

module.exports = Post
