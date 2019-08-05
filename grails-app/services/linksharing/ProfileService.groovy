package linksharing

import grails.transaction.Transactional

@Transactional
class ProfileService {

    def update(params,request,user) {
            user.firstName=params.fname
            user.lastName=params.lname
            user.username=params.username

        String uname=params.username
        def f = request.getFile('inputphoto')
        String fName = f.getOriginalFilename()
        if(fName){
            String image = uname+fName
            String loc='/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/images/'+image
            File des=new File(loc)
            f.transferTo(des)
            user.photo=image
            user.save(flush:true)

        }
            return 1
    }

    def updatepass(params,user){
        String password = params.password
        String confirmpassword = params.confirmpassword
        if(confirmpassword.compareTo(password)!=0)
        {
            return 0

        }
        user.password=params.password
        return 1
    }
}
