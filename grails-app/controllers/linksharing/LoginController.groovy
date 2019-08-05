package linksharing

import grails.converters.JSON

class LoginController {
    def loginService

    def index() {

        //get boolean value from service
        //compare value to true and false
        //if true -- render dashboard
        //if flase -- render error/login again

        String email = params.email
        String enteredPassword = params.pwd
        Boolean isLogin =  loginService.loginMethod(email, enteredPassword)
        if(!isLogin) {
            flash.message1 = "Fail"
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




