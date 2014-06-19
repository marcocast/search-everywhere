
<%@ page import="search.everywhere.Result" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-result" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-result" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list result">
			
				<g:if test="${resultInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="result.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${resultInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.resultDate}">
				<li class="fieldcontain">
					<span id="resultDate-label" class="property-label"><g:message code="result.resultDate.label" default="Result Date" /></span>
					
						<span class="property-value" aria-labelledby="resultDate-label"><g:formatDate date="${resultInstance?.resultDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.regex}">
				<li class="fieldcontain">
					<span id="regex-label" class="property-label"><g:message code="result.regex.label" default="Regex" /></span>
					
						<span class="property-value" aria-labelledby="regex-label"><g:formatBoolean boolean="${resultInstance?.regex}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="result.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${resultInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resultInstance?.totalMatches}">
				<li class="fieldcontain">
					<span id="totalMatches-label" class="property-label"><g:message code="result.totalMatches.label" default="Total Matches" /></span>
					
						<span class="property-value" aria-labelledby="totalMatches-label"><g:fieldValue bean="${resultInstance}" field="totalMatches"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:resultInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${resultInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
