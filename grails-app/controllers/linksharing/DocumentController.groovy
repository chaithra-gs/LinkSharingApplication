package linksharing

class DocumentController {

    def documentService

    def download() {
        if (!session.name) {
            render("please login first")
        } else {

            Long id = Long.parseLong(params.id)
            println "id:" + id
            DocumentResource dr =  Resource.get(id)


            //Users user = session.user
            User user = User.findByEmail(session.name)
            def file = new File("/home/chaithra/Downloads/grailsDocs/")

            def temp = new File("/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/documents/" + dr.path)
            if (temp.exists()) {
                file = temp
            } else {
                file = null
            }
            print dr.path

            response.setHeader("Content-disposition", "attachment;filename=\"${dr.path}\"")
            response.outputStream << file.bytes

        }
    }


    def save()
    {
        if(!session.name)
        {
            render("please login first")
        }
        else {
            documentService.saveMethod(params, session.name, request)
            redirect(controller: "Dashboard", action: "index")
        }

    }




}

