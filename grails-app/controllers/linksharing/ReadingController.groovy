package linksharing

class ReadingController {

    def readingService

    def editread()
    {
            readingService.editreadMethod(params,session.name)
            redirect(controller : "Dashboard" ,action : "dashboard")

    }
    def delete()
    {
        readingService.deleteMethod(params)
        redirect(controller : "Dashboard" , action : "dashboard")
    }
}
