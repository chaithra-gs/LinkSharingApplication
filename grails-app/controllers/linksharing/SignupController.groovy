package linksharing

class SignupController {

    def signupService
    def index(){
        String firstname = params.firstname
        String lastname = params.lastname
        String email = params.signup_email
        String username = params.username
        String password = params.password
        String confirmpassword = params.confirmpassword

        if(firstname && lastname && email && username && password && confirmpassword)
        {
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
                    flash.message = "Register sucess"
                    session.name = params.signup_email
                    redirect(controller: "dashboard", action: "index")
                }
                else
                {
                    flash.message = "register Fail"
                    //render(text: "register failed")
                    render(view:"index")
                }
            }
        }
        else{
            flash.message14=" Please Enter all required fields!!"
            render(view:"index")
        }



    }
}


