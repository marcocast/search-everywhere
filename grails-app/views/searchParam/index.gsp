<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<title>Welcome to Grails</title>
		<g:set var="entityName" value="${message(code: 'searchParam.label', default: 'SearchParam')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


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
			<ul id="sparks" class="">
				<li class="sparks-info">
					<h5> My Income <span class="txt-color-blue">$47,171</span></h5>
					<div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
						1300, 1877, 2500, 2577, 2000, 2100, 3000, 2700, 3631, 2471, 2700, 3631, 2471
					</div>
				</li>
				<li class="sparks-info">
					<h5> Site Traffic <span class="txt-color-purple"><i class="fa fa-arrow-circle-up" data-rel="bootstrap-tooltip" title="Increased"></i>&nbsp;45%</span></h5>
					<div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
						110,150,300,130,400,240,220,310,220,300, 270, 210
					</div>
				</li>
				<li class="sparks-info">
					<h5> Site Orders <span class="txt-color-greenDark"><i class="fa fa-shopping-cart"></i>&nbsp;2447</span></h5>
					<div class="sparkline txt-color-greenDark hidden-mobile hidden-md hidden-sm">
						110,150,300,130,400,240,220,310,220,300, 270, 210
					</div>
				</li>
			</ul>
		</div>
	</div>.danger
	
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
							    .danger
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
											   	${searchableFileDAOService.getSearchableFile(searchablefileName).name}								
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
