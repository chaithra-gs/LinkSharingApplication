    package linksharing

    import Enums.Seriousness
    import org.hibernate.mapping.Table

    class Subscription {

        Topic topic
        User user
        Date dateCreated
        Seriousness seriousness

        static belongsTo = [user:User, topic:Topic]

        static constraints = {

            //int countUbs = Subscription.countByUser(user)


        }
    }
