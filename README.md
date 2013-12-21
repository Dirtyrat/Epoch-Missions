Mission System for DayZ Epoch (by Torndeco)
=============
Original code by <a href="https://github.com/lazyink/DayZ-Missions">Lazyink</a>, <a href="https://github.com/theszerdi">TheSzerdi</a>, Falcyn and TAW_Tonic.


=============
<h5>Requirements </h5>

Epoch Server (doh!)
DZAI @ https://github.com/dayzai/DayZBanditAI
DZAI Support @ http://opendayz.net/forums/DZAI/
If u already have Sarge Installed on your Server.


=============
<h5>Install Notes Before u Start</h5>
dayz_server/   Refers to your dayz_server.pbo
mpmission/     Refers to your mission.pbo

This guide assumes u already know how to extract your pbo etcs.

The debug monitor is just an example, 
There are loads of different debug monitor examples on epoch + opendayz forums.
I will basicly ignore all requests or questions on how to make the debug monitor look different.

The debug timer code is just a countdown timer, if your server is running slow, the counter will run slow.
U will need to setup an automatic server restart yourself.


=============
<h5>Install Instructions </h5>


<h6>Step 1</h6>
Copy dayz_server/*  to your server files

Copy mpmission/* to your mission files


=============
<h6>Step 2</h6>

Edit your mpmission/init.sqf
Look for

```
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
```

Change it to

```
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

// Missions
dayz_spaceInterrupt = compile preprocessFileLineNumbers "extras\debug_monitor\dayz_spaceInterrupt.sqf";
execVM "addons\Missions\init.sqf";
```

=============
<h6>Step 3</h6>
Edit your dayz_server/compile/server_playerSetup.sqf

Look for @ End of file

```
PVDZE_plr_Login = nil;
PVDZE_plr_Login2 = nil;
```

Change to 
```
call mission_sync_markers;

PVDZE_plr_Login = nil;
PVDZE_plr_Login2 = nil;
```


=============
<h6>Step 4</h6>

Edit dayz_server\DZAI\spawn_functions\spawn_heliPatrol.sqf

Look for 

```
DZAI_curHeliPatrols = DZAI_curHeliPatrols + 1;
```

Change to 

```
DZAI_curHeliPatrols = DZAI_curHeliPatrols + 1;
mission_dzai_heli_array set [count mission_dzai_heli_array, [_helicopter, _unitGroup, 0]];
```


=============
<h6>How to disable the custom debug monitor</h6>
Apparently there is alot of people that don't like the mission info in debug monitor.
U are all nuts, but anyways...

Edit the dayz_server\addons\Missions\config.sqf
```
mission_warning_debug = false;
```

Edit your mpmission\init.sqf

Remove the line
```
dayz_spaceInterrupt = compile preprocessFileLineNumbers "extras\debug_monitor\dayz_spaceInterrupt.sqf";
```

Optional u can delete the entire directory
mpmission\extras\debug_monitor


=============
<h6>To use your own debug monitor</h6>

Look @ mpmission\extras\debug_monitor\debug_monitor.sqf

The important variables for the debug monitor are
customMission added to the debug text...
%1 = customMissionImage
%2 = "extras\debug_monitor\pirates.paa"


Edit addons\Missions\init.sqf
Remove the line (this is the line that spawns the supplied debug monitor code)
```
[] execVM "extras\debug_monitor\debug_monitor.sqf";
```


=============
<h5>List of Planned Changes</h5>
Random chance of mission sites calling Patroling AI Heli for Help
Parachuting AI reinforcements