package linksharing

import Enums.Visibility

class Topic {

    String name
    User createdBy
    Date dateCreated
    Long visibilityId = Visibility.PRIVATE.id
    Date lastUpdated


    static belongsTo = [createdBy:User]
    static hasMany = [resources:Resource, subscriptionTo:Subscription]


    static constraints = {
        //add conditional check for visibility id shall be driven from enum ids
        visibilityId nullable: true
    }
}
