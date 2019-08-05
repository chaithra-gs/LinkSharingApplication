package linksharing

class SendLinkController {

    def link() {

            User user = User.findByEmail(params.fetchemail)

            String link = createLink(controller: 'forgetPassword', action: 'validateEmail', params: [email: user.email], absolute: true)
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} Your password reset link is here!!!"
                text link
            }
            render("Check Your Mail")


    }
}
