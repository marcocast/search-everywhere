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
			<li>Home</li><li>Graph </li><li>search</li>
		</ol>
		<!-- end breadcrumb -->
	
	
	
	</div>
	<!-- END RIBBON -->		
		
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
							<h2>Search Form Elements </h2>
		
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
									<header>
										Standard Form Header
									</header>
		
									<fieldset>
										
										<section>
											<label class="label">Search Text</label>
											<label class="input">
												<input type="text" maxlength="500"  name="text" placeholder="Enter text">
											</label>
										</section>
		
				
				
										<section>
											<label class="toggle pull-left text-left">
													<input type="checkbox" name="regex" checked="checked">
													<i data-swchon-text="ON" data-swchoff-text="OFF"></i>Regex</label>
										</section>
		
									
									</fieldset>
		
			
			
			
									<fieldset>
										<section>
											<label class="label">Select Searchable files</label>
											<label class="select select-multiple">
												<g:select optionKey="identifier" multiple style="width:100%" class="select2" optionValue="name"
												name="searchableFileNames" from="${searchableFileInstanceList}"  size="${searchableFileInstanceList.size()}" />
												</label>
											<div class="note">
												<strong>Note:</strong>type or click on the field to add multiple searchable files.
											</div>
										</section>
								
										
										
									</fieldset>
		
									
									<footer>
												<fieldset class="buttons">
													<button type="submit" class="btn btn-primary"><g:message code="default.button.execute.search.label" default="Generate Graph " /><i class="fa fa-bar-chart-o"></i></button>
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
		
				
		<article class="col-sm-12 col-md-12 col-lg-6">
		
					<!-- Widget ID (each widget will need unique ID)-->
					<div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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
							<h2>Search Form Elements </h2>
		
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
		
								<g:form action="graphWithSearchParam" id="formGraphWithSearchParam"  class="smart-form">
									<header>
										Standard Form Header
									</header>
			
									<g:set var="searchParamDAOService" bean="searchParamDAOService"/>
									<fieldset>
										<section>
											<label class="label">Select Search existing Param</label>
											<label class="select select-multiple">
												<g:select optionKey="identifier" class="custom-scroll" optionValue="name"
												name="searchParamas" from="${searchParamDAOService.getAllActiveSearchParams()}" />
												</label>
											<div class="note">
												<strong>Note:</strong> hold down the ctrl/cmd button to select multiple options.
											</div>
										</section>
								
										
									</fieldset>
		
									
									<footer>
												<fieldset class="buttons">
													<button type="submit" class="btn btn-primary"><g:message code="default.button.execute.search.label" default="Generate Graph " /><i class="fa fa-bar-chart-o"></i></button>
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