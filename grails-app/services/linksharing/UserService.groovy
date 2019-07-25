package linksharing

import grails.transaction.Transactional

@Transactional
class UserService {

//    def subscriptions(String username) {
//        User user =User.findByUsername(username)
//
//        List<Long> subscriptionList = Subscription.createCriteria().list{
//            eq("user.id",user.id)
//        }
//        //print subscriptionList
//        subscriptionList.sort{b,a-> a.topic.lastUpdated<=>b.topic.lastUpdated}
//        //print subscriptionList
//        return subscriptionList
//
//    }

//    def subscriptioncount(List topicids)
//    {
//        def topiccounts=Subscription.createCriteria().list()
//                {
//                    projections{
//                        count('topic.id')
//                        groupProperty('topic.id')
//                        // countDistinct('topic.id')
//                    }
//                    'topic'{
//                        inList('id',topicids)
//                    }
//                }
//
//        List <Integer> counts=topicids.collect{ x ->
//            topiccounts.find{
//                if (it.getAt(1)==x)
//                    return it.getAt(0)
//            }
//
//        }.collect{it.getAt(0)}
//        return counts
//    }
//
//    def postscount(List topicids)
//    {
//        def rescounts=Resources.createCriteria().list()
//                {
//                    projections{
//                        count('topic.id')
//                        groupProperty('topic.id')
//                        // countDistinct('topic.id')
//                    }
//                    'topic'{
//                        inList('id',topicids)
//                    }
//                }
//
//        List <Integer> resourcecount=topicids.collect{ x ->
//            rescounts.find{
//
//                if (it.getAt(1)==x)
//                    return it.getAt(0)
//            }
//
//        }.collect{if(!it)
//            return 0
//        else
//            it.getAt(0)}
//
//        return resourcecount
//
//    }
//
//    def trendtopics()
//    {
//        List <Long> topicsid=Topic.list().collect{
//            it.id
//        }
//
//        List abcd=Resources.createCriteria().list(max:5)
//                {
//                    projections{
//                        count('topic.id')
//                        groupProperty('topic.id')
//
//                    }
//
//
//                }
//
//        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}
//
//        List <Integer> xyz=topicsid.collect{ x ->
//            abcd.find{
//
//                if (it.getAt(1)==x)
//                    return it.getAt(0)
//                else
//                    return 0
//
//            }
//
//        }.collect{if(!it)
//            return 0
//        else
//            it.getAt(1)}
//        xyz.removeAll{it==0}
//        List bbb= xyz+(topicsid-xyz)
//        List <Topic> topicstrendy=Topic.createCriteria().list{
//            inList('id' , bbb)
//
//        }
//        return topicstrendy
//    }
//}
//}
}
