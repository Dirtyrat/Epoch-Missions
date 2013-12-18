if (isServer) then {
	// Mission System
		// Mission
	[] execVM "\z\addons\dayz_server\addons\Missions\mission_deamon.sqf";
};

if (!isDedicated) then {
	// Custom Debug
	[] execVM "extras\debug_monitor\debug_monitor.sqf";
	
	// PublicEH for Mission Updates
	"customMissionWarning" addPublicVariableEventHandler {_this select 1 execVM "addons\Missions\mission_warning.sqf"};
};