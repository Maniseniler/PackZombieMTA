
function onPlayQuit ( )
      local playeraccount = getPlayerAccount ( source )
      if ( playeraccount ) and not isGuestAccount ( playeraccount ) then
	      local myTeam = getPlayerTeam ( source )
			if (myTeam) then
			
            local currentTeam = getTeamName ( myTeam ) 
            setAccountData ( playeraccount, "TeamLog", currentTeam ) 
      end
end
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), onPlayQuit )



function onPlayLogin (_, playeraccount )
      if ( playeraccount ) then
            local LoadTeam = getAccountData ( playeraccount, "TeamLog" )

            if ( LoadTeam ) then
			      teamLoad = getTeamFromName ( LoadTeam ) 
                  setPlayerTeam ( source, teamLoad )
            end
      end
end
addEventHandler ( "onPlayerLogin", getRootElement ( ), onPlayLogin )