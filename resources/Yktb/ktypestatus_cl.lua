local showMyIcon = true
local chattingPlayers = {}
local drawDistance = 1000
local transicon = false
local chatIconFor = {}

local screenSizex, screenSizey = guiGetScreenSize()
local guix = screenSizex * 0.1
local guiy = screenSizex * 0.1
local globalscale = 1
local globalalpha = .85

addEvent("updateChatList", true )

gChatting = false
 
function chatCheckPulse()
    local chatState = isChatBoxInputActive() or isConsoleActive()
 
    if chatState ~= gChatting then
        if chatState then
            triggerServerEvent("playerChatting", getLocalPlayer())
        else
            triggerServerEvent("playerNotChatting", getLocalPlayer())
        end
        gChatting = chatState
    end
    setTimer( chatCheckPulse, 250, 1)
end

function showTextIcon()
	local playerx,playery,playerz = getElementPosition ( getLocalPlayer() )
	for player, truth in pairs(chattingPlayers) do
		
		if (player == getLocalPlayer()) then
			if(not showMyIcon) then
				return
			end
		end
	
		if(truth) then
			local chatx, chaty, chatz = getElementPosition( player )
			if(isPedInVehicle(player)) then
				chatz = chatz + .5
			end
			local dist = getDistanceBetweenPoints3D ( playerx, playery, playerz, chatx, chaty, chatz )
			if dist < drawDistance then
				if( isLineOfSightClear(playerx, playery, playerz, chatx, chaty, chatz, true, false, false, false )) then
					local screenX, screenY = getScreenFromWorldPosition ( chatx, chaty, chatz+1.2 )
					
					local scaled = screenSizex * (1/(2*(dist+5))) *.85
					local relx, rely = scaled * globalscale, scaled * globalscale
					-- -.0025 * dist+.125
					--if(dist < 1) then
					--	relx, rely = guix, guiy
					--end
					guiSetAlpha(chatIconFor[player], globalalpha)
					guiSetSize(chatIconFor[player], relx, rely, false)
					guiSetPosition(chatIconFor[player], screenX, screenY, false)
					if(screenX and screenY) then
						guiSetVisible(chatIconFor[player], true)
					end
				end
			end
		end
	end
end

function updateList(newEntry, newStatus)
	chattingPlayers[newEntry] = newStatus
	if(not chatIconFor[newEntry]) then
		chatIconFor[newEntry] = guiCreateStaticImage(0, 0, guix, guiy, "chat.png", false )
	end
	guiSetVisible(chatIconFor[newEntry], false)
end

function toggleIcon()
	outputChatBox ( "Your icon is: " )
	if( showMyIcon ) then
		showMyIcon = false
		outputChatBox ( "off", 255, 0, 0)
	else
		showMyIcon = true
		outputChatBox ( "on", 0, 255, 0)
	end
end

function resizeIcon( command, newSize )
	if(newSize) then
		local resize = tonumber( newSize )
		local percent = resize/100
		globalscale = percent
	end
	outputChatBox("Chat icons are "..(globalscale * 100).."% normal size")
end

function setIconAlpha( command, newSize )
	if(newSize) then
		globalalpha = tonumber( newSize ) / 100
	end
	outputChatBox("Chat icons are "..(globalalpha * 100).."% visible")
end

addEventHandler ( "updateChatList", getRootElement(), updateList )

addEventHandler ( "onClientResourceStart", getRootElement(), chatCheckPulse )
addEventHandler ( "onClientPlayerJoin", getRootElement(), chatCheckPulse )
addEventHandler ( "onClientRender", getRootElement(), showTextIcon )

addCommandHandler( "toggleicon", toggleIcon)
addCommandHandler( "resizeicon", resizeIcon)
addCommandHandler( "seticonvis", setIconAlpha)