safecol = createColCuboid ( 791.0283203125, -2168.658203125, 12.955365180969, 255, 380, 255 )
safeZoneRadar = createRadarArea ( 791.0283203125, -2168.658203125, 100, 300, 0, 0, 0, 100)
setElementData (safeZoneRadar, "zombieProof", true)

safecolCLO = createColCuboid ( 1397.4267578125, -1835.6611328125, 18.795755386353, 170, 140, 255 )
safeZoneRadarCLO = createRadarArea ( 1397.4267578125, -1835.6611328125, 170, 140, 2, 94, 0, 80)
setElementData (safeZoneRadarCLO, "zombieProof", true)


safecolCivil = createColCuboid ( -1748.6064453125, 1059.7724609375 ,7.1048574447632, 100, 90, 255 )
safeZoneRadarCivil = createRadarArea ( -1748.6064453125, 1059.7724609375 ,250, 230, 2, 94, 0, 80)
setElementData (safeZoneRadarCivil, "zombieProof", true)

safecolswat = createColCuboid ( 136.28755,-1967.44556,3.77344, 100, 100, 100)
safeZoneRadarsasship = createRadarArea ( 136.28755,-1967.44556, 50, 110, 0, 0, 0, 100)
setElementData (safeZoneRadarswat, "zombieProof", true)


safecolbay = createColCuboid (  -2194.373046875, -296.501953125, 35.33324432373, 500, 380, 255 )
safeZoneRadarbay = createRadarArea ( -2194.373046875, -296.501953125, 250, 240, 255, 255, 120, 100)
setElementData (safeZoneRadarbay, "zombieProof", true)

safecolusms = createColCuboid ( -2546, -730, 10.81, 100, 150, 255 )
safeZoneRadarCivil = createRadarArea ( -2546, -730, 100, 150, 2, 94, 0, 80)
setElementData (safeZoneRadarusms, "zombieProof", true)

safecolcamp = createColCuboid ( 2074, -156, 10.81, 520, 440, 255 )
safeZoneRadarcamp = createRadarArea ( 2074, -156, 520, 440, 255, 255, 120, 100)
setElementData (safeZoneRadarcamp, "zombieProof", true)

safecolarmy = createColCuboid ( 200, 1851, 10.81, 30, 25, 255 )
safeZoneRadararmy = createRadarArea ( 200, 1851, 30, 25, 255, 0, 0, 0)
setElementData (safeZoneRadararmy, "zombieProof", true)

safecolmarine = createColCuboid ( -1472, 457, 17.640625, 255, 100, 255 )
safeZoneRadarmarine = createRadarArea ( -1472, 457, 255, 100, 2, 94, 0, 80)
setElementData (safeZoneRadarmarine, "zombieProof", true)

safecolcia = createColCuboid ( 299.3515625, -1396.26953125, 53.086242675781, 110, 110, 255 )
safeZoneRadarcia = createRadarArea ( 299.3515625, -1396.26953125, 150, 150,  0, 0, 0, 100)
setElementData (safeZoneRadarcia, "zombieProof", true)

safecolbeach = createColCuboid ( 125, -2133, 17.640625, 900, 500, 255 )
safeZoneRadarbeach = createRadarArea ( 125, -2133, 900, 500,  90, 0, 74, 0)
setElementData (safeZoneRadarbeach, "zombieProof", true)

safecol = createColCuboid ( 2449.13745, -1687.83533, 13.52159, 255, 380, 255 )
safeZoneRadar = createRadarArea ( 2449.13745, -1687.83533, 100, 80, 0, 0, 0, 100)
setElementData (safeZoneRadar, "zombieProof", true)

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecol, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
	killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecol, leaveZone )




function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolCLO, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolCLO, leaveZone )



function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolPolice, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolPolice, leaveZone )


function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolCivil, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolCivil, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolbay, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolbay, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolswat, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolswat, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolcrime, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolcrime, leaveZone )


function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolusms, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolusms, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolcamp, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolcamp, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
   if skin == 310 then
           outputChatBox ("You was killed by the Army Guards", hitPlayer, 220, 0, 0)
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolarmy, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
 if skin == 310 then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolarmy, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolmarine, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
  killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolmarine, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolcia, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)    
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
		killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolcia, leaveZone )

function enterZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
             killPed (hitPlayer)

       else
	end
end
addEventHandler( "onColShapeHit", safecolbeach, enterZone )

function leaveZone(hitPlayer,thePlayer)
local skin = getElementModel (hitPlayer)    
if (skin == 13 or  skin == 22 or skin == 56 or skin == 67 or skin == 68 or skin == 69 or skin == 75 or skin == 77 or skin == 84 or skin == 92 or skin == 95 or skin == 97 or skin == 105 or skin == 107 or skin == 108 or skin == 126 or skin == 127 or skin == 128 or skin == 152 or skin == 162 or skin == 167 or skin == 188 or skin == 195 or skin == 206 or skin == 209 or skin == 212 or skin == 213 or skin == 229 or skin == 230 or skin == 258 or skin == 264 or skin == 274 or skin == 277) then
		killPed (hitPlayer)
end
end
addEventHandler( "onColShapeLeave", safecolbeach, leaveZone )
