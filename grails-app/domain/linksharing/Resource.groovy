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

    class LinkResource extends Resource{
        String url

    }
    class DocumentResource extends Resource{
        String filePath

    }

    static mapping={
        table 'Resources'
    }
}
