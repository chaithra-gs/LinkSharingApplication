package linksharing

class SignupController {

    def signupService
    def index(){
        signupService.register(params,request)
        render(text: "Success")
    }
}


