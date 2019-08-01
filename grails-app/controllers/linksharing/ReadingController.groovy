package linksharing

class ReadingController {

    def readingService

    def editread()
    {
        if(!session.name)
        {
            render("please login first")
        }
        else{
            readingService.editreadMethod(params,session.name)
            redirect(controller : "Dashboard" ,action : "dashboard")
        }
    }
    def delete()
    {
        readingService.deleteMethod(params)
        redirect(controller : "Dashboard" , action : "dashboard")
    }
}
