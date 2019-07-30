package linksharing


import grails.transaction.Transactional


@Transactional(readOnly = true)
class UserController {
   // static defaultAction = "myaction"
    def showAllUserListService
    def UserService
    def forgetPasswordService


    def myaction(){
        User user1=User.findByEmail(session.name)

        render(view:"EditProfile" ,model:[userdata:user1])
    }
    def showlist() {
        String str = session.name
        User user1 = User.findByEmail(str)
        List<User> list1 = showAllUserListService.listMethod()
        render(view: "showUserList", model: [userList: list1,userdata:user1])
    }

    def logout(){
        session.invalidate()
        redirect(url:'/')
    }

    // To display the number of subscription and trending topics  done by particular user
    def userTable() {
        render(view: 'showUserList', model: [userList: User.list()])
    }

    def activate() {
        User user = User.findById(params.userId)
        user.active = true
        user.save(failOnError: true, flush: true)
        redirect(controller:"user" ,action:'showlist')
    }
    @Transactional
    def deactivate() {
        User user = User.findById(params.userId)
        user.active = false
        //user.confirmPassword = user.password
        user.save(failOnError: true, flush: true)
        redirect(controller:"user" ,action:'showlist')
        //redirect(action: 'userTable')
    }


































/*default  static code */


//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond User.list(params), model:[userCount: User.count()]
//    }
//
//    def show(User user) {
//        respond user
//    }
//
//    def create() {
//        respond new User(params)
//    }
//
//    @Transactional
//    def save(User user) {
//        if (user == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (user.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond user.errors, view:'create'
//            return
//        }
//
//        user.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
//                redirect user
//            }
//            '*' { respond user, [status: CREATED] }
//        }
//    }
//
//    def edit(User user) {
//        respond user
//    }
//
//    @Transactional
//    def update(User user) {
//        if (user == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (user.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond user.errors, view:'edit'
//            return
//        }
//
//        user.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
//                redirect user
//            }
//            '*'{ respond user, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(User user) {
//
//        if (user == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        user.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
