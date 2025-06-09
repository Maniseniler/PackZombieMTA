
addEvent("onZombieWasted",true)
addEventHandler("onZombieWasted",root,
function (killer)
    givePlayerMoney(killer,250)
end)	