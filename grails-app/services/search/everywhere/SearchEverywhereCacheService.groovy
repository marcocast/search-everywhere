package search.everywhere

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.io.FileType

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchEverywhereCacheService {

	private static final String userHomeFolder  = System.getProperty("user.home");
	private static final String searchEverywhereHomeFolder = userHomeFolder + "/.search-everywhere";
	private static final String searchableFilesFolder = searchEverywhereHomeFolder + "/searchable-files";
	private final Map<String,SearchableFile> searchableFileCache = new HashMap<String,SearchableFile>();


	def createFolersIfNotExist(){
		if(!new File(searchEverywhereHomeFolder).exists()){
			new File( searchEverywhereHomeFolder ).mkdir()
			new File( searchableFilesFolder ).mkdir()
		}
	}

	def loadAllIntoCache() {

		loadSearchbaleFiles()
	}


	def loadSearchbaleFiles() {

		def dir = new File(searchableFilesFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			searchableFileCache.put(file.name, new SearchableFile(JSON.parse(file.text)))
		}
	}


	def List<SearchableFile> getAllSearchableFiles(){

		List<SearchableFile> allSearchableFiles = new ArrayList<SearchableFile>()
		searchableFileCache.each() { k, v -> allSearchableFiles.add( v) }

		return allSearchableFiles
	}

	def SearchableFile getSearchableFile(String name){
		return searchableFileCache.get(name)
	}

	def void addSearchableFile(SearchableFile searchableFile){
		def file1 = new File(searchEverywhereHomeFolder + "/searchable-files/" + searchableFile.name)
		file1.write searchableFile.encodeAsJSON().toString()
		searchableFileCache.put(searchableFile.name,searchableFile)
	}

	def void removeSearchableFile(String name){
		def file1 = new File(searchEverywhereHomeFolder + "/searchable-files/" + name)
		file1.delete()
		searchableFileCache.remove(name)
	}

	def void editSearchableFile(SearchableFile searchableFile){
		def file1 = new File(searchEverywhereHomeFolder + "/searchable-files/" + searchableFile.name)
		file1.delete()
		file1.write searchableFile.encodeAsJSON().toString()
		searchableFileCache.put(searchableFile.name,searchableFile)
	}
}
