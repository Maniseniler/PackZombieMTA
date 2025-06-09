GUIEditor = {
    checkbox = {},
    label = {},
    radiobutton = {},
    button = {},
    window = {},
    edit = {},
    gridlist = {}
}
outputChatBox("#FF9900 * #00B7FFSupprot System By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local x, y = guiGetScreenSize()
local rx, ry = (x/800), (y/600)

function centerWindow(window)
  local screenW, screenH = guiGetScreenSize()
  local windowW, windowH = guiGetSize(window, false)
  local x, y = (screenW - windowW) / 2, (screenH - windowH) / 2
  guiSetPosition(window, x, y, false)
end

function sendClientMessage(message)
	exports.guimessages:outputClient("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : "..message, 255, 0, 0)
end

function setPlayerLastMessage(Player, Message)
	if Player and Message and type(Message) == "string" then
		setElementData(Player, "LastMessage", Message)
	end
end

function getPlayerLastMessage(Player)
	if Player then
		local Data = getElementData(Player, "LastMessage")
		return Data
	end
end

function openSupWindow(window)
	if window then
		guiSetVisible(window, true)
		guiBringToFront(window)
		guiSetAlpha(SupportWindow, 0.5)
		guiSetEnabled(SupportWindow, false)
	end
end

function closeSupWindow(window)
	if window then
		guiSetVisible(window, false)
		guiSetAlpha(SupportWindow, 0.8)
		guiSetEnabled(SupportWindow, true)
	end
end

function setPlayerStat(player, stat)
	if player and stat then
		setElementData(player, "stat", tostring(stat))
		triggerServerEvent("SupportSystem:setPlayerStat", localPlayer, stat)
	end
end

local Punishments = {
{"Mute Player"},
{"Ban Player"},
{"Clear Player Chat"}
}
----------------------------------------------------#Windows#-----------------------------------------------------
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        SupportWindow = guiCreateWindow(0, 0, rx*596, ry*385, "[ Support Chat | By | Elian Host Panel ]", false)
        guiWindowSetSizable(SupportWindow, false)
		guiSetVisible(SupportWindow, false)
		centerWindow(SupportWindow)
        guiSetProperty(SupportWindow, "CaptionColour", "FF00AAFF")
        SupportList = guiCreateGridList(rx*9, ry*25, rx*172, ry*243, false, SupportWindow)
		guiSetFont(SupportList, "default-bold-small")
        guiGridListAddColumn(SupportList, "Supporters", 0.9)




        
        support = guiCreateRadioButton(rx*63, ry*274, rx*64, ry*15, "Support", false, SupportWindow)
        guiSetProperty(support, "NormalTextColour", "FF00FF00")
		guiSetFont(support, "default-bold-small")
        out_cheak = guiCreateCheckBox(rx*12, ry*297, rx*169, ry*15, "اضهار الرسالة في الشات", false, false, SupportWindow)
       
        MessagesGridList = guiCreateGridList(rx*187, ry*25, rx*399, ry*327, false, SupportWindow)
		guiSetFont(MessagesGridList, "default-bold-small")
        guiGridListAddColumn(MessagesGridList, "Messages", 2)
		guiSetFont(out_cheak, "default-bold-small")
		guiSetFont(play_cheak, "default-bold-small")
		guiSetFont(filter_cheak, "default-bold-small")
		guiSetProperty(out_cheak, "NormalTextColour", "FFFF0000")
		guiSetProperty(play_cheak, "NormalTextColour", "FFFF0000")
		guiSetProperty(filter_cheak, "NormalTextColour", "FFFF0000")
        sendbutton = guiCreateButton(rx*186, ry*356, rx*70, ry*19, "ارسال", false, SupportWindow)
        guiSetProperty(sendbutton, "NormalTextColour", "FF1C9618")
		guiSetFont(sendbutton, "default-bold-small")			
        sendedit = guiCreateEdit(rx*261, ry*355, rx*325, ry*20, "", false, SupportWindow)
        adminbutton = guiCreateButton(rx*12, ry*356, rx*169, ry*19, "الاعدادت", false, SupportWindow)
        guiSetProperty(adminbutton, "NormalTextColour", "FF00BFFF")
		guiSetFont(adminbutton, "default-bold-small")	
		--------------------------------------------------------------------------------------------
	Rules = guiCreateButton(rx*100, ry*312, rx*70, ry*19, "القوانين", false, SupportWindow)
        guiSetProperty(Rules, "NormalTextColour", "FFFF0000")
		guiSetFont(Rules, "default-bold-small")			
		       Rules_Window = guiCreateWindow(704, 358, 423, 378, "[ Roles F5 | By | Elian Host Panel ]", false)
        guiWindowSetSizable(Rules_Window, false)
		guiSetVisible(Rules_Window, false)
        guiSetAlpha(Rules_Window, 1.00)
		guiSetProperty(Rules_Window, "CaptionColour", "FFFE0000")

        Support_Rules = guiCreateMemo(9, 27, 404, 296, "                                      Support Chat\n\n1 - عدم السب او الشتم    | العقوبة  : ميوت                   \n\n2 - النشر = مسح الشات + صكه باند                       \n\n3 - اي مشكلة او شكوى على الدعم اكتب في اف8 report         \n\n 4 - للحصول على دعم ساعد الزوار واذ شافتك الادارة تحطك دعم      \n\n5 - يجب عدم الاستهزاء من الدعم الى الزائر ومن الزائر الي الدعم     \n\n6 - يمنع منعا باتا اللعب في الازرار مسح الشات و الميوت          \n\n7 - مسح الشات =في الساعه مرة واحدة فقط                 \n\n8 - اعطاء ميوت = للي يسولف او الي يشتم                  ", false, Rules_Window)
        guiMemoSetReadOnly(Support_Rules, true)
        exx = guiCreateButton(141, 338, 127, 24, "اغلاق", false, Rules_Window)
		guiSetFont(exx, "default-bold-small")
        guiSetProperty(exx, "NormalTextColour", "FF00FBFD")   
		---------------------------------------------------------------------------------------
			

		--
        OptionWindow = guiCreateWindow(0, 0, 226, 132, "خيارات", false)
        guiWindowSetSizable(OptionWindow, false)
		guiSetVisible(OptionWindow, false)
		centerWindow(OptionWindow)

        Copy = guiCreateButton(9, 23, 207, 31, "نسخ الرسالة", false, OptionWindow)
        guiSetProperty(Copy, "NormalTextColour", "FF1C9618")
        guiSetFont(Copy, "default-bold-small")		
        RemoveMessage = guiCreateButton(9, 58, 207, 31, "مسح الرسالة", false, OptionWindow)
        guiSetProperty(RemoveMessage, "NormalTextColour", "FFFF0000")
		guiSetFont(RemoveMessage, "default-bold-small")	
        CloseOptions = guiCreateButton(9, 93, 207, 31, "اغلاق", false, OptionWindow)
        guiSetProperty(CloseOptions, "NormalTextColour", "FF00BFFF")  
		guiSetFont(CloseOptions, "default-bold-small")	
		--
        ControlWindow = guiCreateWindow(0, 0, 379, 295, "[ الاعدادت ]", false)
        guiWindowSetSizable(ControlWindow, false)
		guiSetVisible(ControlWindow, false)
		centerWindow(ControlWindow)

        PlayersGridList = guiCreateGridList(9, 23, 360, 172, false, ControlWindow)
        guiGridListAddColumn(PlayersGridList, "اللاعبون", 0.5)
		guiGridListAddColumn(PlayersGridList, "الميوت", 0.2)
		guiGridListAddColumn(PlayersGridList, "الباند", 0.2)
		guiSetFont(PlayersGridList, "default-bold-small")
        clearchat = guiCreateButton(10, 198, 176, 26, "مسح شات المساعدة", false, ControlWindow)
        guiSetProperty(clearchat, "NormalTextColour", "FF00FFF7")
		guiSetFont(clearchat, "default-bold-small")	
        showlogs = guiCreateButton(193, 198, 176, 26, "سجل شات المساعدة", false, ControlWindow)
		guiSetEnabled ( showlogs, false )
        guiSetProperty(showlogs, "NormalTextColour", "FF00FF88")
		guiSetFont(showlogs, "default-bold-small")	
        punish = guiCreateButton(10, 228, 176, 26, "معاقبة الاعب", false, ControlWindow)
        guiSetProperty(punish, "NormalTextColour", "FFFFE100")
		guiSetFont(punish, "default-bold-small")	
        changestates = guiCreateButton(193, 228, 176, 26, "تغيير وظيفة الاعب", false, ControlWindow)
        guiSetProperty(changestates, "NormalTextColour", "FF9D00FF")
        guiSetFont(changestates, "default-bold-small")			
        CloseControls = guiCreateButton(10, 258, 359, 26, "اغلاق اللوحة", false, ControlWindow)
        guiSetProperty(CloseControls, "NormalTextColour", "FFFF0000") 
        guiSetFont(CloseControls, "default-bold-small")		
		--
        HistoryWindow = guiCreateWindow(0, 0, 491, 344, "السجل", false)
        guiWindowSetSizable(HistoryWindow, false)
		guiSetVisible(HistoryWindow, false)
		centerWindow(HistoryWindow)
		
        HistoryList = guiCreateGridList(9, 22, 472, 282, false, HistoryWindow)
        guiGridListAddColumn(HistoryList, "Logs", 2)
        CloseHistory = guiCreateButton(9, 306, 472, 28, "اغلاق اللوحة", false, HistoryWindow)
        guiSetProperty(CloseHistory, "NormalTextColour", "FFFF0000")
        guiSetFont(CloseHistory, "default-bold-small")			
		--
        Punishment_Window = guiCreateWindow(232, 133, 336, 346, ":: لوحة المعاقبات  ::", false)
        guiWindowSetSizable(Punishment_Window, false)
		centerWindow(Punishment_Window)
		guiSetVisible(Punishment_Window, false)

        Punishment_GridList = guiCreateGridList(9, 24, 317, 143, false, Punishment_Window)
        guiGridListAddColumn(Punishment_GridList, "العقابات", 0.9)
				guiSetFont(Punishment_GridList, "default-bold-small")
        Punishment_Label1 = guiCreateLabel(10, 173, 67, 15, "صنف المدة : ", false, Punishment_Window)
        guiSetFont(Punishment_Label1, "default-bold-small")
        guiLabelSetVerticalAlign(Punishment_Label1, "bottom")
        Punishment_Box = guiCreateComboBox(81, 173, 245, 85, "", false, Punishment_Window)
         guiComboBoxAddItem(Punishment_Box, "Sec")
        guiComboBoxAddItem(Punishment_Box, "Min")
        guiComboBoxAddItem(Punishment_Box, "Hour")
        guiComboBoxAddItem(Punishment_Box, "Day") 
		guiSetFont(Punishment_Box, "default-bold-small")
        Punishment_Label2 = guiCreateLabel(10, 203, 67, 15, "المدة :", false, Punishment_Window)
        guiSetFont(Punishment_Label2, "default-bold-small")
        guiLabelSetVerticalAlign(Punishment_Label2, "center")
        Punishment_TimeEdit = guiCreateEdit(81, 203, 245, 19, "", false, Punishment_Window)
        Punishment_Label3 = guiCreateLabel(10, 228, 67, 15, "السبب :", false, Punishment_Window)
        guiSetFont(Punishment_Label3, "default-bold-small")
        guiLabelSetVerticalAlign(Punishment_Label3, "center")
        Punishment_ReasonEdit = guiCreateEdit(81, 228, 245, 19, "", false, Punishment_Window)
        Punishment_Punish = guiCreateButton(9, 258, 317, 23, "معاقبة", false, Punishment_Window)
        guiSetFont(Punishment_Punish, "default-bold-small")
        guiSetProperty(Punishment_Punish, "NormalTextColour", "FFFF0000")
        Punishment_Remove_Punish = guiCreateButton(9, 286, 317, 23, "حذف المعاقبة", false, Punishment_Window)
        guiSetFont(Punishment_Remove_Punish, "default-bold-small")
        guiSetProperty(Punishment_Remove_Punish, "NormalTextColour", "FF00FF88")
        Punishment_Close = guiCreateButton(9, 313, 317, 23, "اغلاق اللوحة", false, Punishment_Window)
        guiSetFont(Punishment_Close, "default-bold-small")
        guiSetProperty(Punishment_Close, "NormalTextColour", "FF9D00FF")
		--
        BanWindow = guiCreateWindow(0, 0, 430, 202, "عذرا لقد تم صكك من شات المساعدة", false)
        guiWindowSetSizable(BanWindow, false)
		guiSetVisible(BanWindow, false)
		centerWindow(BanWindow)

        LabelEtc = guiCreateLabel(95, 27, 248, 15, "عذرا لقد تم صكك من شات المساعدة", false, BanWindow)
        guiSetFont(LabelEtc, "default-bold-small")
        guiLabelSetColor(LabelEtc, 255, 0, 0)
        BReason = guiCreateLabel(12, 58, 418, 15, " N/A : سبب الباند", false, BanWindow)
        guiSetFont(BReason, "default-bold-small")
        BTime = guiCreateLabel(12, 77, 418, 15, " N/A : وقت الباند", false, BanWindow)
        guiSetFont(BTime, "default-bold-small")
        BTime2 = guiCreateLabel(12, 96, 418, 15, " N/A : المدة المتبقية", false, BanWindow)
        guiSetFont(BTime2, "default-bold-small")
        BAdmin = guiCreateLabel(12, 115, 418, 15, " N/A : الادمن يلي صكك", false, BanWindow)
        guiSetFont(BAdmin, "default-bold-small")
        ok = guiCreateButton(154, 164, 123, 28, "حسنا شكرا", false, BanWindow)
        guiSetProperty(ok, "NormalTextColour", "FF00FFF7")  
		--
        StatWindow = guiCreateWindow(458, 331, 365, 138, ":: تغيير وظيفة الاعب ::", false)
        guiWindowSetSizable(StatWindow, false)
		guiSetVisible(StatWindow, false)
		centerWindow(StatWindow)

        StatLabel = guiCreateLabel(10, 28, 81, 15, "الوظيفة : ", false, StatWindow)
        guiSetFont(StatLabel, "default-bold-small")
        guiLabelSetVerticalAlign(StatLabel, "bottom")
        StatBox = guiCreateComboBox(90, 28, 265, 77, "", false, StatWindow)
        guiSetFont(StatBox, "default-bold-small")
        guiComboBoxAddItem(StatBox, "player")
        guiComboBoxAddItem(StatBox, "support")
        guiComboBoxAddItem(StatBox, "offline")
        Change = guiCreateButton(9, 60, 346, 29, "تغيير", false, StatWindow)
                guiSetFont(Change, "default-bold-small")
        guiSetProperty(Change, "NormalTextColour", "FF00FFF7")
        StatClose = guiCreateButton(9, 95, 346, 29, "اغلاق", false, StatWindow)
                guiSetFont(StatClose, "default-bold-small")
        guiSetProperty(StatClose, "NormalTextColour", "FFFF0000")
		--
		setElementData(localPlayer, "stat", "player")
    end
)
------------------------------------------------------------------------------------------------------------------------------------------------
function OpenSupportWindow()
	if getElementData(localPlayer, "SupportBan") then
		guiSetVisible(BanWindow, not guiGetVisible(BanWindow))
		showCursor(guiGetVisible(BanWindow))
	else
		if guiGetVisible(SupportWindow) then
			guiSetVisible(SupportWindow, false)
			guiSetVisible(ControlWindow, false)
			
			guiSetVisible(OptionWindow, false)
			guiSetVisible(HistoryWindow, false)
			guiSetVisible(Punishment_Window, false)
			guiSetVisible(StatWindow, false)
			guiSetVisible(BanWindow, false)
			showCursor(false)
		else
			guiSetVisible(SupportWindow, true)
			guiSetEnabled(SupportWindow, true)
			showCursor(true)
			guiSetInputMode("no_binds_when_editing")
			guiSetVisible(RemoveMessage, false)
			guiSetVisible(adminbutton, false)
			guiSetVisible(support, false)
			guiSetAlpha(SupportWindow, 0.8)
			triggerServerEvent("SupportSystem:CheakIsAdmin", localPlayer)
			refreshSupportList()
		end
	end
