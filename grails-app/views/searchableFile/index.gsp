<%@ page import="search.everywhere.SearchableFile" %>

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
			<li>Home</li><li>Searchable Files</li><li>list</li>
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
										<div class="widget-body-toolbar">
											<g:link class="btn btn-primary" action="create" resource="${searchableFileInstance}"><i class="fa fa-plus"></i> Add Searchable file</g:link>
												
										</div>
										
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
						
											<g:each in="${searchableFileInstanceList}" status="i" var="searchableFileInstance">
												<tr>
												
													<td><g:link action="show" id="${searchableFileInstance.identifier}" params="[identifier: searchableFileInstance.identifier]">${fieldValue(bean: searchableFileInstance, field: "name")}</g:link></td>
												
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
