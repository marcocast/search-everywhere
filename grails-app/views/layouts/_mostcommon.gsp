<%@ page import="search.everywhere.CommonResultsDAOService" %>
<g:set var="commonResultsDAOService" bean="commonResultsDAOService"/>
<ul id="sparks" class="">
	<g:if test="${commonResultsDAOService.getCommonResultsSize()>0}">
		<li class="sparks-info">
			<g:set var="firstCommonData" value=" ${commonResultsDAOService.get1stCommonData()}" />
			<h5> ${firstCommonData.substring(0,firstCommonData.indexOf("???"))} <span class="txt-color-purple"><i class="fa ${firstCommonData.substring(firstCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${firstCommonData.substring(firstCommonData.indexOf("AVE") + 3,firstCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
				${firstCommonData.substring(firstCommonData.indexOf("???") + 3,firstCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
					
	<g:if test="${commonResultsDAOService.getCommonResultsSize()>1}">
		<li class="sparks-info">
			<g:set var="secondCommonData" value=" ${commonResultsDAOService.get2ndCommonData()}" />
			<h5> ${secondCommonData.substring(0,secondCommonData.indexOf("???"))} <span class="txt-color-blue"><i class="fa ${secondCommonData.substring(secondCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${secondCommonData.substring(secondCommonData.indexOf("AVE") + 3,secondCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
				${secondCommonData.substring(secondCommonData.indexOf("???") + 3,secondCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
	<g:if test="${commonResultsDAOService.getCommonResultsSize()>2}">
		<li class="sparks-info">
			<g:set var="thirdCommonData" value=" ${commonResultsDAOService.get3rdCommonData()}" />
			<h5> ${thirdCommonData.substring(0,thirdCommonData.indexOf("???"))} <span class="txt-color-pink"><i class="fa ${thirdCommonData.substring(thirdCommonData.indexOf("UD") + 2)}" data-rel="bootstrap-tooltip" title="Last against average"></i>&nbsp;${thirdCommonData.substring(thirdCommonData.indexOf("AVE") + 3,thirdCommonData.indexOf("UD") )}%</span></h5>
			<div class="sparkline txt-color-pink hidden-mobile hidden-md hidden-sm">
				${thirdCommonData.substring(thirdCommonData.indexOf("???") + 3,thirdCommonData.indexOf("AVE") )}
			</div>
		</li>
	</g:if>
</ul>