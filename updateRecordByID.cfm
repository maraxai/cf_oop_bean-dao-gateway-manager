<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css"/>
	</head>
	<body>
		
		<div class="container">
			<!--- instantiate the programmerManager object --->
			<cfset objProgrammerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />

			<!--- populate the bean with the form data --->
			<cfset objUpdateBean = createObject('component', 'programmers.logic.bean.programmerBean').init(ID) />
			
			<!--- get the user bean for this programmer from the DAO --->
			<cfset updateBean = objProgrammerManager.read(objUpdateBean.getID()) />

			<h3>Edit User Information</h3>
			<h4>Update the Record</h4>
			<p>You requested the data for the record with ID <cfoutput>#updateBean.getID()#</cfoutput> for an update.</p>

			<cfif structKeyExists(FORM, "btn_updateRecord")>	
				<!--- set the values of the form elements into the currently populated user bean object --->
				<cfset updateBean.setFirstName(FORM.firstName) />
				<cfset updateBean.setLastName(FORM.lastName) />
				<cfset updateBean.setProgrammingLanguage(FORM.programmingLanguage) />
				
				<!--- pass this user bean into the updateUser() method --->
				<cfset objProgrammerManager.update(programmer=updateBean) />
				<cfoutput>Your update has been successful!</cfoutput>
				<form name="return" action="index.cfm" method="POST">
				<input class="button" type="submit" value="Return to Main Page" />
			</form>
			</cfif>
			
			<cfform name="updateRecord" action="updateRecordByID.cfm" method="POST">
				<cfinput type="hidden" name="ID" value="#updateBean.getID()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="firstName" value="#updateBean.getFirstName()#" /><p/>
				<label for="lastName">Last name:</label><br>
				<cfinput type="text" name="lastName" value="#updateBean.getLastName()#" /><p/>
				<label for="programmingLanguage">Programming Language:</label><br>
				<cfinput type="text" name="programmingLanguage" value="#updateBean.getProgrammingLanguage()#" /><p/>
				<cfinput class="button" type="submit" name="btn_updateRecord" value="Update Record" />
			</cfform>
			
			
		</div>

	</body>
</html>
