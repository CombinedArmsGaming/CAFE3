params [ "_veh" ];

if ( !isNull _veh ) then
{
	_veh setVehiclePosition [(getpos _veh), [], 6, "NONE"];
};
