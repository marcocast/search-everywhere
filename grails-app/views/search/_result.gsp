<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<form class="smart-form">
	<header>
		<ul>
	        <li><strong>${result.text}</strong>
	        <input type="checkbox" name="regex" checked="checked" disabled="disabled">
					
			<g:if test="${result.regex==true}">
				<i data-swchon-text="ON" data-swchoff-text="OFF"></i>
			</g:if>
			<g:else>
			     <i data-swchon-text="OFF" data-swchoff-text="OFF"></i>
			</g:else>Regex</label>
	        <small> on </small>
	        <strong>${searchableFileDAOService.getSearchableFile(result.searchableFileNames.first()).name} </strong>
	        <g:if test="${result.totalMatches > -1 }">		
	        	<small> Total lines found </small><strong class="text-danger">${result.totalMatches} </strong>
	        </g:if>
	        <g:else>
			<section>
				<label class="textarea textarea-resizable"> 
				    									
				<strong class="text-danger">${result.result}</strong>
					
				</label>
			</section>
			</g:else>	
	        </li>
	        
        </ul>
	</header>
	<g:if test="${result.totalMatches > -1 }">	
		<fieldset>
										
			<section>
				<label class="textarea textarea-resizable"> 
				    									
						<textarea rows="${result.totalMatches + 10}" placeholder="Nothing found">${resultDAOService.getFullResultText(result.identifier)}</textarea>
					
				</label>
			</section>
		</fieldset>
	</g:if> 
	
	
</form>

									