end
bindKey("F5", "down", OpenSupportWindow)
addCommandHandler("support", OpenSupportWindow)

addEvent("SupportSystem:PlayerIsAnAdmin", true)
addEventHandler("SupportSystem:PlayerIsAnAdmin", root,
function()
	guiSetVisible(RemoveMessage, true)
	guiSetVisible(adminbutton, true)
	guiSetVisible(support, true)
end)

addEventHandler("onClientPreRender", root,
function()
	if getElementData(localPlayer, "SupportMute") then
		guiSetEnabled(sendedit, false)
		guiSetText(sendedit, ""..getElementData(localPlayer, "SMuteTimer").." | Reason: "..getElementData(localPlayer, "SMuteReason").." |By: "..getElementData(localPlayer, "SMuteBy").." .")
	else
		guiSetEnabled(sendedit, true)
	end
	if getElementData(localPlayer, "SupportBan") and guiGetVisible(BanWindow) then
		guiSetText(BReason, "Ban Reason : "..getElementData(localPlayer, "SBanReason"))
		guiSetText(BTime, "Ban Time : "..getElementData(localPlayer, "SBanTime"))
		guiSetText(BTime2, "Time untill your ban end : "..getElementData(localPlayer, "SBanTimer"))
		guiSetText(BAdmin, "Responsible Admin : "..getElementData(localPlayer, "SBanBy"))
	end
end)

