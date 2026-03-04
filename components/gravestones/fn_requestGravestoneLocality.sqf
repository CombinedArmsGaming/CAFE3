/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Processes a locality transfer request for the specified gravestone object.
		If the gravestone object is still local to the server, the requesting client is granted locality. Otherwise,
		no action is performed.

		This function can only be executed on the server.
	Arguments:
		0:  <BOOLEAN>   The gravestone object to transfer
		1:  <NUMBER>    The requesting client's owner ID
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

params [
	["_obj", objNull, [objNull]],
	["_clientID", -1, [-1]]
];

if (!isServer or {!local _obj} or {_clientID <= 2}) exitWith {};





// Transfer ownership to the requesting client.
// The locality flag used in client checks is updated via the "Local" EH defined
// in fn_createGravestoneAndDeleteCorpse, so we don't need to do that here.
_obj setOwner _clientID;
