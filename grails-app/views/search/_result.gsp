<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
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
	        <strong>${result.searchableFileNames} </strong>
	        
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

									