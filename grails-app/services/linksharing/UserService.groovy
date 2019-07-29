package linksharing

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

        List<Long> subscriptionList = Subscription.createCriteria().list{
            eq("user.id",user.id)
        }

        //print subscriptionList
        subscriptionList.sort{b,a-> a.topic.lastUpdated<=>b.topic.lastUpdated}
        //print subscriptionList
        return subscriptionList

    }

    def subscriptioncount(List topicids)
    {if(topicids){


        def topiccounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    'topic'{
                        inList('id',topicids)
                    }
                }

        List <Integer> counts = topicids.collect{ x ->
            topiccounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{it.getAt(0)}
        return counts
    }
        else {
        return null
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

        List abcd=Resource.createCriteria().list(max:5)
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')

                    }


                }

        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}

        List <Integer> xyz=topicsid.collect{ x ->
            abcd.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
                else
                    return 0

            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(1)}
        xyz.removeAll{it==0}
        List bbb= xyz+(topicsid-xyz)
        List <Topic> topicstrendy=Topic.createCriteria().list{
            inList('id' , bbb)

        }
        return topicstrendy
    }


}
