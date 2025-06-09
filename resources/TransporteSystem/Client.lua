--***********************************--
--***********************************--
--          [Missions]Transporter    --
--            By DeaD             --
--***********************************--
--***********************************--
---
---
lp = getLocalPlayer()
rRoot = getResourceRootElement(getThisResource())
---
function showTransWin()
	guiSetVisible(TransWindow,true)
	showCursor(true)
	guiBringToFront(TransWindow)
end
addEvent("showTransWin",true)
addEventHandler("showTransWin",root,showTransWin)

function startTransporterMission()
	triggerServerEvent("startTransporterMission",lp,lp)
end

function centerWindow(center_window)
    local screenW,screenH=guiGetScreenSize()
    local windowW,windowH=guiGetSize(center_window,false)
    local x,y = (screenW-windowW)/2,(screenH-windowH)/2
    guiSetPosition(center_window,x,y,false)
end

function closeWindow()
		guiSetVisible(TransWindow,false)
		showCursor(false)
end

function missionDone(won)
	if won == true then
		missionDone = playSound("missionDone.mp3")
	else
		missionFail = playSound("fail.mp3")
	end
end
addEvent("missionDone",true)
addEventHandler("missionDone",root,missionDone)

addEventHandler("onClientResourceStart",rRoot,function()
	triggerServerEvent("requestDx",lp,lp)
	--
	TransWindow = guiCreateWindow(530,222,251,249,"[ Transporter Mission | By |DeaD ]",false)
	guiSetVisible(TransWindow,false)
	TransMemo = guiCreateMemo(12,28,227,141,"Transporter Mission :\n\nسيتم اعطائك سيارة و راكب و يجب ايصاله الى وجهته اذا و صل صحة السيارة الى 30/100 سيتم الغاء المهمة تلقائيا المود من قبل دياد و خالد ",false,TransWindow)
	TransLabel = guiCreateLabel(41,175,168,18,"هل  قبلت المهمة ؟        ",false,TransWindow)
	TransButtonYes = guiCreateButton(10,199,107,35,"موافق",false,TransWindow)
	TransButtonNo = guiCreateButton(126,199,107,35,"الغاء",false,TransWindow)
	if TransWindow then
		guiWindowSetSizable	(TransWindow,false)
		guiWindowSetMovable	(TransWindow,false)
		centerWindow(TransWindow)
		--
		addEventHandler("onClientGUIClick",root,function()
			if source == TransButtonYes then
				startTransporterMission()
				closeWindow()
			elseif source == TransButtonNo then
				closeWindow()
			end
		end )
	end
end )

function makeTexts(dxTexts,maxDis)
	if ( dxTexts and type(dxTexts) == "table" ) then
		addEventHandler("onClientRender",getRootElement(),function()
			local px,py,pz = getElementPosition(getLocalPlayer())		
			for k,v in ipairs ( dxTexts ) do	
			local sx, sy, sz = v[1],v[2],v[3] + 1
			local c1,c2,c3 =  0,255,0
			local size =  1.2
			local font = "default-bold"
			local site = isLineOfSightClear (px,py,pz,sx,sy,sz,true,true,true,true,false,true,false,lp)
				if (  c1 and c2 and c3 and size and font and site) then
					local x,y = getScreenFromWorldPosition(sx, sy, sz)
						if x then
							local dis = getDistanceBetweenPoints3D(sx, sy, sz,px,py,pz)
								if dis and dis < maxDis then
									dxDrawText("مهمة التوصيل", x, y, x, y, tocolor(c1,c2,c3),size,font)
								end
						end
				end
			end
		end	)
	end
end

function startDxDrawing(posTable,maxDis)
	if ( tonumber(maxDis) and posTable and type(posTable) == "table" ) then
		makeTexts(posTable,maxDis)
	end
end
addEvent("startDxDrawing",true)
addEventHandler("startDxDrawing",root,startDxDrawing)