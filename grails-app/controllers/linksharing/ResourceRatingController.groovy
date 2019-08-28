package linksharing

class ResourceRatingController {

    def resourceRatingService
    def save(){
        resourceRatingService.saveMethod(params)
    }
}
