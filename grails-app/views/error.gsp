<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="smart-admin"/>
		<title>Error to SSearcH Everywhere</title>
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
					<li>Home</li><li>Miscellaneous</li><li>Error 500</li>
				</ol>
				<!-- end breadcrumb -->

				<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

			</div>
			<!-- END RIBBON -->

			<!-- MAIN CONTENT -->
			<div id="content">

				<!-- row -->
				<div class="row">
				
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				
						<div class="row">
							<div class="col-sm-12">
								<div class="text-center error-box">
									<h1 class="error-text tada animated"><i class="fa fa-times-circle text-danger error-icon-shadow"></i> Error 500</h1>
									<h2 class="font-xl"><strong>Oooops, Something went wrong!</strong></h2>
									<br />
									<p class="lead">
										<strong>You have experienced a technical error. We apologize.</strong><br><br>
										<small>
											We are working hard to correct this issue. Please wait a few moments and try your search again. <br> 
										</small>
									</p>
								</div>
								<div class="text-left error-box">	
									<p class="lead semi-bold">
									<small>
										<g:if env="development">
										
												<g:renderException exception="${exception}" />
											</g:if>
											<g:else>
												<ul class="errors">
													<li>An error has occurred</li>
												</ul>
											</g:else>
										</small>
										</p>
								<div class="text-center error-box">
									<ul class="error-search text-left font-md">
							            <li><a href="/search-everywhere"><small>Go to My Dashboard <i class="fa fa-arrow-right"></i></small></a></li>
							            <li><a href="mailto:marcocast@gmail.com"><small>Contact SSearcH Everywhere IT <i class="fa fa-mail-forward"></i></small></a></li>
							            <li><a href="javascript:history.back();"><small>Go back</small></a></li>
							        </ul>
								</div>
				
							</div>
				
						</div>
				
					</div>
					
				</div>
				<!-- end row -->

			</div>
			<!-- END MAIN CONTENT -->
	</body>
</html>

	