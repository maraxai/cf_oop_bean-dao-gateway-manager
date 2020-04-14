<h1>Test BEAN-DAO-GATEWAY-MANAGER</h1>

<hr>
<!--- BEAN - all code relating to the bean --->
<h2>BEAN</h2>

<h3>Create a Bean</h3>
<p>with createObject().init()</p>
<cfset objBean = createObject('component', 'logic.bean.programmerBean').init() />
<p>dump with &lt;cfdump var="#objBean#" label="programmerBean"/&gt;	:</p>
<cfdump var="#objBean#" label="programmerBean"/>	
<p>dump with &lt;cfdump var="#objBean.getMemento()#" label="programmerBean"/&gt;	:
</p>
<cfdump var="#objBean.getMemento()#" />

<h3>Populate the Bean</h3>
<p> with Setters:</p>
<cfset objBean.setfirstName('Brendan') />
<cfset objBean.setlastName('Eich') />
<cfset objBean.setProgrammingLanguage('JavaScript') /> 
<cfdump var="#objBean.getMemento()#" />

<h3>Get the Bean's properties</h3>
<p> with Getters:</p>
<cfoutput>getFirstName() outputs: #objBean.getFirstName()#</cfoutput><br>
<cfoutput>getLastName() outputs: #objBean.getLastName()#</cfoutput><br>
<cfoutput>getProgrammingLanguage() outputs: #objBean.getprogrammingLanguage()#</cfoutput>

<hr>
<!--- DAO - all code relating to the DAO --->
<h2>DAO</h2>

<h3>Create a DAO</h3>
<h4>READ QUERY</h4>
<p>query the database with ID=2 and fill the bean: </p>
<!--- instantiate the DAO --->
<cfset programmerDAO = createObject('component', 'logic.DAO.programmerDAO') />
<!--- call the function  --->
<cfset objProgrammer = programmerDAO.getRecordByID(2) />

<cfdump var="#objProgrammer.getMemento()#" />
<cfoutput>#objProgrammer.getFirstName()# #objProgrammer.getLastName()#  is the inventor of #objProgrammer.getProgrammingLanguage()#</cfoutput>

<h4>CREATE QUERY</h4>
<p>create a new record : </p>
<!--- populate the bean with the new record --->
<h5>Populate the Bean</h5>
<p> with Setters:</p>
<cfset objBean.setfirstName('Dennis') />
<cfset objBean.setlastName('Ritchie') />
<cfset objBean.setProgrammingLanguage("C") /> 
<cfdump var="#objBean.getMemento()#" />
<!--- call the function  --->
 
<cfset objProgrammer = programmerDAO.createNewRecord(objBean) />

<cfoutput>Output the return of the function createNewRecord():</cfoutput><br>
<cfdump var="The ID of the newly created record is: #objProgrammer#" /><br>
<cfset objAdd = programmerDAO.getRecordByID(objProgrammer) />
<cfoutput>#objAdd.getFirstName()# #objAdd.getLastName()#  is the inventor of #objAdd.getProgrammingLanguage()#</cfoutput>

<h4>UPDATE QUERY</h4>
<p>update an existing record : </p>
<!--- get bean with record to be updated --->
<h5>Get Record to update</h5>
<p> with DAO function :</p>
<cfset objToUpdate = programmerDAO.getRecordByID(7) />
<cfdump var="#objToUpdate.getMemento()#" />

<h5>Update the Properties with the setter methods:</h5>
<p> with Setters:</p>
<cfset objToUpdate.setfirstName('James') />
<cfset objToUpdate.setlastName('Gosling') />
<cfset objToUpdate.setProgrammingLanguage("Java") /> 
<cfdump var="#objToUpdate.getMemento()#" />
<!--- call the function  --->
<cfset objUpdated = programmerDAO.updateRecord(objToUpdate) />

<cfoutput>The Update has been Successful: </cfoutput>
<cfdump var="#objUpdated#" /><br>

<cfset objUpdateProg = programmerDAO.getRecordByID(objToUpdate.getID()) />
<cfoutput>
	<cfif objUpdated == true>
		Record with the ID #objUpdateProg.getFirstName()# has been successfully updated. The new record is: #objUpdateProg.getFirstName()# #objUpdateProg.getLastName()#  is the inventor of #objUpdateProg.getProgrammingLanguage()#
	<cfelse>
		Update failed!	
	</cfif>
</cfoutput>
	
	
<h4>DELETE QUERY</h4>
<p>delete an existing record : </p>
<!--- get bean with record to delete --->
<h5>Get Record to delete</h5>
<p> with DAO function :</p>
<cfset objToDelete = programmerDAO.getRecordByID(10) />
<cfdump var="#objToDelete#" />

<!--- call the function  --->
<cfset objDeleted = programmerDAO.deleteRecordByID(objToDelete.getID()) />

<cfoutput>The Update has been Successful: </cfoutput>
<cfdump var="#objDeleted#" /><br>

<cfoutput>
	<cfif objDeleted == true>
		Record has been successfully deleted.
	<cfelse>
		Delete failed!	
	</cfif>
</cfoutput>

