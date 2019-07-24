package linksharing

import grails.transaction.Transactional

@Transactional
class ShowAllUserListService {

    def listMethod() {

        List showlist = User.list()
        return showlist;

    }
}
