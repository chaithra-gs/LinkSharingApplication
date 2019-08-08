package linksharing


import grails.transaction.Transactional


@Transactional(readOnly = true)
class UserController {

    def userService
    def showAllUserListService

    def layout() {
        render(view: "index1")
    }

    def myaction() {
        if (!session.name) {
            render("please login first")
        } else {
            List subscriptionLt = userService.subscriptions(session.name)
            User user1 = User.findByEmail(session.name)
            Integer count_topic = userService.topicCount(session.name)
            Integer count_subscribe = userService.subCount(session.name)


            render(view: "EditProfile", model: [userdata       : user1, subscriptions: subscriptionLt, count_topic: count_topic,
                                                count_subscribe: count_subscribe,])
        }
    }

    def showlist() {
        if (!session.name) {
            render("please login first")
        } else {
            String str = session.name
            User user1 = User.findByEmail(str)
            List subscriptionLt = userService.subscriptions(session.name)
            List<User> list1 = showAllUserListService.listMethod()
            render(view: "showUserList", model: [userList: list1, userdata: user1, subscriptions: subscriptionLt])
        }
    }

    def logout() {
        session.invalidate()
        redirect(url: '/')
    }

    // To display the number of subscription and trending topics  done by particular user
    def userTable() {
        render(view: 'showUserList', model: [userList: User.list()])
    }

    def activate() {
        User user = User.findById(params.userId)
        user.active = true
        user.save(failOnError: true, flush: true)
        redirect(controller: "user", action: 'showlist')
    }

    @Transactional
    def deactivate() {
        User user = User.findById(params.userId)
        if (user.id != 1) {
            user.active = false
        }
        user.save(failOnError: true, flush: true)
        redirect(controller: "user", action: 'showlist')

    }

    def removeAdmin() {
        User user = User.findById(params.userId)
        if (user.id != 1) {
            user.admin = false
        }
        user.save(failOnError: true, flush: true)
        redirect(controller: "user", action: 'showlist')

    }

    def makeAdmin() {
        User user = User.findById(params.userId)
        user.admin = true
        user.save(failOnError: true, flush: true)
        redirect(controller: "user", action: 'showlist')
    }

}
