package linksharing

class ReadingController {

    def readingService

    def editread()
    {
        if(!session.uname)
        {
            render("please login first")
        }
        else{
            readingService.editreadMethod(params,session.uname)
            redirect(controller : "Dashboard" ,action : "dashboard")
        }}
    def delete()
    {
        readingService.deleteMethod(params)
        redirect(controller : "Dashboard" , action : "dashboard")
    }
}
