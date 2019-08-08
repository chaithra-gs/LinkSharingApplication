package linksharing

class SearchController {
    def userService
    def searchService
    def search() {
        if (!session.name) {
            render("please login first")
        } else {
            User user=User.findByEmail(session.name)
            List subscriptionLt = userService.subscriptions(session.name)
            List<String> resultSet = searchService.showSearch(params.q)
            println resultSet
            if (resultSet)
                render view: 'search', model: [result: resultSet,userdata:user,subscriptions  : subscriptionLt]
            else
                redirect url: "/dashboard"
        }
    }
}
