package linksharing

import Enums.Visibility
import grails.transaction.Transactional

@Transactional
class SignupService {
    def register(params, request) {
        String password = params.password
        String confirmpassword = params.confirmpassword
        if (confirmpassword.compareTo(password) != 0) {
            return 0

        } else {
            String firstname = params.firstname
            String lastname = params.lastname
            String email = params.signup_email
            String username = params.username
            Boolean admin = 0
            Boolean active = 1

            String image = "default.png"
            def f = request.getFile('inputphoto')
            String fName = f.getOriginalFilename()
            if (fName) {

                image = username + fName

                String loc = '/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/images/' + image
                File des = new File(loc)
                f.transferTo(des)
            }
            User userr = new User(firstName: firstname, lastName: lastname, email: email, username: username, password: password, admin: admin, active: active, photo: image)
            userr.save(flush: true, failOnError: true, validate: true)
        }
    }


    List<Resource> recentShare() {

        List<Resource> recentShare = Resource.createCriteria().list(max: 5) {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        recentShare.sort { Resource r2, Resource r1 -> r1.dateCreated <=> r2.dateCreated }
    }

    List<Resource> postList(){
            List<Resource> topPosts = ResourceRating.createCriteria().list(max: 5) {
                projections {
                    avg("score")
                    groupProperty("resource.id")

                }
                'resource' {
                    'topic' {
                        eq('visibility', Visibility.PUBLIC)
                    }

                }
            }
        List<Long> resIds=topPosts.collect{it.getAt(1)}

        return resIds

    }
}
