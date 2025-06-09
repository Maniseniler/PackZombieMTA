

function createGUI(thePlayer)
	cWindow = 	guiCreateWindow(988,431,288,155,"Air Forces Aircraft Carrier 69",false)
	button1 = 	guiCreateButton(13,29,77,33,"Open Rear Door",false,cWindow)
	button2 = 	guiCreateButton(13,71,77,33,"Raise Main   Lift",false,cWindow)
	button3 = 	guiCreateButton(13,112,77,33,"Raise Side    Lift",false,cWindow)
	buttonA = 	guiCreateButton(102,29,77,33,"Close Rear Door",false,cWindow)
	buttonB = 	guiCreateButton(102,71,77,33,"Lower Main   Lift",false,cWindow)
	buttonC = 	guiCreateButton(102,112,77,33,"Lower Side     Lift",false,cWindow)
	button7 = 	guiCreateButton(207,112,72,33,"Done",false,cWindow)
	ON      = 	guiCreateButton(207,27,72,33,"Missiles ON",false,cWindow)
	OFF     = 	guiCreateButton(207,70,71,33,"Missiles OFF",false,cWindow)
	addEventHandler("onClientGUIClick", button1, function() triggerServerEvent("rearDoorBut", root) end, false)
	addEventHandler("onClientGUIClick", button2, function() triggerServerEvent("mainLiftBut", root) end, false)
	addEventHandler("onClientGUIClick", button3, function() triggerServerEvent("sideLiftBut", root) end, false)
	addEventHandler("onClientGUIClick", buttonA, function() triggerServerEvent("rearDoorButD", root) end, false)
	addEventHandler("onClientGUIClick", buttonB, function() triggerServerEvent("mainLiftButD", root) end, false)
	addEventHandler("onClientGUIClick", buttonC, function() triggerServerEvent("sideLiftButD", root) end, false)
	addEventHandler("onClientGUIClick", button7, closeCgui, false)
	guiSetVisible(cWindow, false)
        guiSetAlpha(cWindow,1)
end
addEventHandler("onClientResourceStart", resourceRoot, createGUI)

function openGUI()
	if (guiGetVisible(cWindow) == false) then
		guiSetVisible(cWindow,true)
		showCursor(true)
	else
		guiSetVisible(cWindow,false)
		showCursor(false)
	end
end
addEvent("makeGUI", true)
addEventHandler("makeGUI", getLocalPlayer(), openGUI)

function closeCgui()
	guiSetVisible (cWindow, false)
	showCursor(false)
end



setVehicleAdjustableProperty ( Rhino, 5000 )

function ReplaceModel() 
txd = engineLoadTXD ( "swat.txd" )
engineImportTXD ( txd, 285 )
dff = engineLoadDFF ( "swat.dff", 285 )
engineReplaceModel ( dff, 285 )
end

addEventHandler("onClientResourceStart",resourceRoot,
function ()
        setTimer ( ReplaceModel, 300, 1)
end)