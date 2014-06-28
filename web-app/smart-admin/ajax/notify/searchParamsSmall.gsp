<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>

<ul class="notification-body">
<g:each in="${notifyService.getLatestSearchParams(5)}" var="searchParam">

	<li>
		<span class="padding-10 unread">

			<em class="badge padding-5 no-border-radius bg-color-blueLight pull-left margin-right-5">
				<i class="fa fa-file fa-fw fa-2x"></i>
			</em>
			
			<span>
				 ID : <span class="text-warning">${searchParam.identifier}</span> 
				<br>
				Name : <span class="text-primary">${searchParam.name}</span>								
				<br>
				<span class="pull-left font-xs">Text : <i>${searchParam.text}</i> with regex <i>${searchParam.regex}</i></span>
			</span>
			<span>
				<br>
				<span class="pull-left font-xs">on <i>${searchParam.searchableFileNames}</i></span>

			</span>
			
		</span>
	</li>
	</g:each>
</ul>
