<%@ page import="search.everywhere.SearchableFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchableFile.label', default: 'SearchableFile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
		
								<g:form action="search" id="formSearch"  class="smart-form">
									<header>
										Standard Form Header
									</header>
		
									<fieldset>
										
										<section>
											<label class="label">Search Text</label>
											<label class="input">
												<input type="text" maxlength="10"  name="text" placeholder="Enter text">
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
												<g:select optionKey="identifier" class="custom-scroll" optionValue="name"
												name="searchableFileNames" from="${searchableFileInstanceList}" multiple="true" />
												</label>
											<div class="note">
												<strong>Note:</strong> hold down the ctrl/cmd button to select multiple options.
											</div>
										</section>
								
										
										
									</fieldset>
		
									
									<footer>
												<fieldset class="buttons">
													<button type="submit" class="btn btn-primary"><g:message code="default.button.execute.search.label" default="Execute Search " /><i class="fa fa-search"></i></button>
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
		
								<g:form action="search" id="formSearch"  class="smart-form">
									<header>
										Standard Form Header
									</header>
			
									<g:set var="searchParamDAOService" bean="searchParamDAOService"/>
									<fieldset>
										<section>
											<label class="label">Select Search existing Param</label>
											<label class="select select-multiple">
												<g:select optionKey="name" class="custom-scroll" optionValue="name"
												name="searchParamas" from="${searchParamDAOService.getAllSearchParams()}" />
												</label>
											<div class="note">
												<strong>Note:</strong> hold down the ctrl/cmd button to select multiple options.
											</div>
										</section>
								
										
									</fieldset>
		
									
									<footer>
												<fieldset class="buttons">
													<g:link class="btn btn-primary" action="search"><g:message code="default.button.execute.search.label" default="Execute Search " /><i class="fa fa-search"></i></g:link>				
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
