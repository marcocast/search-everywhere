package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service


@Service
@Transactional
class NotifyService {

	def searchEverywhereCacheService;
	def searchableFileDAOService
	def resultDAOService

	def getLatestSearchableFiles(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { searchableFileDAOService.getSearchableFile(it.name) }.take(tot)
	}

	def getLatestResults(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { resultDAOService.getResult(it.name) }.take(tot)
	}
}
