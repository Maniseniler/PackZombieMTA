local player = getLocalPlayer()

function mutePlayer(playerName, Reason, Time, Type)
	if not playerName then return end
	if not Reason then Reason = "No Reason" end
	if not Time then Time = 60 end
	if not Type then Type = "Min" end
	local Int
	if Type == "Sec" then Int = 1000 elseif Type == "Min" then Int = 60000 elseif Type == "Hour" then Int = 3600000 elseif Type == "Day" then Int = 86400000 end
	triggerServerEvent("SupportSystem:MutePlayer", localPlayer, playerName, Reason, Time, Type, Int)
end

function unMutePlayer(playerName)
	if not playerName then return end
	triggerServerEvent("SupportSystem:unMutePlayer", localPlayer, playerName)
end
