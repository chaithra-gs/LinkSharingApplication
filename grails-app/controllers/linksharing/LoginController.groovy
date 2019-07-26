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
            session.name = params.email
            print session.name
            redirect(controller: "dashboard", action: "index")
        }
        else {
            redirect(view: "/error", model: [:])
        }
    }
}
