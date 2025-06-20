


local mainKey = 'F9'

local Cplayer = getLocalPlayer(  );
local screenW, screenH = guiGetScreenSize(  );
setElementData( Cplayer, 'chatStatus', 'متصل' )
setElementData( Cplayer, 'donotDisturb', nil )
local chat_Windows = {  };

local statusTable = {
	{ 'الاثنان معا' },
	{ 'متصل' },
	{ 'غير متصل' },
};

local badWordsTable = {
	{'اشخلك'},
	{'دينك'},
	{'ربك'},
	{'ورع'},
	{'ممحون'},
	{'سالب'},
	{'قحبة'},
	{'قحبه'},
	{'كلب'},
	{'متناك'},
	{'قواد'},
	{'جرار'},
	{'طيز'},
	{'كسختك'},
	{'زبي'},
	{'شرموط'},
	{'عرص'},
	{'كسمك'},
	{'امك'},
	{'ابوك'},
	{'اختك'},
	{'زق'},
	{'نيك'},
	{'منيوك'},
	{'_!_'},
};

GUIEditor = {
    checkbox = {},
    label = {},
    edit = {},
    button = {},
    window = {},
    gridlist = {},
    combobox = {}
};
GUIEditor.window[1] = guiCreateWindow(10, (screenH - 395) / 2, 413, 395, "[ Private Chat | By | DeaD ]", false)
guiWindowSetSizable(GUIEditor.window[1], false)
guiSetAlpha(GUIEditor.window[1], 1.00)
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF139EFE")
guiSetVisible(GUIEditor.window[1], false)
GUIEditor.gridlist[1] = guiCreateGridList(10, 97, 255, 248, false, GUIEditor.window[1])
guiGridListSetSortingEnabled(GUIEditor.gridlist[1], false)
PlayerColumn = guiGridListAddColumn(GUIEditor.gridlist[1], "Players", 0.7)
guiGridListAddColumn(GUIEditor.gridlist[1], "Status", 0.2)

guiGridListSetItemColor(GUIEditor.gridlist[1],player,PlayerColumn,255,255,0,true)
guiSetFont(GUIEditor.gridlist[1], "default-bold-small")
   
