<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<title>Search Params</title>
		<g:set var="entityName" value="${message(code: 'searchParam.label', default: 'SearchParam')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<!-- RIBBON -->
	<div id="ribbon">
	
		<span class="ribbon-button-alignment"> 
			<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
				<i class="fa fa-refresh"></i>
			</span> 
		</span>
	
		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li>Home</li><li>Search Params</li><li>list</li>
		</ol>
		<!-- end breadcrumb -->
	
	
	
	</div>
	<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
<div id="content">

	<div class="row">
		<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
			<h1 class="page-title txt-color-blueDark">
				<i class="fa fa-search-plus fa-fw "></i> 
				Search Params 
				<span>> 
				List
			</h1>
		</div>
		<div class="col-xs-12 col-sm-5 col-md-5 col-lg-9">
			<g:render template="/layouts/mostcommon" />
		</div>
	</div>
	
	<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">

		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
				<!-- widget options:
				usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

				data-widget-colorbutton="false"
				data-widget-editbutton="false"
				data-widget-togglebutton="false"
				data-widget-deletebutton="false"
				data-widget-fullscreenbutton="false"
				data-widget-custombutton="false"
				data-widget-collapsed="true"
				data-widget-sortable="false"

				-->
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2>Existing Search Params </h2>

				</header>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body no-padding">
						<div class="widget-body-toolbar">
							<g:link class="btn btn-primary" action="create" resource="${searchParamInstance}">
							<i class="fa fa-plus"></i> Add Search Param</g:link>
								
						</div>
						
						<table id="dt_basic" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Text</th>
									<th>Searchable Files</th>
								</tr>
							</thead>
							<tbody>
		
							<g:each in="${searchParamInstanceList}" status="i" var="searchParamInstance">
							    <g:if test="${searchParamInstance.searchableFileNames.isEmpty()}">
									<tr class="danger">								
								</g:if>
								<g:else>
								   	<tr>								
								</g:else>
								


									<td><g:link action="show" id="${searchParamInstance.name}" params="[identifier: searchParamInstance.identifier]">${fieldValue(bean: searchParamInstance, field: "name")}</g:link></td>
								
									<td>${fieldValue(bean: searchParamInstance, field: "text")}
										<g:if test="${searchParamInstance?.regex==true}">
											<span class="badge pull-right toggle state-disabled">Regex</span>
										</g:if>
									
					
									</td>
								
									<td>
									
									    <g:each in="${searchParamInstance.searchableFileNames}" status="u" var="searchablefileName">
									    	<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)==null}">
												<span class="badge bg-color-red  pull-left toggle from"> <i class="fa fa-user fa-fw fa-trash-o"></i> ${searchableFileDAOService.getSearchableFileNameFromIdentifier(searchablefileName)} <i class="icon-paperclip"></i></span>
											</g:if>
											<g:else>
												<g:link controller="searchableFile" action="show" id="${searchablefileName}" params="[identifier: searchablefileName]">${searchableFileDAOService.getSearchableFile(searchablefileName).name}</g:link>
											</g:else>
										</g:each>
									</td>
								
									
									
								
								</tr>
								
		
	
							</g:each>
							
							
								
							</tbody>
						</table>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->

	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

</div>
<!-- END MAIN CONTENT -->
	</body>
</html>
