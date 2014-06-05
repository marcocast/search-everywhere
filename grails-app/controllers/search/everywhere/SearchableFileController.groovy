package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SearchableFileController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 100, 100)
		respond SearchableFile.list(params), model:[searchableFileInstanceCount: SearchableFile.count()]
	}

	def show(SearchableFile searchableFileInstance) {
		respond searchableFileInstance
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

		searchableFileInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'searchableFileInstance.label', default: 'SearchableFile'),
					searchableFileInstance.id
				])
				redirect searchableFileInstance
			}
			'*' { respond searchableFileInstance, [status: CREATED] }
		}
	}

	def edit(SearchableFile searchableFileInstance) {
		respond searchableFileInstance
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

		searchableFileInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'SearchableFile.label', default: 'SearchableFile'),
					searchableFileInstance.id
				])
				redirect searchableFileInstance
			}
			'*'{ respond searchableFileInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(SearchableFile searchableFileInstance) {

		if (searchableFileInstance == null) {
			notFound()
			return
		}

		searchableFileInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'SearchableFile.label', default: 'SearchableFile'),
					searchableFileInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
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
