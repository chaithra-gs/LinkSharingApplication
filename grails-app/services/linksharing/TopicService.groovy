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

        String  fname = f.getOriginalFilename()
        String fpath='/home/chaithra/grailsproject/grailsFiles/'+uname+fName
        File des=new File(fpath)
        f.transferTo(des)


        DocumentResource newRes = new DocumentResource(description:description1,topic:tID,path:fpath)
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
     def updateVisibility(params)
     {
         Topic t=Topic.get(params.id)
         t.visibility=params.visibility
     }



}
