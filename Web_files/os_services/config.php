<?php

////////////////////////////////
/// Common database settings ///
////////////////////////////////

    $dbName = "os_services";
	
	// The default value for this bundle is "os_services", but you can change this to whatever suits your needs.
	
	
    $dbHost = "localhost";
	
	// The default value for MOST situations is "localhost" (unless your database is hosted remotely).  You probably don't need to change this.
	
	
    $dbUser = "<database_user>";
	
	// "opensim" is the default username defined in your OpenSim .ini files, but if you want to assign a different user, enter that info here.
	
	
    $dbPassword	= "<database_password>";
	
	// Enter the password required by the user listed above to access you OpenSim database(s).
	
	
	$dbPort = 3306;
	
	// DON'T change unless you use a different mysql port (3306 is default on MOST systems)
	

//////////////////////////////////
/// Additional GROUPS settings ///
//////////////////////////////////

    // Group security //
	
	$groupWriteKey = '';
	$groupReadKey  = '';
	
	// A xmlrpc client must have this key to commit changes to the Groups DB.  Leave blank to allow all clients to make changes.


    $debugXMLRPC = 0;
    $debugXMLRPCFile = "xmlrpc.log";
	
	// Set to 0 for no debugging, 1 for essential debugging, 2 for more information.
	
	
// The rest of these can be left as is unless you need additional layers of security.
// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
	

	$groupRequireAgentAuthForWrite = FALSE;
	
	// Enabling this, will require that the service attempt to verify the agent is authentic by contacting the User Service specified in the request to authenticate the AgentID and SessionID provided.
	

	$groupEnforceGroupPerms = FALSE;
	
	// This enforces the role Permissions bitmask.
	

	$overrideAgentUserService = '';
	
	// Specify the following to hard-code / lockdown the User Service used to authenticate user sessions.  Example: http://osgrid.org:8002
	
    // Note:  This causes the User Service specified with requests to be ignored, and prevents the service from being used cross-grid or by hypergridded users.
	
		
	$membersVisibleTo = 'Group'; // Anyone in the group can see members
    // $membersVisibleTo = 'Owners'; // Only members of the owners role can see members
    // $membersVisibleTo = 'All'; // Anyone can see members

    // This setting configures the behavior of the "Members are Visible" checkbox provided for on the Role configuration panel -- and determines who is allowed to get a list of members for a role when that checkbox is *NOT* checked.
	
?>
