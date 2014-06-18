package search.everywhere

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on
import grails.transaction.Transactional

import org.grep4j.core.result.GrepResults

@Transactional
class GrepService {

	ProfileConverterService profileConverterService

	def grepBasedOnSearchParams(SearchParam searchParam) {

		GrepResults results;

		if (searchParam.regex){
			results = grep(regularExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchParam.searchableFileNames.first())));
		}else{
			results = grep(constantExpression(searchParam.text), on(profileConverterService.convertSearchableFileToGrep4jProfile(searchParam.searchableFileNames.first())));
		}

		return results.toString()
	}
}
