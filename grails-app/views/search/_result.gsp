<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
<form class="smart-form">
	<header>
		${result.text} on ${result.searchableFileNames} with regex ${result.regex}
	</header>

	<fieldset>
									
		<section>
			<label class="textarea"> 										
				<textarea rows="${result.totalMatches}" placeholder="Nothing found">${resultDAOService.getFullResultText(result.identifier)}</textarea> 
			</label>
		</section>
	</fieldset>

	
	
</form>

									