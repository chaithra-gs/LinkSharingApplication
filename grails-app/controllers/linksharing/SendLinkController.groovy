package linksharing

class SendLinkController {

    Integer otp1=Math.random()*1000000

    def link() {

        User user = User.findByEmail(params.fetchemail)
        if(user){
            otp1=Math.random()*1000000
            String link = createLink(controller: 'forgetPassword', action: 'validateEmail', params: [email: user.email], absolute: true)
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} Your password reset link is here!!! with otp" + otp1
                text link
            }
            flash.message22="Check your mail"
            redirect(controller:"forgetPassword",action:"ForgetPassword")
        }
        else{
            flash.message="Email doesn't exist"
            redirect(controller:"forgetPassword",action:"ForgetPassword")
        }
    }
    def resetpage(){
        String str=params.otp
        Integer check=Integer.parseInt(str)
        if(otp1==check)
        {
            redirect(action:"resetPassword")
        }

        else{
            flash.message15="Invalid OTP"
            redirect(controller:"forgetPassword", action: "forgetPassword")
        }
    }
    def resetPassword()
    {
        render(view:"Resetnewpasword")
    }
}
