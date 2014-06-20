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

	def grepBasedOnSearchParams(SearchParam searchParam) {

		GrepResults grepResult;

		if (searchParam.regex){
			grepResult = grep(regularExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchParam.searchableFileNames.first())));
		}else{
			grepResult = grep(constantExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchParam.searchableFileNames.first())));
		}


		Result result = new Result();

		result.text = searchParam.text
		result.regex = searchParam.regex
		result.searchableFileNames = searchParam.searchableFileNames
		result.result = grepResult.text
		result.totalMatches = grepResult.totalLines()
		return result
	}
}
