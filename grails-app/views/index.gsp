<!DOCTYPE html>
<%@ page import="search.everywhere.SearchableFileDAOService" %>
<g:set var="searchableFileDAOService" bean="searchableFileDAOService"/>
<%@ page import="search.everywhere.ResultDAOService" %>
<g:set var="resultDAOService" bean="resultDAOService"/>
<%@ page import="search.everywhere.SearchParamDAOService" %>
<g:set var="searchParamDAOService" bean="searchParamDAOService"/>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<title>Welcome to SSearcH Everywhere</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
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
			<li>Home</li>
		</ol>
		<!-- end breadcrumb -->
	
	
	
	</div>
	<!-- END RIBBON -->
		
		<div id="content">
		<div class="row">
			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-3">
				<h1 class="page-title txt-color-blueDark">
					<i class="fa fa-home fa-fw "></i> 
						Welcome to SSearch Everywhere 
				</h1>
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-9">
				<g:render template="/layouts/mostcommon" />
			</div>
		</div>
		<div class="row">
		<!-- NEW WIDGET START -->
		<div class="col-sm-6">
			
					<!-- widget content -->
					
						
					<div class="bs-example bs-example-type">
			<p>Congratulations, you have successfully started your <strong>SS</strong>earc<strong>H</strong> everywhere application! </p>

			<p>SSearcH Everywhere is a simple and useful application that will make the search of text in remote files easy and fun.</p>
			
			<p>As you got it from the name, the connections to remote files are done through SSH, and The actual search are normal greps with or without regex</p>
			
			<p>Ok, so lets start :)</p>
			
			<br>
			<g:if test="${searchableFileDAOService.getAllSearchableFiles().size()==0}">
				<p>The first thing you want to do is to create a Searchable file</p>
				
				<p>Searchable files are the files you are interested in searching text in.</p>
				
				<p>To create them is simple, just click here and fill the form <g:link class="btn btn-primary" controller="searchableFile" action="create"><i class="fa fa-plus"></i> Add Searchable file</g:link>
				</p>
			</g:if>
			
			<g:if test="${searchableFileDAOService.getAllSearchableFiles().size()>0 && resultDAOService.getAllResults().size()==0}">
				<p>Good, you created succesfully some searchable file</p>
				
				<p>Why don't you try to search something now? <g:link controller="search" action="index"><i class="fa fa-lg fa-fw fa-search"></i> <span class="menu-item-parent">Search</span></g:link></p>
				
			</g:if>
			
			<g:if test="${resultDAOService.getAllResults().size()>0}">
				<p>Well done!, I hope you found what you where looking for.</p>
				<p>Just on the right of the logo, you will be able to see the latest activities</p>
				
				
				<br>
				<g:render template="/layouts/mostcommon" />
				
				<p>The percentage you see above, is the trend of your searches.</p>
				<p>The most 3 common search trends will be shown.</p>
				
				
				<br>
			
				<g:if test="${searchParamDAOService.getAllSearchParams().size()==0}">
					<p>Let me now introduce you to the Search Param concept.</p>
					
					<p>Search Params are there to memorize search criterias so that you will not need to write the same stuff over and over</p>
					<p>Try to create one <g:link class="btn btn-primary" controller="searchParam" action="create"><i class="fa fa-plus"></i> Add Search Param</g:link> and then run a search again using it <g:link controller="search" action="index"><i class="fa fa-lg fa-fw fa-search"></i> <span class="menu-item-parent">Search</span></g:link> 
					
				</g:if>
				<g:else>
					
					Ok, so now you know the main 3 concept of SSearcH Everywhere, so have fun and remember to clean your results sometimes :)	
					
				</g:else>
			
			</g:if>
			
			</div>
			</div>
			</div>
		</div>
	</body>
</html>
