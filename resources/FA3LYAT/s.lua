local Groups = { "Console","FA3LYAT" }

function isPlayerAdmin(player)
    for k,v in ipairs ( Groups ) do
        if ( isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(player)), aclGetGroup(v)) ) then
		    return true
		end
	end
end

addCommandHandler("Fa3lyat", function ( player, cmd, ... )
    if not ( isGuestAccount ( getPlayerAccount ( player ) ) ) then
	    if ( isPlayerAdmin ( player ) ) then
		    local msg = {...}
		    local message = table.concat(msg, " ")
			setElementData ( resourceRoot, "Have_", true )
			setElementData ( resourceRoot, "Msg_", message )
			if ( getElementData ( player, "Name" ) and getElementData ( player, "Name" ) ~= false ) then
				setElementData ( resourceRoot, "By_", getElementData ( player, "Name" ))
			else
				setElementData ( resourceRoot, "By_", getPlayerName ( player ))
			end
		else
		    outputChatBox("* You Are Not Admin !", player, 255, 0, 0, true)
		end
	else
	    outputChatBox("* Please Login !", player, 255, 0, 0, true)
	end
end)

