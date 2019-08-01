package linksharing

class ProfileController {

    def dashboardService
    def profileService

    def profile(params,request){
        if(!session.name)
        {
            render("please login first")
        }
        else {
            User user = User.findByEmail(session.name)
            print params.fname
            print params.lname
            def update = profileService.update(params, request, user)

            redirect(controller: "dashboard", action: "index")
            //redirect(controller:'Profile',action:'editProfile')
        }
    }

    def password(){
        if(!session.name)
        {
            render("please login first")
        }
        else {
            User user = User.findByEmail(session.name)
            def updatepass = profileService.updatepass(params, user)
            redirect(controller: "dashboard", action: "index")
            //redirect(controller:'Profile',action:'editProfile')
        }
    }
}
