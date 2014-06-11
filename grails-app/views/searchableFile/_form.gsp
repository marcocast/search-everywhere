<%@ page import="search.everywhere.SearchableFile" %>



<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'identifier', 'error')} ">

	<label class="input">
		<g:hiddenField name="identifier" value="${searchableFileInstance?.identifier}" />
	</label>

</div>


<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'name', 'error')} required">
	<label class="label" for="name">
		<g:message code="searchableFile.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<label class="input">
		<g:textField name="name" required="" value="${searchableFileInstance?.name}"/>
	</label>

</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'url', 'error')} required">
	<label class="label"  for="url">
		<g:message code="searchableFile.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<label class="input">
		<g:textField name="url" required="" value="${searchableFileInstance?.url}"/>
	</label>
</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'path', 'error')} ">
	<label class="label"  for="path">
		<g:message code="searchableFile.path.label" default="Path" />
		
	</label>
	<label class="input">
		<g:textField name="path" value="${searchableFileInstance?.path}"/>
	</label>
</div>


<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'user', 'error')} ">
	<label class="label"  for="user">
		<g:message code="searchableFile.user.label" default="User" />
		
	</label>
	<label class="input">
		<g:textField name="user" value="${searchableFileInstance?.user}"/>
	</label>
</div>

<div class="fieldcontain ${hasErrors(bean: searchableFileInstance, field: 'password', 'error')} ">
	<label class="label"  for="password">
		<g:message code="searchableFile.password.label" default="Password" />
		
	</label>
	<label class="input">
		<g:passwordField name="password" value="${searchableFileInstance?.password}"/>
	</label>
</div>
