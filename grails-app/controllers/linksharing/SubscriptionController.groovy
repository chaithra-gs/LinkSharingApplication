package linksharing

import Enums.Visibility
import Enums.*

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscriptionController {
    def subscriptionService

    def updateSerious() {
        if(!session.name)
        {
            render("please login first")
        }
        else{
            subscriptionService.updateSerious(params)
            redirect(controller: "dashboard", action: "index")
        }
    }
    def updateSeriouss() {
        if(!session.name)
        {
            render("please login first")
        }
        else{
            println "?????????????????????????????????????????????????????????????????????????"
            subscriptionService.updateSeriouss(params)
            redirect(controller:"topic",action: "topicshow",params:[id: params.id])
        }
    }
    def changesub()
    {
        if(!session.name)
        {
            render("please login first")
        }
        else{
            subscriptionService.updateSubscription(params)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def unsubscribe(params){
        Long sid = 0.0
        User user=User.findByEmail(session.name)
        Subscription su=Subscription.findById(params.id)
        if(su) {
            sid = Long.parseLong(params.id)
        }
        else
        {
            Long topid = Long.parseLong(params.id)
            println "----------------------"
            println topid
            Subscription sub = Subscription.createCriteria().get {
                eq('topic.id', topid)
                eq('user.id', user.id)
            }
            println sub
            sid = sub.id
        }
        Subscription s=Subscription.findById(sid)
        s.delete(flush:true)
        if(params.page=="dashboard"){
            redirect(controller: "dashboard", action: "index")
        }
        else if(params.page=="topic"){
            redirect(controller:"Topic" ,action:"topicshow",params:[id:params.id])
        }
    }


    def subscribe(params) {
        if (!session.name) {
            render("please login first")
        } else {
            User user = User.findByEmail(session.name)
            Long topid = Long.parseLong(params.id)
            Topic t = Topic.get(topid)
            Subscription s=Subscription.findByTopicAndUser(t,user)
            if(s==null){
                s = new Subscription(seriousness: Seriousness.'CASUAL', topic: t)
                user.addToSubscribedTo(s)
                s.save(flush: true, failOnError: true)
                user.save(flush: true, failOnError: true)
            }
            else{
                flash.message23="Already subscribed"
            }

            redirect(controller: "dashboard", action: "index")
        }
    }
    def subscribeTopic(params){
        User user=User.findByEmail(session.name)
        if(user){
            Long topid = Long.parseLong(params.id)
            Topic t=Topic.get(topid)
            Subscription s=Subscription.findByTopicAndUser(t,user)
            if(s==null){
                s=new Subscription(seriousness: "CASUAL" ,topic :t)
                user.addToSubscribedTo(s)
                s.save(flush:true,failOnError:true)
                user.save(flush:true,failOnError:true)
            }
            else{
                flash.message11="Already subscribed"
            }

            redirect(controller:"dashboard" ,action:"index")

        }
        else{
            render("please login!")
        }

    }
}

































/*static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Subscription.list(params), model:[subscriptionCount: Subscription.count()]
}

def show(Subscription subscription) {
    respond subscription
}

def create() {
    respond new Subscription(params)
}

@Transactional
def save(Subscription subscription) {
    if (subscription == null) {
        transactionStatus.setRollbackOnly()
        notFound()
        return
    }

    if (subscription.hasErrors()) {
        transactionStatus.setRollbackOnly()
        respond subscription.errors, view:'create'
        return
    }

    subscription.save flush:true

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.created.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscription.id])
            redirect subscription
        }
        '*' { respond subscription, [status: CREATED] }
    }
}

def edit(Subscription subscription) {
    respond subscription
}

@Transactional
def update(Subscription subscription) {
    if (subscription == null) {
        transactionStatus.setRollbackOnly()
        notFound()
        return
    }

    if (subscription.hasErrors()) {
        transactionStatus.setRollbackOnly()
        respond subscription.errors, view:'edit'
        return
    }

    subscription.save flush:true

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.updated.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscription.id])
            redirect subscription
        }
        '*'{ respond subscription, [status: OK] }
    }
}

@Transactional
def delete(Subscription subscription) {

    if (subscription == null) {
        transactionStatus.setRollbackOnly()
        notFound()
        return
    }

    subscription.delete flush:true

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscription.label', default: 'Subscription'), subscription.id])
            redirect action:"index", method:"GET"
        }
        '*'{ render status: NO_CONTENT }
    }
}

protected void notFound() {
    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
            redirect action: "index", method: "GET"
        }
        '*'{ render status: NOT_FOUND }
    }
}*/

