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
        }
        else {
            Resource res = Resource.get(params.id)
            List trending = userService.trendtopics()

            List trending1=trending.collect{it.id}
            println "trending1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+trending1
            List subcount = userService.subscriptioncount(trending1)
            List postcount = userService.postscount(trending1)

            render(view: "rating", model: [resource: res, trending: trending, countforsubs: subcount, countforposts:postcount])


        }
    }


    def editread() {
        if (!session.name) {
            render("Login required")
        } else {
            resourceService.editreadMethod(params, session.name)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def delete() {
        resourceService.deleteMethod(params)
        redirect(controller: "dashboard", action: "index")
    }

}

