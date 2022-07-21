# Epoch-Objects-Exporter
A simple script you can run using BigEgg's Epoch Antihack/Admin Tools or via server to export map objects into your rpt file

## Example Video
The video is a great example of how to use the script. You should watch it!

Video: https://youtu.be/T1zkQsmxTJo

## Purpose:
* Export map objects into your server rpt file
    * Either so you can move the objects using the `local _center = ` at the top of the exported rpt section
    * or to save the objects as a file rather than saving them to the SQL database.

## Config
This is your config:
~~~
local _centerATL = [4400,9000,15];
local _radius = 20;
local _PosTypeASL = false;
local _getVector = true;
local _partsToExportArray = [];
//DO NOT CHANGE ANYTHING BELOW THIS LINE
~~~

`_centerATL` is the center of the area you want to export.

`_radius` is the radius of the area you want to export.

`_PosTypeASL` is a bool value (true/false) that determines if you want to export the objects in ASL or ATL. ASL means Z height relative to sea level, ATL means Z height relative to the ground. See https://community.bistudio.com/wiki/Position#PositionAGL:~:text=Render%20Time%20Scope-,Types,-A%20comparison%20of for more info. In short, if you are working over water, you want to use ASL. If you are working on land or on a beach shore, you want to use ATL.

`_getVector` is a bool value (true/false) that determines if you want to export the objects in vector format or not. You can leave it as true, as it will only only use the vector format if the object has been vectored already.

`_partsToExportArray` is an array of strings that determines which parts you want to export. You can leave it as empty, as it will export all parts possible. You could also set it to `local _partsToExportArray = DayZ_SafeObjects;` if you just wanted base parts. Remember that if you use a variable like DayZ_SafeObjects, it has to be a variable that the server can read, not a variable in the `if (!isDedicated)` block. For example; `DZE_maintainClasses` would not work unless you run this script via the client rather than the server.

Hey now, that's a good point. Why are we running this all on the server and not the client? Well, to start, the server has more accurate positions than the client. If this is ran on the client, farther objects will be exported slightly off their true position. Secondly, if you ran this on the client, you would have to allow a lot of battleye exceptions so that the player doesn't get kicked.

## Instructions:
* Run the script on the server via SQF Injector after setting your config.
* Go to your server RPT file, and copy the exported section.
* Create a new sqf file in your dayz_server folder, and paste the copied section into it.
    * You can name it whatever you want.
    * You can also (and probably should) put it in a folder, if you want.
* Remove the timestamps from the copied section. (see video on how I did this).
* Change the `local _center = ` to the new location.
   * At this point you may want to copy the contents of your new file and paste it into the SQF injector to make sure it works as you expect (like how I did it in the video).
* Call that file from server_functions.sqf.

## What this doesn't do:
* It doesn't export the objects into the SQL database.
* It doesn't remove the objects from the SQL database for you, if you want to move them instead of copying them.
* It doesn't export the objects into a file, you need to copy and paste from the rpt it into a file yourself.
* It doesn't allow you to rotate objects.
    * It would be really cool if you could rotate objects, but I don't know how to do that. That's because this is using a center point to spawn the objects, so if you turned them all 45 degrees then you would have a big, ugly problem.


## Version History:
* v1.0: Initial Release. Exports to the server rpt file using BigEgg's Epoch Antihack/Admin Tools SQF Injector.