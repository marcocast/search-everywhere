package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class ResultFileReaderService {

	def searchEverywhereCacheService;

	def readFullResultFile(String resultIdentifier) {

		new File(searchEverywhereCacheService.searchEverywhereHomeFolder + "/" + resultIdentifier).text
	}
}
