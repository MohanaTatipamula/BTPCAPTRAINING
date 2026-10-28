sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/hpcl/projmgmtui/test/integration/pages/ProductList.gen",
	"com/hpcl/projmgmtui/test/integration/pages/ProductObjectPage.gen"
], function (JourneyRunner, ProductListGenerated, ProductObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/hpcl/projmgmtui') + '/test/flp.html#app-preview',
        pages: {
			onTheProductListGenerated: ProductListGenerated,
			onTheProductObjectPageGenerated: ProductObjectPageGenerated
        },
        async: true
    });

    return runner;
});

