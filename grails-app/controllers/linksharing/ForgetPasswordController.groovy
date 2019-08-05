package linksharing

class ForgetPasswordController {

    def forgetPasswordService

    def forgetPassword(){
        render(view: "Forgetpassword")

    }

    def validateEmail()
    {
        if(forgetPasswordService.validateEmail(params)==1)
        {
            session.name = params.email
            render(view:"enterotp")
            //render(view: "Resetnewpasword")
        }
        else {
            flash.message8="Email doesn't Exist"

        }
    }

    def reset(){
    render(view: "/sendLink/Resetnewpasword")
    }

    def updatePassword()
    {
        String email = session.name
       boolean updatepass= forgetPasswordService.resetPassword(params,email)


        if(updatepass)
        {
            session.invalidate()
            flash.message10 = "Login with new password"
            redirect(url:"/")

        }
        else {
            flash.message10 = "password Mismatch"
            redirect(controller: "ForgetPassword", action: "reset")

        }

    }
    def newpass()
    {
        redirect(url:"/")
    }
}
