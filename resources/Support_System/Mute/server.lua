local SupportMute = { }

addEvent("SupportSystem:MutePlayer", true)
addEventHandler("SupportSystem:MutePlayer", root,
function (playerName,Reason,Time, Type, Int)
	local toWho = getPlayerFromName(playerName)
	if toWho ~= false then
		if not getElementData(toWho, "SupportMute") then
			local duration = tonumber(Time) * tonumber(Int)
			setElementData(toWho, "SupportMute", true)
			SupportMute[toWho] = setTimer ( unMutePlayerFromSupport, duration, 1, toWho )
			setElementData(toWho, "SMuteReason", Reason)
			setElementData(toWho, "SMuteBy", getPlayerName(source))
			setElementData(toWho, "SMuteTime", getTimeLeft(SupportMute[toWho]))
			--SupportMute [ getPlayerSerial ( toWho ) ] = { duration, timer }
			exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :   #FFFFFF[ "..Time.." "..Type.." #FFFFFF] بمدة قدرها #FFFFFF[ "..getPlayerName(source).." #FFFFFF] إنصك ميوت بواسطة #FFFFFF[ "..getPlayerName(toWho).." #FFFFFF] ان اللاعب",255,0,0,true)
			exports["guimessages"]:outputServer(toWho, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[#FF0000 "..Reason.." #FFFFFF] :#26FF00 السبب ",255,0,0,true)
		else
			exports["guimessages"]:outputServer(source, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FF0000 هذا اللاعب مصكوك ميوت من قبل",255,0,0,true)
		end
	end
end)

addEvent("SupportSystem:unMutePlayer", true)
addEventHandler("SupportSystem:unMutePlayer", root, function(playerName)
	local toWho = getPlayerFromName(playerName)
	if toWho ~= false then
		if getElementData(toWho, "SupportMute") then
			setElementData(toWho,"SupportMute", false)
			setPlayerMuted(toWho, false)
			setAccountData(getPlayerAccount(source), "PlayerMuteTimer", false)
			exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[ "..getPlayerName(source).." #FFFFFF] :#00FFF7 فك ميوت اللاعب #FFFFFF[ "..getPlayerName(toWho).." #FFFFFF] :#00FFF7 ان اللاعب",255,0,0,true)
		else
			exports["guimessages"]:outputServer(source, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FF0000 هذا اللاعب ليس مصكوك",255,0,0,true)
		end
	end
end
)

addEventHandler("onPlayerLogin", getRootElement(),
function(_,account)
	local sMuteTime = getAccountData(account, "PlayerMuteTimer")
	if (sMuteTime) then
		if ( sMuteTime ~= false ) then
			setElementData(source, "SupportMute", true)
			exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#FF0000 Console #FFFFFF}#26FF00 تم صكه ميوت من قبل  #FFFFFF[ "..getPlayerName(source).." #FFFFFF] :#26FF00 إن اللاعب ", 255, 0, 0,true)
			SupportMute[source] = setTimer ( unMutePlayerFromSupport, sMuteTime, 1, source )
			outputChatBox(tostring(sMuteTime))
			return
		end
	end
	setElementData(source, "SupportMute", false)
end)

addEventHandler("onPlayerQuit", root,
function()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if getElementData(source, "SupportMute") then
			if isTimer(SupportMute[source]) then
				local timeLeft = getTimerDetails (SupportMute[source])
				killTimer(SupportMute[source])
				setAccountData(account, "PlayerMuteTimer", timeLeft)
			end
		end
	end
end)

addEventHandler("onResourceStop", resourceRoot,
function()
	for _,v in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(v)
		if not isGuestAccount(account) then 
			if getElementData(v, "SupportMute") then
				if isTimer(SupportMute[v]) then
					local timeLeft = getTimerDetails (SupportMute[v])
					killTimer(SupportMute[v])
					setAccountData(account, "PlayerMuteTimer", timeLeft)
				end
			end
		end
	end
end)

addEventHandler("onResourceStart", resourceRoot,
function()
	for _,v in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(v)
		if not isGuestAccount(account) then
			local sMuteTime = getAccountData(account, "PlayerMuteTimer")
			if sMuteTime then
				if ( sMuteTime ~= false ) then
					setElementData(v, "SupportMute", true)
					exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#FF0000 Console #FFFFFF}#26FF00 تم صكه ميوت بواسط #FFFFFF[ "..getPlayerName(v).." #FFFFFF] :#26FF00 إن اللاعب ", 255, 0, 0)
					SupportMute[v] = setTimer ( unMutePlayerFromSupport, sMuteTime, 1, v )
					outputChatBox(tostring(sMuteTime))
					return
				else
					setElementData(v, "SupportMute", false)
					exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :  #FFFFFF{#FF0000 Console #FFFFFF}#26FF00 تم صكه ميوت بواسط #FFFFFF[ "..getPlayerName(v).." #FFFFFF] :#26FF00 إن اللاعب ", 255, 0, 0)
				end
			end
		setElementData(v, "SupportMute", false)
		end
	end
end)

function getTimeLeft(Timer)
local ms = getTimerDetails(Timer)
local m = math.floor(ms/60000)
local s = math.floor((ms-m*60000)/1000)
if m < 10 then m = ""..m end
if s < 10 then s = ""..s end
return ""..m.." Minutes and "..s.." Seconds"
end


addCommandHandler("mutetime",
function(plr)
	if getElementData(plr, "SupportMute") == true then
		if isTimer(SupportMute[plr]) then
			local timeLeft = getTimerDetails (SupportMute[plr])
			outputChatBox("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[ #26FF00"..getTimeLeft(SupportMute[plr]).." #FFFFFF] :#00FFF7 الوقت المتبقي حتى يتم فك ميوتك هو ", plr, 255, 0, 0, true)
		end
	end
end)


setTimer(function()
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "SupportMute") then
			setElementData(v, "SMuteTimer", getTimeLeft(SupportMute[v]))
		end
	end
end, 1000, 0)

function unMutePlayerFromSupport( thePlayer )
	if isElement ( thePlayer ) then
		setElementData(thePlayer, "SupportMute", false)
		setAccountData(getPlayerAccount(thePlayer), "PlayerMuteTimer", false)
		exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#26FF00 Console #FFFFFF}#26FF00 تم صكه ميوت من قبل  #FFFFFF[ "..getPlayerName(thePlayer).." #FFFFFF] :#26FF00 إن اللاعب",255,0,0)
	end
end
-------------------------#Save#-----------------------------
function playerLogin (thePreviousAccount, theCurrentAccount, autoLogin)
	local accountDataR = getAccountData (theCurrentAccount, "SMuteReason") or "N/A"
	local accountDataB = getAccountData (theCurrentAccount, "SMuteBy") or "N/A"
	local accountDataT = getAccountData (theCurrentAccount, "SMuteTime") or "N/A"
	if (accountDataR) and (accountDataB) and (accountDataT) then
		local Reason = getAccountData(theCurrentAccount, "SMuteReason")
		local Time = getAccountData(theCurrentAccount, "SMuteTime")
		local By = getAccountData(theCurrentAccount, "SMuteBy")
		setElementData(source,"SMuteBy", tostring(By))
		setElementData(source,"SMuteTime", tostring(Time))
		setElementData(source,"SMuteReason", tostring(Reason))
	end
end
addEventHandler("onPlayerLogin", getRootElement(), playerLogin)

function onQuit()
	if not (isGuestAccount (getPlayerAccount (source))) then
		local account = getPlayerAccount (source)
		if (account) then
			local ElementR = getElementData (source, "SMuteReason") or "N/A"
			local ElementB = getElementData (source, "SMuteBy") or "N/A"
			local ElementT = getElementData (source, "SMuteTime") or "N/A"
			setAccountData(account, "SMuteReason", tostring(ElementR))
			setAccountData(account, "SMuteBy", tostring(ElementB))
			setAccountData(account, "SMuteTime", tostring(ElementT))
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), onQuit)
addEventHandler("onPlayerLogout", getRootElement(), onQuit)
--addEventHandler("onPlayerSpawn", getRootElement(), onQuit)