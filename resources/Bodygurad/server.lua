local ablauf = {}
local ped = {}
local stat = {}
local firetimer = {}
local timer = {}
local jx, jy, jz = {}, {}, {}
local pedSayTimer = {}

local say_messages = {
	[1] = "اهلا و سهلا و مرحبا",
	[2] = "انا بوديقارد الادارة",
	[3] = "اسمي ابراهيم و انت",
	[4] = "كيفك ما قتلي",
}

local function doPedSaySomething(ped)
	if(isTimer(pedSayTimer[ped])) then
		killTimer(pedSayTimer[ped])
	end
	if(isElement(ped)) then
		local message = say_messages[math.random(1, #say_messages)]
		local x, y, z = getElementPosition(ped)
		local col = createColSphere(x, y, z, 10)
		for index, p in ipairs( getElementsWithinColShape(col, "player") ) do
			local x2, y2, z2 = getElementPosition ( p )
			local distance = getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 )
			local rgb = 15 * distance - 125
			local rgb = math.abs ( rgb - 255 ) + 125
			outputChatBox ("#FF0000 * #FFFFFF[#FF4000 Body #FFFFFF] :#00FFEE" ..message, p, rgb, rgb, rgb,true )
		end
		destroyElement(col)
		pedSayTimer[ped] = setTimer(doPedSaySomething, 10000+math.random(5000, 60000), 1, ped)
	end
end


local function functionscheck()
	for index, p in next, ped do
		if(isElement(p)) then
			local player = getPlayerFromName(getElementData(p, "besitzer"))
			if(player) and (ped[player]) then
				if(isElement(p)) and (ablauf[player] == true) then
					if not(stat[p]) then
						stat[p] = {}
						timer[p] = {}
					end
					local owner = player
					if(owner) then
						local x, y, z = getElementPosition(owner)
						local x2, y2, z2 = getElementPosition(p)
						if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 3) then
							-- SPRINT CHECK --
							stat[p]["running"] = true
							if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 10) then
								if(stat[p]["jumping"] ~= true) and (stat[p]["inveh"] ~= true) then
									setPedAnimation(p, "ped" , "sprint_civi", -1, true, true, false) -- Sprintet
								end
							else
								if(stat[p]["jumping"] ~= true) and (stat[p]["inveh"] ~= true) then
									setPedAnimation(p, "ped" , "JOG_maleA", -1, true, true, false) -- Joggt
								end
							end
							-- ROTATION --
							local x1, y1 = getElementPosition(p)
							local x2, y2 = getElementPosition(owner)
							local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
							rot = rot-90
							setPedRotation(p, rot)
							-- CAR --
							local inveh = false
							if(isPedInVehicle(player)) then
								inveh = true
							end
							if(inveh == true) and (getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) < 4) then 
								if(stat[p]["inveh"] ~= true) and (stat[p]["enterveh"] ~= true) then
									stat[p]["enterveh"] = true
									setPedAnimation(p)
									triggerClientEvent(getRootElement(), "doPedEnter", player, p, true)
									setTimer(function()
										local occupants = getVehicleOccupants(getPedOccupiedVehicle(player))
										for i = 1, getVehicleMaxPassengers(getPedOccupiedVehicle(player)), 1 do
											if not(occupants[i]) then
												warpPedIntoVehicle(p, getPedOccupiedVehicle(player), i)
												stat[p]["inveh"] = true
												break;
											end
										end
										stat[p]["enterveh"] = false
									end, 2000, 1)
								end
							else
								if(stat[p]["inveh"] == true) and (stat[p]["enterveh"] == false) and(isPedInVehicle(player) == false) then -- er ist nicht im auto aber ich bin es
									stat[p]["enterveh"] = true
									triggerClientEvent(getRootElement(), "doPedExitVeh", player, p, true)
									setTimer(function()
										removePedFromVehicle(p)
										stat[p]["enterveh"] = false
										stat[p]["inveh"] = false
									end, 1000, 1)
								end
							end
							-- JUMP CHECK  --
							if(inveh == false) then
								if((z-z2) > 0.8) and (getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) < 4) and (stat[p]["jumping"] ~= true) then -- er ist oben
									stat[p]["jumping"] = true
									setPedAnimation(p)
									triggerClientEvent(getRootElement(), "doPedJump", player, p, true)
									if(isTimer(timer[p]["jump"])) then killTimer(timer[p]["jump"]) end
									timer[p]["jump"] = setTimer(function()
										stat[p]["jumping"] = false
										triggerClientEvent(getRootElement(), "doPedJump", player, p, false)
									end, 800, 1)
								end
							end
						else
							if (stat[p]["running"] == true)then
								stat[p]["running"] = false
								setPedAnimation(p)
							end
						end
					else
						destroyElement(p)
					end
				end
			end
		else
			if(isElement(p)) then
				destroyElement(p)
			end
			p = nil
		end
	end
end

setTimer(functionscheck, 200, -1)




addCommandHandler("AEH", function(p)
	if(ablauf[p] == true) then return end
	ablauf[p] = true
	local x, y, z = getElementPosition(p)
	ped[p] = createPed(294, x, y+1, z)
	setElementData(ped[p], "besitzer", getPlayerName(p))
	setElementData(ped[p], "bodyguard", true)
	setTimer(giveWeapon, 1000, 1, ped[p], 38, 999999999999, true)
	setPedStat (ped[p], 72, 999)
	setPedStat (ped[p], 76, 999)
	setPedStat (ped[p], 74, 999)
	addEventHandler("onClientPedDamage", ped, cancelPedDamage)
	pedSayTimer[ped[p]] = setTimer(doPedSaySomething, 5000, 1, ped[p])
	addEventHandler("onPedWasted", ped[p], function()
		local ped = source
		setTimer(destroyElement, 1000, 1, ped)
		ablauf[p] = false
		
	end)
end)