addEvent("SupportSystem:CloseWindow", true)
addEventHandler("SupportSystem:CloseWindow", root,
function()
	guiSetVisible(SupportWindow, false)
	guiSetVisible(ControlWindow, false)
	guiSetVisible(OptionWindow, false)
	guiSetVisible(HistoryWindow, false)
	guiSetVisible(Punishment_Window, false)
	showCursor(false)
	guiCheckBoxSetSelected(out_cheak, false)
	guiRadioButtonSetSelected(player, true)
	setElementData(localPlayer, "stat", "player")
end)
------------------------------------------------------------------------------------------------------------------------------------------------
addEventHandler("onClientGUIClick", resourceRoot,
function()
	if source == sendbutton then
		local Message = guiGetText(sendedit)
		if Message and tostring(Message) ~= "" or tostring(Message) ~= " " then
			if getElementData(localPlayer, "SupportMute") ~= true then
				if getElementData(localPlayer, "stat") ~= "offline" then
					if getPlayerLastMessage(localPlayer) ~= Message then
						triggerServerEvent("SupportSystem:RequestMessage", localPlayer, Message)
						setPlayerLastMessage(localPlayer, Message)
						guiSetText(sendedit, "")
					else
						sendClientMessage("don't repeat the message twice !")
					end
				else
					sendClientMessage("you are offline, please change your states to player first !")
				end
			else
				sendClientMessage("you are muted from support chat, please wait untill your mute finish !")
			end
		else
			sendClientMessage("please write any message in the edit box !")
		end
	end
end)

