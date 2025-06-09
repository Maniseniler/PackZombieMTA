local app_id = "1219728896727973999"

function ConnectRPC()
   setDiscordApplicationID(app_id)
   if isDiscordRichPresenceConnected() then
      local name = getPlayerName(localPlayer)
      iprint("RPC: Discord RPC is now connected")
      setDiscordRichPresenceAsset("tarincommunity", "[Tarin-Community]●[ Zombie War ]●[ قتال الزومبي ]●[T.N]~~[TN_Tunisia]~")
      setDiscordRichPresenceButton(1, "Join Discord", "https://discord.gg/gyd5aSTyt7")
      setDiscordRichPresenceButton(2, "Connect Server", "mtasa://197.3.80.232:12577")
      --// NOTE: you can show only 2 buttons
      setDiscordRichPresenceState("Playing in [Tarin-Community]●[ Zombie War ]")
      setDiscordRichPresenceDetails("Login as: "..name)
   else
      iprint("RPC: Discord RPC failed to connect")
   end
end
addEventHandler("onClientResourceStart", resourceRoot, ConnectRPC)


--// Now, we reset the rpc details so the status will not be bugged
addEventHandler("onClientResourceStop", resourceRoot, function()
    resetDiscordRichPresenceData()
end)