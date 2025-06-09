local mbag = {
	{2422.3,-2261.6,16},
	{1758.9,-2767.9,1.7},
	{2493.3,-951.8,82.25},
	{815.7,-1108.2,25.8},
	{390.9,-2054.3,13.8},
	{-719.05,-1938.8,8.35},
	{-625.7,-2249.5,23.05},
	{-1812.3,-168.5,18.2},
	{-2659.5,1528.05,54.79},
	{-1733.76,194.75,3.6},
	{-2535.5,40.15,8.5},
	{-1804.85,558.45,35.15},
	{-752.6,-131.6,65.8},
}

function createBag()
	local random = math.random ( #mbag )
	local x, y, z = mbag[random][1], mbag[random][2], mbag[random][3]
	bag = createPickup( x, y, z, 3, 1550 )
	setElementCollisionsEnabled( bag, false )
	bl = createBlipAttachedTo(bag,52)
	outputChatBox( "#FF9900 * #FFFFFF[#00A2FF Money #FFFFFF] :#6C0000 تم عمل رسبون لجائزة اسرع و خذها انت الاول ", root, 0, 255, 0 ,true)
end
addEventHandler("onResourceStart", resourceRoot,createBag)

addEventHandler("onPickupHit",root,
function ( player )
	if ( source ~= bag ) then
		return
	end
	if ( isPedInVehicle( player ) ) then
		return
	end
		destroyElement( bag )
		destroyElement( bl )
		randomMoney = math.random ( 4000, 10000 )
		givePlayerMoney(player,randomMoney)
		outputChatBox("#FF9900 * #FFFFFF[#00A2FF Money #FFFFFF] :#6C0000 #FFFFFF[#00B300 $" .. tostring(randomMoney) .." #FFFFFF]#6C0000 لقد ربحت ", player, 0, 250, 0,true)
	end
)
