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

		def myDailyActivitiesDataPerType = []

		def myDailyActivitiesColumnsPerType = [["string", "date"]]

		try{

			Map<String, List<Result>> identifierPerResult = new HashMap<String, List<Result>>();

			List<Long> dates = new ArrayList<Long>()

			def allResults = params.checkboxResult.replaceAll('\\[', '').replaceAll('\\]', '').replaceAll(' ', '').tokenize( ',' ).sort(true)

			for(String identifier : allResults){

				Result result = resultDAOService.getResult(identifier)
				String searchableFileName = searchableFileDAOService.getSearchableFile(result.searchableFileNames.first()).name;

				myDailyActivitiesData.add([
					resultDAOService.getResultParamFromIdentifier(identifier) + " - " + new Date(result.resultDate),
					result.totalMatches
				])

				if(!identifierPerResult.containsKey(resultDAOService.getResultParamFromIdentifier(identifier))){
					identifierPerResult.put(resultDAOService.getResultParamFromIdentifier(identifier), new ArrayList<Result>())
				}

				identifierPerResult.get(resultDAOService.getResultParamFromIdentifier(identifier)).add(result)

				long droppedMillis = 100000 * (result.resultDate/ 100000);
				dates.add(droppedMillis)
			}



			identifierPerResult.each{ k, v ->

				myDailyActivitiesColumnsPerType.add(["number", k])
			}

			dates.each{ dd ->

				def element = []
				element.add(new Date(dd))

				identifierPerResult.each{ k, v ->
					boolean added = false;
					v.each { el ->

						long droppedMillis = 100000 * (el.resultDate/ 100000);

						if(droppedMillis.compareTo(dd.longValue()) == 0){
							element.add(el.totalMatches)
							added = true;
						}
					}

					if(!added){
						element.add(0l)
					}
				}

				myDailyActivitiesDataPerType.add(element)
			}
		}catch (Exception e){
		}

		render  template: "chart", model: ["myDailyActivitiesColumns": myDailyActivitiesColumns, "myDailyActivitiesData": myDailyActivitiesData, "myDailyActivitiesColumnsPerType":myDailyActivitiesColumnsPerType, "myDailyActivitiesDataPerType": myDailyActivitiesDataPerType]
	}


	def graph() {
		[ checkboxResult:params.checkboxResult ]
	}




	def index() {
		respond resultDAOService.getAllResults().sort{ it.resultDate }.reverse(), model:[getAllResultsInstanceCount: resultDAOService.getAllResults().size()]
	}
}
