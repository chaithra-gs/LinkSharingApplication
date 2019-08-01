package linksharingapplication

import linksharing.Resource
import linksharing.Subscription
import linksharing.Topic
import linksharing.User

class BootStrap {

    def init = { servletContext ->
        /*User u1=new User(username : 'LSA_Admin' , firstName :'myname'  , lastName : 's' , password : '12345' , admin : true , active : true , email : 'myemail@gmail.com' )
        u1.save(flush:true,failOnError:true)*/
       /* User u1=new User(username : 'chaithra1 gs' , firstName :'chaithra'  , lastName : 'gs' , password : '1234' , admin : false , active : true , email : 'chaithraa@gmail.com' )
        User u2=new User(username : 'roopa1 sabri' , firstName: 'roopa'  , lastName : 'sabri' , password : '12345' , admin : false , active : true , email : 'roopaa@gmail.com')
        User u3=new User(username : 'sabri1 ss' , firstName : 'sabri'  , lastName : 'ss' , password : 'chai' , admin : false , active : true , email : 'sabrii@gmail.com')
        User u4=new User(username : 'chinnu1 ps' , firstName : 'chinnu'  , lastName : 'ps' , password : '123456' , admin : true , active : true , email : 'chinnuu@gmail.com')
        u1.save(flush:true,failOnError:true)
        u2.save(failOnerror:true,flush:true)
        u3.save(failOnerror:true,flush:true)
        u4.save(failOnerror:true,flush:true)

        *//*createUserInDB()
        createTopicInDB()
        createResourceInDB()
        createSubscriptionInDB()*//*

        Topic topic1 = new Topic(name:"html",visibility: "PUBLIC")
        Topic topic2 = new Topic(name:"css",visibility: "PUBLIC")
        Topic topic3 = new Topic(name:"javascript",visibility: "PUBLIC")
        Topic topic11 = new Topic(name:"groovy",visibility: "PRIVATE")
        Topic topic12 = new Topic(name:"grails",visibility: "PRIVATE")
        topic1.save(failOnerror:true,flush:true)
        topic2.save(failOnerror:true,flush:true)
        topic3.save(failOnerror:true,flush:true)
        topic11.save(failOnerror:true,flush:true)
        topic12.save(failOnerror:true,flush:true)
        u4.addToTopics(topic1)
        u4.addToTopics(topic2)
        u4.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)
        u3.addToTopics(topic3)
        u3.addToTopics(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)
        u2.addToTopics(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)


        Resource resource1 = new Resource(description:"This is first Post",topic:topic1)
        Resource resource2 = new Resource(description:"This is second Post",topic:topic1)
        Resource resource3 = new Resource(description:"This is third Post",topic:topic2)
        Resource resource4 = new Resource(description:"This is fourth Post",topic:topic3)

        u4.addToResources(resource1)

        u4.addToResources(resource2)
        u4.addToResources(resource3)
        u4.save(flush:true,failOnError: true)

        u3.addToResources(resource4)
        u3.save(flush:true,failOnError: true)


        topic1.addToResourceHas(resource1)
        topic1.addToResourceHas(resource2)
        topic1.save(flush:true,failOnError: true)

        topic2.addToResourceHas(resource3)
        topic2.save(flush:true,failOnError: true)

        topic3.addToResourceHas(resource4)
        topic3.save(flush:true,failOnError: true)

        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)


        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
        Subscription s6=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription s7=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription s8=new Subscription(seriousness: "CASUAL" , topic :topic2)

        u4.addToSubscribedTo(s1)
        u4.addToSubscribedTo(s2)
        u4.addToSubscribedTo(s4)
        u3.addToSubscribedTo(s3)
        u3.addToSubscribedTo(s6)
        u2.addToSubscribedTo(s5)
        u1.addToSubscribedTo(s7)
        u1.addToSubscribedTo(s8)


        topic1.addToSubscriptionHas(s1)
        topic2.addToSubscriptionHas(s2)
        topic11.addToSubscriptionHas(s4)
        topic12.addToSubscriptionHas(s5)

        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        s6.save(flush:true,failOnError:true)
        s7.save(flush:true,failOnError:true)
        s8.save(flush:true,failOnError:true)*/
    }
    def destroy = {
    }

