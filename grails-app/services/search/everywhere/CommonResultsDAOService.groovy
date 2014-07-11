package search.everywhere

import grails.transaction.Transactional

import java.util.HashMap.Entry

import org.springframework.stereotype.Service

@Service
@Transactional
class CommonResultsDAOService {

	def searchEverywhereCacheService;
	def resultDAOService;


	def String get1stCommonData(){
		return searchEverywhereCacheService.commonResultsDataCache.get("first")
	}

	def String get2ndCommonData(){
		return searchEverywhereCacheService.commonResultsDataCache.get("second")
	}

	def String get3rdCommonData(){
		return searchEverywhereCacheService.commonResultsDataCache.get("third")
	}

	def extract1stCommonData(){

		List<Entry<String, List<Long>>> entries = searchEverywhereCacheService.commonResultsCache.sort {
			it.value.size()
		}.entrySet().toList().reverse().take(12)

		if(entries.size() > 0){

			String data = extractCommonData(entries.get(0))

			searchEverywhereCacheService.commonResultsDataCache.put("first",data)
			def file1 = new File(searchEverywhereCacheService.commonResultsDataFolder + "/first")
			file1.write data
		}
	}

	def extract2ndCommonData(){

		List<Entry<String, List<Long>>> entries = searchEverywhereCacheService.commonResultsCache.sort {
			it.value.size()
		}.entrySet().toList().reverse().take(12)

		if(entries.size() > 1){

			String data = extractCommonData(entries.get(1))

			searchEverywhereCacheService.commonResultsDataCache.put("second",data)
			def file1 = new File(searchEverywhereCacheService.commonResultsDataFolder + "/second")
			file1.write data
		}
	}

	def extract3rdCommonData(){

		List<Entry<String, List<Long>>> entries = searchEverywhereCacheService.commonResultsCache.sort {
			it.value.size()
		}.entrySet().toList().reverse().take(12)

		if(entries.size() > 2){

			String data = extractCommonData(entries.get(2))

			searchEverywhereCacheService.commonResultsDataCache.put("third",data)
			def file1 = new File(searchEverywhereCacheService.commonResultsDataFolder + "/third")
			file1.write data
		}
	}

	private String extractCommonData(Entry<String, List<Long>> entry){

		String dataToReturn = ""
		List<Long> results = entry.getValue()
		String name = entry.getKey()
		name = resultDAOService.getResultParamFromIdentifier(name)

		String totalLines = ""
		long total = 0l
		long last = 0l
		int counter = 0;

		int drop = 0
		if(results.size() > 10){
			drop = results.size() - 10
		}


		results.drop(drop).each {
			totalLines = totalLines + it + ","
			total = total + it
			last = it
			counter++
		}


		BigDecimal allLessLast = new BigDecimal(total)

		BigDecimal average = new BigDecimal(total)
		if(counter > 2){
			allLessLast	= new BigDecimal(total - last)
			average =  allLessLast.divide(new BigDecimal(counter-1),1, BigDecimal.ROUND_HALF_UP)
		}else if(counter > 1){
			average =  new BigDecimal(total - last)
		}


		int compareResult = average.compareTo(new BigDecimal(last)) ;
		String increasingDecrising = ""
		BigDecimal averageResult = null
		if(compareResult == 1){
			BigDecimal difference = average.subtract(new BigDecimal(last))
			increasingDecrising = "fa-arrow-circle-down"
			averageResult = (difference.multiply(new BigDecimal(100))).divide(average,BigDecimal.ROUND_HALF_UP)
		}else if(compareResult == -1){
			BigDecimal difference = new BigDecimal(last).subtract(average)
			increasingDecrising = "fa-arrow-circle-up"
			if(average.compareTo(BigDecimal.ZERO) == 0){
				averageResult = new BigDecimal(100);
			}else{
				averageResult = (difference.multiply(new BigDecimal(100))).divide(average,BigDecimal.ROUND_HALF_UP)
			}
		}else{
			increasingDecrising = "fa-arrow-circle-o-right"
			averageResult = BigDecimal.ZERO
		}

		dataToReturn = name	+ "???" +	totalLines.substring(0,totalLines.size()-1) + "AVE" + averageResult + "UD" + increasingDecrising

		return dataToReturn
	}


	def void addResult(Result result){

		String commonIdentifier = result.identifier.substring(result.identifier.indexOf('X'))
		if(!searchEverywhereCacheService.commonResultsCache.containsKey(commonIdentifier)){
			searchEverywhereCacheService.commonResultsCache.put(commonIdentifier, new ArrayList<Long>())
		}
		searchEverywhereCacheService.commonResultsCache.get(commonIdentifier).add(result.totalMatches)
		removeCommonResultFile(commonIdentifier)
		def file1 = new File(searchEverywhereCacheService.commonResultsFolder + "/" + commonIdentifier)
		file1.write searchEverywhereCacheService.commonResultsCache.get(commonIdentifier).encodeAsJSON().toString()

		extract1stCommonData()
		extract2ndCommonData()
		extract3rdCommonData()
	}

	def void removeAll(){
		searchEverywhereCacheService.commonResultsCache.findAll{ it.value != null }.each { removeCommonResult(it.key) }
	}

	def void removeCommonResultFile(String commonIdentifier){
		def file1 = new File(searchEverywhereCacheService.commonResultsFolder + "/" + commonIdentifier)
		file1.delete()
	}

	def void removeCommonResultsFileFromResultIdentifier(String identifier){
		String commonIdentifier = identifier.substring(identifier.indexOf('X'))
		removeCommonResult(commonIdentifier)
	}

	def void removeCommonResult(String commonIdentifier){
		searchEverywhereCacheService.commonResultsCache.remove(commonIdentifier)
		def file1 = new File(searchEverywhereCacheService.commonResultsFolder + "/" + commonIdentifier)
		file1.delete()
	}
}
