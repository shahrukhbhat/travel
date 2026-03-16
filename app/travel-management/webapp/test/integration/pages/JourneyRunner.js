sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"travelmanagement/test/integration/pages/TravelList",
	"travelmanagement/test/integration/pages/TravelObjectPage"
], function (JourneyRunner, TravelList, TravelObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('travelmanagement') + '/test/flpSandbox.html#travelmanagement-tile',
        pages: {
			onTheTravelList: TravelList,
			onTheTravelObjectPage: TravelObjectPage
        },
        async: true
    });

    return runner;
});

