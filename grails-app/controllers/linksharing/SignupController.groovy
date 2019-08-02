package linksharing

class SignupController {

    def signupService
    def index(){

        Boolean flag1=User.findByEmail(params.signup_email)
        Boolean flag2=User.findByUsername(params.username)

        if(flag1 || flag2){
            flash.message3="\"Email or Username already Exists\""
            redirect(url:"/")
        }


        else{
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
}


