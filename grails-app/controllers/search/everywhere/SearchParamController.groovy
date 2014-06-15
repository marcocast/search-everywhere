package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchParamController {

	static allowedMethods = [save: "POST", update: "PUT"]

	SearchParamDAOService searchParamDAOService;
	SearchableFileDAOService searchableFileDAOService;

	def index(Integer max) {
		respond searchParamDAOService.getAllSearchParams(), model:[searchParamInstanceCount: searchParamDAOService.getAllSearchParams().size()]
	}

	def show(params) {
		respond searchParamDAOService.getSearchParam(params.identifier)
	}

	def create() {
		[searchableFileInstanceList:searchableFileDAOService.getAllSearchableFiles()]
	}

	@Transactional
	def save(SearchParam searchParamInstance) {

		if (searchParamInstance == null) {
			notFound()
			return
		}

		if (searchParamInstance.hasErrors()) {
			respond searchParamInstance.errors, view:'create'
			return
		}

		searchParamInstance.searchableFileNames = [params.pnames].flatten().findAll{ it != null }

		searchParamDAOService.addSearchParam(searchParamInstance)

		redirect(controller:'searchParam',action:'index')
	}

	def edit(params) {
		[searchParamInstance:searchParamDAOService.getSearchParam(params.identifier),searchableFileInstanceList:searchableFileDAOService.getAllSearchableFiles()]
	}

	@Transactional
	def update(SearchParam searchParamInstance) {

		if (searchParamInstance == null) {
			notFound()
			return
		}

		if (searchParamInstance.hasErrors()) {
			respond searchParamInstance.errors, view:'edit'
			return
		}

		searchParamInstance.searchableFileNames = [params.pnames].flatten().findAll{ it != null }

		searchParamDAOService.editSearchParam(searchParamInstance)

		redirect(controller:'searchParam',action:'index')
	}

	@Transactional
	def delete(params) {

		searchParamDAOService.removeSearchParam(params.identifier)

		redirect(controller:'searchParam',action:'index')
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'searchParamInstance.label', default: 'SearchParam'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
