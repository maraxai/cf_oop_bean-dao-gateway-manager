<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		<h1>ColdFusion Object-Oriented Programming (OOP)</h1>
		<h2>BEAN-DAO-GATEWAY-MANAGER</h2>
		<p>This demonstration deals with data of innovative programmers and the programming language that they invented or initiated. 
		    The database table has the the columns first name, last name and programming language.</p>

		
		<!--- MANAGER - all code relating to the manager --->

		
		<!--- instantiate the manager --->
		<cfset programmerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />
	
		<!--- instantiate a managerBean --->
		<cfset objManagerBean = createObject('component', 'logic.bean.programmerBean').init() />
		
		<!--- ALL FUNCTIONS   --->
		
		<!--- CREATE --->
		<div class="container">
			<h3>Create a new Record</h3>
			<p>Add another innovative Programmer to the list:</p>
		
			<!--- form --->
			<cfform name="createNewRecord" action="createRecord.cfm" method="POST">
				<label for="firstName">First name:</label><br>
				<cfinput type="text" name="firstName"/><p></p>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="lastName"/><p></p>
				<label for="programmingLanguage">Programming Language:</label><br>
				<cfinput type="text" name="programmingLanguage"/><br /><p></p>
				<cfinput class="button" type="submit" name="btn_createRecord" value="Create New Record" />
			</cfform>
		</div>
		
		<!--- READ --->
		<div class="container">
			<h3>Read a Record</h3>
		
			<!--- Form --->
			<cfform name="getRecordByID" action="getRecordByID.cfm" method="POST">
				<label for="ID">Enter the ID of the record you want to see:</label>
				<cfinput type="text" name="ID" mask="999"/><br />
				<cfinput class="button" type="submit" name="btn_requestRecordByID" value="Request Data"/>
			</cfform>
		</div>
		
		<!--- UPDATE --->
		<div class="container">
				<h3>Update a Record</h3>

			<!--- Form 	--->
			<cfform name="updateRecordByID" action="updateRecordByID.cfm" method="POST">
				<label for="ID">Enter the ID of the record you want to update:</label>
				<cfinput type="text" name="ID" mask="999"/><br />
				<cfinput class="button" type="submit" name="btn_updateRecordByID" value="Request Data"/>
			</cfform>
		</div>
		
		<!--- DELETE --->
		<div class="container">
			<h3>Delete a Record</h3>

			<!--- Form 	--->
			<cfform name="deleteRecordByID" action="deleteRecordByID.cfm" method="POST">
				<label for="ID">Enter the ID of the record you want to delete:</label>
				<cfinput type="text" name="ID" mask="999"/><br />
				<cfinput class="button" type="submit" name="btn_deleteRecordByID" value="Request Data"/>
			</cfform>
		</div>
		
		<!--- READ ALL RECORDS --->
		<div class="container">
			<h3>All Records</h3>
			<cfset objMgrAllRecords = programmerManager.getAllProgrammers() />
			<cfoutput>
				<table>
					<tr>
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Programming Language</th>
					</tr>
					<cfloop query="#objMgrAllRecords#">
						<tr>
							<td>#objMgrAllRecords.ID#</td>
							<td>#objMgrAllRecords.firstName#</td>
							<td>#objMgrAllRecords.lastName#</td>
							<td>#objMgrAllRecords.programmingLanguage#</td>
						</tr>
					</cfloop>
				</table>
			</cfoutput>
		</div>
		
		<!--- QUERY BY PROGRAMMING LANGUAGE --->
		<div class="container">
			<h3>Filter Records by Programming Language</h3>
			
			<!--- Form --->
			<cfform name="getRecordsByLanguage" action="getRecordsByLanguage.cfm" method="POST">
				<label for="programmingLanguage">Enter the programming language of the record you want to see:</label>
				<cfinput type="text" name="programmingLanguage"/><br />
				<cfinput class="button" type="submit" name="btn_reqRecordByLanguage" value="Request Data"/>
			</cfform>
		</div>
	</body>
</html>

