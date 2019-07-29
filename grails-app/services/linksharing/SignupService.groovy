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
                println "<<<<<<<<<<<<<<<<<<<<< username :"+params.username

                    //getBytes(UTF_8)
                    // byte [] userphoto=params.pic.bytes
                    Boolean admin = 0
                    Boolean active = 1

                def f = request.getFile('inputphoto')
                String fName = f.getOriginalFilename()
                def image = username+fName

                String loc='/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/images/' + image
                File des=new File(loc)
                f.transferTo(des)

                User userr = new User(firstName: firstname,lastName: lastname,email:email,username:username,password:password,admin:admin,active:active,photo:image)
                userr.save(flush:true,failOnError:true,validate:true)


            }


        }
}
