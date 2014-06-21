package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class ResultDAOService {

	def searchEverywhereCacheService;

	def List<Result> getAllResults(){

		List<Result> allResults = new ArrayList<Result>()
		searchEverywhereCacheService.resultCache.each() { k, v -> allResults.add( v) }

		return allResults
	}

	def Result getResult(String identifier){
		return searchEverywhereCacheService.resultCache.get(identifier)
	}

	def String getFullResultText(String identifier){
		if(!new File(searchEverywhereCacheService.textResultsFolder + "/" + identifier).exists()){
			return ""
		}
		return new File(searchEverywhereCacheService.textResultsFolder + "/" + identifier).text
	}


	def void addResult(Result result){

		result.identifier = (result.resultDate + result.text + result.searchableFileNames).replaceAll("\\[","__").replaceAll("\\]","").replaceAll(" ","_").replaceAll("\\.", "-")
		if(result.totalMatches > 0){
			def file2 =new File(searchEverywhereCacheService.textResultsFolder + "/" + result.identifier)
			file2.write result.result
			result.result = ""
		}
		def file1 = new File(searchEverywhereCacheService.resultsFolder + "/" + result.identifier)
		file1.write result.encodeAsJSON().toString()
		searchEverywhereCacheService.resultCache.put(result.identifier,result)
	}

	def void removeResult(String identifier){
		def file1 = new File(searchEverywhereCacheService.resultsFolder + "/" + identifier)
		file1.delete()
		def file2 = new File(searchEverywhereCacheService.textResultsFolder + "/" + identifier)
		file2.delete()
		searchEverywhereCacheService.resultCache.remove(identifier)
	}

	def void editResult(Result result){
		removeResult(result.identifier)
		addResult(result)
	}

	def resultsSize(){
		return searchEverywhereCacheService.resultCache.size()
	}
}
