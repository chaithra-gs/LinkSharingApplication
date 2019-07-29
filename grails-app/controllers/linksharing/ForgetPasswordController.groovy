package linksharing

class ForgetPasswordController {

    def forgetPasswordService

    def forgetPassword(){
        render(view: "Forgetpassword")

    }

    def validateResetPaswordEmail()
    {
        if(forgetPasswordService.validateEmail(params))
        {
            session.name = params.fetch_email
            render(view:"Resetnewpasword")
            //render(text:"jelklhkd")
        }
        else {
            render(text:"Email doesn't Exist")
        }
    }

    def updatePassword(){
        String email = session.name
        forgetPasswordService.resetPassword(params,email)
        session.invalidate()

        render(text: "Login with new Password")
    }
    /*def backtodashboard()
    {
        redirect(view:'dashboard')
    }*/
}
