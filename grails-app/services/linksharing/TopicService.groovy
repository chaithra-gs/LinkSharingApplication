package linksharing

import Enums.Visibility
import grails.transaction.Transactional

@Transactional
class TopicService {

    def save(params,uemail) {

        String topicName = params.topicName
        Visibility visible=params.selection
        User u=User.findByEmail(uemail)


        Topic topic = new Topic(name:topicName,visibility: visible,createdBy:u)
        topic.save(flush:true,failOnError:true,validate:true)


    }
}