addEventHandler("onClientKey", root,
function(key,press)
	if key == "enter" and press and guiGetVisible(SupportWindow) then
		local Message = guiGetText(sendedit)
		if Message and tostring(Message) ~= "" or tostring(Message) ~= " " then
			if getElementData(localPlayer, "SupportMute") ~= true then
				if getElementData(localPlayer, "stat") ~= "offline" then
					if getPlayerLastMessage(localPlayer) ~= Message then
						triggerServerEvent("SupportSystem:RequestMessage", localPlayer, Message)
						setPlayerLastMessage(localPlayer, Message)
						guiSetText(sendedit, "")
					else
						sendClientMessage("don't repeat the message twice !")
					end
				else
					sendClientMessage("you are offline, please change your states to player first !")
				end
			else
				sendClientMessage("you are muted from support chat, please wait untill your mute finish !")
			end
		else
			sendClientMessage("please write any message in the edit box !")
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------
addEventHandler("onClientGUIDoubleClick", resourceRoot,
function()
	if source == MessagesGridList and guiGridListGetSelectedItem(MessagesGridList) ~= -1 then
		openSupWindow(OptionWindow)
	end
end
)
------------------------------------------------------------------------------------------------------------------------------------------------
addEventHandler("onClientGUIClick", resourceRoot,
function()
	if source == Copy then
		local mes = guiGridListGetItemText(MessagesGridList, guiGridListGetSelectedItem(MessagesGridList), 1)
		setClipboard(tostring(mes))
		sendClientMessage("#00ff00selected message has copied succsesfully !")
	elseif source == CloseOptions then
		closeSupWindow(OptionWindow)
	elseif source == CloseHistory then
		closeSupWindow(HistoryWindow)
	elseif source == CloseControls then
		closeSupWindow(ControlWindow)
	elseif source == Punishment_Close then
		closeSupWindow(Punishment_Window)
	elseif source == ok then
		guiSetVisible(BanWindow, false)
		showCursor(false)
	elseif source == showlogs then
		openSupWindow(HistoryWindow)
		triggerServerEvent("SupportSystem:RequestLogs", localPlayer)
	elseif source == adminbutton then
		openSupWindow(ControlWindow)
		refreshPlayerList()
	elseif source == punish and guiGridListGetSelectedItem(PlayersGridList) ~= -1 then
		openSupWindow(Punishment_Window)
		refreshPunishments()
	elseif source == offline then
		setPlayerStat(localPlayer, "offline")
		sendClientMessage("your support statues has changed to offline")
		refreshSupportList()
	elseif source == support then
		setPlayerStat(localPlayer, "support")
		sendClientMessage("#00ff00your support statues has changed to support")
		refreshSupportList()
	elseif source == player then
		setPlayerStat(localPlayer, "player")
		sendClientMessage("your support statues has changed to player")
		refreshSupportList()
	elseif source == clearchat then
		triggerServerEvent("SupportSystem:RequestClearTheChat", localPlayer)
	elseif source == RemoveMessage then
		local Message = guiGridListGetSelectedItem(MessagesGridList)
		if Message and Message ~= -1 then
			triggerServerEvent("SupportSystem:RequestRemoveMessage", localPlayer, Message)
		end
	elseif source == Punishment_Punish and guiComboBoxGetSelected(Punishment_Box) ~= -1 then
		local playerName = guiGridListGetItemText(PlayersGridList, guiGridListGetSelectedItem(PlayersGridList), 1)
		local Reason = guiGetText(Punishment_ReasonEdit) or "No Reason"
		local Time = guiGetText(Punishment_TimeEdit) or 60
		local Type = guiComboBoxGetItemText(Punishment_Box, guiComboBoxGetSelected(Punishment_Box))
		local Punish = guiGridListGetItemText(Punishment_GridList, guiGridListGetSelectedItem(Punishment_GridList), 1)
		if Punish == "Mute Player" then
			mutePlayer(playerName, Reason, Time, Type)
		elseif Punish == "Ban Player" then
			BanPlayerS(playerName, Reason, Time, Type)
		elseif Punish == "Clear Player Chat" then
			triggerServerEvent("SupportSystem:RequestClearPlayerChat", localPlayer, playerName, Reason)
		end
		refreshSupportList()
	elseif source == Punishment_Remove_Punish then
		local playerName = guiGridListGetItemText(PlayersGridList, guiGridListGetSelectedItem(PlayersGridList), 1)
		local Punish = guiGridListGetItemText(Punishment_GridList, guiGridListGetSelectedItem(Punishment_GridList), 1)
		if Punish == "Mute Player" then
			unMutePlayer(playerName)
		elseif Punish == "Ban Player" then
			unBanPlayer(playerName)
		end
		refreshSupportList()
	elseif source == changestates and guiGridListGetSelectedItem(PlayersGridList) ~= -1 then
		openSupWindow(StatWindow)
	elseif source == StatClose then
		closeSupWindow(StatWindow)
	elseif source == Change and guiComboBoxGetSelected(StatBox) ~= -1 then
		local Stat = guiComboBoxGetItemText(StatBox, guiComboBoxGetSelected(StatBox))
		local playerName = guiGridListGetItemText(PlayersGridList, guiGridListGetSelectedItem(PlayersGridList), 1)
		triggerServerEvent("SupportSystem:adminSetStat", localPlayer, getPlayerFromName(playerName), Stat)
		refreshSupportList()
	end
end
)
------------------------------------------------------------------------------------------------------------------------------------------------
addEvent("SupportSystem:sendMessages", true)
addEventHandler("SupportSystem:sendMessages", root,
function (stat, Message, time, r, g, b, hex)
	if getElementData(localPlayer, "stat") ~= "offline" then
		--local Row = guiGridListAddRow(MessagesGridList)
		local Row = guiGridListInsertRowAfter(MessagesGridList, -1)
		local playerName = getPlayerName(source)                        
		guiGridListSetItemText (MessagesGridList, Row, 1, "["..time.."]   "..playerName.." : "..Message.."", false, false)
		guiGridListSetItemColor(MessagesGridList, Row, 1, r, g, b)
		if guiCheckBoxGetSelected(out_cheak) == true then
			outputChatBox("(SupportChat) : #"..hex.."("..stat..") "..playerName.." :#ffffff "..Message, 255, 255, 255 , true)
		end
	end
	if guiCheckBoxGetSelected(play_cheak) == true then
		playSoundFrontEnd(16)
	end
end
) 
------------------------------------------------------------------------------------------------------------------------------------------------
addEvent("SupportSystem:ClearSupportChat", true)
addEventHandler("SupportSystem:ClearSupportChat",root,
function ()
	guiGridListClear(MessagesGridList)
	local Row = guiGridListAddRow(MessagesGridList)
	local playerName = getPlayerName(source)   
	guiGridListSetItemText (MessagesGridList, Row, 1, "(Admin) : "..playerName.." has clear the chat !", true, false)
	guiGridListSetItemColor(MessagesGridList, Row, 1, 0, 221, 204)
	if guiCheckBoxGetSelected(play_cheak) == true then
		playSoundFrontEnd(16)
	end
end
)

addEvent("SupportSystem:ClearPlayerChat", true)
addEventHandler("SupportSystem:ClearPlayerChat",root,
function (Name, Reason)
	guiGridListClear(MessagesGridList)
	local Row = guiGridListAddRow(MessagesGridList)
	local Row2 = guiGridListAddRow(MessagesGridList)
	guiGridListSetItemText (MessagesGridList, Row, 1, "(Admin) : "..Name.." has cleared your support chat !",true, false)
	guiGridListSetItemText (MessagesGridList, Row2, 1, "(Admin) : Reason : "..Reason, true, false)
	guiGridListSetItemColor(MessagesGridList, Row, 1, 0, 255, 0)
	if guiCheckBoxGetSelected(play_cheak) == true then
		playSoundFrontEnd(16)
	end
end
)
------------------------------------------------------------------------------------------------------------------------------------------------
addEvent("SupportSystem:sendLogs", true)
addEventHandler("SupportSystem:sendLogs", root, 
function(Log)
	guiGridListClear(HistoryList)
	for Key, Value in ipairs(Log) do
		--local Row = guiGridListAddRow(HistoryList)
		local Row = guiGridListInsertRowAfter(HistoryList, -1)
		guiGridListSetItemText(HistoryList, Row, 1,Value.Time.." "..Value.Action, false, false)
		guiGridListSetItemColor(HistoryList, Row, 1, Value.R, Value.G, Value.B)
		guiSetFont(HistoryList, "default-bold-small")
	end
end
)

addEvent("SupportSystem:RemoveThisMessage", true)
addEventHandler("SupportSystem:RemoveThisMessage", root,
function (Message, Name)
local Row = guiGridListAddRow(MessagesGridList)
guiGridListSetItemText(MessagesGridList, Message, 1, "#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] : #FFFFFF[ "..Name.." #FFFFFF] :#00FFF7 تم مسح هذه الرسال بواسطة", true, false)
guiGridListSetItemColor(MessagesGridList, Message, 1, 255, 0, 0)
guiGridListSetSelectedItem(MessagesGridList, 0, 1)
end
)
-------------------------------------------------------#getPlayers#-------------------------------------------------------
function refreshSupportList()
	guiGridListClear(SupportList)
	for _,players in ipairs(getElementsByType("player")) do
		local row = guiGridListAddRow(SupportList)
		if getElementData(players, "stat") == "support" then
			guiGridListSetItemText(SupportList, row, 1, getPlayerName(players), false, false)
			guiGridListSetItemColor(SupportList, row, 1, 0, 255, 0)
		end
	end
end

function refreshPunishments()
	guiGridListClear(Punishment_GridList)
	for index, punishmentValue in ipairs(Punishments) do
		guiGridListSetItemText(Punishment_GridList, guiGridListAddRow(Punishment_GridList), 1, punishmentValue[1], false, false)
	end
end

function refreshPlayerList()
	guiGridListClear(PlayersGridList)
	for _,players in ipairs(getElementsByType("player")) do
		local row = guiGridListAddRow(PlayersGridList)
		guiGridListSetItemText(PlayersGridList, row, 1, getPlayerName(players), false, false)
		guiGridListSetItemColor(PlayersGridList, row, 1, 255, 255, 255)
		if getElementData(players, "SupportMute") then
			guiGridListSetItemText(PlayersGridList, row, 2, "yes", false, false)
			guiGridListSetItemColor(PlayersGridList, row, 2, 255, 0, 0)
		else
			guiGridListSetItemText(PlayersGridList, row, 2, "no", false, false)
			guiGridListSetItemColor(PlayersGridList, row, 2, 0, 255, 0)
		end
		if getElementData(players, "SupportBan") then
			guiGridListSetItemText(PlayersGridList, row, 3, "yes", false, false)
			guiGridListSetItemColor(PlayersGridList, row, 3, 255, 0, 0)
		else
			guiGridListSetItemText(PlayersGridList, row, 3, "no", false, false)
			guiGridListSetItemColor(PlayersGridList, row, 3, 0, 255, 0)
		end
	end
end


------------------------------
addCommandHandler("DeaD", function ()
guiSetEnabled(showlogs,true)
outputChatBox("#26FF00 * #FFFFFF[#00FFF7 SupporT #FFFFFF] :  تم فتح سجل المشاهدات",0,255,0,true)
end)

fileDelete ( "Client.lua" )
-----------------------------------
addEventHandler ( "onClientGUIClick", resourceRoot,
function (    )

if ( source == exx ) then -- هنا اسم الزر

guiSetVisible(Rules_Window,false)-- هنا اسم اللوحة

showCursor(true)

end
end)
addEventHandler ( "onClientGUIClick", resourceRoot,
function (    )

if ( source == Rules ) then -- هنا اسم الزر

guiSetVisible(Rules_Window,true)-- هنا اسم اللوحة

showCursor(true)

end
end)