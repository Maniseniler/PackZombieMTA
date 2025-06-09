--------------------------------------------------
--  PROJECT:     Anti Away From Keyboard
--  RIGHTS:      All rights reserved by developers
--  FILE:        Anti-AFK/Server.lua
--  PURPOSE:     Anti AFK
--  DEVELOPERS:  --
--------------------------------------------------

AFK_TIME = 5 -- the time that if the player didn't moved he will be AFK , in minutes .
AFK_TIMES = 1 -- afk times before the player get kicked .
SHOW,AFK_MSG = true -- show the afk message [true or false]
msgs = false -- show messages on chat box ?
-----------

checkTimer = {} 

function onResourceStart()
	startCheck()
	for i,m in ipairs ( getElementsByType("player") ) do
		if not isPedInVehicle ( m ) then
		setElementAlpha ( m, 255 )
		setElementCollisionsEnabled(m,true)
		setPlayerAfk(m,false)
		end
	end
end
addEventHandler("onResourceStart",resourceRoot,onResourceStart)

function startCheck()
	checkTimer = setTimer ( function()
		for i,m in ipairs ( getElementsByType("player") ) do
		if not isGuestAccount( getPlayerAccount( m ) ) then
			if getElementData(m, "Stats") and getElementData(m, "LegalStatus") ~= "Jailed" then return end
			if getElementDimension(m) == 999 then return end
			if getElementDimension(m) == 55 then return end
			if getElementDimension(m) == 50 then return end
			if getElementData(m, "TurfStat1") then return end
			if getElementData(m, "TurfStat2") then return end
			if getElementData(m, "Turf2Stat1") then return end
			if getElementData(m, "Turf2Stat2") then return end
			if isPedInVehicle ( m ) then return end
			local team = getPlayerTeam(m)
			if not team then return end

			local idle = getPlayerIdleTime(m)
			if tonumber(idle) >= AFK_TIME * 60 * 1000  then
				if not isPlayerAfk(m) then
					if not ( isPedDead ( m ) ) then
						if (getTeamName(getPlayerTeam( m )) ~= "Medic") then
						-- the player is afk
						triggerEvent("onPlayerAfk",m,m,idle)
						end
					end
				end
			else
				local afk = isPlayerAfk(m)
				if ( afk == true ) then
					-- the player was afk and now he is back !
					triggerEvent("onPlayerAfkBack",m,m)
				end
			end
		end
		end
	end , 1000 , 0 )
end

addEvent("onPlayerAfk",true)
addEventHandler("onPlayerAfk",root,function ( Player , Time )
	------
	if getElementData(Player, "LegalStatus") ~= "Jailed" then cancelEvent() end
	if getElementDimension(Player) == 999 then cancelEvent() end
	if getElementDimension(Player) == 55 then cancelEvent() end
	if getElementDimension(Player) == 50 then cancelEvent() end
	if getElementData(Player, "TurfStat1") then cancelEvent() end
	if getElementData(Player, "TurfStat2") then cancelEvent() end
	if getElementData(Player, "Turf2Stat1") then cancelEvent() end
	if getElementData(Player, "Turf2Stat2") then cancelEvent() end
	if isPedInVehicle ( Player ) then cancelEvent() end
	if SHOW then
		if ( tostring ( AFK_MSG ) ) then
			showAfkMessage(Player,true)
		end
	end
	------
	setPlayerAfk(Player,true)
	------
	
end )

addEvent("onPlayerAfkBack",true)
addEventHandler("onPlayerAfkBack",root,function ( Player  )
	setPlayerAfk(source,false)
	------
	showAfkMessage(source,false)
	setElementAlpha ( source, 255 )
	setElementCollisionsEnabled(source,true)
	------
end )


function isPlayerAfk(Player)
	local afk = getElementData(Player,"State-AFK") or false
	return afk
end

function setPlayerAfk(Player,state)
	setElementData(Player,"State-AFK",state or false)
end

function showAfkMessage(Player,state)
		if state == true then ev = "YouAreAFK" else ev = "YouAreNotAFK" end
		triggerClientEvent(Player,tostring(ev) or "YouAreAFK",Player)
end

function onAfkEnd(Player)
	Player = Player or source
	--
	setElementData(Player,"AFKtime",getElementData(Player,"AFKtime") + 1 )
	local afkTimes = getElementData(Player,"AFKtime")
	if ( afkTimes and afkTimes >= AFK_TIMES ) then
		setElementAlpha ( Player, 100 )
		setElementCollisionsEnabled(Player,false)
		--kickPlayer(Player,"You Have Been Afk For : "..tonumber(AFK_TIME).." Minutes")
		--if msgs then	outputChatBox("#FFFFFF [ #00BFFF"..getPlayerName(Player).."#FFFFFF ] #FF6600 Has Been kicked for being AFK #FFFFFF[ "..afkTimes.." #FFFFFF]",root,255,0,0,true)	end
	else
		setElementAlpha ( Player, 100 )
		setElementCollisionsEnabled(Player,false)
		--killPed(Player)
		--if msgs then	outputChatBox("#FFFFFF [ #00BFFF"..getPlayerName(Player).."#FFFFFF ]#FF6600 Has Been slapped for being AFK #FFFFFF[ "..afkTimes.."#FFFFFF ]",root,255,0,0,true) end
		
	end
end
addEvent("KillAFK",true)
addEventHandler("KillAFK",root,onAfkEnd)