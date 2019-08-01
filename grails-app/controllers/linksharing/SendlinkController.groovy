package linksharing

class SendlinkController {

    def index() {
        User user = User.findByEmail(params.fetchemail)
        String link = createLink(controller: 'forgetPassword', action: 'validateResetPaswordEmail', params: [email: user.email], absolute: true)
        sendMail {
            to "${user.email}"
            subject "Hello ${user.firstName} Your password reset link is here!!!"
            text link
        }
        render("Check Your Mail")
    }
}
