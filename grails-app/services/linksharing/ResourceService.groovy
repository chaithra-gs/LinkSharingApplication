package linksharing

import grails.transaction.Transactional

@Transactional
class ResourceService {
    def displayunread(String username) {
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
            Casr=ReadingItem.createCriteria().list {
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
        println "resources here" +resources
        return resources

    }

    def editreadMethod(params)
    {
        User user=User.findByUsername(params.username)
        Long id=Long.parseLong(params.resourceId)
        ReadingItem ri=ReadingItem.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        if(ri)
        {
            if(ri.isRead){
                ri.isRead=false
                ri.save(flush:true,failOnError:true)
                String str="mark as unread"
                return str
            }else{
                ri.isRead=true
                ri.save(flush:true,failOnError:true)
                String str= "mark as read"
                return str
            }
        }

    }


    def deleteMethod(params)
    {
       /* Resource res= Resource.get(Long.parseLong(params.id))
        ReadingItem resRate=ReadingItem.createCriteria().get{
            projections{
                eq('resource.id',res.id)
            }
        }
        resRate.delete()
        //resRate.save()
        res.delete()*/
        Resource resource = Resource.get(params.id)
        if (resource.hasProperty("path")) {
            String location = '/home/chaithra/grailsproject/git/LinkSharingApplication/grails-app/assets/documents/' + resource.path
            File file = new File(location)
            file.delete()
        }
        resource.delete(flush: true, failOnError: true)
        //redirect controller: 'dashboard', action: 'index'

    }

}
