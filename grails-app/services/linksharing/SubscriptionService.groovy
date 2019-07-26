package linksharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def updateSerious(params)
    {
        Subscription s=Subscription.get(params.id)
        s.seriousness = params.seriousness
    }
}
