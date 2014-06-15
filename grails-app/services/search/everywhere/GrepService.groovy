package search.everywhere

import static org.grep4j.core.Grep4j.constantExpression
import static org.grep4j.core.Grep4j.grep
import static org.grep4j.core.Grep4j.regularExpression
import static org.grep4j.core.fluent.Dictionary.on
import grails.transaction.Transactional

import org.grep4j.core.request.GrepExpression
import org.grep4j.core.result.GrepResults

@Transactional
class GrepService {

	def grepBasedOnSearchParams(params) {

		boolean regex = false
		def selectedWloProfiles = null
		String searchText = null




		GrepExpression grepExpression;

		if (params.regex){
			grepExpression = regularExpression(searchText)
		}else{
			grepExpression = constantExpression(searchText)
		}

		GrepResults results = grep(grepExpression, on(profiles));



		grepsearchResult.save()

		return grepsearchResult
	}
}
