<cfcomponent displayname="programmerBean" output="false" hint="the bean programmerBean">
	
	<!--- set fields (private properties for getters/setters) --->
	<cfproperty name="ID" type="numeric" default=0 />
	<cfproperty name="firstName" type="string" default="" />
	<cfproperty name="lastName" type="string" default="" />
	<cfproperty name="programmingLanguage" type="string" default="" />
	
	<!--- pseudo constructor, create a struct that holds the variables.instance  --->
	<cfset variables.instance = {
		ID = 0,
		firstName = '',
		lastName = '',
		programmingLanguage = ''
	} />
	
	<!--- constructor method init(), holds the arguments and the initial values  --->
	<cffunction name="init" access="public" output="false" returntype="any" hint="constructor method for the object">
	<cfargument name="ID" type="numeric" required="true" default=0 />
	<cfargument name="firstName" type="string" required="true" default='' />
	<cfargument name="lastName" type="string" required="true" default='' />
	<cfargument name="programmingLanguage" type="string" required="true" default='' />
	
	<cfset setID(arguments.ID) />
	<cfset setFirstName(arguments.firstName) />
	<cfset setLastName(arguments.lastName) />
	<cfset setProgrammingLanguage(arguments.programmingLanguage) />
	
	<cfreturn this />
		
	</cffunction>
	
	<!--- getters/accessors --->
	<cffunction name="getID" access="public" output="false" hint="returns the ID">
		<cfreturn variables.instance.ID />
	</cffunction>
	
	<cffunction name="getFirstName" access="public" output="false" hint="returns the first name">
		<cfreturn variables.instance.firstName />
	</cffunction>
	
	<cffunction name="getLastName" access="public" output="false" hint="returns the last name">
		<cfreturn variables.instance.lastName />
	</cffunction>
	
	<cffunction name="getProgrammingLanguage" access="public" output="false" hint="returns the programming language">
		<cfreturn variables.instance.ProgrammingLanguage />
	</cffunction>
	
	<!--- setters/mutators --->
	<cffunction name="setID" access="public" output="false" hint="note that auto-increment is set and therefore no ID can be set manually">
		<cfargument name="ID" type="numeric" required="true" hint="sets the ID" />
		<cfset variables.instance.ID = arguments.ID />
	</cffunction>
	
	<cffunction name="setFirstName" access="public" output="false" hint="sets the first name">
		<cfargument name="firstName" type="string" required="true" hint="first name" />
		<cfset variables.instance.firstName = arguments.firstName />
	</cffunction>
	
	<cffunction name="setLastName" access="public" output="false" hint="sets the last name">
		<cfargument name="lastName" type="string" required="true" hint="last name" />
		<cfset variables.instance.lastName = arguments.lastName />
	</cffunction>
		
	<cffunction name="setProgrammingLanguage" access="public" output="false" hint="sets the programming language">
		<cfargument name="programmingLanguage" type="string" required="true" hint="last name" />
		<cfset variables.instance.programmingLanguage = arguments.programmingLanguage />
	</cffunction>
	
	<!--- optional utiliy function --->
	<cffunction name="getMemento" access="public" output="false" hint="returns the variables.instance">
		<cfreturn variables.instance />
	</cffunction>
	
</cfcomponent>
