package linksharing

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    String  photo
    Boolean admin
    Boolean active
    Date dateCreated
    //Date dateUpdated
    //Reading_Item reading_item
    //Resource_Rating resource_rating
    static hasMany = [subscribedTo:Subscription, topics:Topic, resources:Resource, readItem:ReadingItem, resourceRated:ResourceRating]

    static constraints = {
        email(unique:true,email:true)
        username(unique:true)
        password(size:4..15, matches:"[a-zA-Z0-9]+")
        photo (blank:true,nullable:true)
        admin nullable:true
        password(validator:{val,obj->
            if(val.equals(obj.firstName)){ return false }
        })
    }



    static mapping={
        table 'Users'
    }
}
