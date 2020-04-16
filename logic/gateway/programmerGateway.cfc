<cfcomponent displayname="programmerGateway" output="false" hint="programmerGateway Gateway Class">
	
	<!--- PUBLIC METHODS --->
	<cffunction name="getAllRecords" access="public" output="false" hint="returns all records">
		<cfset qAllRecords = '' />
		<!--- SELECT Query --->
		<cfquery name="qAllRecords" datasource="db_computerScience" username="mike" password="mySQL4webDev">
			SELECT ID, firstName, lastName, programmingLanguage
			FROM programmers
		</cfquery>
		<cfreturn qAllRecords />
	</cffunction>
	
	<cffunction name="getRecordsByLanguage" access="public" output="false" hint="filters records based on provided argument for programming language">
		<cfargument name="programmingLanguage" required="true" type="string" hint="filters all records by provided search parameter for last name" />
		<cfset qRecordsByLanguage = '' />
		<!--- SELECT Query --->
		<cfquery name="qRecordsByLanguage" datasource="db_computerScience" username="mike" password="mySQL4webDev">
			SELECT firstName, lastName, programmingLanguage
			FROM programmers
			WHERE programmingLanguage LIKE <cfqueryparam value="#arguments.programmingLanguage#%" cfsqltype="cf_sql_varchar" />
			
		</cfquery>
		<cfreturn qRecordsByLanguage />
	</cffunction>
	
</cfcomponent>