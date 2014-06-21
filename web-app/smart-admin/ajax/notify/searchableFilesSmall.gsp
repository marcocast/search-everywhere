<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>

<ul class="notification-body">
<g:each in="${notifyService.getLatestSearchableFiles(5)}" var="searchableFile">

	<li>
		<span class="unread">
			<a href="javascript:void(0);" class="msg">
               
				<span class="badge pull-left toggle from"> <i class="fa fa-user fa-fw fa-file-text"></i> ${searchableFile.name} <i class="icon-paperclip"></i></span>
				<time>${searchableFile.identifier}</time>
				<span class="subject">${searchableFile.url}</span>
				<span class="msg-body">${searchableFile.path}</span>
			</a>
		</span>
	</li>

	</g:each>
</ul>