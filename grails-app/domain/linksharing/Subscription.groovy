package linksharing

import org.hibernate.mapping.Table

class Subscription {

    Topic topic
    User user
    /*enum SERIOUSNESS{
        CASUAL,
        SERIOUS,
        VERY_SERIOUS
    }*/
    Date dateCreated

    static belongsTo = [user:User, topic:Topic]

    static constraints = {


    }
}
