package search.everywhere



import grails.test.mixin.*
import spock.lang.*

@TestFor(SearchParamController)
@Mock(SearchParam)
class SearchParamControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.searchParamInstanceList
            model.searchParamInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.searchParamInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def searchParam = new SearchParam()
            searchParam.validate()
            controller.save(searchParam)

        then:"The create view is rendered again with the correct model"
            model.searchParamInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            searchParam = new SearchParam(params)

            controller.save(searchParam)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/searchParam/show/1'
            controller.flash.message != null
            SearchParam.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def searchParam = new SearchParam(params)
            controller.show(searchParam)

        then:"A model is populated containing the domain instance"
            model.searchParamInstance == searchParam
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def searchParam = new SearchParam(params)
            controller.edit(searchParam)

        then:"A model is populated containing the domain instance"
            model.searchParamInstance == searchParam
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/searchParam/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def searchParam = new SearchParam()
            searchParam.validate()
            controller.update(searchParam)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.searchParamInstance == searchParam

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            searchParam = new SearchParam(params).save(flush: true)
            controller.update(searchParam)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/searchParam/show/$searchParam.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/searchParam/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def searchParam = new SearchParam(params).save(flush: true)

        then:"It exists"
            SearchParam.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(searchParam)

        then:"The instance is deleted"
            SearchParam.count() == 0
            response.redirectedUrl == '/searchParam/index'
            flash.message != null
    }
}
