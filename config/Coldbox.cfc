component {
	
	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "DemoApp",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
	
			//Application Aspects
			handlerCaching 			= false
		};
				
		// These are just settings I use for the layout of the Demo to make this sample app easier to reuse.
		settings = {
			demoTitle = 'WireBox AOP For Security',
			demoDescription = listChangeDelims( fileRead('C:\Users\gmurphy.ALIONSCIENCE\aop\readme.md'), '<p>', chr(13)&chr(10) ),
			demoDescriptionButtons = [
				{
					// Change to WireBox AOP ref card once it's ready
					name = 'WireBox Ref Card',
					link = 'https://github.com/ColdBox/cbox-refcards/raw/master/WireBox/WireBox-Refcard.pdf'
				}
			],
			demoSourceLink = 'https://github.com/murpg/WireBox_AOP_Security',
			demoRelatedLiveLink = 'http://code.runnable.com/UxAPnxLIPPQRijiK/wirebox-aop-for-security-for-coldbox-coldfusion-cfml-mvc-and-railo'
		};

		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	
	}

}