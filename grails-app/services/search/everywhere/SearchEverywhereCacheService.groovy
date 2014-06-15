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
	static final String searchableFilesFolder = searchEverywhereHomeFolder + "/searchable-files";
	static final String searchParamsFolder = searchEverywhereHomeFolder + "/search-params";
	final Map<String,SearchableFile> searchableFileCache = new ConcurrentHashMap<String,SearchableFile>();
	final Map<String,SearchParam> searchParamCache = new ConcurrentHashMap<String,SearchParam>();


	def createFolersIfNotExist(){
		if(!new File(searchEverywhereHomeFolder).exists()){
			new File( searchEverywhereHomeFolder ).mkdir()
			new File( searchableFilesFolder ).mkdir()
			new File( searchParamsFolder ).mkdir()
		}
	}

	def loadAllIntoCache() {

		loadSearchbaleFiles()
		loadSearchParams()
	}


	def loadSearchbaleFiles() {

		def dir = new File(searchableFilesFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			searchableFileCache.put(file.name, new SearchableFile(JSON.parse(file.text)))
		}
	}


	def loadSearchParams() {

		def dir = new File(searchParamsFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			searchParamCache.put(file.name, new SearchParam(JSON.parse(file.text)))
		}
	}
}
