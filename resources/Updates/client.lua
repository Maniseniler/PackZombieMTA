outputChatBox("#FF9900 * #00B7FFUpdate Panel By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local UpdatesMain = { gridlist = {}, window = {}, button = {} };
local UpdatesAdmin = { button = {}, window = {}, gridlist = {} };
local AddUpdate = { button = {}, window = {}, label = {}, edit = {} };
local EditUpdate = { button = {}, window = {}, label = {}, edit = {} };
local DeleteWarning = { button = {}, window = {}, label = {} };
local time = getRealTime();
local day,month,year = time.monthday ,time.month + 1,time.year + 1900
local screenW, screenH = guiGetScreenSize();

function RGBToHex(red, green, blue)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) ) then
		return nil
	end
	return string.format("#%.2X%.2X%.2X", red,green,blue);
end

function outputBar( text, r, g, b )
	local color = RGBToHex(r,g,b);
	exports["guimessages"]:outputClient ("#3399FF[Updates System] "..color..""..text.."",r,g,b);
end

function guiGridListGetSelectedItemText ( gridList, column )
    local item = guiGridListGetSelectedItem ( gridList );
    local text = guiGridListGetItemText ( gridList, item, column or 1 );
    if ( text ~= '' ) then
        return text
    else
        return false
    end
end

function guiSetAntiFlood(guiElement)
	guiSetEnabled(guiElement,false);
	local Time = 2
	setTimer(guiSetEnabled,tonumber(Time)*1000,1,guiElement,true);
	playSoundFrontEnd(27);
end

