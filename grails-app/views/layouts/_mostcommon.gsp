<%@ page import="search.everywhere.CommonResultsDAOService" %>
<g:set var="commonResultsDAOService" bean="commonResultsDAOService"/>
<ul id="sparks" class="">
	<g:if test="${commonResultsDAOService.get1stCommonData() != null && !commonResultsDAOService.get1stCommonData().isEmpty()}">
		<li class="sparks-info">
			<g:set var="firstCommonData" value=" ${commonResultsDAOService.get1stCommonData()}" />
			<h5><span class="font-sm">${firstCommonData.substring(0,firstCommonData.indexOf("???"))}</span> <span class="txt-color-purple font-sm"><i class="fa ${firstCommonData.substring(firstCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${firstCommonData.substring(firstCommonData.indexOf("AVE") + 3,firstCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
				${firstCommonData.substring(firstCommonData.indexOf("???") + 3,firstCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
					
	<g:if test="${commonResultsDAOService.get2ndCommonData() != null && !commonResultsDAOService.get2ndCommonData().isEmpty()}">
		<li class="sparks-info">
			<g:set var="secondCommonData" value=" ${commonResultsDAOService.get2ndCommonData()}" />
			<h5><span class="font-sm">${secondCommonData.substring(0,secondCommonData.indexOf("???"))}</span> <span class="txt-color-blue font-sm"><i class="fa ${secondCommonData.substring(secondCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${secondCommonData.substring(secondCommonData.indexOf("AVE") + 3,secondCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
				${secondCommonData.substring(secondCommonData.indexOf("???") + 3,secondCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
	<g:if test="${commonResultsDAOService.get3rdCommonData() != null && !commonResultsDAOService.get3rdCommonData().isEmpty()}">
		<li class="sparks-info">
			<g:set var="thirdCommonData" value=" ${commonResultsDAOService.get3rdCommonData()}" />
			<h5><span class="font-sm">${thirdCommonData.substring(0,thirdCommonData.indexOf("???"))}</span> <span class="txt-color-pink font-sm"><i class="fa ${thirdCommonData.substring(thirdCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${thirdCommonData.substring(thirdCommonData.indexOf("AVE") + 3,thirdCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-pink hidden-mobile hidden-md hidden-sm">
				${thirdCommonData.substring(thirdCommonData.indexOf("???") + 3,thirdCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
</ul>