<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
<form class="smart-form">
	<header>
		<ul>
	        <li><strong>${result.text}</strong>
	        <small> on </small>
	        <strong>${result.searchableFileNames} </strong>
	        <g:if test="${result.regex==true}">
				<span class="badge pull-right toggle state-disabled">Regex</span>
			</g:if>
	        <small> Total lines found </small><strong class="text-danger">${result.totalMatches} </strong></li>
        </ul>
	</header>

	<fieldset>
									
		<section>
			<label class="textarea textarea-resizable"> 										
				<textarea rows="${result.totalMatches + 10}" placeholder="Nothing found">${resultDAOService.getFullResultText(result.identifier)}</textarea> 
			</label>
		</section>
	</fieldset>

	
	
</form>

									