
<%@ page import="search.everywhere.SearchableFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
				<li>Home</li><li>Searchable Files</li><li>Create</li>
			</ol>
			<!-- end breadcrumb -->
		
		
		
		</div>
		<!-- END RIBBON -->	
		
		<div id="content">

				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
						<h1 class="page-title txt-color-blueDark">
							<i class="fa fa-file-text fa-fw "></i> 
								Searchable Files 
							<span>> 
								Create
							</span>
						</h1>
					</div>
					<div class="col-xs-12 col-sm-5 col-md-5 col-lg-9">
						<g:render template="/layouts/mostcommon" />
					</div>
				</div>
				
				
				
				<!-- widget grid -->
				<section id="widget-grid" class="">
				
					
				
					<!-- END ROW -->
				
					<!-- START ROW -->
				
					<div class="row">
				
						<!-- NEW COL START -->
						<article class="col-sm-12 col-md-12 col-lg-12">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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
									<h2>Create Form Elements </h2>
				
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
									<div id="create-searchableFile" class="content scaffold-create" role="main">
										<h1><g:message code="default.create.label" args="[entityName]" /></h1>
										<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
										</g:if>
										<g:hasErrors bean="${searchableFileInstance}">
										<ul class="errors" role="alert">
											<g:eachError bean="${searchableFileInstance}" var="error">
											<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
											</g:eachError>
										</ul>
										</g:hasErrors>
										<g:form url="[resource:searchableFileInstance, action:'save']" class="smart-form">
											<header>
												
											</header>
											<fieldset class="form">
												<g:render template="form"/>
											</fieldset>
											<footer>
												<fieldset class="buttons">
													<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
																								
													<g:link class="btn btn-default" action="index" resource="${searchableFileInstance}">List</g:link>
													
												</fieldset>
											</footer>
										</g:form>
									</div>
										
				
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
				
						</article>
						<!-- END COL -->
				
						
				
					</div>
				
					<!-- END ROW -->
				
					
				
				</section>
				<!-- end widget grid -->


			</div>
		
		
		
		
	</body>
</html>
