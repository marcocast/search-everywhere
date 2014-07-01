package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchableFileController {

	static allowedMethods = [save: "POST", update: "PUT"]

	def searchableFileDAOService;
	def encodingService



	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}

	def show(params) {
		respond searchableFileDAOService.getSearchableFile(params.identifier)
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

		searchableFileDAOService.addSearchableFile(searchableFileInstance)

		redirect(controller:'searchableFile',action:'index')
	}

	def edit(params) {
		SearchableFile searchableFile = searchableFileDAOService.getSearchableFile(params.identifier)
		if(searchableFile.password != null){
			searchableFile.password = encodingService.decodeBase64(searchableFile.password);
		}
		respond searchableFile
	}

	def copy(params) {
		SearchableFile searchableFile = searchableFileDAOService.getSearchableFile(params.identifier)
		SearchableFile newOne = new SearchableFile();
		newOne.name = "CopyOf"+searchableFile.name
		newOne.password = null
		newOne.url = searchableFile.url
		newOne.path = searchableFile.path
		newOne.user = searchableFile.user
		respond newOne
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

		searchableFileDAOService.editSearchableFile(searchableFileInstance)

		redirect(controller:'searchableFile',action:'index')
	}

	@Transactional
	def delete(params) {


		searchableFileDAOService.removeSearchableFile(params.identifier)

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
