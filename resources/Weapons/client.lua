outputChatBox("#0077FFMod Weapon by Ibrahim Bouchaala",200,0,0,true)
function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW)/2,(screenH - windowH)/2
    guiSetPosition(center_window, x, y, false)
end

jobpick = createPickup(2567.0576,-1280.4055,1044.1250,3,1)
Sskin = createPed(292, 2567.0576,-1280.4055,1044.1250,180)
setElementInterior(Sskin,2)
setElementDimension(Sskin,5)
setElementInterior(jobpick,2)
setElementDimension(jobpick,5)

function openJobWindow(source)
	if source == localPlayer and getElementType(source) == "player" then
		local job = getElementData(localPlayer,"worldjob")
		if job == true then
			if getElementData(source,"part") == false then
				if getElementData(source,"weapon") == false then
					guiSetVisible(jobquitwindow,true)
					showCursor(true)
				else
					outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : لم تكمل المهمة",200,0,0,true)
				end
			else
				outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : لم تكمل المهمة",200,0,0,true)
			end
		elseif job == false then
			guiSetVisible(jobjoinwindow,true)
			showCursor(true)
		end
	end
end
addEventHandler("onClientPickupHit",jobpick,openJobWindow)

jobjoinwindow = guiCreateWindow(0,0,0.20,0.35,"لوحة التوظيف لمصنع الاسلحة المطور",true)
guiSetProperty(jobjoinwindow, "CaptionColour", "FF0041FC")
guiWindowSetMovable(jobjoinwindow,false)
guiWindowSetSizable(jobjoinwindow,false)
guiSetVisible(jobjoinwindow,false)
centerWindow(jobjoinwindow)


joinlabel = guiCreateMemo(0.02,0.1,1.2,0.65, "مود مصنع الاسلحة المطور                  \n\nالأن اصبح من السهل الاشتغال في المصنع       \n\n\nالقوانين :                                                             \n\nممنوع قتل أي شخص بالسلاح الذي يتم اعطائه          \n\nممنوع ضرب الطاولات و تكسيرهم                    \n\nملاحظات :                                                   \n                 \nيجب ارتداء قناع                                 \n\n مع تحيات صانع المود                       Ibrahim Bouchaala", true, jobjoinwindow)
        guiMemoSetReadOnly(joinlabel, true)
		guiSetFont(joinlabel, "default-bold-small")

closejoinwindow = guiCreateButton(0.65,0.80,0.3,0.2,"إلغاء",true,jobjoinwindow)
guiSetFont(closejoinwindow,"default-bold-small")
guiSetProperty(closejoinwindow, "NormalTextColour", "FFFD1D00")

joinjobbutton = guiCreateButton(0.05,0.80,0.3,0.2,"اخذ الوظيفة",true,jobjoinwindow)
guiSetFont(joinjobbutton,"default-bold-small")
guiSetProperty(joinjobbutton, "NormalTextColour", "FF05FB00")


function closeJoinWindow(button)
	if button == "left" then
		if source == closejoinwindow then
			if guiGetVisible(jobjoinwindow) == true then
				guiSetVisible(jobjoinwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closejoinwindow,closeJoinWindow)

function joinJob(button)
	if button == "left" then
		if source == joinjobbutton then
			setElementData(localPlayer,"worldjob",true)
			toggleControl("fire",false)
			toggleControl("sprint",false)
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			outputChatBox("#FF9900* #FFFFFF[#0077FF Weapon #FFFFFF] : انت الأن موظف يجب عليك الحذر من الجيش",255,255,255,true)
			guiSetVisible(jobjoinwindow,false)
			showCursor(false)
		end
	end
end
addEventHandler("onClientGUIClick",joinjobbutton,joinJob)

jobquitwindow = guiCreateWindow(0,0,0.3,0.1,"الخروج من الوظيفة",true)
guiSetProperty(jobquitwindow, "CaptionColour", "FF0041FC")
guiWindowSetMovable(jobquitwindow,false)
guiWindowSetSizable(jobquitwindow,false)
guiSetVisible(jobquitwindow,false)
centerWindow(jobquitwindow)

quitlabel = guiCreateLabel(0.1,0.325,0.9,0.5,"            حين تقوم بترك الوظيفة ستباع الاسلحة تلقائيا                             ",true,jobquitwindow)
guiSetFont(quitlabel, "default-bold-small")

closequitwindow = guiCreateButton(0.65,0.65,0.3,0.3,"إلغاء",true,jobquitwindow)
guiSetFont(closequitwindow, "default-bold-small")
guiSetProperty(closequitwindow, "NormalTextColour", "FF05FB00")

