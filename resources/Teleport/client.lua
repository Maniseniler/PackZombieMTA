outputChatBox('#FF9900 * #00B7FFWarp Panel By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R',150,150,150,true)
function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end
GUIEditor = {
    checkbox = {},
    label = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {}
}

-- Local Window --
teleportWindow = guiCreateWindow(734, 312, 454, 475, "[ Warp Players | By | Elian Host Panel ]", false)
guiWindowSetSizable(teleportWindow, false)
guiSetAlpha(teleportWindow, 7.0)
guiSetVisible ( teleportWindow, false)
        guiSetProperty(teleportWindow, "CaptionColour", "FF00FF00")
		GUIEditor.memo[1] = guiCreateMemo(306, 38, 120, 264, "  Warp System\n\nMod By : DeaD\n\nمود الانتقال الى \nاللاعبين مود حصري\nمن قبل دياد\n\n\n\nLast Edit :\n\nBy : DeaD\nTime : 17:4\nDate: 31/5/2018", false, teleportWindow)
guiMemoSetReadOnly(GUIEditor.memo[1], true)
		GUIEditor.label[1] = guiCreateLabel(326, 326, 100, 16, "اغلاق الانتقال الي", false, teleportWindow)
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[1], 255, 0, 0)
TheCheck = guiCreateCheckBox(304, 325, 15, 17, "اغلاق الانتقال الي", false, false, teleportWindow)
        guiSetFont(TheCheck, "default-bold-small")
        guiSetProperty(TheCheck, "NormalTextColour", "FF00FF00")    
-- Local Gridlist --
teleportGridlist = guiCreateGridList(17, 28, 267, 437, false, teleportWindow)
teleportColumn = guiGridListAddColumn(teleportGridlist, "Players", 0.9)
        teleportButton = guiCreateButton(297, 377, 139, 30, "انتقال", false, teleportWindow)
        guiSetProperty(teleportButton, "NormalTextColour", "FF0065FD")   
        teleportButton1 = guiCreateButton(297, 425, 139, 30, "اغلاق", false, teleportWindow)
        guiSetProperty(teleportButton1, "NormalTextColour", "FFF0FE00")   
guiGridListSetItemColor(teleportGridlist,addrow,teleportColumn,255,255,0)		
		guiSetFont(teleportGridlist, "default-bold-small")
		guiSetFont(teleportButton, "default-bold-small")
		guiSetFont(teleportButton1, "default-bold-small")
guiSetVisible ( teleportGridlist, false)
guiSetVisible ( teleportButton, false)
-- Function Open --
function open ()
centerWindow(teleportWindow)
 if ( guiGetVisible ( teleportWindow )) or ( guiGetVisible ( teleportGridlist )) or ( guiGetVisible ( teleportButton )) then
  guiSetVisible ( teleportWindow, false )
  guiSetVisible ( teleportGridlist, false )
  guiSetVisible ( teleportButton, false )
  showCursor ( false )
  guiGridListClear( teleportGridlist )
 else
  guiSetVisible ( teleportWindow, true )
  guiSetVisible ( teleportGridlist, true )
  guiSetVisible ( teleportButton, true )
  showCursor ( true )
  for i , player in pairs(getElementsByType("player")) do
 zPlayer = string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")
   local addrow = guiGridListAddRow( teleportGridlist )
   guiGridListSetItemText(teleportGridlist,addrow,teleportColumn, zPlayer,false,false)
  end
 end
end
bindKey ( "F1", "down", open )


addEventHandler( "onClientGUIClick", guiRoot,
function()
    if ( source == TheCheck ) then
        local CheckData = getElementData( localPlayer, "DataCheck" )
        if ( guiCheckBoxGetSelected( source ) ) then
            if ( not CheckData ) or ( CheckData ~= true ) then setElementData( localPlayer, "DataCheck", true ) end
        else
            if ( not CheckData ) or ( CheckData ~= false ) then setElementData( localPlayer, "DataCheck", false ) end
        end
    elseif ( source == teleportButton ) then
local addrow = guiGridListGetSelectedItem( teleportGridlist )
if ( addrow ~= -1 ) then
    local Target = getPlayerFromName( guiGridListGetItemText( teleportGridlist, addrow, 1 ) )
    if ( Target ) then
        local CheckData = getElementData( Target, "DataCheck" )
        if ( not CheckData ) or ( CheckData == false ) then
            local TargetX, TargetY, TargetZ = getElementPosition( Target )
            setElementPosition( localPlayer, TargetX + 1, TargetY + 1, TargetZ )
							end
						end
					end
				end
			end
)

addEventHandler( "onClientGUIDoubleClick",teleportGridlist,
function ()
local addrow = guiGridListGetSelectedItem( teleportGridlist )
if ( addrow ~= -1 ) then
    local Target = getPlayerFromName( guiGridListGetItemText( teleportGridlist, addrow, 1 ) )
    if ( Target ) then
        local CheckData = getElementData( Target, "DataCheck" )
        if ( not CheckData ) or ( CheckData == false ) then
            local TargetX, TargetY, TargetZ = getElementPosition( Target )
            setElementPosition( localPlayer, TargetX + 1, TargetY + 1, TargetZ )
				end
			end
		end
	end
)
addEventHandler("onClientGUIClick",resourceRoot,
 function ()
 if (source == teleportButton1) then
 guiSetVisible(teleportWindow,false)
 showCursor(false)
  end
 end
)
