outputChatBox("#FF9900 * #00B7FFJump Mode By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)

key = "shift" -- You Can Change This :)
player = localPlayer

bindKey(key,"down",	
	function ()
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player)
			if isPedOnGround(player) then
				local vx,vy,vz = getElementVelocity(veh)
				setElementVelocity(veh,vx,vy,vz + 0.5)
			end
		end
	end
)
