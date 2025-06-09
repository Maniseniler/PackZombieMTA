outputChatBox("#FF9900 * #00B7FFBodyguard System By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local gMe = getLocalPlayer()

addEvent("doPedJump", true)
addEvent("doPedEnter", true)
addEvent("doPedExitVeh", true)

addEventHandler("doPedJump", getLocalPlayer(), function(p, boolean)
	setPedControlState(p, "jump", boolean)
end)

addEventHandler("doPedEnter", getLocalPlayer(), function(p, boolean)
	setPedControlState(p, "enter_passenger", boolean)
end)

addEventHandler("doPedExitVeh", getLocalPlayer(), function(p, boolean)
	setPedControlState(p, "enter_exit", boolean)
end)


-- DAMAGE ABFRAGE --

local pedTarget = {}
local pedTimer = {}
local pedShooting = {}

local function doPedAttackOtherPlayer(ped)
	if(isTimer(pedTimer[ped])) or (isPedInVehicle(ped)) then
		killTimer(pedTimer[ped])
	end
	if(isElement(ped)) then
		pedTimer[ped] = setTimer(function()
			if(isElement(ped)) then
				local target = pedTarget[ped]
				if(target) then
					local x, y, z = getElementPosition(ped)
					local x2, y2, z2 = getElementPosition(target)
					if(isLineOfSightClear(x, y, z, x2, y2, z2, true, false, false, false, false, false)) then
						if(getElementHealth(target) > 1) then
							if(pedShooting[ped] ~= true) then
								--[[
								local x1, y1 = getElementPosition(ped)
								local x2, y2 = getElementPosition(target)
									local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
									rot = rot-90
									setPedRotation(ped, rot)
									setPedAnimation(ped)
									if(getPedControlState(ped, "fire") ~= true) then
										setPedControlState(ped, "fire", true)
									end
									setPedAimTarget(ped, x2, y2, z2)]]
								setPedControlState(ped, "fire", true)
								pedShooting[ped] = true
							else
								local x1, y1, z1 = getElementPosition(ped)
								local x2, y2, z2 = getElementPosition(target)
								local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
								rot = rot-90
								setPedRotation(ped, rot)
								setPedAimTarget(ped, x2, y2, z2)
							end
						else
							killTimer(pedTimer[ped])
							pedShooting[ped] = false
							setPedControlState(ped, "fire", false)
						end
					else
						killTimer(pedTimer[ped])
						pedShooting[ped] = false
						setPedControlState(ped, "fire", false)
					end
				end
			else
				killTimer(pedTimer[ped])
			end
		end, 500, -1)
	else
		killTimer(pedTimer[ped])
	end
end

addEventHandler("onClientPedDamage", getRootElement(), function(attacker)
	if(getElementData(source, "bodyguard") == true) then
		if(attacker) and (isElement(attacker)) then
			if(getElementType(attacker) == "player") or (getElementType(attacker) == "vehicle") then
				pedTarget[source] = attacker
				doPedAttackOtherPlayer(source)
			end
		end
	end
end)

-- onClientRender Func --


addEventHandler("onClientRender", getRootElement(), function()
	for index, p in pairs(getElementsByType("ped", getRootElement(), true)) do
		if(getElementData(p, "bodyguard") == true) then
			local owner = getElementData(p, "besitzer")
			if(owner) then
				local x, y, z = getElementPosition(p)
				local x2, y2, z2 = getElementPosition(gMe)
				if(isLineOfSightClear(x, y, z, x2, y2, z2, true, true, false, true)) then
					local sx, sy = getScreenFromWorldPosition(x, y, z+1)
					if(sx) and (sy) then
						local distance = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
						if(distance < 30) then
							dxDrawText("#FFFFFF[ #00FFEE"..owner.." #FFFFFF]#FF0000 Bodyguard", sx+2, sy+2, sx, sy, tocolor(255, 255, 255, math.abs(math.sin(getTickCount()/700))*255), 2-(distance/20), "arial", "center", "center", false, false, false, true, false)
							dxDrawText("#FFFFFF[ #00FFEE"..owner.." #FFFFFF]#FF0000 Bodyguard", sx, sy, sx, sy, tocolor(255, 255, 255, math.abs(math.sin(getTickCount()/700))*255), 2-(distance/20), "arial", "center", "center", false, false, false, true, false)
						end
					end
				end
			end
		end
	end
end)