UpdatesMain.window[1] = guiCreateWindow((screenW - 590) / 2, (screenH - 390) / 2, 590, 390, "[ Server Updates | By | Elian Host Panel ]", false)
guiWindowSetSizable(UpdatesMain.window[1], false)
guiSetProperty(UpdatesMain.window[1], "CaptionColour", "FF3399FF")
guiSetVisible(UpdatesMain.window[1], false)
UpdatesMain.gridlist[1] = guiCreateGridList(10, 26, 570, 310, false, UpdatesMain.window[1])
guiGridListAddColumn(UpdatesMain.gridlist[1], "Date", 0.2)
guiGridListAddColumn(UpdatesMain.gridlist[1], "Infomation", 0.5)
guiGridListAddColumn(UpdatesMain.gridlist[1], "Author", 0.2)
UpdatesMain.button[1] = guiCreateButton(210, 345, 170, 35, "Close", false, UpdatesMain.window[1])
guiSetFont(UpdatesMain.button[1], "default-bold-small")
guiSetProperty(UpdatesMain.button[1], "NormalTextColour", "FFFA0000")
-- | TODO_ADMIN : Refresh & 
UpdatesAdmin.window[1] = guiCreateWindow((screenW - 590) / 2, (screenH - 448) / 2, 590, 448, "[ Server Updates | By | Elian Host Panel ]", false)
guiWindowSetSizable(UpdatesAdmin.window[1], false)
guiSetProperty(UpdatesAdmin.window[1], "CaptionColour", "FF3399FF")
guiSetVisible(UpdatesAdmin.window[1], false)
UpdatesAdmin.gridlist[1] = guiCreateGridList(10, 30, 570, 310, false, UpdatesAdmin.window[1])
guiGridListAddColumn(UpdatesAdmin.gridlist[1], "Date", 0.2)
guiGridListAddColumn(UpdatesAdmin.gridlist[1], "Infomation", 0.5)
guiGridListAddColumn(UpdatesAdmin.gridlist[1], "Author", 0.2)
UpdatesAdmin.button[1] = guiCreateButton(10, 350, 180, 35, "اضافة", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[1], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[1], "NormalTextColour", "FF4BC72C")
UpdatesAdmin.button[2] = guiCreateButton(205, 350, 180, 35, "مسح", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[2], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[2], "NormalTextColour", "FFFF7300")
UpdatesAdmin.button[3] = guiCreateButton(400, 350, 180, 35, "تعديل", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[3], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[3], "NormalTextColour", "FF5E00FF")
UpdatesAdmin.button[4] = guiCreateButton(10, 395, 180, 35, "مسح الكل", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[4], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[4], "NormalTextColour", "FFFA0000")
UpdatesAdmin.button[5] = guiCreateButton(205, 395, 180, 35, "نسخ", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[5], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[5], "NormalTextColour", "FFF2FF00")
UpdatesAdmin.button[6] = guiCreateButton(400, 395, 180, 35, "Close Window", false, UpdatesAdmin.window[1])
guiSetFont(UpdatesAdmin.button[6], "default-bold-small")
guiSetProperty(UpdatesAdmin.button[6], "NormalTextColour", "FFFF00FF")
-- |
AddUpdate.window[1] = guiCreateWindow((screenW - 370) / 2, (screenH - 189) / 2, 370, 189, "[ Updates Admin | Add Updates | By | DeaD ]", false)
guiWindowSetSizable(AddUpdate.window[1], false)
guiSetProperty(AddUpdate.window[1], "CaptionColour", "FF3399FF")
guiSetVisible(AddUpdate.window[1], false)
AddUpdate.label[1] = guiCreateLabel(13, 29, 46, 25, "Date :", false, AddUpdate.window[1])
guiSetFont(AddUpdate.label[1], "clear-normal")
guiLabelSetVerticalAlign(AddUpdate.label[1], "center")
AddUpdate.edit[1] = guiCreateEdit(59, 29, 188, 25, "", false, AddUpdate.window[1])
AddUpdate.button[1] = guiCreateButton(250, 29, 110, 25, "جلب الوقت", false, AddUpdate.window[1])
guiSetFont(AddUpdate.button[1], "default-bold-small")
guiSetProperty(AddUpdate.button[1], "NormalTextColour", "FF00FF00")
AddUpdate.label[2] = guiCreateLabel(13, 64, 46, 25, "Info :", false, AddUpdate.window[1])
guiSetFont(AddUpdate.label[2], "clear-normal")
guiLabelSetVerticalAlign(AddUpdate.label[2], "center")
AddUpdate.edit[2] = guiCreateEdit(59, 64, 300, 25, "", false, AddUpdate.window[1])
AddUpdate.label[3] = guiCreateLabel(13, 99, 50, 25, "Author :", false, AddUpdate.window[1])
guiSetFont(AddUpdate.label[3], "clear-normal")
guiLabelSetVerticalAlign(AddUpdate.label[3], "center")
AddUpdate.edit[3] = guiCreateEdit(74, 99, 172, 25, "", false, AddUpdate.window[1])
AddUpdate.label[4] = guiCreateLabel(0, 124, 370, 15, "______________________________________________", false, AddUpdate.window[1])
guiSetFont(AddUpdate.label[4], "clear-normal")
guiLabelSetVerticalAlign(AddUpdate.label[4], "center")
AddUpdate.button[2] = guiCreateButton(13, 149, 163, 28, "اضافة", false, AddUpdate.window[1])
guiSetFont(AddUpdate.button[2], "default-bold-small")
guiSetProperty(AddUpdate.button[2], "NormalTextColour", "FF00FFF7")
AddUpdate.button[4] = guiCreateButton(250, 99, 110, 25, "جلب اسمي الكامل", false, AddUpdate.window[1])
guiSetFont(AddUpdate.button[4], "default-bold-small")
guiSetProperty(AddUpdate.button[4], "NormalTextColour", "FF5E00FF")
AddUpdate.button[5] = guiCreateButton(197, 149, 163, 28, "اغلاق", false, AddUpdate.window[1])
guiSetFont(AddUpdate.button[5], "default-bold-small")
guiSetProperty(AddUpdate.button[5], "NormalTextColour", "FFFC0000")
-- |
EditUpdate.window[1] = guiCreateWindow((screenW - 370) / 2, (screenH - 189) / 2, 370, 189, "[ Updates Admin | Edit Updates | By | DeaD ]", false)
guiWindowSetSizable(EditUpdate.window[1], false)
guiSetProperty(EditUpdate.window[1], "CaptionColour", "FF3399FF")
guiSetVisible(EditUpdate.window[1], false)
EditUpdate.label[1] = guiCreateLabel(13, 29, 46, 25, "Date :", false, EditUpdate.window[1])
guiSetFont(EditUpdate.label[1], "clear-normal")
guiLabelSetVerticalAlign(EditUpdate.label[1], "center")
EditUpdate.edit[1] = guiCreateEdit(59, 29, 188, 25, "", false, EditUpdate.window[1])
EditUpdate.button[1] = guiCreateButton(250, 29, 110, 25, "جلب الوقت", false, EditUpdate.window[1])
guiSetFont(EditUpdate.button[1], "default-bold-small")
guiSetProperty(EditUpdate.button[1], "NormalTextColour", "FF00FF00")
EditUpdate.label[2] = guiCreateLabel(13, 64, 46, 25, "Info :", false, EditUpdate.window[1])
guiSetFont(EditUpdate.label[2], "clear-normal")
guiLabelSetVerticalAlign(EditUpdate.label[2], "center")
EditUpdate.edit[2] = guiCreateEdit(59, 64, 300, 25, "", false, EditUpdate.window[1])
EditUpdate.label[3] = guiCreateLabel(13, 99, 50, 25, "Author :", false, EditUpdate.window[1])
guiSetFont(EditUpdate.label[3], "clear-normal")
guiLabelSetVerticalAlign(EditUpdate.label[3], "center")
EditUpdate.edit[3] = guiCreateEdit(74, 99, 172, 25, "", false, EditUpdate.window[1])
EditUpdate.label[4] = guiCreateLabel(0, 124, 370, 15, "______________________________________________", false, EditUpdate.window[1])
guiSetFont(EditUpdate.label[4], "clear-normal")
guiLabelSetVerticalAlign(EditUpdate.label[4], "center")
EditUpdate.button[2] = guiCreateButton(13, 149, 163, 28, "تعديل", false, EditUpdate.window[1])
guiSetFont(EditUpdate.button[2], "default-bold-small")
guiSetProperty(EditUpdate.button[2], "NormalTextColour", "FF00FFF7")
EditUpdate.button[4] = guiCreateButton(250, 99, 110, 25, "جلب اسمي الكامل", false, EditUpdate.window[1])
guiSetFont(EditUpdate.button[4], "default-bold-small")
guiSetProperty(EditUpdate.button[4], "NormalTextColour", "FF5E00FF")
EditUpdate.button[5] = guiCreateButton(197, 149, 163, 28, "اغلاق", false, EditUpdate.window[1])
guiSetFont(EditUpdate.button[5], "default-bold-small")
guiSetProperty(EditUpdate.button[5], "NormalTextColour", "FFFC0000")
-- |
DeleteWarning.window[1] = guiCreateWindow((screenW - 284) / 2, (screenH - 117) / 2, 284, 117, "[ Updates Admin | Warning | By | DeaD ]", false)
guiWindowSetSizable(DeleteWarning.window[1], false)
guiSetProperty(DeleteWarning.window[1], "CaptionColour", "FF3399FF")
guiSetVisible(DeleteWarning.window[1], false)
DeleteWarning.label[1] = guiCreateLabel(10, 27, 264, 33, "هل انت متأكد \nانك ستمسح جميع المعلومات", false, DeleteWarning.window[1])
guiSetFont(DeleteWarning.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(DeleteWarning.label[1], "center", false)
DeleteWarning.button[1] = guiCreateButton(20, 70, 110, 30, "متأكد", false, DeleteWarning.window[1])
guiSetFont(DeleteWarning.button[1], "default-bold-small")
guiSetProperty(DeleteWarning.button[1], "NormalTextColour", "FFFC0000")
DeleteWarning.button[2] = guiCreateButton(154, 70, 110, 30, "الغاء", false, DeleteWarning.window[1])
guiSetFont(DeleteWarning.button[2], "default-bold-small")
guiSetProperty(DeleteWarning.button[2], "NormalTextColour", "FF00FFF7")

function triggerLoginCheck()
	triggerServerEvent("UpdatesSystem:RequestServerUpdates", localPlayer );
end
addCommandHandler("Updates",triggerLoginCheck);
addCommandHandler("updates",triggerLoginCheck);

addEvent("UpdatesSystem:OpenUpdatesPanel", true)
addEventHandler("UpdatesSystem:OpenUpdatesPanel", root,
function ( UpdatesTable )
	guiSetVisible(UpdatesMain.window[1], not guiGetVisible(UpdatesMain.window[1]));
	showCursor( guiGetVisible(UpdatesMain.window[1]) );
	guiGridListClear(UpdatesMain.gridlist[1]);
	for index, value in ipairs(UpdatesTable) do
		local Row = guiGridListAddRow(UpdatesMain.gridlist[1]);
		guiGridListSetItemText (UpdatesMain.gridlist[1], Row, 1, value["Date"], false, false);
		guiGridListSetItemText (UpdatesMain.gridlist[1], Row, 2, value["Info"], false, false);
		guiGridListSetItemText (UpdatesMain.gridlist[1], Row, 3, value["Author"], false, false);
		guiGridListSetItemColor(UpdatesMain.gridlist[1], Row, 1, 0,255,0);
	end
end );

-- Admin Section ["{}"]
function triggerAdminCheck()
	triggerServerEvent("UpdatesSystem:RequestAdminPanel", localPlayer, localPlayer);
end
addCommandHandler("UpdatesAdmin",triggerAdminCheck);
addCommandHandler("updatesadmin",triggerAdminCheck);
addCommandHandler("UA",triggerAdminCheck);

addEvent("UpdatesSystem:OpenAdminPanel", true)
addEventHandler("UpdatesSystem:OpenAdminPanel", root,
function ( UpdatesTable )
	guiSetVisible(UpdatesAdmin.window[1], not guiGetVisible(UpdatesAdmin.window[1]));
	showCursor( guiGetVisible(UpdatesAdmin.window[1]) );
	guiBringToFront(UpdatesAdmin.window[1]);
	if guiGetVisible(UpdatesAdmin.window[1]) == false then
		guiSetVisible(AddUpdate.window[1], false);
		guiSetVisible(EditUpdate.window[1], false);
		guiSetVisible(DeleteWarning.window[1], false);
	end
	guiGridListClear(UpdatesAdmin.gridlist[1]);
	for index, value in ipairs(UpdatesTable) do
		local AdminRow = guiGridListAddRow(UpdatesAdmin.gridlist[1]);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 1, value["Date"], false, false);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 2, value["Info"], false, false);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 3, value["Author"], false, false);
		guiGridListSetItemColor(UpdatesAdmin.gridlist[1], AdminRow, 1, 0,255,0);
	end
