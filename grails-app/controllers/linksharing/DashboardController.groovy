package linksharing

class DashboardController {

    def userService

    def index() {
        //for getting session object name
        print session.name
        User user1 = User.findByEmail(session.name)
        println "This is username of the user who is logged in"+user1.username
        println "this is photo path"+user1.photo
        //for displaying subscriptions and topic count of particular user

        Integer count_topic = userService.topicCount(session.name)
        Integer count_subscribe = userService.subCount(session.name)

        println session.name

        List subscriptionLt=userService.subscriptions(session.name)
        print subscriptionLt

        List topicList=subscriptionLt*.topic

        List<Long>topicids = topicList.collect{it.id}

        List counts=userService.subscriptioncount(topicids)
        List resourcecount=userService.postscount(topicids)

        List trending=userService.trendtopics()

        User user =User.findByEmail(session.name)


        render(view: "dashboard" ,model : [user : user ,
                                           userdata: user1,
                                           count_topic : count_topic ,
                                           count_subscribe  : count_subscribe ,
                                           subscriptions : subscriptionLt,
                                           subscount:counts,
                                           resourcecount:resourcecount ,
                                           trending : trending])




    }

}
