<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>
<%@ page import="search.everywhere.Result" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<ul class="notification-body">
<g:each in="${notifyService.getLatestResults(notifyService.getTotalRecentResultsActivities())}" var="result">

	
	<li>
		<span class="padding-10 unread">

			<em class="badge padding-5 no-border-radius bg-color-blueLight pull-left margin-right-5">
				<g:link controller="result" action="show" id="${result.identifier}" params="[identifier: result.identifier]"><i class="fa fa-arrow-circle-right fa-fw fa-2x"></i></g:link>
			</em>
			
			<span>
				 <g:each in="${result.searchableFileNames}" status="u" var="searchablefileName">
			    	<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)==null}">
						<span class="label bg-color-red"> <i class="fa fa-user fa-fw fa-trash-o"></i> ${searchableFileDAOService.getSearchableFileNameFromIdentifier(searchablefileName)} <i class="icon-paperclip"></i></span>
					</g:if>
					<g:else>
					   	<g:link controller="searchableFile" action="show" id="${searchablefileName}" params="[identifier: searchablefileName]">${searchableFileDAOService.getSearchableFile(searchablefileName).name}</g:link>						
					</g:else>
				</g:each>
				 <br>
				 with text "<span class="text-warning">${result.text}</span>" 
				 <g:if test="${result.regex==true}">
					<span class="badge pull-right toggle state-disabled">Regex</span>
				</g:if>
				<br>
				 Total lines found <span class="text-success"><strong>${result.totalMatches}</strong></span>
				<br>

				 <br>
				 <span class="pull-right font-xs"><i>${new Date(result.resultDate)}</i></span>
			</span>
			
		</span>
	</li>

	</g:each>
</ul>
