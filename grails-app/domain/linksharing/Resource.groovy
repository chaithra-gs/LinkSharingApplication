package linksharing

import org.hibernate.mapping.Table

class Resource {

    String decription
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    static hasMany = [readingItems:ReadingItem,resourceRated:ResourceRating]
    static belongsTo = [topic:Topic,user:User]
    static constraints = {
        description nullable:true,size:0..100

    }

    static mapping={
        table 'Resources'
    }
}
