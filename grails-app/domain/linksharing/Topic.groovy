package linksharing

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    /*enum VISIBILITY{
        PRIVATE,PUBLIC
    }*/

    static belongsTo = [user:User]
    static hasMany = [resources:Resource, subscriptions:Subscription]


    static constraints = {

    }
}
