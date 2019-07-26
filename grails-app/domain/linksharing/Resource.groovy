package linksharing

import org.hibernate.mapping.Table

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [topic:Topic,user:User]
    static hasMany = [readingItems:ReadingItem,resourceRated:ResourceRating]

    static constraints = {
        description nullable:true,size:0..100
    }

    static mapping={
        table 'Resources'
    }
}
