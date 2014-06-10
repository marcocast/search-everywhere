package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchableFileController {

	static allowedMethods = [save: "POST", update: "PUT"]
	def searchEverywhereCacheService;



	def index() {
		respond searchEverywhereCacheService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchEverywhereCacheService.getAllSearchableFiles().size()]
	}

	def show(params) {
		respond searchEverywhereCacheService.getSearchableFile(params.name)
	}

	def create() {
		respond new SearchableFile(params)
	}

	@Transactional
	def save(SearchableFile searchableFileInstance) {
		if (searchableFileInstance == null) {
			notFound()
			return
		}

		if (searchableFileInstance.hasErrors()) {
			respond searchableFileInstance.errors, view:'create'
			return
		}

		def userHomeFolder  = System.getProperty("user.home")
		def searchEverywhereHomeFolder = userHomeFolder + "/.search-everywhere"



		searchEverywhereCacheService.addSearchableFile(searchableFileInstance)



		redirect(controller:'searchableFile',action:'index')
	}

	def edit(params) {
		respond searchEverywhereCacheService.getSearchableFile(params.name)
	}

	@Transactional
	def update(SearchableFile searchableFileInstance) {
		if (searchableFileInstance == null) {
			notFound()
			return
		}

		if (searchableFileInstance.hasErrors()) {
			respond searchableFileInstance.errors, view:'edit'
			return
		}

		searchEverywhereCacheService.editSearchableFile(searchableFileInstance)

		redirect(controller:'searchableFile',action:'index')
	}

	@Transactional
	def delete(params) {


		searchEverywhereCacheService.removeSearchableFile(params.name)

		redirect(controller:'searchableFile',action:'index')
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'searchableFileInstance.label', default: 'SearchableFile'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
