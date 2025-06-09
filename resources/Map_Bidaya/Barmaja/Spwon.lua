addEventHandler("onPlayerChat",root,
function ( msg )
if ( msg == "المقر" ) then
setElementPosition ( source,840.06512, -2125.80688, 13.65282 )
end
end)
addEventHandler("onPlayerChat",root,
function ( msg )
if ( msg == "سيارة" ) then
setElementPosition ( source,823.46472, -1924.91931, 13.27680 )

end
end)

addEventHandler("onResourceStart", resourceRoot,
	function()
		resetMapInfo()
		for i,player in ipairs(getElementsByType("player")) do
			spawn(player)
		end
	end
)

function spawn(player)
	if not isElement(player) then return end
	repeat until spawnPlayer ( player, 840.06512+math.random(1,5),-2125.80688+math.random(5,9), 13.65282, 180, 284, 0, 0)
	fadeCamera(player, true)
	setCameraTarget(player, player)
	showChat(player, true)
end

addEventHandler("onPlayerJoin", root,
	function()
		spawn(source)
	end
)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)