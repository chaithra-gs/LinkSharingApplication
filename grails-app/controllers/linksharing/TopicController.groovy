package linksharing

import Enums.Visibility

class TopicController {
    def userService
    def topicService
    def topiclistService

    def newTopic(){
        render(view:"topicShow")
    }
    def topiclist() {
        User u = User.findByEmail(session.name)
        if(u.admin)
        {
            List subscriptionLt = userService.subscriptions(session.name)
            List topiclist = topiclistService.serviceMethod()
            render(view: 'TopicList', model: [topiclists: topiclist, userdata: u, subscriptions: subscriptionLt])
        }
        else{
            flash.message="Access denied"
            redirect(controller: "dashboard", action: "index")
        }
    }


    def save() {
        String p1=params.topicName
        Visibility visible=params.selection
        if(p1 && visible)
        {
            Topic uniqueTopic=Topic.findByName(params.topicName)
            User user=User.findByEmail(session.name)
            /*List list = topicService.checkUnique(session.name)
            boolean var=list.contains(uniqueTopic)*/

            List<Topic> var=topicService.checkUnique(session.name,params.topicName)
            if(var){

                redirect(controller: "dashboard", action: "index")
                flash.message="Topic already exists"
            }else{
                String email = session.name
                topicService.save(params, email)
                redirect(controller: "dashboard", action: "index")
            }
        }
        else{
            flash.message="please enter all fields"
            redirect(controller: "dashboard", action: "index")
        }

    }

    def send(){
        redirect(controller: "dashboard", action: "index")
    }

    def editDocument(){
        println params.tname
        println  params.desc
        Resource res=Resource.get(Long.parseLong(params.id))
        topicService.saveDocument(params,request,session.name)
        redirect(controller: "resource", action: "index",params: [id: res.id])

    }



    def saveDoc(){
        String p1 = params.select
        String p2 = params.topic
        def f = request.getFile('document')
        String p3 = f.getOriginalFilename()
        if(p1 && p2 && p3)
        {
            topicService.saveDoc(params,request,session.name)
            redirect(controller: "dashboard", action: "index")
        }
        else{
            flash.message=" please enter all fields!"
            redirect(controller: "dashboard", action: "index")
        }
    }
    def saveLink(){

        String description1=params.selectlink
        String link = params.linkres
        if(description1 && link){
            topicService.saveLink(params,request,session.name)
            redirect(controller: "dashboard", action: "index")
        }
        else{
            flash.message="please enter all fields!"
            redirect(controller: "dashboard", action: "index")
        }


    }

    def updateVisibility(params)
    {
        Topic t=Topic.get(params.id)
        t.visibility=params.visibility
        t.save(flush:true,failOnError:true)
        redirect(controller: "dashboard", action: "index")

    }


    def topicshow() {

            User user = User.findByEmail(session.name)
            User user1 = User.findByEmail(session.name)
            Long tid = 0.0

            Long id = Long.parseLong(params.id)
            //Long id=params.id
            Subscription sub = Subscription.get(id)

            List subscriptionLt = userService.subscriptions(session.name)

            if (sub) {
                Topic t = sub.topic
                tid = t.id

            } else {
                tid = id
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
            //get entire row of subscription table
            List<User> users = subscription*.user
            //get count of users subscribed to particualr topic
            List<Long> userslist = users.collect { it.id }


            List subscriptioncount = topicService.subscriptioncount(userslist)

            List postscount = topicService.topiccount(userslist)


            List<Resource> resource = Resource.createCriteria().list {
                eq("topic.id", tid)
            }

            println "------------------------"
            render(view: "topicShow",
                    model: [user             : user,
                            subs: sub,
                            subscount        : subscount,
                            postcount        : postcount,
                            subscription     : subscription,
                            subscriptions    : subscriptionLt,
                            subscriptioncount: subscriptioncount,
                            postscount       : postscount,
                            resources        : resource,
                            userdata         : user1,
                            subscriptions    : subscriptionLt])

    }

    def sendInvite(){
        User user = User.findByEmail(params.iemail)
        if(user)
        {
            Topic topic = Topic.findByName(params.topic)
            Long topicId = topic.id
            String link = createLink(controller: 'Subscription', action: 'subscribeTopic',params:[id:topicId], absolute: true)
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} You have been invited to join this topic at LinkSharing!!!"
                text link
            }
            redirect controller: 'dashboard',action:'index'
        }
        else{
            flash.message="Email doesn't Exist!!"
            redirect controller: 'dashboard',action:'index'
        }

    }
    def delete() {

            Long t_id = Long.parseLong(params.id)
            Topic t1 = Topic.findById(t_id)
            t1.delete(flush: true)
            redirect(action: "topiclist")

    }
    def deleted() {

            Long t_id = Long.parseLong(params.id)
            Topic t1 = Topic.findById(t_id)
            t1.delete(flush: true)
            redirect(controller:"dashboard",action: "index")

    }
}



