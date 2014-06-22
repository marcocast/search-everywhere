package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service


@Service
@Transactional
class MostCommonResultService {

	def searchEverywhereCacheService;
	def searchableFileDAOService
	def resultDAOService
	def notifyService


	def get1stMostCommonData() {

		return searchEverywhereCacheService.mostCommonResultCache.entrySet().toList().first().value
	}

	def get1stMostCommonResult() {

		return searchEverywhereCacheService.mostCommonResultCache.keySet().toList().first().text
	}

	def set1stMostCommon() {

		def orderedFiles =  new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{ it.file }.grep(~/.*/).sort{ it.lastModified() }.reverse()

		Map<String, Integer> allResultsGroupedAndOrdered = new HashMap<String, Integer>();

		orderedFiles.each {
			String nameWithoutDate = it.name.substring(it.name.indexOf('X'));
			if(!allResultsGroupedAndOrdered.containsKey(nameWithoutDate)){

				allResultsGroupedAndOrdered.put(nameWithoutDate, 0);
			}
			allResultsGroupedAndOrdered.put(nameWithoutDate, 1 + allResultsGroupedAndOrdered.get(nameWithoutDate));
		}

		allResultsGroupedAndOrdered = allResultsGroupedAndOrdered.sort { -it.value }

		String toReturn = ""

		String theFirstResult =  allResultsGroupedAndOrdered.keySet().toList().first()

		Result resultAsKey = null;
		orderedFiles.take(12).reverse().each{
			if(it.name.indexOf(theFirstResult) != -1){
				resultAsKey = resultDAOService.getResult(it.name)
				toReturn += resultAsKey.totalMatches + ","
			}
		}

		if(toReturn.endsWith(',')){
			toReturn = toReturn.substring(0, toReturn.length()-1)
		}

		searchEverywhereCacheService.mostCommonResultCache.put(resultAsKey, toReturn)
	}
}
