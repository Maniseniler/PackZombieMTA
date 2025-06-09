exports.scoreboard:addScoreboardColumn('Zombie kills')
 
addEvent("onZombieWasted",true)
addEventHandler("onZombieWasted",root,
function (killer)
    givePlayerMoney(killer,50)
    addPlayerZombieKills(killer)
 
end)


function addPlayerZombieKills(killer)
    local account = getPlayerAccount(killer)
    if isGuestAccount(account) then return end
    local zombieKills = getAccountData(account,"Zombie kills")
    if not zombieKills then setAccountData(account,"Zombie kills",0) end
    setAccountData(account,"Zombie kills",tonumber(zombieKills)+1)
end


addEventHandler("onPlayerLogin",root,
function ()
    local account = getPlayerAccount(source)
    if isGuestAccount(account) then return end
    local zombieKills = getAccountData(account,"Zombie kills")
    if zombieKills then
        setElementData(source,"Zombie kills",tostring(zombieKills))
    else
        setElementData(source,"Zombie kills",0)    
 
end
end)