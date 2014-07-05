package search.everywhere



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResultController {

	static allowedMethods = [save: "POST", update: "PUT"]

	def resultDAOService;
	def commonResultsDAOService;
	def searchableFileDAOService;

	def index() {
		respond resultDAOService.getAllResults().sort{it.resultDate}.reverse(), model:[getAllResultsInstanceCount: resultDAOService.getAllResults().size()]
	}

	def filterResults() {

		String text = params.text
		String searchableFileName = params.searchableFileName
		String fromS = params.from
		String toS = params.to



		List<Result> filteredResults = resultDAOService.getAllResults()

		if(text != null && !text.isEmpty()){
			filteredResults.findAll{ it.text != text }.each { filteredResults.remove(it) }
		}
		if(searchableFileName != null && !searchableFileName.isEmpty()){
			filteredResults.findAll{ searchableFileDAOService.getSearchableFile(it.searchableFileNames.first()).name != searchableFileName }.each { filteredResults.remove(it) }
		}

		if(fromS != null && !fromS.isEmpty()){
			Date from = new Date(fromS)
			filteredResults.findAll{ new Date(it.resultDate).compareTo(from) == -1 }.each { filteredResults.remove(it) }
		}
		if(toS != null && !toS.isEmpty()){
			toS = toS + " 24:59:59"
			Date to = new Date(toS)
			filteredResults.findAll{ new Date(it.resultDate).compareTo(to) == 1 }.each { filteredResults.remove(it) }
		}

		render(view: "index", model: [resultInstanceList:filteredResults,getAllResultsInstanceCount:filteredResults.size()])
	}



	def cleanAllResults(params) {

		def allResults = params.resultInstanceList.replaceAll('\\[', '').replaceAll('\\]', '').replaceAll(' ', '').tokenize( ',' ).sort(true)

		allResults.each {

			resultDAOService.removeResult(it)
		}

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
