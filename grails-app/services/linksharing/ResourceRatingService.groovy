package linksharing

import grails.transaction.Transactional

@Transactional
class ResourceRatingService {

    def saveMethod(params) {
       // print "very much inside"
        int rating=Integer.parseInt(params.value)
        User user=User.findByEmail(params.username)
        Long resourceId= Long.parseLong(params.resourceId)
        Resource res=Resource.get(resourceId)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('userRated.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            resRate.score=rating
            resRate.save(flush:true)
        }
        else{
            ResourceRating resourceRate = new ResourceRating(score:rating,userRated: user,resource: res)
            //println "??????????????????? resource rate object :"+resourceRate.score
            resourceRate.save(failOnError: true)
            user.addToResourceRated(resourceRate)
            res.addToResourceRated(resourceRate)
            user.save(failOnError: true)
            res.save(failOnError: true)
            //resourceRate.save(failOnError: true)
        }
        // print "very much outside"


    }

    def readMethod(username , Resource res)
    {
       // println "here i am in read Method:"+username+" " +res
        User user=User.findByEmail(username)
        ResourceRating resRate=ResourceRating.createCriteria().get{
            eq('userRated.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            return resRate.score
        }
        else
            return 0

    }
}
