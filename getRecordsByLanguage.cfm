<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		<div class="container">
		<!--- instantiate the manager --->
		<cfset programmerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />
			
		<!--- populate the bean with the data from the form --->
		<cfset filterBean = createObject('component', 'programmers.logic.bean.programmerBean')
			.init(argumentCollection=FORM) />
		
		<!--- call the function and provide the argument; get the value of the property through the bean's getter method --->
		<cfset qProgrammerByLanguage = programmerManager.filterByProgrammingLanguage(filterBean.getProgrammingLanguage()) />
		
		<cfoutput>
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Programming Language</th>
				</tr>
				<cfloop query="#qProgrammerByLanguage#">
					<tr>
						<td>#qProgrammerByLanguage.firstName#</td>
						<td>#qProgrammerByLanguage.lastName#</td>
						<td>#qProgrammerByLanguage.programmingLanguage#</td>
					</tr>
				</cfloop>
			</table>
		</cfoutput>
		<p></p>
		<form name="return" action="index.cfm" method="POST">
			<input class="button" type="submit" value="Return to Main Page" />
		</form>
		
		</div>
	</body>
</html>
