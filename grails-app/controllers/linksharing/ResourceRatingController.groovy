package linksharing

class ResourceRatingController {

    def resourceRatingService
    def save() {
        //println "params: in save method"+params
        resourceRatingService.saveMethod(params)
    }
}
