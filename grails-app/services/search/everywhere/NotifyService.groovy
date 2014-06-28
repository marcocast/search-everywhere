package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service


@Service
@Transactional
class NotifyService {

	def searchEverywhereCacheService;
	def searchableFileDAOService
	def searchParamDAOService
	def resultDAOService

	def getLatestSearchableFiles(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { searchableFileDAOService.getSearchableFile(it.name) }.take(tot)
	}


	def getLatestSearchParams(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { searchParamDAOService.getSearchParam(it.name) }.take(tot)
	}


	def getLatestResults(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { resultDAOService.getResult(it.name) }.take(tot)
	}

	def getLastUpdateDate(){
		List<File> mostRecents = new ArrayList<File>();
		mostRecents.add(new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())
		mostRecents.add( new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())
		mostRecents.add(new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())

		def lastDate = mostRecents.sort{it.lastModified()}.reverse().head().lastModified()

		return lastDate
	}
}
