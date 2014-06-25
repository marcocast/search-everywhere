<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>

<ul class="notification-body">
<g:each in="${notifyService.getLatestSearchableFiles(5)}" var="searchableFile">

	<li>
		<span class="padding-10 unread">

			<em class="badge padding-5 no-border-radius bg-color-blueLight pull-left margin-right-5">
				<i class="fa fa-file fa-fw fa-2x"></i>
			</em>
			
			<span>
				 ID : <span class="text-warning">${searchableFile.identifier}</span> 
				<br>
				Name : <span class="text-primary">${searchableFile.name}</span>								
				<br>
				<span class="pull-left font-xs"><i>${searchableFile.path}</i>@<i>${searchableFile.url}</i></span>
			</span>
			
		</span>
	</li>
	</g:each>
</ul>