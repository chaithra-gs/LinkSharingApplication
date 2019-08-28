package linksharing

import grails.transaction.Transactional

@Transactional
class ShowAllUserListService {

    def listMethod() {
        List showlist = User.list()
        List x=showlist.sort{a,b-> a.username.toLowerCase()<=>b.username.toLowerCase()}
        return x;

    }
}
