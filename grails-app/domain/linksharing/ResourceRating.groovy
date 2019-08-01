package linksharing

class ResourceRating {

    Integer score

    static belongsTo = [userRated:User, resource:Resource]

    static constraints = {
        score range:0..5,nullable:true
    }
}
