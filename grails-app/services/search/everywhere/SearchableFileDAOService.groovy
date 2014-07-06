package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchableFileDAOService {

	def searchEverywhereCacheService;
	def searchParamDAOService;
	def resultDAOService;
	def encodingService;
	def notifyService;

	def List<SearchableFile> getAllSearchableFiles(){

		List<SearchableFile> allSearchableFiles = new ArrayList<SearchableFile>()
		searchEverywhereCacheService.searchableFileCache.each() { k, v -> allSearchableFiles.add( v) }

		return allSearchableFiles
	}

	def SearchableFile getSearchableFile(String identifier){
		return searchEverywhereCacheService.searchableFileCache.get(identifier)
	}

	def String getSearchableFileNameFromIdentifier(String identifier){
		return identifier.replaceAll("_"," ").replaceAll("-", "\\.")
	}


	def SearchableFile getSearchableFileByName(String name){
		return searchEverywhereCacheService.searchableFileCache.find{it.name == name}
	}


	def void addSearchableFile(SearchableFile searchableFile){
		searchableFile.identifier = searchableFile.name.replaceAll(" ","_").replaceAll("\\.", "-")
		if(searchableFile.password){
			searchableFile.password = encodingService.econdeBase64(searchableFile.password)
		}
		def file1 = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + searchableFile.identifier)
		file1.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.searchableFileCache.put(searchableFile.identifier,searchableFile)
		notifyService.addSearchableFileActivity();
	}

	def void removeSearchableFile(String identifier){

		searchParamDAOService.removeSearchableFileFromSearchParams(identifier)
		resultDAOService.removeSearchableFileFromResult(identifier)
		removeSearchableFileOnly(identifier)
	}

	def void removeSearchableFileOnly(String identifier){
		def file1 = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + identifier)
		file1.delete()
		searchEverywhereCacheService.searchableFileCache.remove(identifier)
	}

	def void editSearchableFile(SearchableFile searchableFile){
		removeSearchableFileOnly(searchableFile.identifier)
		if(searchableFile.password){
			searchableFile.password = encodingService.econdeBase64(searchableFile.password)
		}
		def file1 = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + searchableFile.identifier)
		file1.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.searchableFileCache.put(searchableFile.identifier,searchableFile)
	}

	def searchableFilesSize(){

		return searchEverywhereCacheService.searchableFileCache.size()
	}
}
