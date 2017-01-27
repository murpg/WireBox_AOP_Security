/* ------------------------------------------------------------------------------
********************************************************************************
Copyright 2005-2014 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author      :	Brad Wood
Date        :	1/6/2014
Description :	This is the Application.cfc for usage withing the ColdBox Framework.
	
------------------------------------------------------------------------------ */
component {
	setting enablecfoutputonly="yes";
	// APPLICATION CFC PROPERTIES
	this.name = hash(getCurrentTemplatePath());
	this.sessionmanagement = "yes";
	
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING = "";
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";
	
	function onApplicationStart() {
		//Load ColdBox
			//Load ColdBox Bootstrap
			application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
			application.cbBootstrap.loadColdbox();
			//writeDump(application.cbBootstrap); abort;
			return true;
	}
	
	function onRequestStart(required string targetPage) {
		 //BootStrap Reinit Check
		if( !structKeyExists(application,"cbBootstrap") or application.cbBootStrap.isfwReinit() ) {
			lock name="coldbox.bootstrap_#hash(getCurrentTemplatePath())#" type="exclusive" timeout="5" throwontimeout="true" {
				structDelete(application,"cbBootStrap");
				application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
			application.cbBootstrap.loadColdbox();
			}
		}
		//On Request Start via ColdBox
		application.cbBootstrap.onRequestStart(arguments.targetPage);
		
		return true;
	}
	
	function onApplicationEnd(required struct appScope) {
		arguments.appScope.cbBootstrap.onApplicationEnd(argumentCollection=arguments);
	}
	
	function onSessionStart() {			
		application.cbBootstrap.onSessionStart();
	}
		
	function onSessionEnd(required struct sessionScope, struct appScope) {
		appScope.cbBootstrap.onSessionEnd(argumentCollection=arguments);
	}
	
	function onMissingTemplate(required string template) {
		return application.cbBootstrap.onMissingTemplate(argumentCollection=arguments);
	}
	
}