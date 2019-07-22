package linksharing

import grails.transaction.Transactional

@Transactional
class LoginService {

    def loginMethod(Map params) {

        String email=params.email
        String password=params.pwd

        if(email == null || password == null)
        {
            return false
        }
        else
        {
            def userdetail=User.findByEmail(email)
            def userpass=userdetail.getPassword()
            if(userpass==password)
            {
                return true
                //render(text: "Success")
            }
            else
            {
                return false

            }

        }

    }
}