GUIEditor.button[1] = guiCreateButton(279, 148, 111, 26, "انشاء محادثة", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[1], "default-bold-small")
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF1FC100")
GUIEditor.button[2] = guiCreateButton(279, 184, 111, 26, "حظر الاعب", false, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFD00004")
guiSetFont(GUIEditor.button[2], "default-bold-small")
GUIEditor.button[3] = guiCreateButton(279, 220, 111, 26, "رسالة صوتية", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[3], "default-bold-small")
guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFDE6E00")
GUIEditor.button[4] = guiCreateButton(10, 359, 254, 22, "اغلاق المحادثة", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[4], "default-bold-small")
guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FF139EFE")
GUIEditor.button[5] = guiCreateButton(347, 359, 56, 22, "خروج", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[5], "default-bold-small")
guiSetProperty(GUIEditor.button[5], "NormalTextColour", "FFFF0000")
GUIEditor.edit[1] = guiCreateEdit(15, 63, 246, 25, "", false, GUIEditor.window[1])
GUIEditor.label[1] = guiCreateLabel(92, 36, 119, 17,"البحث على اللاعبين", false, GUIEditor.window[1])
guiSetFont(GUIEditor.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(GUIEditor.label[1], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
GUIEditor.combobox[1] = guiCreateComboBox(275, 63, 125, 24, "وضع حالة", false, GUIEditor.window[1])
GUIEditor.label[2] = guiCreateLabel(298, 36, 119, 17, " حالة اللاعب", false, GUIEditor.window[1])
guiSetFont(GUIEditor.label[2], "default-bold-small")
guiLabelSetHorizontalAlign(GUIEditor.label[2], "center", false)
guiLabelSetVerticalAlign(GUIEditor.label[2], "center")
GUIEditor.checkbox[1] = guiCreateCheckBox(281, 273, 109, 19, "     عدم الازعاج     ", false, false, GUIEditor.window[1])
guiSetFont(GUIEditor.checkbox[1], "default-bold-small")
guiSetProperty(GUIEditor.checkbox[1], "NormalTextColour", "FFFE1217")
guiSetEnabled( GUIEditor.button[2], false )
bindKey( mainKey, 'down', function(  )
	guiSetVisible( GUIEditor.window[1], not guiGetVisible( GUIEditor.window[1] ) )
		showCursor( guiGetVisible( GUIEditor.window[1] ) )
		guiSetInputEnabled( guiGetVisible( GUIEditor.window[1] ) )
	for cNumber, _ in pairs( chat_Windows ) do
		guiSetVisible( chat_Windows[cNumber].window, guiGetVisible( GUIEditor.window[1] ) )
	end
end );

for _, status in ipairs( statusTable ) do
	guiComboBoxAddItem( GUIEditor.combobox[1], status[1] )
end;

addEventHandler( 'onClientGUIChanged', root,
function(  )
	if ( source == GUIEditor.edit[1] ) then
		local plrString = guiGetText( GUIEditor.edit[1] )
			if ( plrString == '' or not plrString ) then
				local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
				if ( Sel == -1 ) then
					guiGridListClear( GUIEditor.gridlist[1] )
					for _, player in ipairs( getElementsByType( 'player' ) ) do
				addPlayer( player ) 
					end return end
			if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
			addPlayer( player )
		end
			end
				else
				local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
				if ( Sel == -1 ) then
					guiGridListClear( GUIEditor.gridlist[1] )
					for _, player in ipairs( getElementsByType( 'player' ) ) do
					if ( string.find( string.upper( getPlayerName( player ) ), string.upper( plrString ) ) ) then
				addPlayer( player ) 
				end end return end
			if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( string.find( string.upper( getPlayerName( player ) ), string.upper( plrString ) ) ) then
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( string.find( string.upper( getPlayerName( player ) ), string.upper( plrString ) ) ) then
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( string.find( string.upper( getPlayerName( player ) ), string.upper( plrString ) ) ) then
			addPlayer( player )
			end
		end
		end
	end
end
end );

function BuildChatting( player )
chat_Windows[player] = {  };
chat_Windows[player].window = guiCreateWindow((screenW - 629) / 2, (screenH - 314) / 2, 629, 314, getPlayerName( player ), false)
guiWindowSetSizable(chat_Windows[player].window, false)
guiSetAlpha(chat_Windows[player].window, 1.00)

chat_Windows[player].memo = guiCreateMemo(10, 21, 609, 242, "", false, chat_Windows[player].window)
guiMemoSetReadOnly(chat_Windows[player].memo, true)
chat_Windows[player].editBox = guiCreateEdit(10, 278, 401, 26, "", false, chat_Windows[player].window)
chat_Windows[player].SendButton = guiCreateButton(421, 280, 104, 24, "بعث الرسالة", false, chat_Windows[player].window)
chat_Windows[player].Xclose = guiCreateButton(582, 278, 37, 26, "X", false, chat_Windows[player].window)
chat_Windows[player].Label = guiCreateLabel(10, 263, 609, 15, "... يكتب [N/A] اللاعب *", false, chat_Windows[player].window)
guiSetFont(chat_Windows[player].Label, "default-small")
guiLabelSetVerticalAlign(chat_Windows[player].Label, "center")
guiSetVisible(chat_Windows[player].Label, false)
chat_Windows[player].Emoji = guiCreateButton(535, 278, 37, 26, "^ᴥ^", false, chat_Windows[player].window)
guiSetProperty(chat_Windows[player].Emoji, "NormalTextColour", "FF4080FF")
guiSetProperty(chat_Windows[player].Xclose, "NormalTextColour", "FFFE0000")
guiSetProperty(chat_Windows[player].SendButton, "NormalTextColour", "FF1FC100")

	if ( guiGetVisible( GUIEditor.window[1] ) == true ) then
		guiSetVisible( chat_Windows[player].window, true )
	else
		guiSetVisible( chat_Windows[player].window, false )
	end
end;

function clickTimer( element, timer )
	guiSetEnabled( element, false )
		setTimer( guiSetEnabled, timer * 1000, 1, element, true )
end;

function sendNewMessage( player )
	if ( isTimer( sendTimer ) ) then return end
	if ( chat_Windows[player] and isElement( chat_Windows[player].window ) ) then
		local message = guiGetText( chat_Windows[player].editBox )
			for _, badWord in ipairs( badWordsTable ) do
				if ( string.find( message, badWord[1] ) ) then
					guiSetProperty( chat_Windows[player].editBox, 'NormalTextColour', 'FFFF0000' )
						guiSetText( chat_Windows[player].editBox, 'السب والشتم سيعرضك للمخالفات !' )
							guiSetEnabled( chat_Windows[player].editBox, false )
								guiEditSetReadOnly( chat_Windows[player].editBox, true )
									setTimer( function(  )
										guiSetText( chat_Windows[player].editBox, '' )
											guiSetEnabled( chat_Windows[player].editBox, true )
										guiEditSetReadOnly( chat_Windows[player].editBox, false )
									guiSetProperty( chat_Windows[player].editBox, 'NormalTextColour', 'FF000000' )
								end, 3000, 1 )
							sendTimer = setTimer( function(  )
						killTimer( sendTimer )
					end, 2500, 1 )
						return
					end 
				end
			if ( string.len( message ) > 0 ) then
				local oldMessages = guiGetText( chat_Windows[player].memo )
					local newString = oldMessages..getPlayerName( Cplayer ):gsub( '#%x%x%x%x%x%x', '' )..' : '..message..'\n'
				guiSetText( chat_Windows[player].memo, newString )
			guiSetText( chat_Windows[player].editBox, '' )
				guiMemoSetCaretIndex( chat_Windows[player].memo, string.len( oldMessages ) )
			triggerServerEvent( 'onServerSendMessage', Cplayer, player, message )
		sendTimer = setTimer( function(  )
			killTimer( sendTimer )
			end, 2500, 1 )
		end
	end
end;

function destroyChattingWindow( player )
	if ( chat_Windows[player] and isElement( chat_Windows[player].window ) ) then
		destroyElement( chat_Windows[player].window )
		chat_Windows[player] = nil
	end
end;

function removePlayer( player )
	local name = getPlayerName( player )
		for i = 0, guiGridListGetRowCount( GUIEditor.gridlist[1] ) do
			if ( guiGridListGetItemText( GUIEditor.gridlist[1], i, 1 ) == name ) then
		guiGridListRemoveRow( GUIEditor.gridlist[1], i )
	end
end
end;

function privateChatClicks(  )
if ( getElementType( source ) ~= 'gui-button' ) then return end
	local parent = getElementParent( source )
		if ( parent == false or not parent ) then return end
			local player = getPlayerFromName( guiGetText( parent ) )
		if ( player == false or not player ) then return end
	if ( source == chat_Windows[player].SendButton ) then
		sendNewMessage( player )
	elseif ( source == chat_Windows[player].Xclose ) then
		destroyChattingWindow( player )
	elseif ( source == chat_Windows[player].Emoji ) then
		if ( isTimer( emojiTimer ) ) then return end
		local oldMessages = guiGetText( chat_Windows[player].memo )
			local newString = oldMessages..getPlayerName( Cplayer ):gsub( '#%x%x%x%x%x%x', '' )..' : '..'^ᴥ^'..'\n'
				guiSetText( chat_Windows[player].memo, newString )
			guiMemoSetCaretIndex( chat_Windows[player].memo, string.len( oldMessages ) )
		triggerServerEvent( 'onServerSendMessage', Cplayer, player, '^ᴥ^' )
			guiSetEnabled( chat_Windows[player].Emoji, false )
				emojiTimer = setTimer( function(  )
					if ( chat_Windows[player] and isElement( chat_Windows[player].Emoji ) ) then
				guiSetEnabled( chat_Windows[player].Emoji, true )
					end
			killTimer( emojiTimer )
		end, 2500, 1 )
	end
end;
addEventHandler( 'onClientGUIClick', root, privateChatClicks );

addEventHandler( 'onClientGUIClick', root,
function(  )
	if ( source == GUIEditor.button[1] ) then
		clickTimer( GUIEditor.button[1], 3 )
			local Sel = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
				if ( Sel == -1 ) then outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 الرجاء اختيار اللاعب لانشاء محادثة', 255, 255, 255, true ) return end
				local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], Sel, 1 ) )
					if ( player == Cplayer ) then outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 لا تستطيع انشاء محادثة مع نفسك', 255, 255, 255, true ) return end
			local serial = getElementData( player, 'chatSystem;playerSerial' )
		triggerServerEvent( 'onServerCheckIfBlocked', Cplayer, serial )
	elseif ( source == GUIEditor.button[4] ) then
		clickTimer( GUIEditor.button[4], 5 )
		if ( guiGetText( GUIEditor.button[4] ) == 'اغلاق المحادثة' ) then
			guiSetEnabled( GUIEditor.button[1], false )
				guiSetEnabled( GUIEditor.button[3], false )
				guiSetEnabled( GUIEditor.button[2], false )
				guiSetEnabled( GUIEditor.gridlist[1], false )
				guiSetEnabled( GUIEditor.combobox[1], false )
				guiSetEnabled( GUIEditor.edit[1], false )
				guiSetEnabled( GUIEditor.checkbox[1], false )
				guiSetText( GUIEditor.button[4], 'فتح المحادثة' )
			setElementData( Cplayer, 'chatStatus', 'غير متصل' )
			triggerServerEvent( 'onServerChangeStatus', Cplayer, 'غير متصل' )
			for cNumber, _ in pairs( chat_Windows ) do
				if ( chat_Windows[cNumber] and isElement( chat_Windows[cNumber].window ) ) then
					destroyElement( chat_Windows[cNumber].window )
					chat_Windows[cNumber] = nil
				end
			end
				else
			guiSetEnabled( GUIEditor.button[1], true )
				guiSetEnabled( GUIEditor.button[3], true )
				guiSetEnabled( GUIEditor.gridlist[1], true )
				guiSetEnabled( GUIEditor.combobox[1], true )
				guiSetEnabled( GUIEditor.edit[1], true )
				guiSetEnabled( GUIEditor.checkbox[1], true )
				guiSetText( GUIEditor.button[4], 'اغلاق المحادثة' )
			setElementData( Cplayer, 'chatStatus', 'متصل' )
			triggerServerEvent( 'onServerChangeStatus', Cplayer, 'متصل' )
		end
	elseif ( source == GUIEditor.button[5] ) then
		guiSetVisible( GUIEditor.window[1], false )
			showCursor( false )
		guiSetInputEnabled( false )
		for cNumber, _ in pairs( chat_Windows ) do
		guiSetVisible( chat_Windows[cNumber].window, false )
		end
	elseif ( source == GUIEditor.gridlist[1] ) then
		local Sel = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if ( Sel == -1 ) then
				guiSetEnabled( GUIEditor.button[2], false )
				guiSetText( GUIEditor.button[2], 'حظر الاعب' )
			else
				guiSetEnabled( GUIEditor.button[2], true )
					local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], Sel, 1 ) )
				local serial = getElementData( player, 'chatSystem;playerSerial' )
					if ( serial and string.len( serial ) == 32 ) then
				triggerServerEvent( 'onServerCheckBlockStatus', Cplayer, serial )
			end
		end
	elseif ( source == GUIEditor.button[2] ) then
		clickTimer( GUIEditor.button[2], 3 )
		local Sel = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if ( Sel == -1 ) then return end
		local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], Sel, 1 ) )
			local serial = getElementData( player, 'chatSystem;playerSerial' )
		if ( guiGetText( GUIEditor.button[2] ) == 'حظر الاعب' ) then
			triggerServerEvent( 'onServerBlockPlayer', Cplayer, serial, player )
		else
			triggerServerEvent( 'onServerUnblockPlayer', Cplayer, serial )
		end
	elseif ( source == GUIEditor.button[3] ) then
		clickTimer( GUIEditor.button[3], 10 )
		local Sel = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if ( Sel == -1 ) then outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 الرجاء اختيار اللاعب لبعث رسالة صوتية له', 255, 255, 255, true ) return end
				local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], Sel, 1 ) )
			local serial = getElementData( player, 'chatSystem;playerSerial' )
		triggerServerEvent( 'onServerSendPoke', Cplayer, player, serial )
	elseif ( source == GUIEditor.combobox[1] ) then
		local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
			if ( Sel == -1 ) then return end
		if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				addPlayer( player )
			end
		end
	elseif ( source == GUIEditor.checkbox[1] ) then
		if ( guiCheckBoxGetSelected( GUIEditor.checkbox[1] ) == true ) then
			setElementData( Cplayer, 'donotDisturb', 'Enabled' )
			triggerServerEvent( 'onServerChangeStatus', Cplayer, 'متصل' )
		else
			setElementData( Cplayer, 'donotDisturb', nil )
			triggerServerEvent( 'onServerChangeStatus', Cplayer, 'متصل' )
		end
	end
