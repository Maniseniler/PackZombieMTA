createBlip (  -2053.9755859375, -199.560546875, 35.327392578125, 23 )

local Rhino = createVehicle(432, -2072.47217, -108.92680, 35.32169, 0, 0, 180)
setVehicleColor ( Rhino, 25, 25, 25, 25 )


function fixDetach(obj)
	local x, y, z = getElementPosition(obj)
	local rx, ry, rz = getElementRotation(obj)
	detachElements(obj)
	setElementPosition(obj, x, y, z)
	setElementRotation(obj, rx, ry, rz)
	return x, y, z
end

function lockv(player, seat, jacked)
    if source == Rhino  then
     local skin = getElementModel (player)
        if not ( skin == 285 or skin == 285) then
             cancelEvent()
             outputChatBox ( "#FF9900 * #FFFFFF[#00CCFF HorroB #FFFFFF] :#FF0000 هذه الدبابة خاصة للمسابقات فقط", player, 100, 100, 0, true )
        end
      end
    end
addEventHandler ( "onVehicleStartEnter", getRootElement(), lockv )

function GUIness(thePlayer)
          local skin = getElementModel (player)
        if ( skin == 285 or skin == 285) then
	--here you can add an if check, if you want to restrict it to admins.
		triggerClientEvent(thePlayer, "makeGUI", root)
	--end
else
end
end
addCommandHandler("accp", GUIness)
