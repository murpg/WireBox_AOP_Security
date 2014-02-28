<cfoutput>

	<cfif getPlugin( "sessionStorage" ).getVar( "loggedIn", false )>
		<h4>You are currently logged in.</h4>
		<a class="btn btn-warning" href="#event.buildLink( "main.logout" )#">
			Log Out
		</a>
	<cfelse>
		<h4>You are currently logged out.</h4>
		<a class="btn btn-success" href="#event.buildLink( "main.login" )#">
			Log In
		</a>
	</cfif>
	
	<br>
	<br>
	<br>
	
	<h4>Try to access our super-secure area if you dare.</h4>
	
	<a class="btn btn-danger" href="#event.buildLink( "main.fortKnox" )#">
		Give up your secrets!
	</a>
</cfoutput>