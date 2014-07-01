<%@ page import="search.everywhere.SearchableFile" %>
<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<!DOCTYPE html>
<html>
	<head>
		
		<meta name="layout" content="smart-admin"/>
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:javascript library="jquery"/>

</head>
<body>
	
	
<div id="content">

	<div class="row">
		<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
			<h1 class="page-title txt-color-blueDark">
				<i class="fa fa-edit fa-fw "></i> 
					Search Result 
				
			</h1>
		</div>
		<div id="commonResult" class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
			<g:render template="/layouts/mostcommon" />
		</div>
	</div>
	
	
	
	<!-- widget grid -->
	<section id="widget-grid" class="">
	
		
	
		<!-- END ROW -->
	
		<!-- START ROW -->
	
		<div class="row">
	
		
	
			<g:each in="${searchParam.searchableFileNames}" status="i" var="searchableFileName">
				
				<script>
				  	<g:remoteFunction controller="search" action="executeSearch" update="resultBox${searchableFileName}" params="'name=${searchParam.name}&text=${searchParam.text}&regex=${searchParam.regex}&searchableFileName=${searchableFileName}'"/>
	        	  </script>
				
				
				
				<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0${searchableFileName}" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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
								<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
								<h2>Result for ${searchableFileDAOService.getSearchableFile(searchableFileName).name}</h2>
			
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
												<article class="col-sm-12 col-md-12 col-lg-12" id="resultBox${searchableFileName}">		
													<div class="progress">		
														<div class="progress progress-striped active">
															<div class="progress-bar bg-color-purple" role="progressbar" style="width: 88%"></div>
														</div>
													</div>
												
												</article>
																
										</div>
										
								</div>
								
					</div>
					
				
				
				
			</g:each>
		
	</div>
			</section>
	<!-- end widget grid -->
	</div>

</body>


</html>