end );

local txtValue = 0

function showWriteMessage( player, name )
	if ( isTimer( writeTimer ) ) then return end
		guiSetText( chat_Windows[player].Label, '* ['..name..'] is typing')
			guiSetVisible( chat_Windows[player].Label, true )
				writeTimer = setTimer( function(  )
					if ( txtValue >= 3 ) then
						guiSetText( chat_Windows[player].Label, '* ['..name..'] is typing' )
					txtValue = 0
				end
			guiSetText( chat_Windows[player].Label, guiGetText( chat_Windows[player].Label )..'.' )
		txtValue = txtValue + 1
	end, 500, 0 )
end;
addEvent( 'onClientShowWrite', true ); addEventHandler( 'onClientShowWrite', root, showWriteMessage )


function hideWriteMessage( player )
	if ( isTimer( writeTimer ) ) then killTimer( writeTimer ) end
	guiSetText( chat_Windows[player].Label, '* [N/A] is typing ...')
	guiSetVisible( chat_Windows[player].Label, false )
end;
addEvent( 'onClientHideWrite', true ); addEventHandler( 'onClientHideWrite', root, hideWriteMessage )

addEventHandler( 'onClientGUIChanged', root,
function(  )
	local parent = getElementParent( source )
		if ( not parent ) then return end
			local player = getPlayerFromName( guiGetText( parent ) )
		if ( not player ) then return end
			if ( source == chat_Windows[player].editBox ) then
				if ( guiGetText( chat_Windows[player].editBox ) ~= '' ) then
					triggerServerEvent( 'onServerCheckShow', Cplayer, player, getPlayerName( Cplayer ) )
				local messageStringText = guiGetText( chat_Windows[player].editBox )
					checkIfTextChanged( player, messageStringText )
				else
			triggerServerEvent( 'onServerCheckHide', Cplayer, player )
		end
	end
end );

