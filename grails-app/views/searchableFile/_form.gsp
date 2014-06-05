<%@ page import="search.everywhere.SearchableFile" %>



<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="searchableFile.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${searchableFileInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="searchableFile.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${searchableFileInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'path', 'error')} ">
	<label for="path">
		<g:message code="searchableFile.path.label" default="Path" />
		
	</label>
	<g:textField name="path" value="${searchableFileInstance?.path}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="searchableFile.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${searchableFileInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="searchableFile.user.label" default="User" />
		
	</label>
	<g:textField name="user" value="${searchableFileInstance?.user}"/>

</div>

