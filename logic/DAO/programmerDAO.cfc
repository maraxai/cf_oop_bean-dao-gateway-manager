<cfcomponent displayname="programmerDAO" output="false" hint="programmerDAO">
	
	<!--- define properties for the data --->
	<cfproperty name="ID" type="numeric" required="true" hint="auto-incremented value, can not be set manually" />
	<cfproperty name="firstName" type="string" required="true" hint="first name of programmer" />
	<cfproperty name="lastName" type="string" required="true" hint="last name of programmer" />
	<cfproperty name="programmingLanguage" type="string" required="true" hint="language invented by programmer" />
	
	<!--- PUBLIC METHODS --->
	<!--- CREATE --->
	<cffunction name="createNewRecord" access="public" output="false" returntype="numeric" hint="create a new record">
		<cfargument name="bean" required="true" type="programmers.logic.bean.programmerBean" hint="programmerBean" />
		
		<cfset var newRecord = 0 />
		
		<cfquery name="qInsert" datasource="db_computerScience" username="mike" password="mySQL4webDev" result="newRecord">
			INSERT INTO programmers (firstName, lastName, programmingLanguage)
			VALUES (
					<cfqueryparam value="#arguments.bean.getFirstName()#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.bean.getLastName()#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.bean.getProgrammingLanguage()#" cfsqltype="cf_sql_varchar" /> 
					)
		</cfquery>
		
		<cfreturn newRecord.generatedKey /> 	
	</cffunction>
	
	<!--- READ --->
	<cffunction name="getRecordByID" access="public" hint="returns a specific record from the db, filtered by the ID">
		<cfargument name="ID" access="public" hint="record ID" />
		<cfset queryResult = '' />
		<cfset objProgrammer = '' />
		
		<!--- query database by ID --->
		<cfquery name="queryResult" datasource="db_computerScience" username="mike" password="mySQL4webDev">
			SELECT ID, firstName, lastName, programmingLanguage
			FROM programmers
			WHERE ID = <cfqueryparam 
									cfsqltype="cf_sql_integer" 
									value="#arguments.ID#" />
		</cfquery>
		
		<cfif queryResult.recordCount>
			<!--- if there is a query result, create a bean  --->
			<cfset objProgrammer = createObject('component', 'programmers.logic.bean.programmerBean')
				.init(
					ID					= queryResult.ID,
					firstName			= queryResult.firstName,
					lastName			= queryResult.lastName,
					programmingLanguage	= queryResult.programmingLanguage
				)/>
		</cfif>
		
		<cfreturn objProgrammer/>
		
	</cffunction>
	
	<!--- UPDATE --->
	<cffunction name="updateRecord" 
				access="public" 
				output="false" 
				hint="update a record ">
				
		<cfargument name="bean" 
					required="true" 
					type="programmers.logic.bean.programmerBean" 
					hint="I am the programmerBean bean" />
					
			<cfset var boolSuccess	= true />
			
			<cftry>
				<cfquery name="qUpdate"
						datasource="db_computerScience"
					 	username="mike"
					 	password="mySQL4webDev">
					UPDATE programmers
					SET
						firstName 			= <cfqueryparam value="#arguments.bean.getFirstName()#" 
												cfsqltype="cf_sql_varchar" />,
						lastName			= <cfqueryparam value="#arguments.bean.getLastName()#" 
												cfsqltype="cf_sql_varchar" />,
						programmingLanguage	= <cfqueryparam value="#arguments.bean.getProgrammingLanguage()#" 
												cfsqltype="cf_sql_varchar" />
					WHERE
						ID	= <cfqueryparam 
									cfsqltype="cf_sql_integer" 
									value="#arguments.bean.getID()#" />
				</cfquery>
				
				<cfcatch type="database">
					<cfset boolSuccess = false />
				</cfcatch>
			</cftry>
		<cfreturn boolSuccess  />
	</cffunction>
	
	<!--- DELETE --->
	<cffunction name="deleteRecordByID" 
				access="public" 
				output="false" 
				returntype="boolean" 
				hint="I delete a record from the database.">
				
		<cfargument name="ID" 
					required="true" 
					type="numeric" 
					hint="ID of the record to delete." />
					
		<cfset var boolSuccess	= true />
		
		<cftry>
			<cfquery name="qDelete"
					datasource="db_computerScience"
				 	username="mike"
				 	password="mySQL4webDev">
				 	
				DELETE FROM programmers
				WHERE
					ID = <cfqueryparam 
							cfsqltype="cf_sql_integer" 
							value="#arguments.ID#" />
							
			</cfquery>
			<cfcatch type="database">
				<cfset boolSuccess = false />
			</cfcatch>
		</cftry>
				
		<cfreturn boolSuccess  />
	</cffunction>
	
</cfcomponent>