function checkIfTextChanged( player, text )
	setTimer( function(  )
		if ( guiGetText( chat_Windows[player].editBox ) == text ) then
			triggerServerEvent( 'onServerCheckHide', Cplayer, player )
		end
	end, 1000, 1 )
end;

addEvent( 'onClientPokePlayer', true );
addEventHandler( 'onClientPokePlayer', root,
function( pokedBy )
	if ( getElementData( Cplayer, 'donotDisturb' ) ~= 'Enabled' ) then
		playSound( 'Wakeup.mp3' )
		outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 بعث لك رسالة صوتية #FFFFFF- [ #FF9900'..pokedBy..' #FFFFFF] - :#00FFA6 اللاعب', 255, 255, 255, true )
	end
end );

addEvent( 'onClientChangeButton', true );
addEventHandler( 'onClientChangeButton', root,
function( Text )
	guiSetText( GUIEditor.button[2], Text )
end );

function buildChattingWith(  )
	local row, column = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if ( row == -1 or column == -1 ) then return end
		local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], row, column ) )
			if ( getElementData( player, 'chatStatus' ) ~= 'متصل' ) then
				outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 عذرا !! لا يمكنك بعث الرسالة لأن اللاعب اصبح غير متصل', 255, 255, 255, true ) return end
				if ( not chat_Windows[player] ) then
			BuildChatting( player )
		guiBringToFront( chat_Windows[player].window )
	end
