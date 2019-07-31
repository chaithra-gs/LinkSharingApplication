package linksharing

import grails.transaction.Transactional

@Transactional
class ResourceRatingService {

    def saveMethod(params) {
        print "very much inside"

        int rating=Integer.parseInt(params.value)
        User user=Users.findByEmail(params.username)
        Long resourceId= Long.parseLong(params.resourceId)
        Resource res=Resource.get(resourceId)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('owner.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            resRate.rating=rating
            resRate.save()
        }
        else{
            ResourceRating resourceRate = new ResourceRating(rating:rating)
            user.addToResourceRated(resourceRate)
            res.addToRatings(resourceRate)
            user.save(failOnError: true)
            res.save(failOnError: true)
            resourceRate.save(failOnError: true)}
        print "very much outside"


    }

    def readMethod(username , Resource res)
    {
        User user=User.findByEmail(username)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('owner.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            return resRate.rating
        }
        else
            return 0

    }
}
