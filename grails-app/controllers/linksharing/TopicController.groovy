package linksharing

class TopicController {
    def userService
    def topicService
    def topiclistService

    def newTopic(){
        render(view:"topicShow")
    }

    def topiclist() {
        User u = User.findByEmail(session.name)
        List subscriptionLt = userService.subscriptions(session.name)
        List topiclist = topiclistService.serviceMethod()

        render(view:'TopicList', model: [topiclists: topiclist,userdata: u,subscriptions:subscriptionLt])
    }

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
        redirect(controller: "dashboard", action: "index")

    }


    def topicshow() {
        User user=User.findByEmail(session.name)
       User user1 = User.findByEmail(session.name)
        Long tid=0.0
        println "+++++++++++++++++++++++++++++++++++++++params id+++++++++++++++++++++++++++++++++++++=++++++++++++++++"
        print params.id
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
                         subscriptions : subscriptionLt,
                         subscriptioncount:subscriptioncount ,
                         postscount:postscount,
                         resources:resource,
                           userdata:user1,
                         subscriptions : subscriptionLt])
    }
}



