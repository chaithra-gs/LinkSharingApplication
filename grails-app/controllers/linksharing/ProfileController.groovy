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
            Boolean check = User.findByUsername(params.username)
            if(check)
            {
                flash.message6="\"username already Exists!!\""
                redirect(controller: "User", action: "myaction")
            }
            else{
                print params.fname
                print params.lname
                def update = profileService.update(params, request, user)

                redirect(controller: "dashboard", action: "index")

            }


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
            if(updatepass)
            {
                flash.message = "Login with new password"
                redirect(url:"/")
               // session.name = params.
                //redirect(controller: "dashboard", action: "index")
            }
            else {
                flash.message = "password Mismatch"
                redirect(controller: "profile", action: "editProfile")

            }
            //redirect(controller:'Profile',action:'editProfile')
        }
    }
}