    void createUserInDB() {
        if (User.count() == 0){
            //create user in system
            User u1=new User(username : 'chaithra1 gs' , firstName :'chaithra'  , lastName : 'gs' , password : '1234' , admin : false , active : true , email : 'chaithraa@gmail.com' )
            User u2=new User(username : 'roopa1 sabri' , firstName: 'roopa'  , lastName : 'sabri' , password : '12345' , admin : false , active : true , email : 'roopaa@gmail.com')
            User u3=new User(username : 'sabri1 ss' , firstName : 'sabri'  , lastName : 'ss' , password : 'chai' , admin : false , active : true , email : 'sabrii@gmail.com')
            User u4=new User(username : 'chinnu1 ps' , firstName : 'chinnu'  , lastName : 'ps' , password : '123456' , admin : true , active : true , email : 'chinnuu@gmail.com')
            u1.save(flush:true,failOnError:true)
            u2.save(failOnerror:true,flush:true)
            u3.save(failOnerror:true,flush:true)
            u4.save(failOnerror:true,flush:true)
        }
    }

    void createTopicInDB() {
        if(Topic.count() == 0 ){
            //User user = User.findByUsername("")
           /* List<User> userList = User.list()
            userList.each {User user ->*/
                //add topic to each user
                Topic topic1 = new Topic(name:"html",visibility: "PUBLIC")
                Topic topic2 = new Topic(name:"css",visibility: "PUBLIC")
                Topic topic3 = new Topic(name:"javascript",visibility: "PUBLIC")
                Topic topic11 = new Topic(name:"groovy",visibility: "PRIVATE")
                Topic topic12 = new Topic(name:"grails",visibility: "PRIVATE")
                topic1.save(failOnerror:true,flush:true)
                topic2.save(failOnerror:true,flush:true)
                topic3.save(failOnerror:true,flush:true)
                topic11.save(failOnerror:true,flush:true)
                topic12.save(failOnerror:true,flush:true)
                u4.addToTopics(topic1)
                u4.addToTopics(topic2)
                u4.save(flush:true,failOnError: true)
                topic1.save(flush:true,failOnError: true)
                topic2.save(flush:true,failOnError: true)
                u3.addToTopics(topic3)
                u3.addToTopics(topic11)
                u3.save(flush:true,failOnError: true)
                topic3.save(flush:true,failOnError: true)
                topic11.save(flush:true,failOnError: true)
                u2.addToTopics(topic12)
                u2.save(flush:true,failOnError: true)
                topic12.save(flush:true,failOnError: true)
        }
    }

    void createResourceInDB() {
        if(Resource.count() == 0 ){
           /* List<User> userList = User.list()
            userList.each {User user ->*/
                //add topic to each user

            Resource resource1 = new Resource(description:"This is first Post",topic:topic1)
            Resource resource2 = new Resource(description:"This is second Post",topic:topic1)
            Resource resource3 = new Resource(description:"This is third Post",topic:topic2)
            Resource resource4 = new Resource(description:"This is fourth Post",topic:topic3)

            u4.addToResources(resource1)

            u4.addToResources(resource2)
            u4.addToResources(resource3)
            u4.save(flush:true,failOnError: true)

            u3.addToResources(resource4)
            u3.save(flush:true,failOnError: true)


            topic1.addToResourceHas(resource1)
            topic1.addToResourceHas(resource2)
            topic1.save(flush:true,failOnError: true)

            topic2.addToResourceHas(resource3)
            topic2.save(flush:true,failOnError: true)

            topic3.addToResourceHas(resource4)
            topic3.save(flush:true,failOnError: true)

            resource1.save(flush:true,failOnError:true)
            resource2.save(flush:true,failOnError:true)
            resource3.save(flush:true,failOnError:true)
            resource4.save(flush:true,failOnError:true)

            }
    }

    void createSubscriptionInDB() {
        if(Subscription.count() == 0 ){
            /*List<User> userList = User.list()
            userList.each {User user ->*/
                //add topic to each user
            Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
            Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
            Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
            Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
            Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
            Subscription s6=new Subscription(seriousness: "CASUAL" ,topic:topic11)
            Subscription s7=new Subscription(seriousness: "CASUAL" , topic :topic1)
            Subscription s8=new Subscription(seriousness: "CASUAL" , topic :topic2)

            u4.addToSubscribedTo(s1)
            u4.addToSubscribedTo(s2)
            u4.addToSubscribedTo(s4)
            u3.addToSubscribedTo(s3)
            u3.addToSubscribedTo(s6)
            u2.addToSubscribedTo(s5)
            u1.addToSubscribedTo(s7)
            u1.addToSubscribedTo(s8)


            topic1.addToSubscriptionHas(s1)
            topic2.addToSubscriptionHas(s2)
            topic11.addToSubscriptionHas(s4)
            topic12.addToSubscriptionHas(s5)

            s1.save(flush:true,failOnError:true)
            s2.save(flush:true,failOnError:true)
            s3.save(flush:true,failOnError:true)
            s4.save(flush:true,failOnError:true)
            s5.save(flush:true,failOnError:true)
            s6.save(flush:true,failOnError:true)
            s7.save(flush:true,failOnError:true)
            s8.save(flush:true,failOnError:true)

        }
    }

}
