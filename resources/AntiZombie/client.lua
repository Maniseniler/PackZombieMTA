outputChatBox("#FF9900 * #00B7FFAnti Zombie By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)

function godmodeHandler ()
  cancelEvent ()
end

addEvent ("enableGodMode",true)
addEventHandler ("enableGodMode",getRootElement(),
function()
  if (source == getLocalPlayer()) then
    addEventHandler ("onClientPlayerDamage",getRootElement(),godmodeHandler)
  end
end)

addEvent ("disableGodMode",true)
addEventHandler ("disableGodMode",getRootElement(),
function()
  if (source == getLocalPlayer()) then
    removeEventHandler ("onClientPlayerDamage",getRootElement(),godmodeHandler)
  end
end)