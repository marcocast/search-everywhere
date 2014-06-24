
<%@ page import="search.everywhere.SearchParam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchParam.label', default: 'SearchParam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
		<div id="content">

				<div class="row">
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark">
							<i class="fa fa-edit fa-fw "></i> 
								Forms 
							<span>> 
								Form Elements
							</span>
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
				
						<!-- NEW COL START -->
						<article class="col-sm-12 col-md-12 col-lg-6">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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
									<h2>Basic Form Elements </h2>
				
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
									<div id="create-searchParam" class="content scaffold-create" role="main">
										<h1><g:message code="default.create.label" args="[entityName]" /></h1>
										<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
										</g:if>
										<g:hasErrors bean="${searchParamInstance}">
										<ul class="errors" role="alert">
											<g:eachError bean="${searchParamInstance}" var="error">
											<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
											</g:eachError>
										</ul>
										</g:hasErrors>
										<g:form url="[resource:searchParamInstance, action:'save']" class="smart-form">
											<header>
												Standard Form Header
											</header>
											<fieldset class="form">
												<g:render template="form"/>
											</fieldset>
											<footer>
												<fieldset class="buttons">
													<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
																								
													<g:link class="btn btn-default" action="index" resource="${searchParamInstance}">List</g:link>
													
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
