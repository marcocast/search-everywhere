<gvisualization:pieCoreChart dynamicLoading="${true}" is3D="${true}" fontSize="${12}"
				elementId="piechart" title="${'Occurences Per Result'}"
				width="100%" height="100%" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div>
<gvisualization:columnCoreChart dynamicLoading="${true}"  fontSize="${12}"
				elementId="columnCoreChart" title="${'Results column'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="columnCoreChart"></div>
<gvisualization:lineCoreChart dynamicLoading="${true}"  fontSize="${12}"
			elementId="lineCoreChart" title="${'Results trends'}"
			width="100%" height="100%"   columns="${myDailyActivitiesColumnsPerType}"
			data="${myDailyActivitiesDataPerType}" />
		<div id="lineCoreChart"></div>

