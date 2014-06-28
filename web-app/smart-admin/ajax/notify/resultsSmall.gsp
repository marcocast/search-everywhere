<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>
<%@ page import="search.everywhere.Result" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<ul class="notification-body">
<g:each in="${notifyService.getLatestResults(5)}" var="result">

	
	<li>
		<span class="padding-10 unread">

			<em class="badge padding-5 no-border-radius bg-color-blueLight pull-left margin-right-5">
				<i class="fa fa-arrow-circle-right fa-fw fa-2x"></i>
			</em>
			
			<span>
				 On ${new Date(result.resultDate)} 
				 <br>
				 with text <span class="text-warning">${result.text}</span> 
				 <g:if test="${result.regex==true}">
					<span class="badge pull-right toggle state-disabled">Regex</span>
				</g:if>
				<br>
				On profile : 
				 <g:each in="${result.searchableFileNames}" status="u" var="searchablefileName">
			    	<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)==null}">
						<span class="badge bg-color-red  pull-left toggle from"> <i class="fa fa-user fa-fw fa-trash-o"></i> ${searchableFileDAOService.getSearchableFileNameFromIdentifier(searchablefileName)} <i class="icon-paperclip"></i></span>
					</g:if>
					<g:else>
					   	<span class="text-primary">${searchableFileDAOService.getSearchableFile(searchablefileName).name}</span>								
					</g:else>
				</g:each>

				 <br>
				 <span class="pull-right font-xs">Total Lines found : <i>${result.totalMatches}</i></span>
			</span>
			
		</span>
	</li>

	</g:each>
</ul>