end;
addEvent( 'buildChattingWith', true ); addEventHandler( 'buildChattingWith', root, buildChattingWith )

function privateChatDoubleClicks(  )
	if ( source == GUIEditor.gridlist[1] ) then
		local Sel = guiGridListGetSelectedItem( GUIEditor.gridlist[1] )
			if ( Sel == -1 ) then return end
		local player = getPlayerFromName( guiGridListGetItemText( GUIEditor.gridlist[1], Sel, 1 ) )
			if ( player == Cplayer ) then outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 عذرا !! لا تستطيع التحدث مع نفسك', 255, 255, 255, true ) return end
			local serial = getElementData( player, 'chatSystem;playerSerial' )
		triggerServerEvent( 'onServerCheckIfBlocked', Cplayer, serial )
	end
end;
addEventHandler( 'onClientGUIDoubleClick', root, privateChatDoubleClicks );

addEvent( 'onClientReceiveMessage', true );
addEventHandler( 'onClientReceiveMessage', root,
function( player, message )
	if ( not chat_Windows[player] ) then
		BuildChatting( player ) 
	end
		local oldMessages = guiGetText( chat_Windows[player].memo )
			local newString = oldMessages..getPlayerName( player ):gsub( '#%x%x%x%x%x%x', '' )..' : '..message..'\n'
		guiSetText( chat_Windows[player].memo, newString )
	guiMemoSetCaretIndex( chat_Windows[player].memo, string.len( oldMessages ) )
		if ( guiGetVisible( GUIEditor.window[1] ) == false ) then
			if ( getElementData( Cplayer, 'donotDisturb' ) ~= 'Enabled' ) then
				outputChatBox( '#FF9900 • #FFFFFF[ #0099FFPrivate Chat #FFFFFF] :#00FFA6 ارسل لك رسالة #FFFFFF[ #FF9900'..getPlayerName( player )..' #FFFFFF] - :#00FFA6 اللاعب', 255, 255, 255, true )
			playSound( 'Message.mp3' )
		end
	end
end );

