package linksharing

class TopicController {
    def userService

    def newTopic(){
        render(view:"topicShow")
    }


    def topicService
    // static defaultAction = "enterTopics"
    def save() {
        String email = session.name
        topicService.save(params, email)

        redirect(controller: "dashboard", action: "index")

    }


    def saveDoc(){
        topicService.saveDoc(params,request,session.name)
        redirect(controller: "dashboard", action: "index")
    }
    def saveLink(){
        topicService.saveLink(params,request,session.name)
        redirect(controller: "dashboard", action: "index")
    }

    def updateVisibility(params)
    {
        Topic t=Topic.get(params.id)
        t.visibility=params.visibility
    }

    /*def topiclist() {
        List topiclist = topiclistService.serviceMethod()

        render(view: 'topiclist', model: [topiclists: topiclist])
    }*/

    def topicshow() {
        User user=User.findByEmail(session.name)
       User user1 = User.findByEmail(session.name)
        Long tid=0.0
        println "+++++++++++++++++++++++++++++"
        println params.id
        Long id = Long.parseLong(params.id)
        Subscription sub = Subscription.get(id)

        List subscriptionLt=userService.subscriptions(session.name)

        if(sub){
            Topic t = sub.topic
            tid = t.id

        }
        else{
            tid=id
        }


        Long subscount = Subscription.createCriteria().count {
            eq("topic.id", tid)
        }
        int postcount = Resource.createCriteria().count {
            eq('topic.id', tid)
        }

        List<Subscription> subscription = Subscription.createCriteria().list {
            eq("topic.id", tid)
        }
        List<User> users = subscription*.user
        List<Long> userslist = users.collect { it.id }


        List subscriptioncount = topicService.subscriptioncount(userslist)

        List postscount = topicService.topiccount(userslist)

        List<Resource> resource = Resource.createCriteria().list {
            eq("topic.id", tid)
        }
        println "------------------------"
        render(view:"topicShow" ,
                model : [user:user,subs:sub ,
                         subscount:subscount ,
                         postcount : postcount ,
                         subscription:subscription,
                         subscriptioncount:subscriptioncount ,
                         postscount:postscount,
                         resources:resource,
                userdata:user1,
                         subscriptions : subscriptionLt])
    }
}



