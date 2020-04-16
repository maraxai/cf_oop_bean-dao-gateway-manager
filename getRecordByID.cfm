<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		<div class="container">
			<!--- check to see if form has been submitted --->
			<cfif structKeyExists(FORM, 'btn_requestRecordByID')>
				
				<!--- instantiate the manager --->
				<cfset programmerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />
					
				<!--- populate the bean with the data from the form --->
				<cfset formBean = createObject('component', 'programmers.logic.bean.programmerBean')
					.init(argumentCollection=FORM) />
				
				<!--- call the read function in the manager who forwards it to the DAO to return a bean filled with the requested data;
				      pass on the ID as an argument, which you retrieve from the bean through the setter method bean --->
				<cfset programmer = programmerManager.read(formBean.getID()) />
				
				<cfoutput>
					<h3>You requested the data for the following record:</h3><br> 
					<cfform name="updateRecord" action="getRecordsByID.cfm" method="POST">
				<label for="ID">ID:</label><br>
				<cfinput type="text" name="ID" disabled="disabled" value="#programmer.getID()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="firstName" disabled="disabled" value="#programmer.getFirstName()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="lastName"  disabled="disabled"value="#programmer.getLastName()#" /><p/>
				<label for="programmingLanguage">Programming Language:</label><br>
				<cfinput type="text" name="programmingLanguage" disabled="disabled" value="#programmer.getProgrammingLanguage()#" /><p/>
			</cfform>
				</cfoutput>
				<p></p>
				<form name="return" action="index.cfm" method="POST">
					<input class="button" type="submit" value="Return to Main Page" />
				</form>
			</cfif>
		</div>
	</body>
</html>