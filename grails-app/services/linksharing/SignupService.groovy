package linksharing

import grails.transaction.Transactional

import java.lang.reflect.Field

@Transactional
class SignupService {

    def register(params,request) {

            String password = params.password
            String confirmpassword = params.confirmpassword
            if(confirmpassword.compareTo(password)!=0)
            {
                    return 0

            }
            else
            {

                    String firstname = params.firstname
                    String lastname = params.lastname
                    String email = params.signup_email
                    String username = params.username

                    //getBytes(UTF_8)
                    // byte [] userphoto=params.pic.bytes
                    Boolean admin = 0
                    Boolean active = 1

                def f= request.getFile('inputphoto')
                String loc='/home/chaithra/grailsproject/git/LinkSharingApplication/src/photo/' + username
                File des=new File(loc)
                f.transferTo(des)

                    User user2 = new User(firstName: firstname,lastName: lastname,email:email,username:username,password:password,admin:admin,active:active,photo: loc)
                    user2.save(flush:true,failOnError:true,validate:true)


            }


        }
}