quitjobbutton = guiCreateButton(0.05,0.65,0.3,0.3,"موافق",true,jobquitwindow)
guiSetFont(quitjobbutton, "default-bold-small")
guiSetProperty(quitjobbutton, "NormalTextColour", "FFFD1D00")

function closeQuitWindow(button)
	if button == "left" then
		if source == closequitwindow then
			if guiGetVisible(jobquitwindow) == true then
				guiSetVisible(jobquitwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closequitwindow,closeQuitWindow)

function quitJob(button)
	if button == "left" then
		if source == quitjobbutton then
			if getElementData(localPlayer,"worldjob") == true then
				triggerServerEvent("onPlayerQuitJob",localPlayer,localPlayer)
				triggerServerEvent("giveJobMoney",localPlayer,localPlayer)
				guiSetVisible(jobquitwindow,false)
				showCursor(false)
			else
				outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : !!!!!!!",200,0,0,true)
			end
		end
	end
end
addEventHandler("onClientGUIClick",quitjobbutton,quitJob)

cashpick = createPickup(2570.5767,-1280.2495,1044.1250,3,1)
setElementInterior(cashpick,2)
setElementDimension(cashpick,5)
Sskin = createPed(292, 2570.5767,-1280.2495,1044.1250,180)
setElementInterior(Sskin,2)
setElementDimension(Sskin,5)

cashwindow = guiCreateWindow(0,0,0.1,0.15,"البائع",true)
guiWindowSetMovable(cashwindow,false)
guiWindowSetSizable(cashwindow,false)
guiSetVisible(cashwindow,false)
centerWindow(cashwindow)

cashlabel = guiCreateLabel(0.07,0.15,1,1,"",true,cashwindow)
guiSetFont(cashlabel, "default-bold-small")

takecashwindow = guiCreateButton(0.05,0.77,0.50,0.17,"بيع الاسلحة",true,cashwindow)
guiSetFont(takecashwindow, "default-bold-small")
guiSetProperty(takecashwindow, "NormalTextColour", "FF05FB00")

closecashwindow = guiCreateButton(0.6,0.77,0.35,0.17,"إلغاء",true,cashwindow)
guiSetFont(closecashwindow, "default-bold-small")
guiSetProperty(closecashwindow, "NormalTextColour", "FFFD1D00")

function openCashWindow(source)
	if source == localPlayer and getElementType(source) == "player" then
		if getElementData(source,"worldjob") == true then
			if getElementData(source,"jobmoney") >= 20 then
				if guiGetVisible(cashwindow) == false then
					guiSetText ( cashlabel,"سعر الاسلحة المصنوعة ["..getElementData(localPlayer,"jobmoney").." $]")
					guiSetVisible(cashwindow,true)
					showCursor(true)
				end
			else
				outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : انت لم تعمل اصلا",200,0,0,true)
			end
		else
			outputChatBox("#FF9900*#FFFFFF[#0077FF Weapon #FFFFFF] : انت لا تعمل هنا",200,0,0,true)
		end
	end
end
addEventHandler("onClientPickupHit",cashpick,openCashWindow)

function closeCashWindow(button)
	if button == "left" then
		if source == closecashwindow then
			if guiGetVisible(cashwindow) == true then
				guiSetVisible(cashwindow,false)
				showCursor(false)
			end
		end
	end
end
addEventHandler("onClientGUIClick",closecashwindow,closeCashWindow)

function giveMeCash(button)
	if button == "left" then
		if source == takecashwindow then
			triggerServerEvent("giveJobMoney",localPlayer,localPlayer)
			guiSetVisible(cashwindow,false)
			showCursor(false)
		end
	end
end
addEventHandler("onClientGUIClick",takecashwindow,giveMeCash)

Works_Job_Enter = createPickup(-86.2715,-299.3637,2.7646,3,1318,10)
--CreateBlipAttachedTo(Works_Job_Enter,47)

function onClientLeaveEnterWorksJoblLSPickup(source)
	if (source == localPlayer and getElementType(source) == "player" and not isPedInVehicle(source)) then
		toggleControl("enter_exit",true)
		unbindKey("F","down",WorksJobEnterDoor)
	end
end
addEventHandler("onClientPickupLeave",Works_Job_Enter,onClientLeaveEnterWorksJoblLSPickup)

function onClientHitEnterWorksJobPickup(source)
	if (source == localPlayer and getElementType(source) == "player" and not isPedInVehicle(source)) then
		toggleControl("enter_exit",false)
		triggerServerEvent("WorksJobEnterDoor",localPlayer,localPlayer)
	end
