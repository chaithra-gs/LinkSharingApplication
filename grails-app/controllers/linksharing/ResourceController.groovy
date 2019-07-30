package linksharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceController {

    def userService
    def resourceService

    def index() {
        if (!session.name) {
            render("Login reqired")
        } else {
            Resource res = Resource.get(params.id)
            List trending = userService.trendtopics()
            List countforsubs = userService.subscriptioncount(trending)
            List countforposts = userService.postscount(trending)

            render(view: "dashboard", model: [resource: res, trending: trending, countforsubs: countforsubs, countforposts: countforposts])


        }
    }

    def editread() {
        if (!session.name) {
            render("Login required")
        } else {
            resourceService.editreadMethod(params, session.username)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def delete() {
        resourceService.deleteMethod(params)
        redirect(controller: "dashboard", action: "index")
    }

}

