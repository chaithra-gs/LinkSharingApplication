package linksharing

class SignupController {

    def signupService
    def index(){
        def value = signupService.register(params,request)
        if(value)
        {
            flash.message = "Login sucess"
            session.name = params.signup_email
            redirect(controller: "dashboard", action: "index")
        }
        else
        {
            flash.message = "Login Fail"
            render(text: "register failed")
        }

    }
}


