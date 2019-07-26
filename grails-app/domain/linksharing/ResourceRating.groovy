package linksharing

class ResourceRating {

    User user
    Integer score

    static belongsTo = [userRated:User, resource:Resource]

    static constraints = {
        score range:0..5,nullable:true
    }
}
