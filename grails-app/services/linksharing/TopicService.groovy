package linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def entryMethod(params,request,created) {

    String topicName = params.name
         topicCreated = created

        Topic topic = new Topic(name:'tname',visibilityId: 1)
        topic.save(flush:true,failOnError:true,validate:true)

    }
}
