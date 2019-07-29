package linksharing

import grails.transaction.Transactional

@Transactional
class ProfileService {

    def update(params,request,user) {
        print "......................." + params.inputphoto
        print ">>>>>>>>>>>>>>>>>>>>."+params.fname
        user.firstName=params.fname

        user.lastName=params.lname
        user.username=params.username
        def des = request.getFile('inputphoto')

        if(des){
            File file=new File( "/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/images/${params.username}.jpg")
            des.transferTo(file)
        }
        String photo1 = "${params.username}.jpg"
        user.photo=photo1
        return 1
    }

    def updatepass(params,user){
        user.password=params.password
        return 1
    }
}