end );

addEvent("UpdatesSystem:RefreshAdminPanel", true)
addEventHandler("UpdatesSystem:RefreshAdminPanel", root,
function ( UpdatesTable )
	guiSetVisible(AddUpdate.window[1], false);
	guiSetVisible(EditUpdate.window[1], false);
	guiSetVisible(DeleteWarning.window[1], false);
	guiBringToFront(UpdatesAdmin.window[1]);
	guiGridListClear(UpdatesAdmin.gridlist[1]);
	for index, value in ipairs(UpdatesTable) do
		local AdminRow = guiGridListAddRow(UpdatesAdmin.gridlist[1]);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 1, value["Date"], false, false);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 2, value["Info"], false, false);
		guiGridListSetItemText (UpdatesAdmin.gridlist[1], AdminRow, 3, value["Author"], false, false);
		guiGridListSetItemColor(UpdatesAdmin.gridlist[1], AdminRow, 1, 0,255,0);
	end
end );

addEventHandler("onClientGUIClick", resourceRoot,
function ()
	if source == UpdatesMain.button[1] then
		guiSetVisible(UpdatesMain.window[1], false);
		showCursor( false );
	elseif source == UpdatesAdmin.button[1] then
		guiSetVisible(AddUpdate.window[1], true);
		guiBringToFront(AddUpdate.window[1]);
	elseif source == AddUpdate.button[1] then
		guiSetText(AddUpdate.edit[1],"["..day.."/"..month.."/"..year.."]");
	elseif source == AddUpdate.button[4] then
		guiSetText(AddUpdate.edit[3], getPlayerName(localPlayer));
	elseif source == AddUpdate.button[2] then
		if guiGetText(AddUpdate.edit[1]) ~= "" or guiGetText(AddUpdate.edit[1]) ~= " " then
			if guiGetText(AddUpdate.edit[2]) ~= "" or guiGetText(AddUpdate.edit[2]) ~= " " then
				if guiGetText(AddUpdate.edit[3]) ~= "" or guiGetText(AddUpdate.edit[3]) ~= " " then
					triggerServerEvent("UpdatesSystem:AddNewUpdate", localPlayer, localPlayer, guiGetText(AddUpdate.edit[1]), guiGetText(AddUpdate.edit[2]), guiGetText(AddUpdate.edit[3]) );
				else
					outputBar("Please Write a Text In Author Field !", 255,0,0);
				end
			else
				outputBar("Please Write a Text In Info Field !", 255,0,0);
			end
		else
			outputBar("Please Write a Text In Date Field !", 255,0,0);
		end
	elseif source == AddUpdate.button[5] then
		guiSetVisible(AddUpdate.window[1], false);
		guiBringToFront(UpdatesAdmin.window[1]);
	elseif source == UpdatesAdmin.button[2] then
		if guiGridListGetSelectedItem(UpdatesAdmin.gridlist[1]) ~= -1 then
			local Date = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 1);
			local Info = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 2);
			local Author = guiGridListGetSelectedItemText(UpdatesAdmin.gridlist[1],3);
			triggerServerEvent("UpdatesSystem:DeleteSelectedItem",localPlayer,localPlayer, Date, Info, Author);
		else
			outputBar("Please Select a Update to Delete it !",255,0,0);
		end
	elseif source == UpdatesAdmin.button[3] then
		if guiGridListGetSelectedItem(UpdatesAdmin.gridlist[1]) ~= -1 then
			local Date = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 1);
			local Info = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 2);
			local Author = guiGridListGetSelectedItemText(UpdatesAdmin.gridlist[1],3);
			guiSetText(EditUpdate.edit[1], Date);
			guiSetText(EditUpdate.edit[2], Info);
			guiSetText(EditUpdate.edit[3], Author);
			guiSetVisible(EditUpdate.window[1], true);
			guiBringToFront(EditUpdate.window[1]);
		else
			outputBar("Please Select a Update to Edit it !",255,0,0);
		end
	elseif source == EditUpdate.button[1] then
		guiSetText(EditUpdate.edit[1],"["..day.."/"..month.."/"..year.."]");
	elseif source == EditUpdate.button[4] then
		guiSetText(EditUpdate.edit[3], getPlayerName(localPlayer));
	elseif source == EditUpdate.button[5] then
		guiSetVisible(EditUpdate.window[1], false);
		guiBringToFront(EditUpdate.window[1]);
	elseif source == EditUpdate.button[2] then
		local OldDate = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 1);
		local OldInfo = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 2);
		local OldAuthor = guiGridListGetSelectedItemText(UpdatesAdmin.gridlist[1],3);
		local NewDate = guiGetText(EditUpdate.edit[1]);
		local NewInfo = guiGetText(EditUpdate.edit[2]);
		local NewAuthor = guiGetText(EditUpdate.edit[3]);
		if NewDate ~= "" or NewDate ~= " " then
			if NewInfo ~= "" or NewInfo ~= " " then
				if NewAuthor ~= "" or NewAuthor ~= " " then
					triggerServerEvent("UpdatesSystem:EditUpdate", localPlayer, localPlayer, OldDate, OldInfo, OldAuthor, NewDate, NewInfo, NewAuthor );
				else
					outputBar("Please Write a Text In Author Field !", 255,0,0);
				end
			else
				outputBar("Please Write a Text In Info Field !", 255,0,0);
			end
		else
			outputBar("Please Write a Text In Date Field !", 255,0,0);
		end
	elseif source == UpdatesAdmin.button[4] then
		guiSetVisible(DeleteWarning.window[1], true);
		guiBringToFront(DeleteWarning.window[1]);
	elseif source == DeleteWarning.button[1] then
		triggerServerEvent("UpdatesSystem:DeleteEverything", localPlayer, localPlayer);
	elseif source == DeleteWarning.button[2] then
		guiSetVisible(DeleteWarning.window[1], false);
		guiBringToFront(UpdatesAdmin.window[1]);
	elseif source == UpdatesAdmin.button[5] then
		if guiGridListGetSelectedItem(UpdatesAdmin.gridlist[1]) ~= -1 then
			local Date = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 1);
			local Info = guiGridListGetSelectedItemText (UpdatesAdmin.gridlist[1], 2);
			local Author = guiGridListGetSelectedItemText(UpdatesAdmin.gridlist[1],3);
			local CopyText = setClipboard("Date : "..Date.." \nInfo : "..Info.." \nAuthor : "..Author.." ");
			if ( CopyText ) then
				outputBar("You Have Succesflly Copied the Selected Update .",0,255,0);
			end
		else
			outputBar("Please a Update to Copy it !", 255,0,0);
		end
	elseif source == UpdatesAdmin.button[6] then
		guiSetVisible(UpdatesAdmin.window[1], false);
		guiSetVisible(EditUpdate.window[1], false);
		guiSetVisible(DeleteWarning.window[1], false);
		showCursor( guiGetVisible(UpdatesAdmin.window[1]) )
	end
end );

addEventHandler("onClientGUIClick", resourceRoot,
function ()
	if getElementType(source) == "gui-button" then
		guiSetAntiFlood(source);
	end
end );