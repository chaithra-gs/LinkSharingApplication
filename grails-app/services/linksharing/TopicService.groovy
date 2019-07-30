package linksharing

import Enums.Visibility
import Enums.Seriousness
import grails.transaction.Transactional

@Transactional
class TopicService {

    def save(params,uemail) {

        String topicName = params.topicName
        Visibility visible=params.selection
        User u=User.findByEmail(uemail)

        Topic topic = new Topic(name:topicName,visibility: visible,createdBy:u)
        topic.save(flush:true,failOnError:true,validate:true)

        Subscription sub=new Subscription(seriousness: Seriousness.VERY_SERIOUS,topic:topic)
        u.addToSubscribedTo(sub)

        topic.addToSubscriptionHas(sub)
        sub.save(failOnerror:true,flush:true)

        u.save(flush:true , failOnError : true)

    }


    def saveDoc(params,request,email)
    {
        User user1=User.findByEmail(email)
        Integer uid =user1.id
        String uname=user1.username

        String description1=params.select
        String tname=params.topic
        Topic tobj=Topic.findByName(tname)
        Integer tID = tobj.id

        def f = request.getFile('document')
        String fName = f.getOriginalFilename()

        String str=uname+fName

        String fpath='/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/documents/'+str
        File des=new File(fpath)
        f.transferTo(des)


        DocumentResource newRes = new DocumentResource(description:description1,topic:tID,path:str)
        user1.addToResources(newRes)
        tobj.addToResourceHas(newRes)
        newRes.save(flush:true,failOnError:true)


    }

    def saveLink(params,request,email)
    {
        User user1=User.findByEmail(email)
        Integer uid =user1.id
        String uname=user1.username

        String description1=params.selectlink
        String tname=params.topic
        Topic tobj=Topic.findByName(tname)
        Integer tID = tobj.id

        String link = params.linkres


        LinkResource newRes = new LinkResource(description:description1,topic:tID,Linkurl:link)
        user1.addToResources(newRes)
        tobj.addToResourceHas(newRes)
        newRes.save(flush:true,failOnError:true)
    }

    def serviceMethod(String name,params) {
        User user=User.findByEmail(name)
        Topic t1=new Topic(name:params.topicName,visibility: params.visibility)
        Subscription sub=new Subscription(seriousness: 'VERY_SERIOUS',topic:t1)
        user.addToTopics(t1)
        user.save(flush:true,failOnError:true)
        t1.save(flush:true,failOnError:true)
        user.addToSubscribedTo(sub)
        sub.save(flush:true,failOnError:true)
    }
     def updateVisibility(params)
     {
         Topic t=Topic.get(params.id)
         t.visibility=params.visibility
     }



    def subscriptioncount(List userslist)
    {
        def usercounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')
                        // countDistinct('topic.id')
                    }
                    'user'{
                        inList('id',userslist)
                    }
                }
        List <Integer> counts=userslist.collect{ x ->
            usercounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{it.getAt(0)}
        return counts
    }

    def topiccount(List userslist)
    {
        def topcounts=Topic.createCriteria().list()
                {
                    projections{
                        count('createdBy.id')
                        groupProperty('createdBy.id')
                        // countDistinct('topic.id')
                    }
                    'createdBy'{
                        inList('id',userslist)
                    }
                }

        List <Integer> topiccount=userslist.collect{ x ->
            topcounts.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}

        return topiccount

    }



}
