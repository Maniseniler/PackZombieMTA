DownloadTeam = createTeam ( "Download", 255, 0, 0 )
EveryoneTeam = createTeam ( "Everyone", 200, 200, 200 )
 


addEventHandler( "onPlayerJoin", root, function(  )
	 setPlayerTeam(source, DownloadTeam)
end )

addEvent ( "Everyone", true )
addEventHandler ( "Everyone", root, function ()
    setPlayerTeam(source, EveryoneTeam)
end )

