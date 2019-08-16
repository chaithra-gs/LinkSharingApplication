package linksharing

import Enums.Visibility

class profileShowService {
    def topicsList(sessionname){
        User user1 = User.findByEmail(sessionname)
        List interTopic = Topic.createCriteria().list{
            eq('visibility', Visibility.PUBLIC)
            eq("createdBy.id", user1.id)
        }
        return interTopic
    }
    def allTopics(sessionname){
        User user1 = User.findByEmail(sessionname)
        List interTopic = Topic.createCriteria().list{
            eq("createdBy.id", user1.id)
        }
        return interTopic

    }

}
