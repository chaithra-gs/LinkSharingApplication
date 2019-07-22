package linksharing

class SignupController {

    def signupService
    def index(){
        //print "inside cont"
        signupService.register(params)
        render(text: "Success")
    }
}
