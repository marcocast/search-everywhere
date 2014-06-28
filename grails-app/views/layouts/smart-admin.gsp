<%@ page import="search.everywhere.NotifyService" %>
<g:set var="notifyService" bean="notifyService"/>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

		<title> Search Everywhere </title>
		<meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="${request.contextPath}/smart-admin/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${request.contextPath}/smart-admin/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
		<link rel="stylesheet" type="text/css" media="screen" href="${request.contextPath}/smart-admin/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${request.contextPath}/smart-admin/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support is under construction
			 This RTL CSS will be released in version 1.5
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		<link rel="stylesheet" type="text/css" media="screen" href="${request.contextPath}/smart-admin/css/demo.min.css">

		<!-- FAVICONS -->
		<link rel="shortcut icon" href="${request.contextPath}/smart-admin/img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="${request.contextPath}/smart-admin/img/favicon/favicon.ico" type="image/x-icon">

		<!-- GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="${request.contextPath}/smart-admin/img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="${request.contextPath}/smart-admin/img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="${request.contextPath}/smart-admin/img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="${request.contextPath}/smart-admin/img/splash/touch-icon-ipad-retina.png">
		
		<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<!-- Startup image for web apps -->
		<link rel="apple-touch-startup-image" href="${request.contextPath}/smart-admin/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="${request.contextPath}/smart-admin/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="${request.contextPath}/smart-admin/img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		<r:layoutResources/>
		
	</head>
	<body class="">
		<!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

		<!-- HEADER -->
		<header id="header">
			<div id="logo-group">

				<!-- PLACE YOUR LOGO HERE -->
				<span> <img src="${request.contextPath}/smart-admin/img/logo.png" style="width: 70%; height: 70%" alt="SSearcH everywhere"> </span>
				<!-- END LOGO PLACEHOLDER -->



				
			</div>

			<!-- projects dropdown -->
			<div class="project-context hidden-xs">

				<span class="label">Recent Activities</span>
				<span id="activity" class="activity-dropdown" ><a>Click here <i class="fa fa-hand-o-down"></i></a></span>
				
				<!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
				<div class="ajax-dropdown">

					<!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
					<div class="btn-group btn-group-justified" data-toggle="buttons" >
						<label class="btn btn-default">
							<input type="radio" name="activity" id="${request.contextPath}/smart-admin/ajax/notify/resultsSmall.gsp">
							<small>Results</small></label>
						<label class="btn btn-default">
							<input type="radio" name="activity" id="${request.contextPath}/smart-admin/ajax/notify/searchableFilesSmall.gsp">
							<small>Searchable Files</small></label>
						<label class="btn btn-default">
							<input type="radio" name="activity" id="${request.contextPath}/smart-admin/ajax/notify/searchParamsSmall.gsp">
							<small>Search Params</small></label>
					</div>

					<!-- notification content -->
					<div class="ajax-notifications custom-scroll">

						<div class="alert alert-transparent">
							<h2>Most recent activities</h2>
							<h4>Click a button to show the latest details</h4>
							<span> Last activity was on: ${new Date(notifyService.getLastUpdateDate())}</span>
						</div>
						
						

					</div>
					<!-- end notification content -->

					<!-- footer: refresh area -->
					
					<!-- end footer -->

				</div>
				<!-- end dropdown-menu-->

			</div>
			<!-- end projects dropdown -->

			<!-- pulled right: nav area -->
			<div class="pull-right">
				
				<!-- collapse menu button -->
				<div id="hide-menu" class="btn-header pull-right">
					<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
				</div>
				<!-- end collapse menu -->
				
				<!-- #MOBILE -->
				<!-- Top menu profile link : this shows only when top menu is active -->
				<ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
					<li class="">
						
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
							</li>
							
							
						</ul>
					</li>
				</ul>

			

				<!-- search mobile button (this is hidden till mobile view port) -->
				<div id="search-mobile" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
				</div>
				<!-- end search mobile button -->

				<!-- input: search field -->
				<form action="search.html" class="header-search pull-right">
					<input id="search-fld"  type="text" name="param" placeholder="Find reports and more" data-autocomplete='[
					"ActionScript",
					"AppleScript",
					"Asp",
					"BASIC",
					"C",
					"C++",
					"Clojure",
					"COBOL",
					"ColdFusion",
					"Erlang",
					"Fortran",
					"Groovy",
					"Haskell",
					"Java",
					"JavaScript",
					"Lisp",
					"Perl",
					"PHP",
					"Python",
					"Ruby",
					"Scala",
					"Scheme"]'>
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
					<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
				</form>
				<!-- end input: search field -->

				<!-- fullscreen button -->
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
				</div>
				<!-- end fullscreen button -->


			</div>
			<!-- end pulled right: nav area -->

		</header>
		<!-- END HEADER -->

		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<aside id="left-panel">

			
			<!-- end user info -->

			<!-- NAVIGATION : This navigation is also responsive

			To make this navigation dynamic please make sure to link the node
			(the reference to the nav > ul) after page load. Or the navigation
			will not initialize.
			-->
			<nav>
				<!-- NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul>
					<li>
						<g:link controller="search" action="index"><i class="fa fa-lg fa-fw fa-search"></i> <span class="menu-item-parent">Search</span></g:link>
						
					</li>
					
					<li>
						<g:link controller="result" action="index"><i class="fa fa-lg fa-fw fa-list-ol"></i>Results<span class="badge pull-right inbox-badge"><g:totResults/></span></g:link>
						
					</li>
		
					<li class="active">
						<a href="#"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">Searchable Files</span></a>
						<ul>
							<li>
								<g:link controller="searchableFile" action="index">View<span class="badge pull-right inbox-badge"><g:totSearchablefiles/></span></g:link>
							</li>
							<li class="active">
								<g:link controller="searchableFile" action="create">Create new</g:link>
							</li>
							
						</ul>
					</li>
					
					
					
					<li class="active">
						<a href="#"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">Search Paramas</span></a>
						<ul>
							<li>
								<g:link controller="searchParam" action="index">View<span class="badge pull-right inbox-badge"><g:totSearchParams/></span></g:link>
							</li>
							<li class="active">
								<g:link controller="searchParam" action="create">Create new</g:link>
							</li>
							
						</ul>
					</li>
					
					<li>
						<g:link controller="graph" action="index"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Graphs</span></g:link>
						
					</li>
				</ul>
			</nav>
			<span class="minifyme" data-action="minifyMenu"> 
				<i class="fa fa-arrow-circle-left hit"></i> 
			</span>

		</aside>
		<!-- END NAVIGATION -->

		<!-- MAIN PANEL -->
		<div id="main" role="main">
			
		
			<g:layoutBody/>
			<r:layoutResources/>

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<div class="page-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<span class="txt-color-white">Cast studio © 2014</span>
				</div>
			</div>
				
		</div>
		<!-- END PAGE FOOTER -->

		

		<!--================================================== -->
		<script type="text/javascript" src="http://www.google.com/jsapi"></script>

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="${request.contextPath}/smart-admin/js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document.write('<script src="${request.contextPath}/smart-admin/js/libs/jquery-2.0.2.min.js"><\/script>');
			}
		</script>

		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="${request.contextPath}/smart-admin/js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->
		<script src="${request.contextPath}/smart-admin/js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="${request.contextPath}/smart-admin/js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="${request.contextPath}/smart-admin/js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="${request.contextPath}/smart-admin/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="${request.contextPath}/smart-admin/js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="${request.contextPath}/smart-admin/js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="${request.contextPath}/smart-admin/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="${request.contextPath}/smart-admin/js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="${request.contextPath}/smart-admin/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="${request.contextPath}/smart-admin/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="${request.contextPath}/smart-admin/js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		<!-- Demo purpose only -->
		<script src="${request.contextPath}/smart-admin/js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="${request.contextPath}/smart-admin/js/app.min.js"></script>

		<!-- PAGE RELATED PLUGIN(S) -->
		<script src="${request.contextPath}/smart-admin/js/plugin/datatables/jquery.dataTables.min.js"></script>
		<script src="${request.contextPath}/smart-admin/js/plugin/datatables/dataTables.colVis.min.js"></script>
		<script src="${request.contextPath}/smart-admin/js/plugin/datatables/dataTables.tableTools.min.js"></script>
		<script src="${request.contextPath}/smart-admin/js/plugin/datatables/dataTables.bootstrap.min.js"></script>
		<script src="${request.contextPath}/smart-admin/js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		
		<script type="text/javascript">
		
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			pageSetUp();
			
			/* // DOM Position key index //
			
				l - Length changing (dropdown)
				f - Filtering input (search)
				t - The Table! (datatable)
				i - Information (records)
				p - Pagination (paging)
				r - pRocessing 
				< and > - div elements
				<"#id" and > - div with an id
				<"class" and > - div with a class
				<"#id.class" and > - div with an id and class
				
				Also see: http://legacy.datatables.net/usage/features
			*/	
			
			/* BASIC ;*/
			$('#dt_basic_result').dataTable( {
			    scrollY: 500,
			    paging: false,
			    bSort: true,
       			"deferRender": true
			} );
			
			/* BASIC ;*/
			$('#dt_basic').dataTable( {
			   bSort: true
			} );
	
			
			/* END BASIC */
			
			/* COLUMN FILTER  */
		    var otable = $('#datatable_fixed_column').DataTable({
		    	//"bFilter": false,
		    	//"bInfo": false,
		    	//"bLengthChange": false
		    	//"bAutoWidth": false,
		    	//"bPaginate": false,
		    	//"bStateSave": true // saves sort state using localStorage
				"sDom": "<'dt-toolbar'<'col-xs-6'f><'col-xs-6'<'toolbar'>>r>"+
						"t"+
						"<'dt-toolbar-footer'<'col-xs-6'i><'col-xs-6'p>>"
			
		    });
		    
		    // custom toolbar
		    $("div.toolbar").html('<div class="text-right"><img src="${request.contextPath}/smart-admin/img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');
		    	   
		    // Apply the filter
		    $("#datatable_fixed_column thead th input[type=text]").on( 'keyup change', function () {
		    	
		        otable
		            .column( $(this).parent().index()+':visible' )
		            .search( this.value )
		            .draw();
		            
		    } );
		    /* END COLUMN FILTER */   
	    
			/* COLUMN SHOW - HIDE */
			$('#datatable_col_reorder').dataTable({
				"sDom": "<'dt-toolbar'<'col-xs-6'f><'col-xs-6'C>r>"+
						"t"+
						"<'dt-toolbar-footer'<'col-xs-6'i><'col-xs-6'p>>"
			});
			
			/* END COLUMN SHOW - HIDE */
			
			/* TABLETOOLS */
			$('#datatable_tabletools').dataTable({
				
				// Tabletools options: 
				//   https://datatables.net/extensions/tabletools/button_options
				"sDom": "<'dt-toolbar'<'col-xs-6'f><'col-xs-6'T>r>"+
						"t"+
						"<'dt-toolbar-footer'<'col-xs-6'i><'col-xs-6'p>>",
		        "oTableTools": {
		        	 "aButtons": [
		             "copy",
		             "csv",
		             "xls",
		                {
		                    "sExtends": "pdf",
		                    "sTitle": "SmartAdmin_PDF",
		                    "sPdfMessage": "SmartAdmin PDF Export",
		                    "sPdfSize": "letter"
		                },
		             	{
	                    	"sExtends": "print",
	                    	"sMessage": "Generated by SmartAdmin <i>(press Esc to close)</i>"
	                	}
		             ],
		            "sSwfPath": "${request.contextPath}/smart-admin/js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
		        }
			});
			
			/* END TABLETOOLS */
		
		})

		</script>
		
		
		
		
		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
			_gaq.push(['_trackPageview']);
			
			(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
			})();
		</script>

	</body>

</html>