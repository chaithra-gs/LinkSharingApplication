package linksharing

class ProfileController {

        def dashboardService
        def profileService

        def profile(params,request){
            User user=User.findByEmail(session.name)
            print params.fname
            print params.lname
            def update=profileService.update(params,request,user)

            redirect(controller: "dashboard", action: "index")
            //redirect(controller:'Profile',action:'editProfile')

        }

        def password(){
            User user=User.findByEmail(session.name)
            def updatepass=profileService.updatepass(params,user)
            redirect(controller: "dashboard", action: "index")
            //redirect(controller:'Profile',action:'editProfile')
        }
}
