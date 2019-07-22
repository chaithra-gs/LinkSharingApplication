package linksharing

class ResourceRating {

    Resource resource
    User user
    Integer score

    static belongsTo = [userRated:User, resourceRated:Resource]

    static constraints = {
        score range:0..5,nullable:true
    }
}
