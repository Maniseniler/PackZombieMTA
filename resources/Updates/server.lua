
local AllowedGroups = { "Console", "Admin", "Update" };
local AdminUpdatesTable = {};

function outputBar( text, element, r, g, b )
	local color = RGBToHex(r,g,b);
	exports["guimessages"]:outputServer(element, "#3399FF[Updates System] "..color..""..text.."", r,g,b,true);
end

function RGBToHex(red, green, blue)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) ) then
		return nil
	end
	return string.format("#%.2X%.2X%.2X", red,green,blue);
end

function isPlayerInAllowedGroups(player)
	if not isGuestAccount(getPlayerAccount(player)) then
		for k,v in ipairs ( AllowedGroups ) do
			if ( isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(player)), aclGetGroup(v)) ) then
				return true
			end
		end
	end
end

function getAllServerUpdates()
	local DB = dbPoll( dbQuery(UADB, "SELECT * FROM Updates" ), -1);
	if ( type ( DB ) == "table" and #DB == 0 or not DB ) then
		return {}
	else
		return DB
	end
end

function addServerUpdate(Date,Info,Author)
	dbExec( UADB, "INSERT INTO Updates VALUES( ?, ?, ? )", Date,Info,Author );
end

function deleteServerUpdate(Date,Info,Author)
	local DB = dbPoll( dbQuery(UADB, "SELECT * FROM Updates WHERE Date=? AND Info=? AND Author=?", Date,Info,Author ), -1);
	if #DB > 0 then
		dbExec(UADB, "DELETE FROM Updates WHERE Date=? AND Info=? AND Author=?", DB[1]["Date"], DB[1]["Info"], DB[1]["Author"] );
	end
end

function EditServerUpdate( OldDate, OldInfo, OldAuthor, NewDate, NewInfo, NewAuthor )
	dbExec(UADB, "UPDATE Updates SET Date = '"..NewDate.."' WHERE Date = '" ..OldDate.."' AND Info = '" ..OldInfo.."' AND Author = '" ..OldAuthor.."'" );
	dbExec(UADB, "UPDATE Updates SET Info = '"..NewInfo.."' WHERE Date = '" ..OldDate.."' AND Info = '" ..OldInfo.."' AND Author = '" ..OldAuthor.."'" );
	dbExec(UADB, "UPDATE Updates SET Author = '"..NewAuthor.."' WHERE Date = '" ..OldDate.."' AND Info = '" ..OldInfo.."' AND Author = '" ..OldAuthor.."'" );
end

function DeleteAllServerUpdates()
	dbExec(UADB, "DELETE FROM Updates");
end

addEventHandler("onResourceStart", resourceRoot,
function ()
	UADB = dbConnect("sqlite", "UpdatesDB.db");
	dbExec(UADB, "CREATE TABLE IF NOT EXISTS Updates ( Date, Info, Author )" );
end );

addEvent("UpdatesSystem:RequestServerUpdates", true)
addEventHandler("UpdatesSystem:RequestServerUpdates", root,
function ()
	if not isGuestAccount(getPlayerAccount(source)) then
		triggerClientEvent(source, "UpdatesSystem:OpenUpdatesPanel", source, getAllServerUpdates());
	else
		outputBar("Please login to see the server updates", source, 255,0,0);
	end
end );

addEvent("UpdatesSystem:RequestAdminPanel", true)
addEventHandler("UpdatesSystem:RequestAdminPanel", root,
function ( client )
	if isPlayerInAllowedGroups(client) then
		triggerClientEvent(client, "UpdatesSystem:OpenAdminPanel", client, getAllServerUpdates());
	end
end );

addEvent("UpdatesSystem:RefreshAdminPanel", true)
addEventHandler("UpdatesSystem:RefreshAdminPanel", root,
function ( client )
	triggerClientEvent(client, "UpdatesSystem:RefreshAdminPanel", client, getAllServerUpdates());
end );

addEvent("UpdatesSystem:AddNewUpdate", true)
addEventHandler("UpdatesSystem:AddNewUpdate", root,
function ( client, Date, Info, Author )
	if isPlayerInAllowedGroups(client) then
		addServerUpdate( Date, Info, Author );
		outputBar("You Have Succesfully Added a new Update .", client, 0,255,0);
		outputBar(RGBToHex(getPlayerNametagColor(client))..getPlayerName(client).." #00FF00Has Added a new Updates Press F10 to see it.", root, 0,255,0);
		playSoundFrontEnd( root, 49 );
		triggerEvent("UpdatesSystem:RefreshAdminPanel", client, client);
	end
end );

addEvent("UpdatesSystem:DeleteSelectedItem", true)
addEventHandler("UpdatesSystem:DeleteSelectedItem", root,
function ( client, Date, Info, Author )
	if isPlayerInAllowedGroups(client) then
		deleteServerUpdate(Date,Info,Author);
		outputBar("You Have Succesfully Deleted a Update .", client, 0,255,0);
		triggerEvent("UpdatesSystem:RefreshAdminPanel", client, client);
	end
end );

addEvent("UpdatesSystem:EditUpdate", true)
addEventHandler("UpdatesSystem:EditUpdate", root,
function ( client, OldDate, OldInfo, OldAuthor, NewDate, NewInfo, NewAuthor )
	if isPlayerInAllowedGroups(client) then
		EditServerUpdate( OldDate, OldInfo, OldAuthor, NewDate, NewInfo, NewAuthor );
		outputBar("You Have Succesfully Edit a Update .", client, 0,255,0);
		triggerEvent("UpdatesSystem:RefreshAdminPanel", client, client);
	end
end );

addEvent("UpdatesSystem:DeleteEverything", true)
addEventHandler("UpdatesSystem:DeleteEverything", root,
function ( client )
	if isPlayerInAllowedGroups(client) then
		DeleteAllServerUpdates();
		outputBar("You Have Succesfully Deleted All Updates .", client, 0,255,0);
		triggerEvent("UpdatesSystem:RefreshAdminPanel", client, client);
	end
end );