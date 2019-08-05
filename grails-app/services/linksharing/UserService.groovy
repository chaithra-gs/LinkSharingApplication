package linksharing

import Enums.Visibility
import grails.transaction.Transactional

@Transactional
class UserService {
    def topicCount(String name)
    {
        User user=User.findByEmail(name)
        Integer count_topic = user?.topics?.size()
    }
    def subCount(String name) {
        User user = User.findByEmail(name)
        Integer count_subscribe = user?.subscribedTo?.size()
    }

// List of subscriptions and trending topics
    def subscriptions(String name) {
        User user =User.findByEmail(name)

        List<Long> subscriptionList = Subscription.createCriteria().list(/*max:5*/){
            eq("user.id",user.id)
        }
        subscriptionList.sort{b,a-> a.topic.lastUpdated<=>b.topic.lastUpdated}
        return subscriptionList

    }

    def subscriptioncount(List topicids) {
        if (topicids) {
            def topiccounts = Subscription.createCriteria().list()
                    {
                        projections {
                            count('topic.id')
                            groupProperty('topic.id')
                            // countDistinct('topic.id')
                        }
                        'topic' {
                            inList('id', topicids)
                        }
                    }
            List<Integer> counts = topicids.collect { x ->
                topiccounts.find {
                    if (it.getAt(1) == x)
                        return it.getAt(0)
                    else {
                        return 0
                    }
                }

            }.collect {
                if (!it) {
                    return 0
                } else {
                    return it.getAt(0)
                }
            }
            return counts

        }
    }
    // for displaying topic  which has more resources as a trending topic


    def postscount(List topicids)
    {
        if(topicids) {

            def rescounts = Resource.createCriteria().list()
                    {
                        projections {
                            count('topic.id')
                            groupProperty('topic.id')
                            // countDistinct('topic.id')
                        }
                        'topic' {
                            inList('id', topicids)
                        }
                    }

            List<Integer> resourcecount = topicids.collect { x ->
                rescounts.find {

                    if (it.getAt(1) == x)
                        return it.getAt(0)
                }

            }.collect {
                if (!it)
                    return 0
                else
                    it.getAt(0)
            }

            return resourcecount
        }
        else{
            return null
        }

    }

    def trendtopics()
    {
        List <Long> topicsid=Topic.list().collect{
          it.id
        }
 println ">>>>>>>>>>>>>>>>>>>>>>>. TOPICSID"+topicsid
        List abcd=Resource.createCriteria().list(max:5)
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                }

        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}
        println "abcd>"+abcd

        List <Integer> xyz=abcd.collect{ x ->
           topicsid.find{

                if (x.getAt(1)==it)
                    return x.getAt(1)
                else
                    return 0

            }

        }
        xyz.removeAll{it==0}
        List bbb= xyz+(topicsid-xyz)
        List<Topic> topicList1 = []
        def i
        for(i=0;i<5;i++){
            topicList1.add(Topic.get(bbb[i]))
        }
        println "topic List:"+topicList1
        return topicList1

    }

    /*for particualr trending topic post and subscriptions*/

    def topTopicsPosts(List<Topic> trending) {

        List abcd = Resource.createCriteria().list(max: 5)
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                }

        abcd.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        List<Integer> xyz = trending.collect { x ->
            abcd.find {
                if (it.getAt(1) == x.id)
                    return it.getAt(0)
                else
                    return 0
            }
        }
        List x = xyz.collect{if(!it)
        return 0
            else
            return it.getAt(0)
        }
        return x
    }

    def topTopicSubs(List<Topic> trending)
    {

        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                    'topic' {
                        inList('id', trending.id)
                    }
                }
       /* println ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"+trending
        println  "??????????????????????????" +topiccounts*/
        List<Integer> counts = trending.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x.id)
                    return it.getAt(0)
            }
        }
        println "::::"+counts
        List l = counts.collect{if(!it)
            return 0
        else
            return it.getAt(0)}
        return l
    }
}
