IMPORTANT 
This is still a WIP,
This guide is prob not correct yet + code may be broken etc




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

The debug monitor is just an example, there are loads of different debug monitor examples on epoch + opendayz forums.
I will basicly ignore all requests or questions on how to make the debug monitor look different.

The debug timer code is just a countdown timer, if your server is lagging it will run slow.
U will need to setup an automatic server restart yourself.


=============
<h5>Install Instructions </h5>


<h6>Step 1</h6>
Copy dayz_server/*  to your server files

Copy mpmission/* to your mission files


<h6>Step 2</h6>
To enable the F10 button for debug monitor
There is a custom dayz_spaceInterrupt.sqf in mpmission/extras/debug_monitor

=============
If u have a custom compiles.sqf
Edit your custom compiles.sqf
Look for 
```
dayz_spaceInterrupt =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\dayz_spaceInterrupt.sqf";
```

Change it to

```
dayz_spaceInterrupt =			compile preprocessFileLineNumbers "extras\debug_monitor\dayz_spaceInterrupt.sqf";
```
=============
Or edit your mpmission/init.sqf
Look for

```
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
```

Change it to

```
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

dayz_spaceInterrupt =			compile preprocessFileLineNumbers "extras\debug_monitor\dayz_spaceInterrupt.sqf";
```
=============
<h6>Step 4</h6>
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
<h5>List of Planned Changes</h5>
Random chance of mission sites calling Patroling AI Heli for Help
Parachuting AI reinforcements