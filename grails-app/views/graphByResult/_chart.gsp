<div class="row">
<gvisualization:pieCoreChart dynamicLoading="${true}" is3D="${true}" fontSize="${10}"
				elementId="piechart" title="${'Occurences Per Result'}"
				width="100%" height="100%" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="piechart"></div>
</div>
			
<div class="row">			
<gvisualization:columnCoreChart dynamicLoading="${true}"  fontSize="${10}"
				elementId="columnCoreChart" title="${'Results column'}"
				width="80%" height="30&" columns="${myDailyActivitiesColumns}"
				data="${myDailyActivitiesData}" />
			<div id="columnCoreChart"></div>
</div>
			
<div class="row">
<gvisualization:lineCoreChart dynamicLoading="${true}"  fontSize="${10}"
			elementId="lineCoreChart" title="${'Results trends'}"
			width="100%" height="100%"   columns="${myDailyActivitiesColumnsPerType}"
			data="${myDailyActivitiesDataPerType}" />
		<div id="lineCoreChart"></div>
</div>

