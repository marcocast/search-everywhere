package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchableFileDAOService {

	def searchEverywhereCacheService;

	def List<SearchableFile> getAllSearchableFiles(){

		List<SearchableFile> allSearchableFiles = new ArrayList<SearchableFile>()
		searchEverywhereCacheService.searchableFileCache.each() { k, v -> allSearchableFiles.add( v) }

		return allSearchableFiles
	}

	def SearchableFile getSearchableFile(String identifier){
		return searchEverywhereCacheService.searchableFileCache.get(identifier)
	}

	def void addSearchableFile(SearchableFile searchableFile){
		searchableFile.identifier = searchableFile.name.replaceAll(" ","_").replaceAll("\\.", "-")
		def file1 = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + searchableFile.identifier)
		file1.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.searchableFileCache.put(searchableFile.identifier,searchableFile)
	}

	def void removeSearchableFile(String identifier){
		def file1 = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + identifier)
		file1.delete()
		searchEverywhereCacheService.searchableFileCache.remove(identifier)
	}

	def void editSearchableFile(SearchableFile searchableFile){
		removeSearchableFile(searchableFile.identifier)

		searchableFile.identifier = searchableFile.name.replaceAll(" ","_").replaceAll("\\.", "-")
		def modifiedFile = new File(searchEverywhereCacheService.searchableFilesFolder + "/" + searchableFile.identifier)
		modifiedFile.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.searchableFileCache.put(searchableFile.identifier,searchableFile)
	}

	def searchableFilesSize(){

		return searchEverywhereCacheService.searchableFileCache.size()
	}
}
