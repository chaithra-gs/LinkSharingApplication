package linksharing

class TopicController {

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

    def updateVisibility(){
        topicService.updateVisibility(params)
        redirect(controller: "dashboard" ,action: "index")

    }




}
