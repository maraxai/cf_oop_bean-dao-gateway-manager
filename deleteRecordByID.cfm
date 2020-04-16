<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		<div class="container">
			<!--- check to see if form has been submitted --->
			<cfif structKeyExists(FORM, 'btn_deleteRecordByID')>
			
				<!--- instantiate the manager --->
				<cfset programmerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />
					
				<!--- populate the bean with the data from the form --->
				<cfset deleteBean = createObject('component', 'programmers.logic.bean.programmerBean')
					.init(argumentCollection=FORM) />
				
				<!--- call the delete function, which returns a boolean for the delete status; pass the value of the ID 
				      as the argument. Get the value by calling the setter method of the bean --->
				<cfset statusDelete = programmerManager.delete(deleteBean.getID()) />
			
				<p></p>
				<cfoutput>
					<h3>
					<cfif statusDelete == true>
						Record successfully deleted!
					<cfelse>
						Delete was not successful, check again!
					</cfif>
					</h3>
				</cfoutput>
				<form name="return" action="index.cfm" method="POST">
					<input class="button" type="submit" value="Return to Main Page" />
				</form>
			</cfif>
		</div>
	</body>
</html>