package sample


import grails.test.mixin.TestFor
import linksharing.AuthenticationInterceptor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AuthenticationInterceptor)
class AuthenticationInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test authentication interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"authentication")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
