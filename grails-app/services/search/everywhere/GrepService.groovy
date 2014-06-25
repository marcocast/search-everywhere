package search.everywhere

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on
import grails.transaction.Transactional

import org.grep4j.core.result.GrepResults
import org.springframework.stereotype.Service


@Service
@Transactional
class GrepService {

	def profileConverterService
	def searchableFileDAOService;


	def grepBasedOnSearchParams(SearchParam searchParam) {

		SearchableFile searchableFile = searchableFileDAOService.getSearchableFile(searchParam.searchableFileNames.first())

		GrepResults grepResult;

		if (searchParam.regex){
			grepResult = grep(regularExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchableFile)));
		}else{
			grepResult = grep(constantExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchableFile)));
		}


		Result result = new Result();

		result.text = searchParam.text
		result.regex = searchParam.regex
		result.searchableFileNames = [searchableFile.identifier].flatten().findAll{ it != null }
		result.result = grepResult.getSingleResult()
		result.totalMatches = grepResult.totalLines()
		result.resultDate = System.currentTimeMillis()
		return result
	}
}
