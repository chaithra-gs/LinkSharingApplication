package linksharing

class LoginController {
    def loginService

    def index() {

        render(loginService.loginMethod(params))




    }
}
