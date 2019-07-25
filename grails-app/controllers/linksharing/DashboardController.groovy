package linksharing

class DashboardController {


    def index() {
        //for getting session object name
        User user1 = User.findByEmail(session.name)
        println session.name


        render(view:"/dashboard" ,model:[userdata:user1])
    }







}
