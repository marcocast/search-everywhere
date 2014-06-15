package search.everywhere;



class SearchController {

	SearchableFileDAOService searchableFileDAOService;

	def executeSearch(){

		//render (template: "result", model: [grepsearchResult: grepsearchResult])
	}



	def search() {

		[ searchParams:searchParamsService.getSearchParam(params) ]
	}


	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}
}
