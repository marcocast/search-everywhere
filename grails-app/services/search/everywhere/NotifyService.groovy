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
	private AtomicInteger recentActivitiesCounter = new AtomicInteger(0);

	public void addActivity(){
		recentActivitiesCounter.incrementAndGet();
	}

	public int getTotalActivity(){
		return recentActivitiesCounter.get();
	}

	def getLatestSearchableFiles(int tot) {
		def orderedFiles = []
		if(!new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.searchableFilesFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { searchableFileDAOService.getSearchableFile(it.name) }.take(tot)
		}
	}


	def getLatestSearchParams(int tot) {
		def orderedFiles = []
		if(!new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.searchParamsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { searchParamDAOService.getSearchParam(it.name) }.take(tot)
		}
	}


	def getLatestResults(int tot) {
		def orderedFiles = []
		if(!new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).isEmpty()){
			orderedFiles =  new File(searchEverywhereCacheService.resultsFolder).listFiles().grep{it.file}.grep(~/.*/).sort{it.lastModified()}.reverse()
			orderedFiles.collect { resultDAOService.getResult(it.name) }.take(tot)
		}
	}

	def getLastUpdateDate(){
		recentActivitiesCounter.set(0);
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
