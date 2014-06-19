package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchParamDAOService {

	def searchEverywhereCacheService;

	def List<SearchParam> getAllSearchParams(){

		List<SearchParam> allSearchParams = new ArrayList<SearchParam>()
		searchEverywhereCacheService.searchParamCache.each() { k, v -> allSearchParams.add( v) }

		return allSearchParams
	}

	def SearchParam getSearchParam(String identifier){
		return searchEverywhereCacheService.searchParamCache.get(identifier)
	}

	def SearchParam getSearchParamByName(String name){
		return searchEverywhereCacheService.searchParamCache.find{it.name == name}
	}

	def void addSearchParam(SearchParam searchParam){
		searchParam.identifier = searchParam.name.replaceAll(" ","_").replaceAll("\\.", "-")
		def file1 = new File(searchEverywhereCacheService.searchParamsFolder + "/" + searchParam.identifier)
		file1.write searchParam.encodeAsJSON().toString()
		searchEverywhereCacheService.searchParamCache.put(searchParam.identifier,searchParam)
	}

	def void removeSearchParam(String identifier){
		def file1 = new File(searchEverywhereCacheService.searchParamsFolder + "/" + identifier)
		file1.delete()
		searchEverywhereCacheService.searchParamCache.remove(identifier)
	}

	def void editSearchParam(SearchParam searchParam){
		removeSearchParam(searchParam.identifier)
		def modifiedFile = new File(searchEverywhereCacheService.searchParamsFolder + "/" + searchParam.identifier)
		modifiedFile.write searchParam.encodeAsJSON().toString()
		searchEverywhereCacheService.searchParamCache.put(searchParam.identifier,searchParam)
	}

	def searchParamsSize(){

		return searchEverywhereCacheService.searchParamCache.size()
	}
}