function addPlayer( player )
	local data = getElementData( player, 'chatStatus' ) or 'متصل'
		local name = getPlayerName( player )
			local r, g, b = getPlayerNametagColor( player )
				local row = guiGridListAddRow( GUIEditor.gridlist[1] )
					guiGridListSetItemText( GUIEditor.gridlist[1], row, 1, name, false, false )
						guiGridListSetItemText( GUIEditor.gridlist[1], row, 2, data, false, false )
					guiGridListSetItemColor( GUIEditor.gridlist[1], row, 1, r, g, b )
				if ( data == 'متصل' ) then
				guiGridListSetItemColor( GUIEditor.gridlist[1], row, 2, 0, 200, 0 )
			else
		guiGridListSetItemColor( GUIEditor.gridlist[1], row, 2, 200, 0, 0 )
	end
end;

function addOnlinePlayer( player )
	local data = getElementData( player, 'chatStatus' ) or 'متصل'
		if ( data == 'متصل' ) then
			local name = getPlayerName( player )
				local r, g, b = getPlayerNametagColor( player )
					local row = guiGridListAddRow( GUIEditor.gridlist[1] )
					guiGridListSetItemText( GUIEditor.gridlist[1], row, 1, name, false, false )
				guiGridListSetItemText( GUIEditor.gridlist[1], row, 2, data, false, false )
			guiGridListSetItemColor( GUIEditor.gridlist[1], row, 1, r, g, b )
		guiGridListSetItemColor( GUIEditor.gridlist[1], row, 2, 0, 200, 0 )
	end
