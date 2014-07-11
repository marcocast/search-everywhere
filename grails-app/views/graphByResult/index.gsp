<%@ page import="search.everywhere.Result"%>
<%@ page import="search.everywhere.SearchableFileDAOService"%>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService" />

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="smart-admin" />
<g:set var="entityName" value="${message(code: 'result.label', default: 'Result')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<!-- RIBBON -->
	<div id="ribbon">

		<span class="ribbon-button-alignment"> <span id="refresh" class="btn btn-ribbon"
			data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom"
			data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
			data-html="true"> <i class="fa fa-refresh"></i>
		</span>
		</span>

		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li>Home</li>
			<li>Results</li>
			<li>list</li>
		</ol>
		<!-- end breadcrumb -->



	</div>
	<!-- END RIBBON -->

	<!-- MAIN CONTENT -->
	<div id="content">

		<div class="row">
			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
				<h1 class="page-title txt-color-blueDark">
					<i class="fa fa-bar-chart-o fa-fw "></i> Result <span>> Historical data </span>
				</h1>
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-9">
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
					<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
						data-widget-editbutton="false">
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
							<span class="widget-icon"> <i class="fa fa-table"></i>
							</span>
							<h2>Existing Results</h2>

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

									<button class="btn bg-color-purple txt-color-white" data-toggle="modal"
										data-target="#myModal">
										<i class="fa fa-filter"></i> Filter results
									</button>


									<!-- modal -->
									<g:form action="filterResults" id="formFilterResults">

										<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
											aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
															&times;</button>
														<h4 class="modal-title" id="myModalLabel">Filter Results</h4>
													</div>
													<div class="modal-body">

														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<input type="text" name="text" class="form-control" placeholder="Text" />
																</div>

															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<input type="text" name="searchableFileName" class="form-control"
																		placeholder="Searchable File Name" />
																</div>

															</div>
														</div>
														<div class="row">
															<div class="col-sm-12">
																<label>Select a date (range):</label>
															</div>
															<div class="col-sm-6">

																<div class="form-group">
																	<div class="form-group">
																		<input class="form-control" id="from" name="from" type="text" placeholder="From">
																	</div>
																</div>

															</div>
															<div class="col-sm-6">

																<div class="form-group">
																	<div class="form-group">
																		<input class="form-control" id="to" name="to" type="text" placeholder="To">
																	</div>
																</div>

															</div>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">
															<i class="glyphicon glyphicon-remove"></i> Cancel
														</button>
														<button type="submit" class="btn bg-color-purple txt-color-white">
															<i class="fa fa-filter"></i> Filter Results
														</button>
													</div>

												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
										<!-- /.modal -->
									</g:form>

								</div>

								<g:form action="graph" id="formSearch" class="smart-form">
									<div class="widget-body-toolbar">
										&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary">
											&nbsp;&nbsp;<i class="fa fa-bar-chart-o fa-border"></i><span class="font-md"> Generate Graph&nbsp;&nbsp;</span>
										</button>
									</div>
									<div class="table-responsive">

										<table id="dt_basic_result_graph"
											class="table table-bordered table-striped table-hover smart-form has-tickbox">
											<thead>
												<tr>
													<th><label class="checkbox"><input type="checkbox"
															id="checkbox-inline-all" name="checkbox-inline-all"><i></i>
													</label></th>
													<th>Result Date</th>
													<th>Text</th>
													<th>Searchable File Names</th>
													<th>Total Matches</th>


												</tr>
											</thead>
											<tbody>

												<g:each in="${resultInstanceList}" status="i" var="resultInstance">
													<tr>
														<td><label class="checkbox"> <input type="checkbox" id="checkboxResult"
																name="checkboxResult" value="${resultInstance.identifier}"> <i></i>
														</label></td>
														<td>
															${new Date(resultInstance.resultDate)}
														</td>
														<td>
															${fieldValue(bean: resultInstance, field: "text")} 
															<g:if test="${resultInstance?.regex==true}">
																<span class="label bg-color-blueLight txt-color-white">Regex</span>
															</g:if>
														</td>
														<td><g:each in="${resultInstance.searchableFileNames}" status="u"
																var="searchablefileName">
																<g:if test="${searchableFileDAOService.getSearchableFile(searchablefileName)==null}">
																	<span class="badge bg-color-red  pull-left toggle from"> <i
																		class="fa fa-user fa-fw fa-trash-o"></i> ${searchableFileDAOService.getSearchableFileNameFromIdentifier(searchablefileName)}
																		<i class="icon-paperclip"></i></span>
																</g:if>
																<g:else>
																	<g:link controller="searchableFile" action="show" id="${searchablefileName}"
																		params="[identifier: searchablefileName]">
																		${searchableFileDAOService.getSearchableFile(searchablefileName).name}
																	</g:link>
																</g:else>
															</g:each></td>
														<td><g:link controller="result" action="show" id="${resultInstance.identifier}"
																params="[identifier: resultInstance.identifier]">
																${fieldValue(bean: resultInstance, field: "totalMatches")}
															</g:link></td>




													</tr>



												</g:each>



											</tbody>
										</table>
									</div>
								</g:form>


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
