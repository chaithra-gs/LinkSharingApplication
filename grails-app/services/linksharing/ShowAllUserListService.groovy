package linksharing

import grails.transaction.Transactional

@Transactional
class ShowAllUserListService {

    def listMethod() {

        List showlist = User.list()
       // print("ROP".toLowerCase())
        List x=showlist.sort{a,b-> a.username.toLowerCase()<=>b.username.toLowerCase()}
        return x;

    }
}
