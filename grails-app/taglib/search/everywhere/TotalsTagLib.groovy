package search.everywhere

class TotalsTagLib {
	static defaultEncodeAs = 'html'
	//static encodeAsForTags = [tagName: 'raw']
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;
	ResultDAOService resultDAOService;

	def totSearchablefiles = {attrs ->
		out << searchableFileDAOService.searchableFilesSize()
	}

	def totSearchParams = {attrs ->
		out << searchParamDAOService.searchParamsSize()
	}

	def totResults = {attrs ->
		out << resultDAOService.resultsSize()
	}
}
