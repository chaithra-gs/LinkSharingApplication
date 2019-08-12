package linksharing

import grails.converters.JSON

class LoginController {
    def loginService
    def signupService

    def index() {
        def recent= signupService.recentShare()
        def postListt=signupService.postList()
        [posts:postListt,resources:recent]
    }
    def auth() {
        String email = params.email
        String enteredPassword = params.pwd
        Boolean isLogin =  loginService.loginMethod(email, enteredPassword)
        if(!isLogin) {
            flash.message1 = "Email or password incorrect"
            redirect(url: '/')
        }
        else{
            if(User.findByEmail(params.email)){
                session.name = params.email
                flash.message = "Register sucess"
                print session.name
                redirect(controller: "dashboard", action: "index")
            }
            else if(User.findByUsername(params.email)) {
                session.name = User.findByUsername(params.email).email
                flash.message = "Register sucess"
                print session.name
                redirect(controller: "dashboard", action: "index")
            }
            else {
                flash.message1="Fail"
                redirect(url: '/')
            }

        }


    }
}




