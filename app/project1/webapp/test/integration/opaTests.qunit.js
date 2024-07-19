sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/DocumentsList',
		'project1/test/integration/pages/DocumentsObjectPage',
		'project1/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, DocumentsList, DocumentsObjectPage, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDocumentsList: DocumentsList,
					onTheDocumentsObjectPage: DocumentsObjectPage,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);