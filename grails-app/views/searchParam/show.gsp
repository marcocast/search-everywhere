
<%@ page import="search.everywhere.SearchParam" %>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin">
		<g:set var="entityName" value="${message(code: 'searchParam.label', default: 'SearchParam')}" />
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
				<li>Home</li><li>Search Params/li><li>Selected</li>
			</ol>
			<!-- end breadcrumb -->
		
		
		
		</div>
		<!-- END RIBBON -->	
	
	<div id="content">

			<div class="row">
				<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
					<h1 class="page-title txt-color-blueDark">
						<i class="fa fa-search-plus fa-fw "></i> 
							Search Params 
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

				<g:form url="[resource:searchParamInstance, action:'delete']" method="DELETE" class="smart-form">
					<header>
						${searchParamInstance.identifier}
					</header>

					<fieldset>
						
						<section>
							<label class="label">Name</label>
							<label class="input state-disabled">
								<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchParamInstance}" field="name"/>">
							</label>
						</section>
						
						<section>
							<label class="toggle pull-right state-disabled">
							<input type="checkbox" name="regex" checked="checked" disabled="disabled">
						
								<g:if test="${searchParamInstance?.regex==true}">
									<i data-swchon-text="ON" data-swchoff-text="OFF"></i>
								</g:if>
								<g:else>
								     <i data-swchon-text="OFF" data-swchoff-text="OFF"></i>
								</g:else>Regex</label>
						</section>

						<section>
							<label class="label">Text</label>
							<label class="input state-disabled">
								<input type="text" maxlength="10" disabled="disabled" value="<g:fieldValue bean="${searchParamInstance}" field="text"/>">
							</label>
						</section>
						
						
		
						
						<section>
							<label class="label">Searchable Files</label>
							<label class="select select-multiple state-disabled">
								<select multiple="" class="custom-scroll" disabled="disabled">
									<g:each in="${searchParamInstance.searchableFileNames}" var="searchablefileName">
									<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)!=null}">
										<option value="${searchablefileName}">${searchableFileDAOService.getSearchableFile(searchablefileName).name}</option>											
									</g:if>
									</g:each>
								</select> </label>
						</section>
						
						
						
						
					</fieldset>

					
					<footer>
						<fieldset class="buttons">
							<g:link class="btn btn-danger" action="delete" params="[identifier: searchParamInstance.identifier]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><g:message code="default.button.delete.label" default="Delete" /></g:link>
							<g:link class="btn btn-primary" action="edit" params="[identifier: searchParamInstance.identifier]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:link class="btn btn-default" action="index">List</g:link>

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
