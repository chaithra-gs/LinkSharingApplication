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
            String firstname = params.fname
            String lastname = params.lname
            String username = params.username
            User user = User.findByEmail(session.name)
            if(firstname && lastname && username)
            {
                User user1 = User.findByEmail(session.name)
                String sessionuser=user1.username
                List<String> userList = User.createCriteria().list(){
                    projections {
                        property('username')
                    }
                    ne('username', sessionuser)

                }
                boolean exists= userList.contains('sessionuser')

                if(exists)
                {
                    flash.message6="\"username already Exists!!\""
                    redirect(controller: "User", action: "myaction")
                }
                else{
                    def update = profileService.update(params, request, user)

                    redirect(controller: "dashboard", action: "index")
                }
            }
            else {
                flash.message9="Please Enter All Fields!!"
                redirect(controller: "User", action: "myaction")
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
                session.invalidate()
                redirect(url:"/")
                flash.message = "Login with new password"

            }
            else {
                flash.message = "password Mismatch"
                redirect(controller: "profile", action: "editProfile")

            }

        }
    }
}
