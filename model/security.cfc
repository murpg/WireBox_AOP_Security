/**
* This aspect enforces security.  It will bind to any method with the annotation "secure" 
* and will kick the user out if they are not logged in.
* @classMatcher any
* @methodMatcher annotatedWith:secure
*/
component {	
	property name="sessionStorage" inject="coldbox:plugin:sessionStorage";
	property name="coldbox" inject="coldbox";
		    
    function invokeMethod( invocation ) {
    	
    	// Enforce our security check
    	if( !sessionStorage.getVar( "loggedIn", false ) ) {
    		// Kick out people who aren't logged in
    		coldbox.setNextEvent( 'main.getLost' );
    	}
    	
		// For logged in people, continue execution of the method
		refLocal.results = arguments.invocation.proceed();
		
		if( structKeyExists(refLocal,"results") ){
			return refLocal.results; 
		}
    }
	
}