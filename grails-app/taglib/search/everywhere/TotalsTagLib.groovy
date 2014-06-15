package search.everywhere

class TotalsTagLib {
	static defaultEncodeAs = 'html'
	//static encodeAsForTags = [tagName: 'raw']
	SearchableFileDAOService searchableFileDAOService;
	SearchParamDAOService searchParamDAOService;

	def totSearchablefiles = {attrs ->
		out << searchableFileDAOService.searchableFilesSize()
	}

	def totSearchParams = {attrs ->
		out << searchParamDAOService.searchParamsSize()
	}
}
