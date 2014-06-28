<gvisualization:pieCoreChart dynamicLoading="${true}"
				elementId="piechart" title="${'Occurences Per Profile Pie'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div>
	<gvisualization:columnCoreChart dynamicLoading="${true}"
				elementId="columnCoreChart" title="${'Profiles Activities'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="columnCoreChart"></div>
	<gvisualization:barCoreChart dynamicLoading="${true}"
				elementId="barCoreChart" title="${'Profiles bar line'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="barCoreChart"></div>






