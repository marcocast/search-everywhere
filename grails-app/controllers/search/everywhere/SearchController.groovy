package search.everywhere;



class SearchController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def executeSearch(params){

		SearchParam searchParam = new SearchParam(params)


		println "daiiiii : " +searchParam.regex


		searchParam.searchableFileNames = [params.searchableFileName].flatten().findAll{ it != null }
		Result result = null;
		try{
			result = grepService.grepBasedOnSearchParams(searchParam)
			resultDAOService.addResult(result)
		}catch(Exception e){
			result = new Result();
			result.text = searchParam.text
			result.regex = searchParam.regex
			result.searchableFileNames = searchParam.searchableFileNames
			result.totalMatches = -1
			result.resultDate = System.currentTimeMillis()
			result.result = e.getMessage()
			result.result = result.result + "\n"
			String searchableFileIdentifier = searchParam.searchableFileNames.first()
			result.result = result.result + "Make sure the searchable file : '" + searchableFileDAOService.getSearchableFile(searchableFileIdentifier).name + "' exists and that the credentials are correct"
		}
		render (template: "result", model: [result: result])
	}



	def search() {
		SearchParam searchParam = new SearchParam(params)
		[ searchParam:searchParam ]
	}

	def searchWithSearchParam() {
		if(params.searchParamas == null){
			render(view: "search", model: [searchParam:new SearchParam()])
		}else{
			SearchParam searchParam = searchParamDAOService.getSearchParam(params.searchParamas)
			render(view: "search", model: [searchParam:searchParam])
		}
	}


	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}
}
