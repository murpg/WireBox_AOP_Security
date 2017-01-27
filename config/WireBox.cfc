component extends="coldbox.system.ioc.config.Binder" {

	function configure(){
		
		// Enable AOP
		wireBox.listeners = [ { class="coldbox.system.aop.mixer" } ];			
		
		// Declare our aspect
		mapAspect( 'security' )
			.to( 'models.security' );
				
	}	
}