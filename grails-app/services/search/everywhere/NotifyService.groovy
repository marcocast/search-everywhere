package search.everywhere

import grails.transaction.Transactional

import java.util.concurrent.atomic.AtomicInteger

import org.springframework.stereotype.Service


@Service
@Transactional
class NotifyService {

	def searchEverywhereCacheService;
	def searchableFileDAOService
	def searchParamDAOService
	def resultDAOService
	private AtomicInteger recentSearchableFilesActivitiesCounter = new AtomicInteger(0);
	private AtomicInteger recentSearchParamsActivitiesCounter = new AtomicInteger(0);
	private AtomicInteger recentResultsActivitiesCounter = new AtomicInteger(0);

	public void addResultActivity(){
		recentResultsActivitiesCounter.incrementAndGet();
	}

	public void addSearchParamActivity(){
		recentSearchParamsActivitiesCounter.incrementAndGet();
	}

	public void addSearchableFileActivity(){
		recentSearchableFilesActivitiesCounter.incrementAndGet();
	}

	public int getTotalActivity(){
		return recentSearchableFilesActivitiesCounter.get() + recentSearchParamsActivitiesCounter.get() + recentResultsActivitiesCounter.get();
	}

	public int getTotalRecentSearchableFilesActivities(){
		return recentSearchableFilesActivitiesCounter.get();
	}

	public int getTotalRecentSearchParamsActivities(){
		return recentSearchParamsActivitiesCounter.get() ;
	}

	public int getTotalRecentResultsActivities(){
		return recentResultsActivitiesCounter.get();
	}

	def getLatestSearchableFiles(int tot) {
		recentSearchableFilesActivitiesCounter.set(0);
		List<SearchableFile> orderedFiles = new ArrayList<SearchableFile>()
		if(!new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { searchableFileDAOService.getSearchableFile(it.name) }.take(tot)
		}
	}


	def getLatestSearchParams(int tot) {
		recentSearchParamsActivitiesCounter.set(0);
		List<SearchParam>  orderedFiles = new ArrayList<SearchParam>()
		if(!new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { searchParamDAOService.getSearchParam(it.name) }.take(tot)
		}
	}


	def getLatestResults(int tot) {
		recentResultsActivitiesCounter.set(0);
		List<Result>  orderedFiles = new ArrayList<Result>()
		if(!new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { resultDAOService.getResult(it.name) }.take(tot)
		}
	}

	def getLastUpdateDate(){

		List<File> mostRecents = new ArrayList<File>();
		if(!new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			mostRecents.add(new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())
		}
		if(!new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			mostRecents.add( new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())
		}
		if(!new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			mostRecents.add(new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse().head())
		}
		if(mostRecents.isEmpty()){
			return 0
		}else{
			return mostRecents.sort{it.lastModified()}.reverse().head().lastModified()
		}
	}
}
