createBlip (-86.2715,-299.3637,2.7646, 8)

boxes = {}
obj = {
	{2578.4,-1289.9513,1044.1250},
	{2522.9,-1286.0757,1054.6406},
}
markers = {
	{2558.6006,-1291.0045,1043.5},
	{2556.2268,-1291.0056,1043.5},
	{2553.8550,-1291.0057,1043.5},
	{2544.4717,-1291.0048,1043.5},
	{2542.0872,-1291.0050,1043.5},
	{2542.0264,-1295.8530,1043.5},
	{2544.3296,-1295.8505,1043.5},
	{2553.7854,-1295.8502,1043.5},
	{2556.2200,-1295.8524,1043.5},
	{2558.5078,-1295.8507,1043.5},
}
jobmarkers = {
	{2559.1150,-1287.2179,1044.63},
	{2551.1011,-1287.2179,1044.63},
	{2543.1372,-1287.2181,1044.63},
	{2543.0427,-1300.0942,1044.63},
	{2551.0955,-1300.0951,1044.63},
	{2559.0603,-1300.0948,1044.63},
}

checkm = false

centerMarker = createMarker(2565.4836,-1292.9449,1043.15,"cylinder",1.8,255,25,25,150)
setElementInterior(centerMarker,2)
setElementDimension(centerMarker,5)
setElementVisibleTo(centerMarker,root,false)

for i,pos in ipairs(obj) do
	obj[i] = createObject(3095,pos[1], pos[2], pos[3],0,90,180)
	setElementInterior(obj[i],2)
	setElementDimension(obj[i],5)
end

function onPlayerTakenParts(player,matchingDimension)
	if getElementType(player) == "player" then
		if getElementData(player,"worldjob") == true then
			if not getElementData(player,"part") == true then
				if not getElementData(player,"weapon") == true then
					setPedAnimation (player,"WEAPONS","SHP_2H_LIFT",-1,false,false,true,false)
					giveWeapon(player,25,1)
					setPedWeaponSlot(player,3)
					setElementData(player,"part",true)
					outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : كذا تمام الحين روح للطاوله يلي وراك.",player,200,170,0,true)
				else
					outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : يجب أن تحمل أسلحة إلى المستودع، قبل اتخاذ تفاصيل جديدة.",player,200,0,0,true)
				end
			else
				outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : كنت قد اتخذت بالفعل جزءا.",player,200,0,0,true)
			end
		end
	end
end

for i,pos in ipairs(jobmarkers) do
	jobmarkers[i] = createMarker(pos[1], pos[2], pos[3],"arrow",0.8,0,0,0,255)
	setElementInterior(jobmarkers[i],2)
	setElementDimension(jobmarkers[i],5)
	addEventHandler("onMarkerHit", jobmarkers[i], onPlayerTakenParts)
end

function onPlayerStartToCreateWeapon(player,matchingDimension)
	if getElementType(player) == "player" then
		if getElementData(player,"worldjob") == true then
			if not getElementData(player,"weapon") then
				if getElementData(player,"part") == true then
					outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : بدأت في صناعة الأسلحة.",player,255,140,0,true)
					setElementFrozen(player,true)
					setPedAnimation(player,"BUDDY", "buddy_reload",-1,true,false,true,false)
					setElementData(player,"part",false)
					toggleAllControls(player,false)
					setTimer(function()
						for i = 1, #markers do
							if isElementWithinMarker ( player, markers [ i ] ) then
								checkm = true
								break
							end
						end
						if checkm == true then
							if not isElementVisibleTo(centerMarker,player) then
								setElementVisibleTo(centerMarker,player,true)
							end
							setElementFrozen(player,false)
							--setPedAnimation(player,"CARRY","crry_prtial",1,true,true,false)
							setPedAnimation (player,"WEAPONS","SHP_2H_LIFT",-1,false, false, false, false)
							--takeWeapon(player,25)						
							--boxes = createObject( 1271, 0, 0, 0 );
							--exports.bone_attach:attachElementToBone( boxes, player, 4, 0, 0.4, - 0.6, -90, 0, 0 );
							setElementData(player,"weapon",true)
							toggleAllControls(player,true)
							toggleControl(player,"fire",false)
							toggleControl(player,"sprint",false)
							toggleControl(player,"next_weapon",false)
							toggleControl(player,"previous_weapon",false)
							outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : الأسلحة المقدمة، أعتبر إلى المستودع.",player,0,200,0,true)
						else
							setPedAnimation(player,false)
							toggleAllControls(player,true)
							setElementFrozen(player,false)
							toggleControl(player,"fire",false)
							toggleControl(player,"sprint",false)
							toggleControl(player,"next_weapon",false)
							toggleControl(player,"previous_weapon",false)
							outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] :كنت قد ذهبت من مكان العمل!",player,200,0,0,true)
						end
					end,10000,1)
				end
			end
		end
	end
end

for i,pos in ipairs(markers) do
	markers[i] = createMarker(pos[1], pos[2], pos[3],"cylinder",0.8,255,0,0,0)
	setElementInterior(markers[i],2)
	setElementDimension(markers[i],5)
	addEventHandler("onMarkerHit", markers[i], onPlayerStartToCreateWeapon)
