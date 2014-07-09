
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
				<li>Home</li><li>Searchable Files</li><li>Selected</li>
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
								Selected
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
									<h2>Show Form Elements </h2>
				
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
				
										<g:form url="[resource:searchableFileInstance, action:'delete']" method="DELETE" class="smart-form">
											<header>
												${searchableFileInstance.identifier}
											</header>
				
											<fieldset>
												
												<section>
													<label class="label">Name</label>
													<label class="input state-disabled">
														<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchableFileInstance}" field="name"/>">
													</label>
												</section>
				
												<section>
													<label class="label">File path</label>
													<label class="input state-disabled">
														<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchableFileInstance}" field="path"/>">
													</label>
												</section>
				
											
											</fieldset>
				
					
					
					
											<fieldset>
												
												
												<section>
													<label class="label">URL</label>
													<label class="input state-disabled">
														<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchableFileInstance}" field="url"/>">
													</label>
												</section>
												
												<section>
													<label class="label">User</label>
													<label class="input state-disabled">
														<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchableFileInstance}" field="user"/>">
													</label>
												</section>
				
												<section>
													<label class="label">Password</label>
													<label class="input state-disabled">
														<g:if test="${searchableFileInstance?.password}">
															<input type="text" maxlength="10" disabled="disabled" value="******">
														</g:if>
														<g:else>
														    <input type="text" maxlength="10" disabled="disabled" value="">
														</g:else>
													</label>
												</section>
												
												
												
												
											</fieldset>
				
											
											<footer>
												<fieldset class="buttons">
													<g:link class="btn btn-danger" action="delete" params="[identifier: searchableFileInstance.identifier]" onclick="return confirm('All Results and Search Params associated with this Searchable File will be removed. Are you sure you want to proceed?');" ><i class="fa fa-trash-o"></i> <g:message code="default.button.delete.label" default="Delete" /></g:link>
													<g:link class="btn btn-primary" action="edit" params="[identifier: searchableFileInstance.identifier]"><i class="fa fa-edit"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link>
													<g:link class="btn bg-color-orange" action="copy" params="[identifier: searchableFileInstance.identifier]"><i class="fa fa-copy"></i> <g:message code="default.button.copy.label" default="Copy" /></g:link>
													<g:link class="btn btn-default" action="index"><i class="glyphicon glyphicon-chevron-left"></i> Back</g:link>
				
												</fieldset>
											</footer>
										</g:form>	
											
											
										
				
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
