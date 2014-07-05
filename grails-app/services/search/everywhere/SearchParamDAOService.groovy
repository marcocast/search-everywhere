package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchParamDAOService {

	def searchEverywhereCacheService;
	def notifyService;

	def List<SearchParam> getAllSearchParams(){

		List<SearchParam> allSearchParams = new ArrayList<SearchParam>()
		searchEverywhereCacheService.searchParamCache.each() { k, v -> allSearchParams.add( v) }

		return allSearchParams
	}

	def List<SearchParam> getAllActiveSearchParams(){

		List<SearchParam> allSearchParams = new ArrayList<SearchParam>()
		searchEverywhereCacheService.searchParamCache.findAll{it.value.searchableFileNames.isEmpty() == false}.each() { k, v -> allSearchParams.add( v) }
		return allSearchParams
	}


	def SearchParam getSearchParam(String identifier){
		return searchEverywhereCacheService.searchParamCache.get(identifier)
	}

	def void addSearchParam(SearchParam searchParam){
		searchParam.identifier = searchParam.name.replaceAll(" ","_").replaceAll("\\.", "-")
		def file1 = new File(searchEverywhereCacheService.searchParamsFolder + "/" + searchParam.identifier)
		file1.write searchParam.encodeAsJSON().toString()
		searchEverywhereCacheService.searchParamCache.put(searchParam.identifier,searchParam)
		notifyService.addActivity();
	}

	def void removeSearchParam(String identifier){
		def file1 = new File(searchEverywhereCacheService.searchParamsFolder + "/" + identifier)
		file1.delete()
		searchEverywhereCacheService.searchParamCache.remove(identifier)
	}

	def void removeSearchableFileFromSearchParams(String searchableFileIdentifier){
		searchEverywhereCacheService.searchParamCache.findAll{it.value.searchableFileNames.contains(searchableFileIdentifier)}.each {
			it.value.searchableFileNames.remove(searchableFileIdentifier)
			if(it.value.searchableFileNames.size()==0){
				removeSearchParam(it.value.identifier)
			}else{
				editSearchParam(it.value)
			}
		}
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
