local _centerATL = [6294.94,7847.88,5.00143433];
local _radius = 20;
local _PosTypeASL = false;
local _getVector = true;
local _partsToExportArray = [];



local _objects = nearestObjects [_centerATL, _partsToExportArray, _radius];
local _count = 0;
diag_log "-----EXPORTING OBJECTS-----";
diag_log text format ["local _center = %1;", _centerATL];
diag_log text format ["local _z_adjustment = %1;", 0];
{
if (!((typeOf _x) in ["WeaponHolder_ItemCrowbar","Crow","WeaponHolder","FxWindPollen1","FXCrWindLeaf1","FXCrWindLeaf2","FXCrWindLeaf3","Rubbish4","Rubbish3","Rubbish2","Rubbish1","FxWindRock1","Mosquito","FxWindGrass2","FxWindGrass1"]) && !(_x isKindOf "Man") && typeOf _x != '') then {
	local _name = typeOf _x;
	local _posATL = getPosATL _x;
    local _pos = _posATL;
    if (_PosTypeASL) then {
	    _pos = getPosASL _x;
    };
    local _vector = [(vectorDir _x),(vectorUp _x)];
	local _dir = getDir _x;
	diag_log text format ["_vehicle_%1 = objNull;",_count];
	diag_log text format ["if (true) then {"];
	diag_log text format ["_this = createVehicle ['%1', _center, [], 0, 'CAN_COLLIDE'];",_name];
	diag_log text format ["_vehicle_%1 = _this;",_count];
	diag_log text format ["_this setPos%1 %2;",if (_PosTypeASL) then {"ASL"} else {"ATL"},format ["[((_center select 0) + (%2)),((_center select 1) + (%4)), %5]",(_centerATL select 0),((_pos select 0) - (_centerATL select 0)),(_centerATL select 1),((_pos select 1) - (_centerATL select 1)),format ["(%1) + (_z_adjustment)", (_pos select 2)]]];
    if (_getVector && (str(_vector select 1) != "[0,0,1]")) then {
        diag_log text format ["_this setVectorDirAndUp %1;",_vector];
    } else {
	    diag_log text format ["_this setDir %1;",_dir];
    };
	diag_log text format ["};"];
	_count = _count + 1;
};
} forEach _objects;
diag_log "-----DONE EXPORTING OBJECTS-----";
