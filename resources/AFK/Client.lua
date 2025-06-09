outputChatBox("#FF9900 * #00B7FFAFK System By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
--------------------------------------------------
--  PROJECT:     Anti Away From Keyboard
--  RIGHTS:      All rights reserved by Mani
--  FILE:        Anti-AFK/Client.lua
--  PURPOSE:     Anti AFK
--------------------------------------------------

-------------- CHANGEABLE
NumToCount = 10 -- the number to count before the player get killed / kicked
MSGtoShow = "Welcome To Server" -- the Message to show
CountSpeed = 1000 -- less number will be faster.
-------------- UNCHANGEABLE
rRoot = getResourceRootElement(getThisResource()) -- Resource Root ,,
setElementData(getLocalPlayer(),"AFKtime",0) -- Rest AFK Times For Player
setElementData(localPlayer,"State-AFK",false)
--- DX ---
sw, sh = guiGetScreenSize() -- Get The Screen Size
x,y = sw/2,sh/2 -- Using Math to Set The Text in center

addEvent("YouAreAFK",true) -- AFK Message Event
addEventHandler("YouAreAFK",root, -- AFK Message Event Handler
function() -- AFK Message Function
	function You() -- AFK Message Function

dxDrawText(  MSGtoShow, x-700,y-497,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)
dxDrawText( MSGtoShow, x-700,y-500,sw,sh,tocolor ( 255, 255, 0, 255 ), 1, "pricedown","center", "center", false, false, false)

	end -- END of AFK Message Function
addEventHandler ( "onClientRender",root,You) -- AFK Message Event Handler
Count() -- Kill Player Counting Trigger
end )

-----------------

local screenWidth, screenHeight = guiGetScreenSize() 
local screenX , screenY = guiGetScreenSize ( )

function dxDrawFramedText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left + 1 , top + 1 , width + 1 , height + 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left + 1 , top - 1 , width + 1 , height - 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top + 1 , width - 1 , height + 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top - 1 , width - 1 , height - 1 , tocolor ( 0 , 0 , 0 , 255 ) , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI )
end

local tag = dxCreateTexture("afk.png")
 
addEventHandler("onClientPreRender", root,
function()
	for i, player in ipairs ( getElementsByType ( "player" ) ) do
		if ( getElementData ( player, "State-AFK" ) == true ) then
			local x, y, z = getPedBonePosition(player, 5)
			dxDrawMaterialLine3D(x, y, z+1.2, x, y, z+0.6, tag, 0.7, tocolor(255,255,255,100))
		end
	end
end
)

----------------------------------

function Count()-- Counting
-- Count --
		local n = NumToCount -- Count Number
		local count = ""..n.."" -- Count Number
		local x,y = sw/2,sh/2 -- Center Text

		function txt()
			dxDrawText(" You will Be [AFK] After { "..count.." }", x-700,y-292,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false) -- Counting DX
			dxDrawText(" You will Be [AFK] After  {"..count.." }", x-700,y-295,sw,sh,tocolor ( 255, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)-- Counting DX
			
			dxDrawText("[ Move To Cancel ]", x-700,y-241,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)-- Text DX
			dxDrawText("[ Move To Cancel ]", x-700,y-243,sw,sh,tocolor ( 255, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)-- Text DX
		end
		
		addEventHandler ( "onClientRender" , root ,txt)-- Adding DX Event Handler
		
	timer =	setTimer ( -- Count 
			function()-- Count 
				n = n - 1 -- Count 
				count = ""..n.."" -- Count 
				playSoundFrontEnd ( 20 )-- Play Sound On Count 
			if n == 0 then -- on Count END
					triggerServerEvent ("KillAFK", getLocalPlayer()) -- Triggers Killing Function
					playSoundFrontEnd ( 101 ) -- Play SOund on Count END
					removeEventHandler ( "onClientRender" , root ,txt) -- Remove DX Text's After Count END
					removeEventHandler ( "onClientRender",root,You)-- Remove DX Text's After Count END
				end
			end
		, CountSpeed , NumToCount ) -- End Of Count Timer
		
--- Count---
end	

addEvent("YouAreNotAFK",true) -- Removing Message Event
addEventHandler("YouAreNotAFK",root,-- Removing Message Event
function()-- Removing Message Function
removeEventHandler ( "onClientRender",root,You)-- Removing Message 1
removeEventHandler ( "onClientRender" , root ,txt)-- Removing Message 2
	if isTimer(timer) then
		killTimer(timer)-- Killing The Timer=
	end
end ) -- END of Removing Message Event

--- DX ---	
addEventHandler ( "onClientKey", getRootElement(), 
function()
	if getElementAlpha ( localPlayer ) == 100 then
	triggerServerEvent ("onPlayerAfkBack", getLocalPlayer())
	end
end
)
