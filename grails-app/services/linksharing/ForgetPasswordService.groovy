package linksharing

import grails.transaction.Transactional

@Transactional
class ForgetPasswordService {

    def validateEmail(Map params)
    {
        String email = params.fetch_email
        User userExist = User.findByEmail(email)
        if(userExist)
        {
            return userExist
        }
        else {
            return null
        }
    }
    def resetPassword(Map params, String email){
        String password = params.newpassword

        User u1 = User.findByEmail(email)
        u1.password = password
        u1.save(failOnError: true, flush: true)

    }
}
