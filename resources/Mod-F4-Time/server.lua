Group = "Time" 

addEvent("SHOW_s",true)
addEventHandler("SHOW_s",getRootElement(),
function()
if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup( Group )) then
triggerClientEvent ( source, "SHOW", source)
else
outputChatBox ( "#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : انت ليس ادارة لفتح اللوحة", source, 255, 255, 255, true )
  end
end)