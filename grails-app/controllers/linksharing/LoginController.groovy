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
        //for getting session object
        //def values = loginService.loginMethod(email, enteredPassword)

        if(isLogin) {
            //render view: "/dashboard", model: [:]
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
                flash.message="Fail"
                redirect(url: '/')
            }
        }
    }



}
