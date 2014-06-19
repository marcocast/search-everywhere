package search.everywhere;



class SearchController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;

	def executeSearch(params){

		SearchParam searchParam = new SearchParam(params)

		searchParam.searchableFileNames = [params.searchableFileName].flatten().findAll{ it != null }

		String grepsearchResult = grepService.grepBasedOnSearchParams(searchParam)

		render (template: "result", model: [grepsearchResult: grepsearchResult])
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
