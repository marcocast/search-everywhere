package search.everywhere

import grails.transaction.Transactional

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchableFileDAOService {

	def searchEverywhereCacheService;

	def List<SearchableFile> getAllSearchableFiles(){

		List<SearchableFile> allSearchableFiles = new ArrayList<SearchableFile>()
		searchEverywhereCacheService.getSearchableFileCache().each() { k, v -> allSearchableFiles.add( v) }

		return allSearchableFiles
	}

	def SearchableFile getSearchableFile(String identifier){
		return searchEverywhereCacheService.getSearchableFileCache().get(identifier)
	}

	def void addSearchableFile(SearchableFile searchableFile){
		searchableFile.identifier = searchableFile.name
		def file1 = new File(searchEverywhereCacheService.getSearchableFilesFolder() + "/" + searchableFile.identifier)
		file1.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.getSearchableFileCache().put(searchableFile.identifier,searchableFile)
	}

	def void removeSearchableFile(String identifier){
		def file1 = new File(searchEverywhereCacheService.getSearchableFilesFolder() + "/" + identifier)
		file1.delete()
		searchEverywhereCacheService.getSearchableFileCache().remove(identifier)
	}

	def void editSearchableFile(SearchableFile searchableFile){
		removeSearchableFile(searchableFile.identifier)

		searchableFile.identifier = searchableFile.name
		def modifiedFile = new File(searchEverywhereCacheService.getSearchableFilesFolder() + "/" + searchableFile.identifier)
		modifiedFile.write searchableFile.encodeAsJSON().toString()
		searchEverywhereCacheService.getSearchableFileCache().put(searchableFile.identifier,searchableFile)
	}
}
