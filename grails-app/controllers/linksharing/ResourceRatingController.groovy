package linksharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceRatingController {

    def resourceRatingService

    def save() {
        resourceRatingService.saveMethod(params)
        render ([success:true] as JSON)
    }
}
