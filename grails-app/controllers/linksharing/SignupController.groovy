package linksharing

class SignupController {

    def signupService
    def index(){
//        print "inside cont"
//        def file = params.get("pic")
//        println "pic ==================================" + file.class
        signupService.register(params,request)
        render(text: "Success")
    }
}


