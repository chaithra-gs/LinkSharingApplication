package linksharing

import grails.transaction.Transactional

@Transactional
class LoginService {

    /*Boolean loginMethod(String userEmail, String enteredPassword) {
        Boolean flag = false
        if(userEmail && enteredPassword)
        {
            String storedPassword = User.findByEmail(userEmail)?.password
            flag  = storedPassword == enteredPassword

        }
        return flag

    }*/

    //for login with both email and password
    Boolean loginMethod(String userEmail, String enteredPassword) {
        Boolean flag = false
        if(userEmail && enteredPassword){

            if(User.findByUsername(userEmail)) {
                String u1 = User.findByUsername(userEmail).email
                String storedPassword1 = User.findByEmail(u1)?.password
                flag = storedPassword1 == enteredPassword
            }
            if(User.findByEmail(userEmail)){
                String u2 = User.findByEmail(userEmail).email
                String storedPassword2 = User.findByEmail(u2)?.password
                flag = storedPassword2 == enteredPassword
            }
        }
        return flag
    }

}






