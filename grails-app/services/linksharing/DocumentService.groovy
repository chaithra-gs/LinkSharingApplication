package linksharing

import grails.transaction.Transactional

@Transactional
class DocumentService {

    def documentService

    def download()
    {

        Long id = Long.parseLong(params.id)
        DocumentResource dr = (DocumentResource) Resource.get(id)
        //Users user = session.user
        User user=User.findByEmail(session.name)
        def file=new File("home/chaithra/Downloads/grailsDocs/${user}.txt")
        println "????????????????????????"+dr.path
        def temp = new File("/home/chaithra/grailsProject/git/LinkSharingApplication/grails-app/assets/documents/"+dr.path)
        if (temp.exists()) {
            file = temp
        } else {
            file = null
        }



        response.setHeader("Content-disposition", "attachment;filename=\"${dr.path}\"")
        response.outputStream << file.bytes

        /*  println "============above redirect"
          redirect(controller:"Topic" ,action:"topicshow", params:[id:params.tid])*/
    }


    def save()
    {
        documentService.saveMethod(params,session.uname,request)
        redirect(controller:"Dashboard" , action:"dashboard")


    }
}
