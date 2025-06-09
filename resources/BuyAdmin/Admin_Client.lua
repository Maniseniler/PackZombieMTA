outputChatBox("#FF9900 * #00B7FFBuy Admin By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
----------------------
-- Setting
----------------------


local Key = "F7"

local Admin = {
{"كنق اوف تايم","King_Of_Time","5"},
{"بوليس","PoLice","15"},
{"موديراتور","Moderator1","25"},
{"موديراتور بليس","Moderator_Plus","40"},
{"برو موديراتور","Pro_Moderator","50"},
{"ايدل موديراتور","iDeal_Moderator","60"},
{"جينيرال موديراتور","General_Moderator","100"},
{"سوبر موديراتور","Super_Moderator","130"},
{"سوبر موديراتور بليس","Super_Moderator_Plus","160"},
{"برو سوبر موديراتور","Pro_Super_Moderator","200"},
{"ايدل سوبر موديراتور","iDeal_Super_Moderator","240"},
{"كنق سوبر موديراتور","King_Super_Moderator","280"},
{"جينيرال سوبر موديراتور","General_Super_Moderator","320"},
{"ادمن","Admin1","400"},
{"ادمن بليس","Admin_Plus","460"},
{"برو ادمن","Pro_Admin","700"},
{"ايدل ادمن","iDeal_Admin","750"},
{"كنق ادمن","king_admin","800"},
{"جينيرال ادمن","General_Admin","850"},
{"سيبر فيزيور","Supervisor","1000"},
{" سيبر فيزيور بليس","Supervisor_Plus","1080"},
{"برو سيبر فيزيور","Pro_Supervisor","2000"},
{"ايدل سيبر فيزيور","iDeal_Supervisor","2100"},
{"جينيرال سيبر فيزيور","General_Supervisor","3000"},
}


----------------------
-- Setting
----------------------
GUIEditor = {
    label = {},
    button = {},
    window = {},
    gridlist = {},
    combobox = {}
}

local screenW, screenH = guiGetScreenSize()
GUIEditor.window[1] = guiCreateWindow((screenW - 480) / 2, (screenH - 386) / 2, 480, 386, "[ Buy Admin | By | Elian Host Panel ]", false)
guiSetVisible(GUIEditor.window[1],false);
guiWindowSetSizable(GUIEditor.window[1], false);
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF0060FE") 
guiWindowSetMovable(GUIEditor.window[1], false)



GUIEditor.label[1] = guiCreateLabel(291, 423, 88, 18, "", false, GUIEditor.window[1])
guiSetFont(GUIEditor.label[1], "default-bold-small")
GUIEditor.button[1] = guiCreateButton(120, 347, 258, 28,"شراء الرتبة", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[1], "default-bold-small")
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF127500")


GUIEditor.gridlist[1] = guiCreateGridList(15, 26, 454, 311, false, GUIEditor.window[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "#", 0.1)
guiSetFont(GUIEditor.gridlist[1],FontGrid)  
row = guiGridListAddRow(GUIEditor.gridlist[1])
guiGridListAddColumn(GUIEditor.gridlist[1], "الرتبه", 0.3)
guiGridListAddColumn(GUIEditor.gridlist[1], "القروب", 0.4)
guiGridListAddColumn(GUIEditor.gridlist[1], "ساعات", 0.1)
for k,v in ipairs ( Admin ) do
row = guiGridListAddRow(GUIEditor.gridlist[1]);
guiGridListSetItemText(GUIEditor.gridlist[1],row,1,''..k..'-  ',false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,2,v[1],false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,3,v[2],false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,4,v[3],false,false)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,1,0, 144, 255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,2,255,255,255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,3,0, 144, 255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,4,255,255,255)
guiSetFont (GUIEditor.gridlist[1],"default-bold-small")
end

xMainFunctions_ = function ( )
 local row, col = guiGridListGetSelectedItem ( GUIEditor.gridlist[1] ) 
local Group = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,3 ));
local Price = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,4 ));
local Name = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,2 ));
   if ( row and col and row ~= -1 and col ~= -1 ) then
triggerServerEvent("Accept:the:request",localPlayer,Group,Price,Name);
  else
outputChatBox("#ff4f00* #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 ألرجاء اختيار الرتبة", 255, 255, 255, true )
  end
end
addEventHandler("onClientGUIClick",GUIEditor.button[1],xMainFunctions_,false);

xBindFunction_ = function ()
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]));
	showCursor(guiGetVisible(GUIEditor.window[1]));
end
bindKey(Key,"down",xBindFunction_);

-------------------------------------------------------
addEventHandler ( "onClientMouseEnter", root,
	function ( )
		if source == X then
			guiSetAlpha ( X, 0.8 )
			playSoundFrontEnd ( 3 )		
		elseif source == GUIEditor.button[1] then
			guiSetAlpha ( GUIEditor.button[1], 0.8 )
			playSoundFrontEnd ( 3 )		
		end
	end
)

addEventHandler ( "onClientMouseLeave", root,
	function ( )	
		if source == X then
			guiSetAlpha ( X, 1 )
			playSoundFrontEnd ( 3 )		
		elseif source == GUIEditor.button[1] then
			guiSetAlpha ( GUIEditor.button[1], 1 )
			playSoundFrontEnd ( 3 )		
		end
	end
)
----------------------------------------------------------
addEventHandler("onClientGUIClick",root,
	function ()
		if ( source == X ) then
		guiSetVisible(GUIEditor.window[1], false)
		showCursor(false)
		end
	end
)
----------------------------------------------------------
fileDelete("Admin_Client.lua")