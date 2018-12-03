'use strict'
const Database = use('Database')
const Model = use('Model')

class Topic extends Model {

	static TopicList(){
	 	const topics = Database
            .table('topics')
            .select('topics.*' , 'sections.name as section_name')
            .leftJoin('sections', 'sections.id', 'topics.section_id')
	       return topics;
	}

	static TopicListByStatus(){
	 	const topics = Database
            .table('topics')
            .select('topics.name','topics.id')
            .where('status', '1')
	       return topics;
	}

	static StoreTopic(data){
	 	const topic = Database
        .table('topics')
        .insert(data)

	    return topic;    
	}
	static ShowTopic(params){
		const topic = Database
            .table('topics')
            .select('topics.*')
            .where('id', params.id)
            .first()

        return topic;    
	}
	static UpdateTopic({params,data}){
		const topic = Database
				      .table('topics')
				      .where('id', params.id)
				      .update(data)
				      
	    return topic;
	}
	static DeleteTopic(params){
		const topic = Database
			          .table('topics')
			          .where('id', params.id)
			          .delete()
			   
        return topic;  
	}
}

module.exports = Topic
