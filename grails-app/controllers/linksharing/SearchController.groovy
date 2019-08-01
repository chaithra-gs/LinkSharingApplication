package linksharing

class SearchController {

    def searchService
    def search() {
        if (!session.name) {
            render("please login first")
        } else {
            println params.q

            List<String> resultSet = searchService.showSearch(params.q)
            println ">>>>>>>>>>>>>>>>>>>>>>>>"
            println resultSet
            if (resultSet)
                render view: 'search', model: [result: resultSet]
            else
                redirect url: "/dashboard"
        }
    }
}