end;

function addOfflinePlayer( player )
	local data = getElementData( player, 'chatStatus' ) or 'غير متصل'
		if ( data == 'غير متصل' ) then
			local name = getPlayerName( player )
		local r, g, b = getPlayerNametagColor( player )
		local row = guiGridListAddRow( GUIEditor.gridlist[1] )
	guiGridListSetItemText( GUIEditor.gridlist[1], row, 1, name, false, false )
		guiGridListSetItemText( GUIEditor.gridlist[1], row, 2, data, false, false )
			guiGridListSetItemColor( GUIEditor.gridlist[1], row, 1, r, g, b )
		guiGridListSetItemColor( GUIEditor.gridlist[1], row, 2, 200, 0, 0 )
	end
end;

addEvent( 'onClientUpdateStatus', true );
addEventHandler( 'onClientUpdateStatus', root,
function( player, status )
	if ( status == 'متصل' ) then
		removePlayer( player )
		local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
			if ( Sel == -1 ) then addPlayer( player ) return end
		if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
			addPlayer( player )
		end
	end
	else
		destroyChattingWindow( player )
			removePlayer( player )
		local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
			if ( Sel == -1 ) then addPlayer( player ) return end
		if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
			addPlayer( player )
		end
	end
	end
end );

addEvent( 'onClientDestroyChats', true );
addEventHandler( 'onClientDestroyChats', root,
function( player )
	destroyChattingWindow( player )
end );

function player_Join( player )
	if ( player ~= Cplayer ) then
	local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
			if ( Sel == -1 ) then addPlayer( player ) return end
		if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
			addPlayer( player )
		end
	end
end
end;
addEvent( 'onClientAddPlayer', true ); addEventHandler( 'onClientAddPlayer', root, player_Join )

function player_Quit( player )
	removePlayer( player )
	destroyChattingWindow( player )
end;
addEvent( 'onClientRemovePlayer', true ); addEventHandler( 'onClientRemovePlayer', root, player_Quit )

function player_ChangedName( player, name )
	for i = 0, guiGridListGetRowCount( GUIEditor.gridlist[1] ) do
		if ( guiGridListGetItemText( GUIEditor.gridlist[1], i, 1 ) == name ) then
			guiGridListRemoveRow( GUIEditor.gridlist[1], i )
		end
	end
		destroyChattingWindow( player )
	setTimer( function(  )
		local Sel = guiComboBoxGetSelected( GUIEditor.combobox[1] )
			if ( Sel == -1 ) then addPlayer( player ) return end
		if ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'متصل' ) then
					addOnlinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'غير متصل' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
				if ( getElementData( player, 'chatStatus' ) == 'غير متصل' ) then
					addOfflinePlayer( player )
				end
			end
		elseif ( guiComboBoxGetItemText( GUIEditor.combobox[1], Sel ) == 'الاثنان معا' ) then
				guiGridListClear( GUIEditor.gridlist[1] )
			for _, player in ipairs( getElementsByType( 'player' ) ) do
			addPlayer( player )
		end
	end
end, 1500, 1 )
end;
addEvent( 'onClientRemovePlayer_ChangedName', true ); addEventHandler( 'onClientRemovePlayer_ChangedName', root, player_ChangedName )

function sendMessage( eleEdit )
	local parent = getElementParent( source )
		if ( parent == false or not parent ) then return end
			local player = getPlayerFromName( guiGetText( parent ) )
		if ( player == false or not player ) then return end
	if ( eleEdit == chat_Windows[player].editBox ) then
		sendNewMessage( player )
	end
end;

addEventHandler( 'onClientGUIAccepted', root, sendMessage );

addEventHandler( 'onClientResourceStart', resourceRoot,
function(  )
	triggerServerEvent( 'onServerSetPlayerSerial', Cplayer )
		setTimer( function(  )
	for _, player in ipairs( getElementsByType( 'player' ) ) do
		addPlayer( player )
	end
end, 1000, 1 )
end );
