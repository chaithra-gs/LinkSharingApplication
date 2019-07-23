package linksharing

class LoginController {
    def loginService

    def index() {
        String email = params.email
        String enteredPassword = params.pwd
        Boolean isLogin =  loginService.loginMethod(email, enteredPassword)

        //get boolean value from service

        //compare value to true and false
        //if true -- render dashboard
        //if flase -- render error/login again

        if(isLogin)
        {
            render view: "/user/dashboard", model: [:]
        }
        else {
            render view: "/error", model: [:]
        }

    }
}
