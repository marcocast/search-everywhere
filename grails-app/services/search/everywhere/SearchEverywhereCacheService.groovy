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
	static final String resultsFolder = searchEverywhereHomeFolder + "/results";
	static final String textResultsFolder = searchEverywhereHomeFolder + "/textResults";
	static final String commonResultsFolder = searchEverywhereHomeFolder + "/commonResults";
	static final String commonResultsDataFolder = searchEverywhereHomeFolder + "/commonResultsData";
	final Map<String,SearchableFile> searchableFileCache = new ConcurrentHashMap<String,SearchableFile>();
	final Map<String,SearchParam> searchParamCache = new ConcurrentHashMap<String,SearchParam>();
	final Map<String,Result> resultCache = new ConcurrentHashMap<String,Result>();
	final Map<String,List<Long>> commonResultsCache = new ConcurrentHashMap<String,List<Long>>();
	final Map<String,String> commonResultsDataCache = new ConcurrentHashMap<String,String>();




	def createFolersIfNotExist(){
		if(!new File(searchEverywhereHomeFolder).exists()){
			new File( searchEverywhereHomeFolder ).mkdir()
		}
		if(!new File(searchableFilesFolder).exists()){
			new File( searchableFilesFolder ).mkdir()
		}
		if(!new File(searchParamsFolder).exists()){
			new File( searchParamsFolder ).mkdir()
		}

		if(!new File(resultsFolder).exists()){
			new File( resultsFolder ).mkdir()
		}
		if(!new File(textResultsFolder).exists()){
			new File( textResultsFolder ).mkdir()
		}
		if(!new File(commonResultsFolder).exists()){
			new File( commonResultsFolder ).mkdir()
		}
		if(!new File(commonResultsDataFolder).exists()){
			new File( commonResultsDataFolder ).mkdir()
		}
	}

	def loadAllIntoCache() {

		loadSearchbaleFiles()
		loadSearchParams()
		loadResults()
		loadCommonResults()
		loadCommonResultsData()
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

	def loadResults() {

		def dir = new File(resultsFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			resultCache.put(file.name, new Result(JSON.parse(file.text)))
		}
	}

	def loadCommonResults() {

		def dir = new File(commonResultsFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			commonResultsCache.put(file.name, new ArrayList<Long>(JSON.parse(file.text)))
		}
	}

	def loadCommonResultsData() {

		def dir = new File(commonResultsDataFolder)
		dir.eachFileRecurse (FileType.FILES) { file ->
			commonResultsDataCache.put(file.name, file.text)
		}
	}
}
