package search.everywhere;



class GraphController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def executeSearch(params){

		def myDailyActivitiesColumns = [
			["string", "Searchable File"],
			["number", "Lines found"]
		]

		def myDailyActivitiesData = [];

		def allSearchableFiles =params.searchableFileNames.replaceAll('\\[', '').replaceAll('\\]', '').replaceAll(' ', '').tokenize( ',' )

		for(String searchableFileName : allSearchableFiles){


			SearchParam searchParam = new SearchParam(params)

			searchParam.searchableFileNames = [searchableFileName]

			Result result = null;
			try{
				result = grepService.grepBasedOnSearchParams(searchParam)

				myDailyActivitiesData.add([
					searchableFileDAOService.getSearchableFile(searchableFileName).name,
					result.totalMatches
				])
			}catch(Exception e){
			}
		}




		render template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData.sort(true) {it[1]}.reverse()]
	}


	def graph() {
		SearchParam searchParam = new SearchParam(params)
		[ searchParam:searchParam ]
	}

	def graphWithSearchParam() {
		SearchParam searchParam = searchParamDAOService.getSearchParam(params.searchParamas)
		render(view: "graph", model: [searchParam:searchParam])
	}


	def index() {
		respond searchableFileDAOService.getAllSearchableFiles(), model:[searchableFileInstanceCount: searchableFileDAOService.getAllSearchableFiles().size()]
	}
}
