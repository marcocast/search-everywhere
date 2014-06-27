<%@ page import="search.everywhere.SearchableFile" %>
<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
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
						Search 
					
				</h1>
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
				<g:render template="/layouts/mostcommon" />
			</div>
		</div>
		
		
		
		<!-- widget grid -->
		<section id="widget-grid" class="">
		
			
		
			<!-- END ROW -->
		
			<!-- START ROW -->
		
			<div class="row">
			
				<div class="jarviswidget" id="wid-id-0${resultInstance.searchableFileNames}" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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
								<h2>Result for ${resultInstance.searchableFileNames}</h2>
			
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
													<form class="smart-form">
														<header>
															<ul>
														        <li><strong>${resultInstance.text}</strong>
														        <input type="checkbox" name="regex" checked="checked" disabled="disabled">
					
																	<g:if test="${resultInstance.regex==true}">
																		<i data-swchon-text="ON" data-swchoff-text="OFF"></i>
																	</g:if>
																	<g:else>
																	     <i data-swchon-text="OFF" data-swchoff-text="OFF"></i>
																</g:else>Regex</label>
														        <small> on </small>
														        <strong>${resultInstance.searchableFileNames} </strong>
														        
														        <small> Total lines found </small><strong class="text-danger">${resultInstance.totalMatches} </strong></li>
													        </ul>
														</header>
													
														<fieldset>
																						
															<section>
																<label class="textarea"> 										
																	<textarea rows="${resultInstance.totalMatches + 10}" placeholder="Nothing found">${resultDAOService.getFullResultText(resultInstance.identifier)}</textarea> 
																</label>
															</section>
														</fieldset>
														
														
													</form>
												
												</article>
																
										</div>
										
								</div>
								
					</div>
						

		</div>
				</section>
		<!-- end widget grid -->
	</div>

</body>


</html>
