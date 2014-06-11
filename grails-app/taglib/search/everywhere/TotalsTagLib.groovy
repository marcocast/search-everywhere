package search.everywhere

class TotalsTagLib {
	static defaultEncodeAs = 'html'
	//static encodeAsForTags = [tagName: 'raw']
	SearchableFileDAOService searchableFileDAOService;

	def totSearchablefiles = {attrs ->
		out << searchableFileDAOService.searchableFilesSize()
	}
}
