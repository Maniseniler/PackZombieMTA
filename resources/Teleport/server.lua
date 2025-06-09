addEvent("CheckPlayerWarpMoney",true )
addEventHandler("CheckPlayerWarpMoney", root, 
function ()
	local Money = getPlayerMoney(source)
	if ( Money >= 1000 ) then
		takePlayerMoney(source,1000)
		triggerClientEvent("letPlayerWarptoAnother", root )
	else
		outputChatBox ("#0099FF[teleport System] #FF0000You Don't Have Enough Money .",source,255,0,0,true)
	end
end )