end
addEventHandler("onClientPickupHit",Works_Job_Enter,onClientHitEnterWorksJobPickup)

function WorksJobEnterDoor()
	triggerServerEvent("WorksJobEnterDoor",localPlayer,localPlayer)
end

Works_Job_Exit = createPickup(2577.4087,-1289.8916,1044.1250,3,1318,10)
setElementInterior(Works_Job_Exit,2)
setElementDimension(Works_Job_Exit,5)

function onClientHitExitWorksJobPickup(source)
	if (source == localPlayer and getElementType(source) == "player" and not isPedInVehicle(source)) then
		triggerServerEvent("WorksJobExitDoor",localPlayer,localPlayer)
	end
end
addEventHandler("onClientPickupHit",Works_Job_Exit,onClientHitExitWorksJobPickup)

function onClientLeaveExitWorksJobPickup(source)
	if (source == localPlayer and getElementType(source) == "player" and not isPedInVehicle(source)) then
		toggleControl("enter_exit",true)
		unbindKey("F","down",WorksJobExitDoor)
	end
end
addEventHandler("onClientPickupLeave",Works_Job_Exit,onClientLeaveExitWorksJobPickup)

function WorksJobExitDoor()
	triggerServerEvent("WorksJobExitDoor",localPlayer,localPlayer)
end

function renderJobName()
	if isElement(Works_Job_Enter) then
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(Works_Job_Enter)
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(px,py,pz+0.025*distance+0.40)
		if posx and distance <= 15 then
			dxDrawBorderedText("المدخل للوظيفه",posx-(0.5),posy-(20),posx-(0.5),posy-(20),tocolor(255,0,0,math.abs(math.sin(getTickCount()/700))*255),1,1, 2-(distance/20),"default-bold","center","top",false,false,false)
		end
	end
end
addEventHandler("onClientHUDRender",root,renderJobName)

function renderJobNameExit()
	if isElement(Works_Job_Exit) then
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(Works_Job_Exit)
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(px,py,pz+0.025*distance+0.40)
		if posx and distance <= 15 then
			dxDrawBorderedText("المخرج لوظيفه السلاح",posx-(0.5),posy-(20),posx-(0.5),posy-(20),tocolor(255,0,0,math.abs(math.sin(getTickCount()/700))*255),1,1, 2-(distance/20),"default-bold","center","top",false,false,false)
		end
	end
end
addEventHandler("onClientHUDRender",root,renderJobNameExit)

function renderJobName()
	if isElement(jobpick) then
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(jobpick)
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(px,py,pz+0.025*distance+0.40)
		if posx and distance <= 15 then
			dxDrawBorderedText("دخول / خروج من الوظيفة",posx-(0.5),posy-(20),posx-(0.5),posy-(20),tocolor(0,255,70,math.abs(math.sin(getTickCount()/700))*255),1,1, 2-(distance/20),"default-bold","center","top",false,false,false)
		end
	end
end
addEventHandler("onClientHUDRender",root,renderJobName)

function renderJobName()
	if isElement(cashpick) then
		local cx,cy,cz = getCameraMatrix()
		local px,py,pz = getElementPosition(cashpick)
		local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
		local posx,posy = getScreenFromWorldPosition(px,py,pz+0.025*distance+0.40)
		if posx and distance <= 15 then
			dxDrawBorderedText("بيع الأسلحة المصنوعة",posx-(0.5),posy-(20),posx-(0.5),posy-(20),tocolor(255,0,70,math.abs(math.sin(getTickCount()/700))*255),1,1, 2-(distance/20),"default-bold","center","top",false,false,false)
		end
	end
end
addEventHandler("onClientHUDRender",root,renderJobName)

function dxDrawBorderedText(text,left,top,right,bottom,color,scale,outlinesize,font,alignX,alignY,clip,wordBreak,postGUI,colorCoded)
	local outlinesize = math.min(scale,outlinesize)
	if outlinesize > 0 then
		for offsetX=-outlinesize,outlinesize,outlinesize do
			for offsetY=-outlinesize,outlinesize,outlinesize do
				if not (offsetX == 0 and offsetY == 0) then
					dxDrawText(text:gsub("#%x%x%x%x%x%x",""), left+offsetX, top+offsetY, right+offsetX, bottom+offsetY, tocolor(0, 0, 0, 255), scale, font, alignX, alignY, clip, wordBreak, postGUI)
				end
			end
		end
	end
	dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded)

end