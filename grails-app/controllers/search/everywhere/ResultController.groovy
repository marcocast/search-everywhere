package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResultController {

	static allowedMethods = [save: "POST", update: "PUT"]

	def resultDAOService;
	def commonResultsDAOService;

	def index() {
		respond resultDAOService.getAllResults().sort{it.resultDate}.reverse(), model:[getAllResultsInstanceCount: resultDAOService.getAllResults().size()]
	}

	def cleanAllResults() {
		resultDAOService.removeAll()
		commonResultsDAOService.removeAll()
		redirect(controller:'result',action:'index')
	}

	def show(params) {
		respond resultDAOService.getResult(params.identifier)
	}

	def create() {
		respond new Result(params)
	}

	@Transactional
	def save(Result resultInstance) {
		if (resultInstance == null) {
			notFound()
			return
		}

		if (resultInstance.hasErrors()) {
			respond resultInstance.errors, view:'create'
			return
		}

		resultDAOService.addResult(resultInstance)

		redirect(controller:'result',action:'index')
	}

	def edit(params) {
		respond resultDAOService.getResult(params.identifier)
	}


	@Transactional
	def delete(params) {


		resultDAOService.removeResult(params.identifier)

		redirect(controller:'result',action:'index')
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'resultInstance.label', default: 'Result'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
