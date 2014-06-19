package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service


@Service
@Transactional
class NotifyService {

	def searchEverywhereCacheService;
	def searchableFileDAOService

	def getLatestSearchableFiles(int tot) {
		def orderedFiles =  new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
		orderedFiles.collect { searchableFileDAOService.getSearchableFile(it.name) }.take(tot)
	}
}
