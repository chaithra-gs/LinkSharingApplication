package linksharing

class DashboardController {

        def userService
        def readingService

        def index() {
                if (!session.name) {
                        render("please login first")
                } else {
                        User user1 = User.findByEmail(session.name)

                        Integer count_topic = userService.topicCount(session.name)
                        Integer count_subscribe = userService.subCount(session.name)
                        List subscriptionLt = userService.subscriptions(session.name)
                        List topicList = subscriptionLt*.topic

                        List<Long> topicids = topicList.collect { it.id }

                        List counts = userService.subscriptioncount(topicids)
                        List resourcecount = userService.postscount(topicids)

                        List trending = userService.trendtopics()

                        User user = User.findByEmail(session.name)


                        List topic1 = userService.topTopicsPosts(trending)
                        List subs1 = userService.topTopicSubs(trending)

                        List resources = readingService.displayunread(session.name)

                        render(view: "dashboard", model: [user           : user,
                                                          userdata       : user1,
                                                          count_topic    : count_topic,
                                                          count_subscribe: count_subscribe,
                                                          subscriptions  : subscriptionLt,
                                                          subscount      : counts,
                                                          resourcecount  : resourcecount,
                                                          trending       : trending,
                                                          topic1         : topic1,
                                                          subs1          : subs1,
                                                          resources      : resources])



                }

        }
}
