package search.everywhere


import org.springframework.stereotype.Service


@Service
class IntraSearchService {

	def searchableFileDAOService;
	def searchParamDAOService;
	def resultDAOService;

	def getAllLabels() {
		Set<String> allLabels = new HashSet<String>()
		searchableFileDAOService.getAllSearchableFiles().each {
			allLabels.add(it.name)
			allLabels.add(it.url)
		}
		searchParamDAOService.getAllActiveSearchParams().each {
			allLabels.add(it.name)
			allLabels.add(it.text)
		}
		return allLabels as grails.converters.JSON
	}
}
