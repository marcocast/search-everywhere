package search.everywhere;



class SearchController {

	SearchableFileDAOService searchableFileDAOService;

	def executeSearch(){

		Thread.sleep(3000);
		render "searchParam"
	}



	def search() {
		SearchParam searchParam = new SearchParam(params)
		[ searchParam:searchParam ]
	}


	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}
}
