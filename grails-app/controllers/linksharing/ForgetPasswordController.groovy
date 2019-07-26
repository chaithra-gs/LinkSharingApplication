package linksharing

class ForgetPasswordController {

    def forgetPasswordService

    def forgetPassword(){
        render(view: "Forgetpassword")

    }

    def validateResetPaswordEmail()
    {
        if(forgetPasswordService.validateEmail(params)==1)
        {
            render(view:"Resetnewpasword")
        }
        else {
            render(text:"Email doesn't Exist")
        }
    }
}
