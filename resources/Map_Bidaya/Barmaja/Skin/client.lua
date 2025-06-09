GUIEditor = {
    gridlist = {},
    window = {},
    label = {}
}
local screenW, screenH = guiGetScreenSize()

Wnd = guiCreateWindow((screenW - 406) / 2, (screenH - 491) / 2, 406, 491, "[ Skin Panel | By | Brothers Host ]",false)
guiSetProperty(Wnd, "CaptionColour", "970053FE")

        DeaD = guiCreateButton(126, 331, 160, 35, "استعادة", false, Wnd)
        guiSetFont(DeaD, "default-bold-small")
        guiSetProperty(DeaD, "NormalTextColour", "FFFE0000")    

GUIEditor.label[2] = guiCreateLabel(171, 391, 224, 19, "اضغط دبل كليك على الشخصية التي تريدها", false, Wnd)
        guiSetFont(GUIEditor.label[2], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[2], 41, 253, 0)
        GUIEditor.label[3] = guiCreateLabel(137, 452, 199, 24, "يجب ان يكون بحوزتك 500", false, Wnd)
        guiSetFont(GUIEditor.label[3], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[3], 0, 214, 252)    
button = guiCreateButton(370,27,35,14,"X",false,Wnd)

guiSetFont(button, "default-bold-small")
guiSetProperty(button, "NormalTextColour", "FFFE0000") 

Label2 = guiCreateLabel(138, 41, 287, 23, "{ Welcome To Server }",false,Wnd)
guiSetFont(Label2, "default-bold-small")
guiLabelSetColor(Label2,0,255,15)
guiLabelSetColor(Label1,255,0,0)
showCursor(false)
guiSetVisible( Wnd, false )
guiWindowSetSizable( Wnd, false )
guiWindowSetMovable( Wnd, false )

    vehicles =
            {
            {"Army - ارمي", 284},
            {"Girl - بنت", 85},
            {"Cat - قطة", 58},
            }
     
    grid = guiCreateGridList(9,74,394,219,false,Wnd)
    guiGridListAddColumn(grid,"Skins",0.9)
     
    for i,veh in ipairs(vehicles) do
         row = guiGridListAddRow(grid)
         --
         guiGridListSetItemText(grid, row, 1, tostring(veh[1]), false, false)
         guiGridListSetItemData(grid, row, 1, tostring(veh[2]))
guiGridListSetItemColor ( grid, row, 1, math.random(255), math.random(255), math.random(255) )
    end
     
    function use()
         local row, col = guiGridListGetSelectedItem(grid)  
         if (row and col and row ~= -1 and col ~= -1) then
              local model = tonumber(guiGridListGetItemData(grid, row, 1))
              if model ~= "" then
                   triggerServerEvent("useSkin", localPlayer, model)
              end
         end
    end
    addEventHandler("onClientDoubleClick", root, use, false)
	
	function close()
	if (source == button) then
	guiSetVisible(Wnd,false)
	showCursor(false)
	end
	end
	addEventHandler("onClientGUIClick", button, close)
	
function guishowc()
guiSetVisible(Wnd,true)
showCursor(true)
end
addEvent("guishowc",true)
addEventHandler("guishowc", getRootElement(), guishowc)
        function Ins()
	if (source == DeaD) then
	outputChatBox('#FF9900 * #FFFFFF[#00ffc4 Skin #FFFFFF] :#FF0000 انقر 3 مرات على الزر لاستعادة شخصيتك ',255,255,255,true)
end
	end
addEventHandler("onClientGUIClick", DeaD, Ins)
	