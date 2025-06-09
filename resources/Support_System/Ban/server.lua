local SupportBan = { }

addEvent("SupportSystem:BanPlayer", true)
addEventHandler("SupportSystem:BanPlayer", root,
function (playerName,Reason,Time, Type, Int)
	local toWho = getPlayerFromName(playerName)
	if toWho ~= false then
		if not getElementData(toWho, "SupportBan") then
			local duration = tonumber(Time) * tonumber(Int)
			setElementData(toWho, "SupportBan", true)
			SupportBan[toWho] = setTimer ( unBanPlayerFromSupport, duration, 1, toWho )
			setElementData(toWho, "SBanReason", Reason)
			setElementData(toWho, "SBanBy", getPlayerName(source))
			setElementData(toWho, "SBanTime", getTimeLeft(SupportBan[toWho]))
			triggerClientEvent(toWho, "SupportSystem:CloseWindow", toWho)
			--SupportBan [ getPlayerSerial ( toWho ) ] = { duration, timer }
			exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :    #FFFFFF[ "..Time.." "..Type.." #FFFFFF] بمدة قدرها #FFFFFF[ "..getPlayerName(source).." #FFFFFF] إنصك باند بواسطة #FFFFFF[ "..getPlayerName(toWho).." #FFFFFF] ان اللاعب",255,0,0)
			exports["guimessages"]:outputServer(toWho, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[#FF0000 "..Reason.." #FFFFFF] :#26FF00 السبب "..Reason.."",255,0,0)
		else
			exports["guimessages"]:outputServer(source, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FF0000 ان اللاعب مبند من قبل",255,0,0)
		end
	end
end)

addEvent("SupportSystem:unBanPlayer", true)
addEventHandler("SupportSystem:unBanPlayer", root, function(playerName)
	local toWho = getPlayerFromName(playerName)
	if toWho ~= false then
		if getElementData(toWho, "SupportBan") then
			setElementData(toWho,"SupportBan", false)
			setAccountData(getPlayerAccount(source), "PlayerBanTimer", false)
			exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[ "..getPlayerName(source).." #FFFFFF] :#00FFF7 فك باند اللاعب #FFFFFF[ "..getPlayerName(toWho).." #FFFFFF] :#00FFF7 ان اللاعب",255,0,0)
		else
			exports["guimessages"]:outputServer(source, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FF0000 هذا اللاعب ليس مبند",255,0,0)
		end
	end
end
)

addEventHandler("onPlayerLogin", getRootElement(),
function(_,account)
	local sBanTime = getAccountData(account, "PlayerBanTimer")
	if (sBanTime) then
		if ( sBanTime ~= false ) then
			setElementData(source, "SupportBan", true)
			exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#FF0000 Console #FFFFFF}#26FF00 تم صكه باند من قبل  #FFFFFF[ "..getPlayerName(source).." #FFFFFF] :#26FF00 إن اللاعب ", 255, 0, 0)
			SupportBan[source] = setTimer ( unBanPlayerFromSupport, sBanTime, 1, source )
			outputChatBox(tostring(sBanTime))
			return
		end
	end
	setElementData(source, "SupportBan", false)
end)

addEventHandler("onPlayerQuit", root,
function()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if getElementData(source, "SupportBan") then
			if isTimer(SupportBan[source]) then
				local timeLeft = getTimerDetails (SupportBan[source])
				killTimer(SupportBan[source])
				setAccountData(account, "PlayerBanTimer", timeLeft)
			end
		end
	end
end)

addEventHandler("onResourceStop", resourceRoot,
function()
	for _,v in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(v)
		if not isGuestAccount(account) then 
			if getElementData(v, "SupportBan") then
				if isTimer(SupportBan[v]) then
					local timeLeft = getTimerDetails (SupportBan[v])
					killTimer(SupportBan[v])
					setAccountData(account, "PlayerBanTimer", timeLeft)
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
			local sBanTime = getAccountData(account, "PlayerBanTimer")
			if sBanTime then
				if ( sBanTime ~= false ) then
					setElementData(v, "SupportBan", true)
					exports["guimessages"]:outputServer(root, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#FF0000 Console #FFFFFF}#26FF00 تم صكه ميوت بواسط #FFFFFF[ "..getPlayerName(v).." #FFFFFF] :#26FF00 إن اللاعب ", 255, 0, 0)
					SupportBan[v] = setTimer ( unBanPlayerFromSupport, sBanTime, 1, v )
					outputChatBox(tostring(sBanTime))
					return
				else
					setElementData(v, "SupportBan", false)
				end
			end
		setElementData(v, "SupportBan", false)
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

setTimer(function()
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "SupportBan") then
			setElementData(v, "SBanTimer", getTimeLeft(SupportBan[v]))
		end
	end
end, 1000, 0)

function unBanPlayerFromSupport( thePlayer )
	if isElement ( thePlayer ) then
		setElementData(thePlayer, "SupportBan", false)
		setAccountData(getPlayerAccount(thePlayer), "PlayerBanTimer", false)
		exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF{#26FF00 Console #FFFFFF}#26FF00 تم صكه ميوت من قبل  #FFFFFF[ "..getPlayerName(thePlayer).." #FFFFFF] :#26FF00 إن اللاعب",255,0,0)
	end
end
-------------------------#Save#-----------------------------
function playerLogin (thePreviousAccount, theCurrentAccount, autoLogin)
	local accountDataR = getAccountData (theCurrentAccount, "SBanReason") or "N/A"
	local accountDataB = getAccountData (theCurrentAccount, "SBanBy") or "N/A"
	local accountDataT = getAccountData (theCurrentAccount, "SBanTime") or "N/A"
	if (accountDataR) and (accountDataB) and (accountDataT) then
		local Reason = getAccountData(theCurrentAccount, "SBanReason")
		local Time = getAccountData(theCurrentAccount, "SBanTime")
		local By = getAccountData(theCurrentAccount, "SBanBy")
		setElementData(source,"SBanBy", tostring(By))
		setElementData(source,"SBanTime", tostring(Time))
		setElementData(source,"SBanReason", tostring(Reason))
	end
end
addEventHandler("onPlayerLogin", getRootElement(), playerLogin)

function onQuit()
	if not (isGuestAccount (getPlayerAccount (source))) then
		local account = getPlayerAccount (source)
		if (account) then
			local ElementR = getElementData (source, "SBanReason") or "N/A"
			local ElementB = getElementData (source, "SBanBy") or "N/A"
			local ElementT = getElementData (source, "SBanTime") or "N/A"
			setAccountData(account, "SBanReason", tostring(ElementR))
			setAccountData(account, "SBanBy", tostring(ElementB))
			setAccountData(account, "SBanTime", tostring(ElementT))
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), onQuit)
addEventHandler("onPlayerLogout", getRootElement(), onQuit)
--addEventHandler("onPlayerSpawn", getRootElement(), onQuit)