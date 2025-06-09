outputChatBox("#FF9900 * #00B7FFAdmin Msg By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local sX, sY = guiGetScreenSize ()

addEventHandler("onClientRender", root, function ()
    if ( getElementData ( resourceRoot, "Have_" ) == true ) then
        local Lines = getChatboxLayout ()["chat_lines"]
        if ( Lines <= 10 ) then
            Lines = Lines + 1
        elseif ( Lines >= 20 ) then
            Lines = Lines - 1
        else
            Lines = Lines
        end
        if ( getElementData ( resourceRoot, "Msg_" ) == "1" ) then
            setElementData ( resourceRoot, "Have_", false )
        else
         dxDrawBorderedText ( "#c1c1c1,#b50000+#c1c1c1' #c1c1c1〖#6C0000 A#7B0000d#8B0000m#9B0000i#AB0000n#c1c1c1 〗 #c1c1c1: " .. getElementData ( resourceRoot, "Msg_" ).. "", sX * 0.02, sY * 0.03 * Lines , sX, sY, tocolor ( 255, 255, 255, 255 ), 1.0, "default-bold", "left", "top", false, false, false, true, false )

        end
    end
end)
bindKey("i", "down", "chatbox","AdminMsg")


function dxDrawBorderedText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, color2 )
    local wh = 1
    local msg_gsub = text:gsub ( '#%x%x%x%x%x%x', '' )
    dxDrawText ( msg_gsub, x - wh, y - wh, w - wh, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false ) -- black
    dxDrawText ( msg_gsub, x + wh, y - wh, w + wh, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x - wh, y + wh, w - wh, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x + wh, y + wh, w + wh, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x - wh, y, w - wh, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x + wh, y, w + wh, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x, y - wh, w, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( msg_gsub, x, y + wh, w, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
    dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, color2 )
end
