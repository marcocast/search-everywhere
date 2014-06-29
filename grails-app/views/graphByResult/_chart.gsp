<gvisualization:pieCoreChart dynamicLoading="${true}" is3D="${true}" fontSize="${12}"
				elementId="piechart" title="${'Occurences Per Profile Pie'}"
				width="100%" height="100%" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div>
	<gvisualization:lineCoreChart dynamicLoading="${true}"  fontSize="${12}"
				elementId="lineCoreChart" title="${'Profiles Activities'}"
				width="80%" height="30&"   columns="${myDailyActivitiesColumnsPerType}"
				data="${myDailyActivitiesDataPerType}" />
			<div id="lineCoreChart"></div>







