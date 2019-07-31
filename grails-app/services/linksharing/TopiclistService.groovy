package linksharing

import grails.transaction.Transactional

@Transactional
class TopiclistService {

    def serviceMethod() {

        List lists = Topic.list()
        return lists
    }

}
