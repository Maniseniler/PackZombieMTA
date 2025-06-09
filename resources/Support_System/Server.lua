--#Server Functions :
local Groups = { "Support","Console"}

function isPlayerStaff(player)
	if not isGuestAccount(getPlayerAccount(player)) then
		for k,v in ipairs ( Groups ) do
			if ( isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(player)), aclGetGroup(v)) ) then
				return true
			end
		end
	end
end

function sendServerMessage(player, message)
	exports.guimessages:outputServer(player, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : "..message, 255, 0, 0)
	outputChatBox("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : "..message, root, 255, 255, 255, true)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--#Support History :
addEventHandler("onResourceStart", resourceRoot, 
function()
	db = dbConnect("sqlite", "history.db")
	dbExec(db, "CREATE TABLE IF NOT EXISTS Support_Histroylog(Time, Action, R, G, B)")
end
)

function sendMessageToLogs(Message, r, g, b)
	if Message and type(Message) == "string" then
		if not r then r = 255 end
		if not g then g = 0 end
		if not b then b = 0 end
		local Realtime = getRealTime()
		local year = Realtime.year + 1900
		local month = Realtime.month + 1
		local day = Realtime.monthday
		local hour = Realtime.hour
		local Min = Realtime.minute
		local sec = Realtime.second
		dbExec(db, "INSERT INTO Support_Histroylog VALUES(?, ?, ?, ?, ?)", "["..year.."/"..month.."/"..day.."|"..hour..":"..Min.."]", Message, r, g, b)
	end
end

function getSupportLogs()
	local Query = dbQuery(db, "SELECT * FROM Support_Histroylog")
	local result = dbPoll(Query, -1)
	return result
end

addEvent("SupportSystem:RequestLogs", true)
addEventHandler("SupportSystem:RequestLogs", root, 
function ()
	local Log = getSupportLogs()
	triggerClientEvent(source, "SupportSystem:sendLogs", source, Log)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
addEvent("SupportSystem:setPlayerStat", true)
addEventHandler("SupportSystem:setPlayerStat", root, 
function(stat)
	setElementData(source, "stat", stat)
end
)

addEvent("SupportSystem:adminSetStat", true)
addEventHandler("SupportSystem:adminSetStat", root, 
function(player, Stat)
	setElementData(player, "stat", Stat)
	sendServerMessage(player, "#00ff00"..getPlayerName(source).." has changed your support states to #ff0000"..Stat)
	sendServerMessage(player, "#00ff00"..getPlayerName(player).." states changed to #ff0000"..Stat)
	sendMessageToLogs(getPlayerName(source).." changed "..getPlayerName(player).." support states to "..Stat)
end)

addEvent("SupportSystem:CheakIsAdmin", true)
addEventHandler("SupportSystem:CheakIsAdmin", root,
function()
	if isPlayerStaff(source) then
		triggerClientEvent(source, "SupportSystem:PlayerIsAnAdmin", source)
	end
end
)

addEvent("SupportSystem:RequestClearTheChat", true)
addEventHandler("SupportSystem:RequestClearTheChat", root,
function()
	if isPlayerStaff(source) then
		triggerClientEvent(root, "SupportSystem:ClearSupportChat", source)
		sendServerMessage(root, "#ff0000"..getPlayerName(source).." has cleared the support chat !")
		sendMessageToLogs(getPlayerName(source).." has clear the chat !", 0, 221, 204)
	end
end)

addEvent("SupportSystem:RequestClearPlayerChat", true)
addEventHandler("SupportSystem:RequestClearPlayerChat", root,
function(playerName, Reason)
	local player = getPlayerFromName(playerName)
	if player then
		triggerClientEvent(player, "SupportSystem:ClearPlayerChat", player, getPlayerName(source), Reason)
		sendServerMessage(root, "#ff0000"..getPlayerName(source).." has cleared "..playerName.." support chat !")
		sendServerMessage(root, "#ff0000Reason :#00ff00 "..Reason)
		sendMessageToLogs(getPlayerName(source).." has cleared "..playerName.." support chat, Reason : "..Reason.." !", 0, 221, 204)
	end
end)

addEvent("SupportSystem:RequestMessage", true)
addEventHandler("SupportSystem:RequestMessage", root,
function(Message)
	local time = getRealTime ()
	local hour, minute, second = time.hour, time.minute, time.second
	if getElementData(source, "stat") == "support" then
		triggerClientEvent(root, "SupportSystem:sendMessages", source, "Support", Message, hour..":"..minute..":"..second, 0, 255, 0, "00FF00")
		sendMessageToLogs("[Support] "..getPlayerName(source).." : "..Message.."", 0, 255, 0)
	elseif getElementData(source, "stat") == "player" then
		triggerClientEvent(root, "SupportSystem:sendMessages", source, "Player", Message, hour..":"..minute..":"..second, 255, 144, 0, "FFAA00")
		sendMessageToLogs("[Player] "..getPlayerName(source).." : "..Message.."", 255, 144, 0)
	end
end
)

addEvent("SupportSystem:RequestRemoveMessage",true)
addEventHandler("SupportSystem:RequestRemoveMessage",root,
function (Message)
triggerClientEvent(root, "SupportSystem:RemoveThisMessage", source, Message, getPlayerName(source))
sendMessageToLogs("(Admin) : "..getPlayerName(source).." has remove a message !", 255, 0, 0)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------
--#Support Mute Event :
local SupportMute = { }
local SupportBan = { }

addEvent("onMutedThis", true)
addEventHandler("onMutedThis", root,
function (playerName,Relset,Time)
if isPlayerStaff(source) then
toWho = getPlayerFromName(playerName)
if toWho ~= false then
local duration = (tonumber(1) or 0) * Time * 100000
setElementData (toWho,"sMute", true )
local timer = setTimer ( UnMutedSupport, duration, 1, toWho )
SupportMute [ getPlayerSerial ( toWho ) ] = { duration, timer }
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FF0000 "..getPlayerName(toWho).." Has Been Muted Support By #FFE275"..getPlayerName(source).." #FFFF00( "..Time.." Min ) #FF0000!",0,255,255)
exports["guimessages"]:outputServer(toWho,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#C38EC7Reason : #29A3CC"..Relset.."",0,255,255)
addHistoryLog("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FF0000 "..getPlayerName(toWho).." Has Been Muted Support By #FFE275"..getPlayerName(source).." #FFFF00( "..Time.." Min ) #FF0000!")
end
else
exports["guimessages"]:outputServer(toWho,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FF0000 You Aren't Admin",0,255,255)
end
end)

addEvent("onBannedThis", true)
addEventHandler("onBannedThis", root,
function (playerName,Relset,Time)
if isPlayerStaff(source) then
toWho = getPlayerFromName(playerName)
if toWho ~= false then
local duration = (tonumber(1) or 0) * Time * 100000
setElementData (toWho,"sBan", true )
triggerClientEvent(toWho, "CloseSupport", toWho)
local timer = setTimer ( UnBannedSupport, duration, 1, toWho )
SupportBan [ getPlayerSerial ( toWho ) ] = { duration, timer }
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FF0000 "..getPlayerName(toWho).."Has Been Banned from Support By "..getPlayerName(source).." #FFFF00( "..Time.." Min ) #FF0000!",0,255,255)
exports["guimessages"]:outputServer(toWho,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FFFF00 Reason : #29A3CC"..Relset.."",0,255,255)
addHistoryLog("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :#FF0000 "..getPlayerName(toWho).."Has Been Banned from Support By "..getPlayerName(source).." #FFFF00( "..Time.." Min ) #FF0000!, "..Relset.."")
end
end
end)


function onJoin ()
local serial = getPlayerSerial(source)
local muteds = SupportMute [ serial ]
if ( type ( muteds ) == "table" ) then
if ( muteds [ 1 ] ) then
setElementData (source,"sMute", true )
local timer = setTimer ( UnMutedSupport, muteds [ 1 ], 1, source )
SupportMute [ serial ] [ 2 ] = timer
return
end
end
setElementData (source,"sMute", false )
end
addEventHandler ( "onPlayerJoin", getRootElement(), onJoin )

function onJoinB ()
local serial = getPlayerSerial(source)
local muteds = SupportBan [ serial ]
if ( type ( muteds ) == "table" ) then
if ( muteds [ 1 ] ) then
setElementData (source,"sBan", true )
local timer = setTimer ( UnBannedSupport, muteds [ 1 ], 1, source )
SupportBan [ serial ] [ 2 ] = timer
return
end
end
setElementData (source,"sBan", false )
end
addEventHandler ( "onPlayerJoin", getRootElement(), onJoinB )
 
addEventHandler ( "onPlayerQuit", root,
function ( )
local serial = getPlayerSerial ( source )
local muteds = SupportMute [ serial ]
if ( type ( muteds ) == "table" ) then
if isTimer ( muteds [ 2 ] ) then
local timeLeft = getTimerDetails ( muteds [ 2 ] )
killTimer ( muteds [ 2 ] )
SupportMute [ serial ] [ 1 ] = timeLeft
end
end
end
)

addEventHandler ( "onPlayerQuit", root,
function ( )
local serial = getPlayerSerial ( source )
local muteds = SupportBan [ serial ]
if ( type ( muteds ) == "table" ) then
if isTimer ( muteds [ 2 ] ) then
local timeLeft = getTimerDetails ( muteds [ 2 ] )
killTimer ( muteds [ 2 ] )
SupportBan [ serial ] [ 1 ] = timeLeft
end
end
end
)

addEvent("onUnMutedThis", true)
addEventHandler("onUnMutedThis", root, function(playerName)
if isPlayerStaff(source) then
toWho = getPlayerFromName(playerName)
if toWho ~= false then
setElementData (toWho,"sMute", false )
SupportMute [ getPlayerSerial ( toWho ) ] = nil
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #BDBCB7"..getPlayerName(toWho).." #00FF00Has Been unMuted Support By #FFE275"..getPlayerName(source).."",0,255,255)
addHistoryLog("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #BDBCB7"..getPlayerName(toWho).." #00FF00Has Been unMuted Support By #FFE275"..getPlayerName(source).."")
end
end
end
)

addEvent("onUnBannedThis", true)
addEventHandler("onUnBannedThis", root, function(playerName)
if isPlayerStaff(source) then
toWho = getPlayerFromName(playerName)
if toWho ~= false then
setElementData (toWho,"sBan", false )
SupportBan [ getPlayerSerial ( toWho ) ] = nil
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00"..getPlayerName(toWho).." Has Been unBanned From Support By "..getPlayerName(source).."",0,255,255)
addHistoryLog("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00"..getPlayerName(toWho).." Has Been unBanned From Support By "..getPlayerName(source).."")
end
end
end
)

function UnMutedSupport( thePlayer )
if isElement ( thePlayer ) then
setElementData (thePlayer,"sMute", false )
SupportMute [ getPlayerSerial ( thePlayer ) ] = nil
exports["guimessages"]:outputServer(thePlayer,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00You Has Been unMuted Support By Console",0,255,255)
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00"..getPlayerName(thePlayer).." Has Been unMuted From Support By Console",0,255,255)
addHistoryLog(""..getPlayerName(thePlayer).." Has Been unMuted from Support By Console !")
end
end

function UnBannedSupport( thePlayer )
if isElement ( thePlayer ) then
setElementData (thePlayer, "sBan", false )
SupportBan [ getPlayerSerial ( thePlayer ) ] = nil
exports["guimessages"]:outputServer(thePlayer,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00You Has Been unBanned From Support By Console",0,255,255)
exports["guimessages"]:outputServer(root,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #00FF00"..getPlayerName(thePlayer).." Has Been unBanned From Support By Console",0,255,255)
addHistoryLog(""..getPlayerName(thePlayer).." Has Been unBanned from Support By Console !")
end
end

addEvent("Give/TakeSupport", true)
addEventHandler("Give/TakeSupport", root, 
function(playerName)
local Stats = getElementData(playerName, "stat")
if isPlayerStaff(source) then
if Stats == "Player" or Stats == "offline" then
exports["guimessages"]:outputServer(source,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFF00You Has Change #00FF00"..getPlayerName(playerName).."#FFFF00 Stats to #00FF00' Support '#FFFF00 in Support Chat. !!", 255, 0, 0, true)
exports["guimessages"]:outputServer(playerName,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFF00Your Stats Has Been Changed By #00FF00"..getPlayerName(source).."#FFF00 to #00FF00' Support '#FFFF00 in Support Chat. !!", 255, 0, 0, true)
setElementData(playerName, "stat", "Support")
addHistoryLog(""..getPlayerName(source).." Has Set "..getPlayerName(playerName).." Stats to Support")
else
exports["guimessages"]:outputServer(source,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFF00You Has Change #00FF00"..getPlayerName(playerName).."#FFFF00 Stats to #FF0000' Player '#FFFF00 in Support Chat. !!", 255, 0, 0, true)
exports["guimessages"]:outputServer(playerName,"#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFF00Your Stats Has Been Changed By #00FF00"..getPlayerName(source).."#FFF00 to #FF0000' Player '#FFFF00 in Support Chat. !!", 255, 0, 0, true)
setElementData(playerName, "stat", "Player")
addHistoryLog(""..getPlayerName(source).." Has Set "..getPlayerName(playerName).." Stats to Player")
		end
	end
end
)

----------------------------------------------------------------------------------------------------------------------------------------------------
--like
-------------------

