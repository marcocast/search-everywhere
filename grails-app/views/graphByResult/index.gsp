<%@ page import="search.everywhere.Result" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
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
			<li>Home</li><li>Results</li><li>list</li>
		</ol>
		<!-- end breadcrumb -->
	
	
	
	</div>
	<!-- END RIBBON -->

		<!-- MAIN CONTENT -->
<div id="content">

	<div class="row">
		<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
			<h1 class="page-title txt-color-blueDark">
				<i class="fa fa-table fa-fw "></i> 
					Table 
				<span>> 
					Data Tables
				</span>
			</h1>
		</div>
		<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
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
						<h2>Standard Data Tables </h2>
	
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
						<g:form action="graph" id="formSearch"  class="smart-form">
							<div class="widget-body-toolbar">
		
								<button type="submit" class="btn btn-primary"><g:message code="default.button.execute.search.label" default="Generate Graph " /><i class="fa fa-bar-chart-o"></i></button>
											
							</div>
							<div class="table-responsive">
							<table id="dt_basic_result_graph" class="table table-bordered table-striped table-hover smart-form has-tickbox">
								<thead>
									<tr>
										<th>
											<label class="checkbox">
												<input type="checkbox" id="checkbox-inline-all" name="checkbox-inline-all">
												<i></i>
											</label>
										</th>
										<th>Result Date</th>
										<th>Text</th>
										<th>Searchable File Names</th>
										<th>Total Matches</th>
										
										
									</tr>
								</thead>
								<tbody>
				
								<g:each in="${resultInstanceList}" status="i" var="resultInstance">
									<tr>
										<td>
											<label class="checkbox">
												<input type="checkbox" id="checkboxResult" name="checkboxResult" value="${resultInstance.identifier}">
												<i></i>
											</label>
										</td>
										<td>${new Date(resultInstance.resultDate)}</td>
										<td>${fieldValue(bean: resultInstance, field: "text")}
											<g:if test="${resultInstance?.regex==true}">
												<span class="badge pull-right toggle state-disabled">Regex</span>
											</g:if>
										</td>
										<td>
										<g:each in="${resultInstance.searchableFileNames}" status="u" var="searchablefileName">
									    	<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)==null}">
												<span class="badge bg-color-red  pull-left toggle from"> <i class="fa fa-user fa-fw fa-trash-o"></i> ${searchableFileDAOService.getSearchableFileNameFromIdentifier(searchablefileName)} <i class="icon-paperclip"></i></span>
											</g:if>
											<g:else>
											   	${searchableFileDAOService.getSearchableFile(searchablefileName).name}								
											</g:else>
										</g:each>
										</td>
										<td>${fieldValue(bean: resultInstance, field: "totalMatches")}</td>
										
										
									
										
									</tr>
									
			
		
								</g:each>
								
								
									
								</tbody>
							</table>
							</div>
						</g:form>

								
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
