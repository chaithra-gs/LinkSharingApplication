package linksharing

class TopicController {

        def topicService
    static defaultAction = "enterTopics"
        def enterTopics() {
            String created = session.name
            topicService.entryMethod(params, request, created)

        }

}
