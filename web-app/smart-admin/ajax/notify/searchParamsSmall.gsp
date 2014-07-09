<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>

<ul class="notification-body">
<g:each in="${notifyService.getLatestSearchParams(notifyService.getTotalRecentSearchParamsActivities())}" var="searchParam">

	<li>
		<span class="padding-10 unread">

			<em class="badge padding-5 no-border-radius bg-color-blueLight pull-left margin-right-5">
				<g:link controller="searchParam" action="show" id="${searchParam.name}" params="[identifier: searchParam.identifier]"><i class="fa fa-file fa-fw fa-2x"></i></g:link>						
				
			</em>
			
			<span>
				 ID : <span class="text-warning">${searchParam.identifier}</span> 
				<br>
				Name : <span class="text-primary">${searchParam.name}</span>								
				 <br>
				 with text "<span class="text-warning">${searchParam.text}</span>" 
				 <g:if test="${searchParam.regex==true}">
					<span class="badge pull-right toggle state-disabled">Regex</span>
				</g:if>
				<br>
			</span>
			<span>
				<br>
				<span class="pull-left font-xs">on <i>${searchParam.searchableFileNames}</i></span>

			</span>
			
		</span>
	</li>
	</g:each>
</ul>
