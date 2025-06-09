--[[
-------------------------------------------------
original script
credits to Yakuza.Real and solidsnake and kenix
http://forum.mtasa.com/viewtopic.php?f=91&t=40132
Edit by oskar
-------------------------------------------------

booo just fix it

]]
exports.scoreboard:addScoreboardColumn('Time')

hour = nil
theName = nil
local t = { }

function checkValues( source,arg1,arg2)
    if (arg2 >= 60) then
        t[ source ][ 'min' ] = tonumber( t[ source ][ 'min' ] or 0 ) + 1
        t[ source ][ 'sec' ] = 0
    end
    if (arg1 >= 60) then
        t[ source ][ 'min' ] = 0
        t[ source ][ 'hour' ] = tonumber( t[ source ][ 'hour' ] or 0 ) + 1
    end
    return arg1, arg2
end

setTimer(
    function( )
        for _, v in pairs( getElementsByType( "player" ) ) do
            if (not t[ v ]) then
                t[ v ] = {
                            ["hour"] = 0,
                             ["min"] = 0,
                             ["sec"] = 0
                            }
            end

            t[ v ][ 'sec' ] = tonumber( t[ v ][ 'sec' ] or 0 ) + 1
            local min,sec = checkValues (
                    v,
                    t[ v ][ 'min' ] or 0,
                    t[ v ][ 'sec' ] or 0
						)
	local hour = tonumber( t[ v ][ 'hour' ] or 0 )

            setElementData(
                v,
                "Time",
                tostring( hour )..':'..tostring( min )..':'..tostring( sec )
            )
        end
    end,
    1000, 0
)

function onPlayerQuit ( )
    local playeraccount = getPlayerAccount ( source )
    if ( playeraccount ) and not isGuestAccount ( playeraccount ) then
        local sValue = getElementData( source,'Time' )
	local hour = tonumber( t[ source ][ 'hour' ] or 0 )
	local min = tonumber( t[ source ][ 'min' ] or 0 )
	local sec = tonumber( t[ source ][ 'sec' ] or 0 )
        setAccountData ( playeraccount, "PlayTime-hour", tostring(hour) )
        setAccountData ( playeraccount, "PlayTime-min", tostring(min) )
        setAccountData ( playeraccount, "PlayTime-sec", tostring(sec) )
        setAccountData ( playeraccount, "PlayTime", tostring(sValue) )

    end
    t[ source ] = nil
end

function onPlayerLogin (_, playeraccount )
    if ( playeraccount ) then
        local time = getAccountData ( playeraccount, "Time" )
	local hou = getAccountData ( playeraccount, "PlayTime-hour")
	local min = getAccountData ( playeraccount, "PlayTime-min")
	local sec = getAccountData ( playeraccount, "PlayTime-sec")
        if ( time ) then
            setElementData ( source, "Time", time )

                             t[ source ]["hour"] = tonumber(hou)
                             t[ source ]["min"] = tonumber(min)
                             t[ source ]["sec"] = tonumber(sec)
                else
            setElementData ( source, "Time",0 )
            setAccountData ( playeraccount, "Time",0 )
        end
    end
end
addEventHandler ( "onPlayerQuit", root, onPlayerQuit )
addEventHandler ( "onPlayerLogin", root, onPlayerLogin )

addEvent( "Give;Houres", true )
addEventHandler( "Give;Houres", getRootElement(),function (hour)
if ( hour ) then
if ( isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Time")) ) then
setElementData(resourceRoot,"time",tonumber(hour))
setElementData(resourceRoot,"theName",getPlayerName(source))
setElementData(resourceRoot,"give","true")
end
end
end)

addCommandHandler("تواجد",function ( plr )
if ( getElementData(resourceRoot,"give") == "true" ) then
if ( isGuestAccount(getPlayerAccount(plr)) ) then return outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : سجل دخولكـ للحساب لاخذ الساعات",plr,255,0,0,true) end
if ( getAccountData(getPlayerAccount(plr),"give") ) then return outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : لقد اخذت الساعات من قبل",plr,255,0,0,true) end
if not ( getAccountData(getPlayerAccount(plr),"GiveTime") ) then
local theTime = t[ plr ]["hour"]
local hour = getElementData(resourceRoot,"time")
local theName = getElementData(resourceRoot,"theName")
t[ plr ]["hour"] = tonumber(theTime) + tonumber(hour)
setAccountData(getPlayerAccount(plr),"give",true)
outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : [#FF0000 " .. tonumber(hour) .. "#FFFFFF ]#FFFFFF قدم لك [#FF0000 ".. theName .." #FFFFFF]#FFFFFF الادمن",plr,255,255,0,true)
end
end
end)

addEvent( "Enable;Houres", true )
addEventHandler( "Enable;Houres", getRootElement(),function (enable)
if ( enable == "false" ) then
setElementData(resourceRoot,"give","false")
for i,v in ipairs (getElementsByType("player")) do
if not ( isGuestAccount(getPlayerAccount(v)) ) then
if ( getAccountData(getPlayerAccount(v),"give") == true ) then
setAccountData(getPlayerAccount(v),"give",false)
end
end
end
elseif ( enable == "true" ) then
setElementData(resourceRoot,"give","true")
end
end)
addEventHandler("onPlayerLogin",root,function ()
if ( getElementData(resourceRoot,"give") == "false" ) then
if ( getAccountData(getPlayerAccount(source),"give") ) then
setAccountData(getPlayerAccount(source),"give",false)
end
end
end)
