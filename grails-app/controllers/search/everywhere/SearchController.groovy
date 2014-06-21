package search.everywhere;



class SearchController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def executeSearch(params){

		SearchParam searchParam = new SearchParam(params)

		searchParam.searchableFileNames = [params.searchableFileName].flatten().findAll{ it != null }

		Result result = grepService.grepBasedOnSearchParams(searchParam)

		resultDAOService.addResult(result)

		render (template: "result", model: [result: result])
	}



	def search() {
		SearchParam searchParam = new SearchParam(params)
		[ searchParam:searchParam ]
	}

	def searchWithSearchParam() {
		SearchParam searchParam = searchParamDAOService.getSearchParam(params.searchParamas)
		render(view: "search", model: [searchParam:searchParam])
	}


	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}
}
