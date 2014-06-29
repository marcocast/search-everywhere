package search.everywhere;



class GraphByResultController {

	GrepService grepService
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def executeSearch(params){

		def totalColumns

		def myDailyActivitiesColumns = [
			["string", "Result"],
			["number", "Lines found"]
		]

		def myDailyActivitiesData = [];

		def myDailyActivitiesDataPerType = [
			[new Date(), 33, 22],
			[new Date(), 44, 45]
		]

		def myDailyActivitiesColumnsPerType = [
			["date", "date"],
			[
				"number",
				"Some result name a"
			],
			[
				"number",
				"Some result name b"
			]
		]

		Map<String, List<Result>> identifierPerResult = new HashMap<String, List<Result>>();

		def allResults = params.checkboxResult.replaceAll('\\[', '').replaceAll('\\]', '').replaceAll(' ', '').tokenize( ',' )

		for(String identifier : allResults){

			Result result = resultDAOService.getResult(identifier)
			String searchableFileName = searchableFileDAOService.getSearchableFile(result.searchableFileNames.first()).name;


			myDailyActivitiesData.add([
				searchableFileName + " - " + new Date(result.resultDate),
				result.totalMatches
			])

			if(!identifierPerResult.containsKey(resultDAOService.getResultParamFromIdentifier(identifier))){
				identifierPerResult.put(resultDAOService.getResultParamFromIdentifier(identifier), new ArrayList<Result>())
			}

			identifierPerResult.get(resultDAOService.getResultParamFromIdentifier(identifier)).add(result)
		}









		render  template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns, "myDailyActivitiesData": myDailyActivitiesData, "myDailyActivitiesColumnsPerType":myDailyActivitiesColumnsPerType, "myDailyActivitiesDataPerType": myDailyActivitiesDataPerType]
	}


	def graph() {
		[ checkboxResult:params.checkboxResult ]
	}

	def graphWithSearchParam() {
		SearchParam searchParam = searchParamDAOService.getSearchParam(params.searchParamas)
		render(view: "graph", model: [searchParam:searchParam])
	}


	def index() {
		respond resultDAOService.getAllResults().sort{ it.resultDate }.reverse(), model:[getAllResultsInstanceCount: resultDAOService.getAllResults().size()]
	}
}
