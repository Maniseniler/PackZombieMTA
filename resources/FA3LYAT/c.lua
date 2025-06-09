outputChatBox("#FF9900 * #00B7FFFA3LYAT Msg By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local sX, sY = guiGetScreenSize ()
local screenW, screenH = guiGetScreenSize()


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
         dxDrawText ( "#c0c0c0[ ".. getElementData ( resourceRoot, "By_" ) .." #c0c0c0]  #FFFFFF: " .. getElementData ( resourceRoot, "Msg_" ).. "", 10, (screenH - 60) / 2, (10) + 1878, ( (screenH - 60) / 2) + 60, tocolor ( 0,100,255,255,1.7 ), 1.7, "default-bold", "left", "top", false, false, false, true, false )
		end
	end
end)
bindKey("n", "down", "chatbox","Fa3lyat")