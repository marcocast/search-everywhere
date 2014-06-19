<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>

<ul class="notification-body">
<g:each in="${searchableFileDAOService.getAllSearchableFiles()}" var="searchableFile">

	<li>
		<span class="unread">
			<a href="javascript:void(0);" class="msg">
				<img src="img/avatars/4.png" alt="" class="air air-top-left margin-top-5" width="40" height="40" />
				<span class="from">${searchableFile.name} <i class="icon-paperclip"></i></span>
				<time>${searchableFile.identifier}</time>
				<span class="subject">${searchableFile.url}</span>
				<span class="msg-body">${searchableFile.path}</span>
			</a>
		</span>
	</li>

	</g:each>
</ul>