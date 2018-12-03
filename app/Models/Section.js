'use strict'
const Database = use('Database')
const Model = use('Model')

class Section extends Model {

	static SectionList(){
	 	const sections = Database
            .table('sections')
            .select('sections.*' , 'courses.name as course_name')
            .leftJoin('courses', 'courses.id', 'sections.course_id')
	       return sections;
	}

	topics () {
		return this.belongsToMany('App/Model/Topic', 'id', 'section_id')
	}

	static SectionListByStatus(){
	 	const sections = Database
            .table('sections')
            .select('sections.name','sections.id')
            .where('status', '1')
	       return sections;
	}

	static StoreSection(data){
	 	const section = Database
	        .table('sections')
	        .insert(data)

	    return section;    
	}
	static ShowSection(params){
		const section = Database
            .table('sections')
            .select('sections.*')
            .where('id', params.id)
            .first()

        return section;    
	}
	static UpdateSection({params,data}){
		const section = Database
	      .table('sections')
	      .where('id', params.id)
	      .update(data)

	    return section;
	}
	static DeleteSection(params){
		const section = Database
          .table('sections')
          .where('id', params.id)
          .delete()

        return section;  
	}
}

module.exports = Section
