<%@ page import="search.everywhere.Result" %>



<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'result', 'error')} ">
	<label for="result">
		<g:message code="result.result.label" default="Result" />
		
	</label>
	<g:textField name="result" value="${resultInstance?.result}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'resultDate', 'error')} required">
	<label for="resultDate">
		<g:message code="result.resultDate.label" default="Result Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="resultDate" precision="day"  value="${resultInstance?.resultDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'regex', 'error')} ">
	<label for="regex">
		<g:message code="result.regex.label" default="Regex" />
		
	</label>
	<g:checkBox name="regex" value="${resultInstance?.regex}" />

</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="result.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${resultInstance?.text}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resultInstance, field: 'totalMatches', 'error')} required">
	<label for="totalMatches">
		<g:message code="result.totalMatches.label" default="Total Matches" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalMatches" type="number" value="${resultInstance.totalMatches}" required=""/>

</div>

