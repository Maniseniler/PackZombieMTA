addEvent("onZombieWasted")
addEventHandler( "onZombieWasted", getRootElement(),
function (killer)
killerName = getPlayerName(killer)
weapon = getPedWeapon(killer)
wr, wg, wb = getPlayerNametagColor(killer)
exports.killmessages:outputMessage ( {killerName,{"padding",width=3},{"icon",id=weapon or 0},{"padding",width=3},{"color",r=162,g=2,b=2},"#800000M.1|#333333Zombie"},getRootElement(),wr,wg,wb )
end)