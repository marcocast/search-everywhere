
<%@ page import="search.everywhere.Result" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-result" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-result" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="result" title="${message(code: 'result.result.label', default: 'Result')}" />
					
						<g:sortableColumn property="resultDate" title="${message(code: 'result.resultDate.label', default: 'Result Date')}" />
					
						<g:sortableColumn property="regex" title="${message(code: 'result.regex.label', default: 'Regex')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'result.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="totalMatches" title="${message(code: 'result.totalMatches.label', default: 'Total Matches')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resultInstanceList}" status="i" var="resultInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resultInstance.id}">${fieldValue(bean: resultInstance, field: "result")}</g:link></td>
					
						<td><g:formatDate date="${resultInstance.resultDate}" /></td>
					
						<td><g:formatBoolean boolean="${resultInstance.regex}" /></td>
					
						<td>${fieldValue(bean: resultInstance, field: "text")}</td>
					
						<td>${fieldValue(bean: resultInstance, field: "totalMatches")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resultInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
