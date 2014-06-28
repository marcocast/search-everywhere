package search.everywhere;



class GraphController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def executeSearch(params){

		def myDailyActivitiesColumns = [
			["string", "Profile - File"],
			["number", "lines found"]
		]

		def myDailyActivitiesData = [];

		SearchParam searchParam = new SearchParam(params)

		searchParam.searchableFileNames = [params.searchableFileName].flatten().findAll{ it != null }
		Result result = null;
		try{
			result = grepService.grepBasedOnSearchParams(searchParam)
			resultDAOService.addResult(result)
			myDailyActivitiesData.add([
				result.identifier,
				result.totalMatches
			])
			myDailyActivitiesData.add([
				result.identifier,
				result.totalMatches
			])
			myDailyActivitiesData.add([
				result.identifier,
				result.totalMatches
			])
			myDailyActivitiesData.add([
				result.identifier,
				result.totalMatches
			])
			myDailyActivitiesData.add([
				result.identifier,
				result.totalMatches
			])
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

		render template: "chart", model: [result: result, "myDailyActivitiesColumns": myDailyActivitiesColumns,	"myDailyActivitiesData": myDailyActivitiesData]
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
