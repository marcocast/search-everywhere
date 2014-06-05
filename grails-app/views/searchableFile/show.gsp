
<%@ page import="search.everywhere.SearchableFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-searchableFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-searchableFile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list searchableFile">
			
				<g:if test="${searchableFileInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="searchableFile.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${searchableFileInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchableFileInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="searchableFile.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${searchableFileInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchableFileInstance?.path}">
				<li class="fieldcontain">
					<span id="path-label" class="property-label"><g:message code="searchableFile.path.label" default="Path" /></span>
					
						<span class="property-value" aria-labelledby="path-label"><g:fieldValue bean="${searchableFileInstance}" field="path"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchableFileInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="searchableFile.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${searchableFileInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${searchableFileInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="searchableFile.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${searchableFileInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:searchableFileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${searchableFileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
