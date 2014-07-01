<%@ page import="search.everywhere.SearchableFile" %>
<%@ page import="search.everywhere.Result" %>
<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
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
			<li>Home</li><li>Intra Search Result</li>
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
								Intra search for
							<span>
								"${text}"
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
						<article class="col-sm-12">
							<!-- new widget -->
							<div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
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
									<span class="widget-icon"> <i class="glyphicon glyphicon-stats txt-color-darken"></i> </span>
									<h2>Search Result </h2>

									<ul class="nav nav-tabs pull-right in" id="myTab">
										<li class="active">
											<a data-toggle="tab" href="#s1"><i class="fa fa-clock-o"></i> <span class="hidden-mobile hidden-tablet">Results</span></a>
										</li>

										<li>
											<a data-toggle="tab" href="#s2"><i class="fa fa-facebook"></i> <span class="hidden-mobile hidden-tablet">Searchable Files</span></a>
										</li>

										<li>
											<a data-toggle="tab" href="#s3"><i class="fa fa-dollar"></i> <span class="hidden-mobile hidden-tablet">Search Params</span></a>
										</li>
									</ul>

								</header>

								<!-- widget div-->
								<div class="no-padding">
									<!-- widget edit box -->
									<div class="jarviswidget-editbox">

										test
									</div>
									<!-- end widget edit box -->

									<div class="widget-body">
										<!-- content -->
										<div id="myTabContent" class="tab-content">
											<div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">
												<div class="table-responsive">
							<table id="dt_basic_result" class="table table-striped table-bordered table-hover">
							<thead>
									
						            <tr>
						                <th>Result Date</th>
										<th>Text</th>
										<th>Searchable File Name</th>
										<th>Total Matches</th>
						            </tr>
						        </thead>
								<tbody>
				
								<g:each in="${resultsList}" status="i" var="resultInstance">
									<tr>
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
										<td><g:link controller="result" action="show" id="${resultInstance.identifier}" params="[identifier: resultInstance.identifier]">${fieldValue(bean: resultInstance, field: "totalMatches")}</g:link></td>
										
										
									
										
									</tr>
									
			
		
								</g:each>
								
								
									
								</tbody>
							</table>
						</div>

												
											</div>
											<!-- end s1 tab pane -->

											<div class="tab-pane fade" id="s2">

										
												<div class="padding-10">
								<table id="dt_basic" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Name</th>
													<th>URL</th>
													<th>Path</th>
													<th>User</th>
													<th>Password</th>
													
												</tr>
											</thead>
											<tbody>
						
											<g:each in="${searchableFilesList}" status="i" var="searchableFileInstance">
												<tr>
												
													<td><g:link controller="searchableFile" action="show" id="${searchableFileInstance.identifier}" params="[identifier: searchableFileInstance.identifier]">${fieldValue(bean: searchableFileInstance, field: "name")}</g:link></td>
												
													<td>${fieldValue(bean: searchableFileInstance, field: "url")}</td>
												
													<td>${fieldValue(bean: searchableFileInstance, field: "path")}</td>
													
													<td>${fieldValue(bean: searchableFileInstance, field: "user")}</td>
												
													<g:if test="${searchableFileInstance?.password}">
														<td>*********</td>
													</g:if>
													<g:else>
													     <td></td>
													</g:else>
													
												
												</tr>
												
						
					
											</g:each>
											
											
												
											</tbody>
										</table>												</div>

											</div>
											<!-- end s2 tab pane -->

											<div class="tab-pane fade" id="s3">

												

												<div class="padding-10">
													<table id="dt_basic" class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>Name</th>
															<th>Text</th>
															<th>Searchable Files</th>
														</tr>
													</thead>
													<tbody>
								
													<g:each in="${searchParamsList}" status="i" var="searchParamInstance">
													    <g:if test="${searchParamInstance.searchableFileNames.isEmpty()}">
															<tr class="danger">								
														</g:if>
														<g:else>
														   	<tr>								
														</g:else>
														
						
						
															<td><g:link controller="searchParam" action="show" id="${searchParamInstance.name}" params="[identifier: searchParamInstance.identifier]">${fieldValue(bean: searchParamInstance, field: "name")}</g:link></td>
														
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
											</div>
											<!-- end s3 tab pane -->
										</div>

										<!-- end content -->
									</div>

								</div>
								<!-- end widget div -->
							</div>
							<!-- end widget -->

						</article>
					</div>
				
				</section>
				<!-- end widget grid -->

			</div>
			<!-- END MAIN CONTENT -->
	</body>
</html>
