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
			<cfset objProgrammerBean = createObject('component', 'programmers.logic.bean.programmerBean')
				.init(argumentCollection=FORM) />
				
			<!--- call the create function in the manager, who forwards it to the DAO to create a new db record and return the generated key of the record --->
			<cfset newID = programmerManager.create(objProgrammerBean) />
			<!--- set the new ID into the user bean --->
			<cfset objProgrammerBean.setID(newID) />
				
			<!--- call the read function --->
			<cfset newProgrammer = programmerManager.read(newID) />
			<cfoutput>
				<h3>You successfully created a new record!</h3>
			<cfform name="updateRecord" action="createRecord.cfm" method="POST">
				<label for="ID">ID:</label><br>
				<cfinput type="text" name="ID" disabled="disabled" value="#newProgrammer.getID()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="firstName" disabled="disabled" value="#newProgrammer.getFirstName()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="lastName"  disabled="disabled"value="#newProgrammer.getLastName()#" /><p/>
				<label for="programmingLanguage">Programming Language:</label><br>
				<cfinput type="text" name="programmingLanguage" disabled="disabled" value="#newProgrammer.getProgrammingLanguage()#" /><p/>
			</cfform>
			</cfoutput>
			<p></p>
			<form name="return" action="index.cfm" method="POST">
				<input class="button" type="submit" value="Return to Main Page" />
			</form>
		</div>

	</body>
</html>