<hr>
<!--- DAO - all code relating to the Gateway --->
<h2>GATEWAY</h2>

<h3>Create a Gateway</h3>
<p>with createObject()</p>
<!--- instantiate the newly created Gateway --->
<cfset objManager = createObject('component', 'programmers.logic.gateway.programmerGateway') />

<!--- call the function getAllRecords --->
<cfoutput>call the function getAllRecords</cfoutput>
<cfset allRecords = objManager.getAllRecords() />
<!--- dump the objManager --->
<cfoutput> and dump the result:</cfoutput>
<cfdump var="#allRecords#" />

<!--- call the function getRecordsByLastName --->
<cfoutput>call the function getRecordsByLanguage</cfoutput>
<cfset recordsByLanguage = objManager.getRecordsByLanguage('C%') />
<!--- dump the objManager --->
<cfoutput> and dump the result:</cfoutput>
<cfdump var="#recordsByLanguage#" />

<hr>
<!--- DAO - all code relating to the manager --->
<h2>MANAGER</h2>

<h3>Instantiate the Manager:</h3>
<!--- instantiate the manager --->
<cfset programmerManager = createObject('component', 'programmers.logic.manager.programmerManager').init() />
<cfdump var="#programmerManager#" label="instance"/>

<!--- instantiate a managerBean --->
<cfset objManagerBean = createObject('component', 'logic.bean.programmerBean').init() />
<p>dump with &lt;cfdump var="#objManagerBean.getMemento()#" label="managerBean"/&gt;	:</p>
<cfdump var="#objManagerBean.getMemento()#" />

<!--- call the functions   --->
<!--- CREATE --->
<h3>Call the function create():</h3>
<h5>1. Fill the bean with the setter methods:</h5>
<cfset objManagerBean.setfirstName('Charlie') />
<cfset objManagerBean.setlastName('Parker') />
<cfset objManagerBean.setProgrammingLanguage("BeBop") /> 
<cfdump var="#objManagerBean.getMemento()#" />
<h5>2. Call the create function:</h5>

<cfset objMgrProgCreate = programmerManager.create(objManagerBean) />
<cfoutput>The generated ID for the new record is: </cfoutput>
<cfdump var="#objMgrProgCreate#" label="create function"/><br>
<cfoutput>Output of create(#objManagerBean.getID()#): #objManagerBean.getFirstName()# #objManagerBean.getLastName()# #objManagerBean.getProgrammingLanguage()#</cfoutput>


<!--- READ --->
<h3>Call the function read():</h3>
<cfset objMgrProg = programmerManager.read(1) />
<cfdump var="#objMgrProg#" label="read function"/>
<cfoutput>Output of read(#objMgrProg.getID()#): #objMgrProg.getFirstName()# #objMgrProg.getLastName()# #objMgrProg.getProgrammingLanguage()#</cfoutput>

<!--- UPDATE --->
<h3>Call the function update():</h3>
<p>Get the bean of the record to be updated </p>
<cfset objUpdBean = programmerManager.read(2) />
<h5>1. Update the Properties with the setter methods:</h5>
<cfset objUpdBean.setFirstName('Michael') />
<cfdump var="#objUpdBean.getMemento()#" />

<h5>2. Call the update function:</h5>
<cfset objMgrProgUpdate = programmerManager.update(objUpdBean) />
<cfoutput>The update was successul: </cfoutput>
<cfdump var="#objMgrProgUpdate#" label="update function"/><br>
<cfset checkUpd = programmerManager.read(2) />
<cfoutput>Output of update(#checkUpd.getID()#): #checkUpd.getFirstName()# #checkUpd.getLastName()# #checkUpd.getProgrammingLanguage()#</cfoutput>

<!--- DELETE --->
<h3>Call the function delete():</h3>
<cfset objMgrProgDel = programmerManager.delete(16) />
<cfoutput>
	<cfif #objMgrProgDel# == true>
		Delete was successful!
	<cfelse>
		Delete was not successful!
	</cfif>
</cfoutput>

<!--- READ ALL RECORDS --->
<h3>Call the function getAllRecords():</h3>
<cfset objMgrAllRecords = programmerManager.getAllProgrammers() />
<cfdump var="#objMgrAllRecords#" label="getAllRecords function"/>
<cfoutput>
	<ul>
		<cfloop query="#objMgrAllRecords#">
			<li>#objMgrAllRecords.firstName# #objMgrAllRecords.lastName# developed #objMgrAllRecords.programmingLanguage#
		</cfloop>
	</ul>
</cfoutput>

<!--- QUERY BY PROGRAMMING LANGUAGE --->
<h3>Call the function filterByProgrammingLanguage():</h3>
<cfset resultOfQueryByPrgLanguage = programmerManager.filterByProgrammingLanguage('C%') />
<cfdump var="#resultOfQueryByPrgLanguage#" />
<cfoutput>list of programming languages that contain the search string 'C%':
	<ul>
		<cfloop query="#resultOfQueryByPrgLanguage#">
			<li>#resultOfQueryByPrgLanguage.programmingLanguage#
		</cfloop>
	</ul>
</cfoutput>







