package linksharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def updateSerious(params)
    {
        Subscription s=Subscription.get(params.id)
        s.seriousness = params.seriousness
        s.save(flush:true,failOnError:true)
    }
    def updateSeriouss(params)
    {
        Subscription s=Subscription.get(params.id)
        s.seriousness = params.seriousness
         s.save(flush:true,failOnError:true)
    }
    def updateSubscription(params){
        Subscription s = Subscription.get(Long.parseLong(params.id))

        s.delete()
        s.save(failOnError:true)
    }
}
