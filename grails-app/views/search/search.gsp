<%@ page import="search.everywhere.SearchableFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
<div id="content">

<div class="row">
		<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
	
			<g:each in="${searchParam.searchableFileNames}" status="i" var="searchableFileName">
				<script>
			  	<g:remoteFunction controller="search" action="executeSearch" update="resultBox${searchableFileName},total" 
				  	params="'name=${searchParam.name}&profileName=${searchableFileName}'"/>
        	  </script>
				
			<div class="progress">		
				<div class="progress progress-striped active">
					<div class="progress-bar bg-color-purple" role="progressbar" style="width: 88%"></div>
				</div>
			</div>
		
			</g:each>

	</div>
			<!-- end widget -->

	</div>
	</div>
	</div>
</body>
</html>