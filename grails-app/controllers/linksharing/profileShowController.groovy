package linksharing

class profileShowController {
    def userService
    def profileShowService
    def showData() {
        if (!session.name) {
            render("please login first")
        } else {
            List subscriptionLt = userService.subscriptions(session.name)
            User user1 = User.findByEmail(session.name)
            Integer count_topic = userService.topicCount(session.name)
            Integer count_subscribe = userService.subCount(session.name)
            List<Resource> resource = Resource.createCriteria().list {
                eq("user.id", user1.id)
            }

            List topicsList = profileShowService.topicsList(session.name)
            List subs1=[]
          if(topicsList){
               subs1 = userService.topTopicSubs(topicsList)

          }

            List topic1 = userService.topTopicsPosts(topicsList)
            List allTopics=profileShowService.allTopics(session.name)
            List allsubs1 = userService.topTopicSubs(allTopics)
            List alltopics1 = userService.topTopicsPosts(allTopics)




            render(view: "profileShow", model: [userdata: user1,
                                                subscriptions: subscriptionLt,
                                                count_topic: count_topic,
                                                count_subscribe: count_subscribe,
                                                resources:resource,
                                                 topics:topicsList,
                    topic1:topic1,
                    subs1:subs1,
                    allTopics:allTopics,
                    allSubs1:allsubs1,
                    allTopics1:alltopics1
            ])
        }
    }
}
