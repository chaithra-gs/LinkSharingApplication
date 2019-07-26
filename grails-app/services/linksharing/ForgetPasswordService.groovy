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
            return 1
        }
        else {
            return 0
        }

    }
}