end

function onPlayerFinishToCreateWeapon(player,matchingDimension)
	if source == centerMarker then
		if getElementType(player) == "player" then
			if getElementData(player,"worldjob") == true then
				if getElementData(player,"weapon") == true then
					local rand = math.random(400,650)
					if isElementVisibleTo(centerMarker,player) then
						setElementVisibleTo(centerMarker,player,false)
					end
					if getElementData(player,"jobmoney") then
						setElementData(player,"jobmoney",getElementData(player,"jobmoney")+rand)
					else
						setElementData(player,"jobmoney",rand)
					end
					setPedAnimation (player,"CARRY","putdwn",-1,false,false,true,false)
					--setTimer(takeWeapon,600,1,player,25)
					
				--	exports.bone_attach:detachElementFromBone(boxes)
					--destroyElement(boxes)
				--	boxes[player] = nil
					takeWeapon(player,25)
					
					setElementData(player,"weapon",false)
					outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] :  #FFFFFF[#00FF00 $"..getElementData(player,"jobmoney").." #FFFFFF] إجمالي المكتسبة  #FFFFFF[#00FF00 $"..rand.." #FFFFFF] تمت صناعة السلاح بننجاح و كان مربوحك منه",player,0,200,0,true)
				end
			end
		end
	end
end
addEventHandler("onMarkerHit",root,onPlayerFinishToCreateWeapon)

function quitJob(player)
	if player then
		if getElementData(player,"worldjob") == true then
			if isElementVisibleTo(centerMarker,player) then
				setElementVisibleTo(centerMarker,player,false)
			end
			toggleControl(player,"fire",true)
			toggleControl(player,"sprint",true)
			toggleControl(player,"next_weapon",true)
			toggleControl(player,"previous_weapon",true)
			setElementData(player,"worldjob",false)
			setElementData(player,"part",false)
			setElementData(player,"weapon",false)
			setPedAnimation(player,false)
			takeWeapon(player, 25)
			outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : لقد استقال بنجاح. حظا سعيدا. يأتي مرة أخرى.",player,0,150,0,true)
		end
	end
end
addEvent("onPlayerQuitJob",true)
addEventHandler("onPlayerQuitJob",root,quitJob)

function giveJobMoney(player)
	if player then
		local money = getElementData(player,"jobmoney")
		if money >= 20 then
			exports.global:giveMoney(player, money)
			setElementData(player,"jobmoney",0)
			outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] :  #FFFFFF[#00FF00 $"..money.."#FFFFFF ] راتبك",player,0,200,0,true)
		end
	end
end
addEvent("giveJobMoney",true)
addEventHandler("giveJobMoney",root,giveJobMoney)

function quitPlayerOnJob()
	if getElementData(source,"worldjob") == true then
		takeWeapon(source,25)
		giveJobMoney(source)
		if isElement(boxes[source]) then
			exports.bone_attach:detachElementFromBone(boxes[source])
			destroyElement(boxes[source])
			boxes[source] = nil
		end
	end
end
addEventHandler("onPlayerQuit",root,quitPlayerOnJob)

function worksJobEnterDoor(player)
	if not isPedInVehicle(player) then
		fadeCamera(player,false,2.0,0,0,0)
		setTimer(setElementPosition,1000,1,player,2575.6145,-1289.7745,1044.1250)
		setTimer(setElementInterior,1000,1,player,2)
		setTimer(setElementDimension,1000,1,player,5)
		setTimer(setCameraTarget,1050,1,player,player)
		setTimer(fadeCamera,1000,1,player,true)
		setTimer(toggleControl,1000,1,player,"enter_exit",true)
	end
end
addEvent("WorksJobEnterDoor",true)
addEventHandler("WorksJobEnterDoor",root,worksJobEnterDoor)

function worksJobExitDoor(player)
	if not isPedInVehicle(player) then
		if getElementData(player,"worldjob") == true then
			outputChatBox("شكرا, للخروج.",player,200,0,0)
			return
		end
		fadeCamera(player,false,2.0,0,0,0)
		setTimer(setElementPosition,1000,1,player,-86.2826,-300.8545,2.7646)
		setTimer(setElementInterior,1000,1,player,0)
		setTimer(setElementDimension,1000,1,player,0)
		setTimer(setCameraTarget,1050,1,player,player)
		setTimer(fadeCamera,1000,1,player,true)
		setTimer(toggleControl,1000,1,player,"enter_exit",true)
	end
end
addEvent("WorksJobExitDoor",true)
addEventHandler("WorksJobExitDoor",root,worksJobExitDoor)

--[[function checkStart()
	if getResourceFromName("bone_attach") and getResourceState(getResourceFromName("bone_attach")) == "running" then
	else
		outputChatBox("Ресурс bone_attach не запущен!",root,255,0,0)
		cancelEvent()
	end
end
addEventHandler("onResourceStart",resourceRoot,checkStart)]]