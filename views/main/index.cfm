<cfoutput>

	<cfif prc.sessionStorage>
		<h4>You are currently logged in.</h4>
		<a class="btn btn-warning" target="_blank" href="#event.buildLink( "main.logout" )#">
			Log Out
		</a>
	<cfelse>
		<h4>You are currently logged out.</h4>
		<a class="btn btn-success" target="_blank" href="#event.buildLink( "main.login" )#">
			Log In
		</a>
	</cfif>
	
	<br>
	<br>
	<br>
	
	<h4>Try to access our super-secure area if you dare.</h4>
	
	<a class="btn btn-danger" target="_blank" href="#event.buildLink( "main.fortKnox" )#">
		Give up your secrets!
	</a>
</cfoutput>