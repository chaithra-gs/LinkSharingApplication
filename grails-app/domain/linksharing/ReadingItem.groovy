package linksharing

class ReadingItem {

    Resource resource
    User user
    Boolean isRead
    static belongsTo = [users:User, resource:Resource]
    static constraints = {

    }
}
