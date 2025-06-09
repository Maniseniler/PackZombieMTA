
-- Add events
do
	addEvent("onPlayerRequestWeaponSkill", true)
	addEvent("onPlayerRequestMaxSkill", true)
	addEvent("onPlayerRequestArmor", true)
	addEvent("onPlayerRequestDamageProof", true)
	addEvent("onPlayerRequestVehicleUpgrade", true)
	addEvent("onPlayerRequestFixVehicle",true)
	addEvent("onPlayerRequestFlipVehicle", true)
	addEvent("onPlayerRequestWeapon", true)
end

addEventHandler( "onPlayerRequestWeaponSkill", root, 
function (thePrice, statID)
	if (thePrice and statID) then
		local money = getPlayerMoney(source)
		local thePrice = tonumber(thePrice)
		if (money >= thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You bought skill to #FFFFFF[#b0c4de "..getWeaponNamefromStat(statID).." #FFFFFF]#6C0000 for #00C800$"..thePrice, source, 190, 190, 190, true)
			setPedStat(source, tonumber(statID), 999)
			takePlayerMoney(source, thePrice)
		elseif (money < thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You don't have enough money to buy skill for #FFFFFF[#b0c4de "..getWeaponNamefromStat(statID).." #FFFFFF]", source, 225, 0, 0,true)
		end
	end
end
)

local weaponNames = {
	[69] = "Colt 45",
	[70] = "Silenced",
	[71] = "Desert eagle",
	[72] = "Shotgun",
	[73] = "Sawn-off shotgun",
	[74] = "Combat shotgun",
	[75] = "Uzi & Tec-9",
	[76] = "MP5",
	[77] = "AK-47",
	[78] = "M4",
	[79] = "Sniper"
}

function getWeaponNamefromStat(statID)
	if (statID) then
		return weaponNames[statID] or ""
	end
end

local skillNames = {
	-- Player body/visual
	[21] = "Max fat",
	[22] = "Max stamina",
	[23] = "Max muscle",
	[24] = "Max health"
}

addEventHandler( "onPlayerRequestMaxSkill", root,
function (thePrice, statID)
	if (thePrice and statID) then
		local money = getPlayerMoney(source)
		local thePrice = tonumber(thePrice)
		if (money >= thePrice) then
			if not (getElementModel(source) == 0) and not (statID == 24) then
				return outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You must have the CJ skin.", source, 225, 0, 0,true)
			end
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You bought #FFFFFF[#b0c4de "..(skillNames[statID] or "").." #FFFFFF]#6C0000 for #00C800$"..thePrice, source, 190, 190, 190, true)
			setPedStat(source, tonumber(statID), 999)
			takePlayerMoney(source, thePrice)
			if (statID == 24) then
				setElementHealth(source, 200)
			end	
		elseif (money < thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You don't have enough money to buy #FFFFFF[#b0c4de "..(skillNames[statID] or "").." #FFFFFF]", source, 225, 0, 0,true)
		end
	end
end
)

addEventHandler( "onPlayerRequestArmor", root,
function (thePrice)
	if (thePrice) then
		local money = getPlayerMoney(source)
		local thePrice = tonumber(thePrice)
		if (money >= thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You bought Armor for #00C800$"..thePrice, source, 190, 190, 190, true)
			setPedArmor(source, 100)
			takePlayerMoney(source, thePrice)	
		elseif (money < thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You don't have enough money to buy Armor.", source, 225, 0, 0,true)
		end
	end
end
)

local weapons = {
	[22] = "Colt 45",
	[23] = "Silenced",
	[24] = "Desert eagle",
	[25] = "Shotgun",
	[26] = "Sawn-off shotgun",
	[27] = "Combat shotgun",
	[28] = "Micro uzi",
	[29] = "MP5",
	[32] = "Tec-9",
	[30] = "AK-47",
	[31] = "M4",
	[34] = "Sniper"
}

addEventHandler("onPlayerRequestWeapon", root,
function (thePrice, weaponID, ammo)
	if (thePrice and weaponID and ammo) then
		local money = getPlayerMoney(source)
		local thePrice = tonumber(thePrice)
		if (money >= thePrice) then
			outputChatBox ("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You bought a #FFFFFF[#b0c4de "..(weapons[weaponID] or "").." #FFFFFF]#6C0000 for #00C800$"..thePrice, source, 190, 190, 190, true)
			giveWeapon(source, tonumber(weaponID), tonumber(ammo), true)
			takePlayerMoney(source, thePrice)
		elseif (money < thePrice) then
			outputChatBox("#FF9900 * #FFFFFF[#00A2FF Weapon Shop #FFFFFF] :#6C0000 You don't have enough money to buy #FFFFFF[#b0c4de "..(weapons[weaponID] or "").." #FFFFFF]", source, 225, 0, 0,true)
		end
	end
end
)

