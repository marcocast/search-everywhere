package search.everywhere

class IntraSearchController {

	def searchableFileDAOService;
	def searchParamDAOService;
	def resultDAOService;

	def search() {
		String text = params.param



		List<SearchableFile> searchableFilesList = new ArrayList<SearchableFile>()
		List<SearchParam> searchParamsList = new ArrayList<SearchParam>()

		List<Result> resultsList = new ArrayList<Result>()

		if(text != null && !text.isEmpty()){

			resultDAOService.getAllResults().findAll{
				(it.text.indexOf(text) != -1 || searchableFileDAOService.getSearchableFile(it.searchableFileNames.first()).name.indexOf(text) != -1 ||searchableFileDAOService.getSearchableFile(it.searchableFileNames.first()).url.indexOf(text) != -1 || it.result.indexOf(text) != -1 )
			}.each { resultsList.add(it) }
			searchableFileDAOService.getAllSearchableFiles().findAll{
				(it.name.indexOf(text) != -1 || it.url.indexOf(text) != -1 || it.path.indexOf(text) != -1 )
			}.each { searchableFilesList.add(it) }
			searchParamDAOService.getAllSearchParams().findAll{
				(it.name.indexOf(text) != -1 || it.text.indexOf(text) != -1 || {
					boolean foundit = false
					it.searchableFileNames.each{ v ->
						if(searchableFileDAOService.getSearchableFile(v.value).name.indexOf(text) != -1){
							foundit = true
						}
					}
					return foundit
				}
				)
			}.each { searchParamsList.add(it) }
		}



		render(view: "result", model: [text:text,searchableFilesList:searchableFilesList, resultsList: resultsList, searchParamsList: searchParamsList])
	}
}
