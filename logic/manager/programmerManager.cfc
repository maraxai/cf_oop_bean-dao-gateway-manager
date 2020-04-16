<cfcomponent displayname="programmerManager" output="false" hint="programmerManager Class">
	<!--- pseudo-constructor --->
	<cfset variables.instance = {
		programmerDAO = '',
		programmerGateway = ''
	} />	
	
	<!--- initialization constructor method --->
	<cffunction name="init" access="public" output="false" returntype="any" hint="constructor method for the programmerManager Class">
		<!--- instantiate the DAO --->
		<cfset variables.instance.programmerDAO = createObject('component', 'programmers.logic.dao.programmerDAO') />
		
		<!--- instantiate the Gateway --->
		<cfset variables.instance.programmerGateway = createObject('component', 'programmers.logic.gateway.programmerGateway') />
		
		<cfreturn this />
	</cffunction>
	
	<!--- CRUD METHODS --->
	
	<!--- CREATE --->
	<cffunction name="create" access="public" output="false" hint="create a new record">
		<!--- send in the programmer object --->
		<cfargument name="programmer" required="true" type="programmers.logic.bean.programmerBean" hint="programmerBean bean" />
		<!--- call the create method in programmerDAO --->
		<cfreturn variables.instance.programmerDAO.createNewRecord(arguments.programmer) />		
	</cffunction>	
	
	<!--- READ --->
	<cffunction name="read" access="public" output="true" hint="return a record filtered by ID ">
		<!--- send in programmer`s ID --->
		<cfargument name="ID" required="true" type="numeric" hint="programmer ID" />
		<!--- call the read() method in programmerDAO --->
		<cfreturn variables.instance.programmerDAO.getRecordByID(arguments.ID) />		
	</cffunction>
	
	<!--- UPDATE --->
	<cffunction name="update" access="public" output="false" hint="update a record, selected by ID">
		<!--- send in the programmer object --->
		<cfargument name="programmer" required="true" type="programmers.logic.bean.programmerBean" hint="programmerBean bean" />
		<!--- call the update method in programmerDAO --->
		<cfreturn variables.instance.programmerDAO.updateRecord(arguments.programmer) />		
	</cffunction>	
	
	<!--- DELETE --->
	<cffunction name="delete" access="public" output="false" hint="delete a record, filtered by ID ">
		<!--- send in programmer`s ID --->
		<cfargument name="ID" required="true" type="numeric" hint="programmer ID" />
		<!--- call the delete method in programmerDAO --->
		<cfreturn variables.instance.programmerDAO.deleteRecordByID(arguments.ID) />		
	</cffunction>	
	
	<!--- GATEWAY METHODS --->
	<cffunction name="getAllProgrammers" access="public" output="false" hint="query all records">
		<!--- call the query method from the programmerGateway and return the query object --->
		<cfreturn variables.instance.programmerGateway.getAllRecords() />
	</cffunction>
	
	<cffunction name="filterByProgrammingLanguage" access="public" output="false" hint="query programmer by filtering programming language">
		<cfargument name="programmingLanguage" required="true" type="string" hint="programming language filter argument" />
		<!--- send the structure into the query method and return the query object --->
		<cfreturn variables.instance.programmerGateway.getRecordsByLanguage(arguments.programmingLanguage) />
	</cffunction>
		
</cfcomponent>