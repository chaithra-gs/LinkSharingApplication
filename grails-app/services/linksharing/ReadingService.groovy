package linksharing

import grails.transaction.Transactional
import Enums.*

@Transactional
class ReadingService {

    def displayunread(String username)
    {
        Long id = User.findByEmail(username).id


        List<Long> Verys = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.VERY_SERIOUS)
        }.collect{it.id}


        List<Long> Ser = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.SERIOUS)
        }.collect{it.id}


        List<Long> Cas = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.CASUAL)
        }.collect{it.id}
        List<Resource> Verysr
        List<Resource> Serr
        List<Resource> Casr
        if(Verys){
            Verysr=ReadingItem.createCriteria().list{
                projections{
                    property("resource")
                }
                'resource' {
                    inList("topic.id" , Verys)
                }
                eq("user.id", id)
            }}
        if(Ser){
            Serr= ReadingItem.createCriteria().list{
                projections{
                    property("resource")
                }
                eq("user.id", id)
                'resource' {
                    inList("topic.id" , Ser)
                }
            }}
        if(Cas){
            Casr= ReadingItem.createCriteria().list {
                projections {
                    property("resource")
                }
                'resource' {
                    inList("topic.id", Cas)
                }
                eq("user.id", id)
            }}


        ArrayList<Resource> resources=new ArrayList()
        Verysr.each{
            resources.add(it)
        }
        Serr.each{
            resources.add(it)
        }
        Casr.each{
            resources.add(it)
        }
        print resources
        return resources

    }

    def editreadMethod(params,String username)
    {
        User user=Users.findByUsername(username)
        Long id=Long.parseLong(params.id)
        ReadingItem ri=ReadingItem.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        ri.isRead=true
        ri.save()

    }
    def deleteMethod(params)
    {
        Resource res= Resources.get(Long.parseLong(params.id))
        res.delete()
    }
}
