package linksharing

import Enums.Visibility

class Topic {

    String name
    Date dateCreated

   // Long visibilityId = Visibility.PRIVATE.id
    Visibility visibility
    Date lastUpdated


    static belongsTo = [createdBy:User]
    static hasMany = [resourceHas:Resource,subscriptionHas:Subscription]


    static constraints = {
        //add conditional check for visibility id shall be driven from enum ids
        //visibilityId nullable: true
       // visibilityId inList: Visibility.values()*.id
    }
}
