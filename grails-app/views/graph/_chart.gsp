<gvisualization:pieCoreChart dynamicLoading="${true}" is3D="${true}" fontSize="${12}"
				elementId="piechart" title="${'Occurences Per Result'}"
				width="100%" height="100%" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div>
	<gvisualization:columnCoreChart dynamicLoading="${true}"  fontSize="${12}"
				elementId="columnCoreChart" title="${'Result Column'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="columnCoreChart"></div>







