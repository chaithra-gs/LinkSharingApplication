package linksharing

class AuthenticationInterceptor {

    public AuthenticationInterceptor(){
        match controller: 'dashboard', action : 'index'
        match controller: 'profileShow', action : 'showData'
        match controller: 'document', action : 'download'
        match controller: 'document', action : 'save'
        match controller: 'profile', action : 'password'
        match controller: 'profile', action : 'profile'
        match controller: 'reading', action : 'editread'
        match controller: 'resource', action : 'index'
        match controller: 'resource', action : 'editread'
        match controller: 'resource', action : 'postlist'

        match controller: 'search', action : 'display'
        match controller: 'search', action : 'search'

        match controller: 'subscription', action : 'updateSerious'
        match controller: 'subscription', action : 'updateSeriouss'
        match controller: 'subscription', action : 'changesub'
        match controller: 'subscription', action : 'subscribe'


        match controller: 'topic', action : 'topicshow'
        match controller: 'topic', action : 'delete'
        match controller: 'topic', action : 'deleted'
        match controller: 'topic', action : 'topiclist'

        match controller: 'user', action : 'myaction'
        match controller: 'user', action : 'showlist'


    }
    boolean before() {
        if (!session.name) {
            flash.message = "Please login"
            redirect(url: "/")
            false
        } else {
            true
        }
    }
}






