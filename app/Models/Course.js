'use strict'
const Database = use('Database')
const Model = use('Model')

class Course extends Model {

	static CourseList(){
	 	const courses  = Database
	            .table('courses')
	            .select('courses.*');
	       return courses;
	}

	static CourseListByStatus(){
	 	const courses  = Database
            .table('courses')
            .select('courses.name','courses.id')
            .where('status', '1')
	       return courses;
	}

	static CourseListWithId()
	{
		const courses = Database
            .table('courses')
            .select('courses.name','courses.id')
        return courses;
	}
	static StoreCourse(data){
	 	const course = Database
	        .table('courses')
	        .insert(data)
	    return course;    
	}
	static ShowCourse(params){
		const course = Database
            .table('courses')
            .select('courses.*')
            .where('id', params.id)
            .first()

        return course;    
	}
	static UpdateCourse({params,data}){
		const course = Database
	      .table('courses')
	      .where('id', params.id)
	      .update(data)

	    return course;
	}
	static DeleteCourse(params){
		const course = Database
          .table('courses')
          .where('id', params.id)
          .delete()

        return course;  
	}
}

module.exports = Course
