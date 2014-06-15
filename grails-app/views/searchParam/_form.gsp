<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFile" %>


<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'identifier', 'error')} ">

	<label class="input">
		<g:hiddenField name="identifier" value="${searchParamInstance?.identifier}" />
	</label>

</div>


<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'name', 'error')} required">
	<label class="label" for="name">
		<g:message code="searchParam.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<label class="input">
		<g:textField name="name" required="" value="${searchParamInstance?.name}"/>
	</label>

</div>

<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'text', 'error')} required">
	<label class="label" for="name">
		<g:message code="searchParam.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<label class="input">
		<g:textField name="text" required="" value="${searchParamInstance?.text}"/>
	</label>

</div>

<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'regex', 'error')} ">
	<label for="regex">
		<g:message code="searchParam.regex.label" default="Regex" />
	</label>
	<g:checkBox name="regex" value="${searchParamInstance?.regex}" />

</div>


<div class="fieldcontain ${hasErrors(bean: searchParamInstance, field: 'searchableFileNames', 'error')} ">
		<label  for="searchableFileNames" class="label">Select Searchable files</label>
		<label class="select select-multiple">
		
				<g:select optionKey="identifier" class="custom-scroll" optionValue="${{it.name}}"
				name="pnames" from="${searchableFileInstanceList}" multiple="multiple" />
				</label>
			
		<div class="note">
			<strong>Note:</strong> hold down the ctrl/cmd button to select multiple options.
		</div>
	
</div>

	

</div>
