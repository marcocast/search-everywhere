package search.everywhere

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.io.FileType

import java.util.concurrent.ConcurrentHashMap

import org.springframework.stereotype.Service

@Service
@Transactional
class SearchEverywhereCacheService {

	private static final String userHomeFolder  = System.getProperty("user.home");
	private static final String searchEverywhereHomeFolder = userHomeFolder + "/.search-everywhere";
	private static final String searchableFilesFolder = searchEverywhereHomeFolder + "/searchable-files";
	private final Map<String,SearchableFile> searchableFileCache = new ConcurrentHashMap<String,SearchableFile>();


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

	def Map<String,SearchableFile> getSearchableFileCache(){
		return searchableFileCache;
	}

	def String getSearchableFilesFolder(){
		return searchableFilesFolder
	}
}
