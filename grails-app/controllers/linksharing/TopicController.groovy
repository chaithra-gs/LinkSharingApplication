package linksharing

class TopicController {

    def topicService
    // static defaultAction = "enterTopics"
    def save() {
        String email = session.name
        topicService.save(params, email)
        redirect(controller: "dashboard", action: "index")

    }

}
