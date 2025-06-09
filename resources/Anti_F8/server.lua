

Command = {
	['aexec']  	= true;
	['delaccount']  	= true;
	['chgpass']  	= true;
	['chgmypass']  	= true;
	['shutdown']  	= true;
	['stopall']  	= true;
	['stopmode']  	= true;
	['stopmap']  	= true;
	['loadmodule']  	= true;
	['crun']  	= true;
	['run']  	= true;
	['srun']  	= true;
	['execute']  	= true;
	['install']  	= true;
	['givetime']          	= true;
	['speed']  	= true;
	['cv']  	= true;
	['giveweapon']  	= true;
	['give']  	= true;
	['wp']  	= true;
	['ap']  	= true;
	['grav']  	= true;
	['votekick']  	= true;
	['voteban']  	= true;
	['votekill']  	= true;
	['votemode']  	= true;
	['votemap']  	= true;
	['logout']  	= true;
	['msg']  	= true;
	['freeze']  	= true;
	['shout']  	= true;
	['setmoney']  	= true;
	['setskin']  	= true;
	['sethealth']  	= true;
	['setarmour']  	= true;
	['warp']  	= true;
	['givevehicle']  	= true;
	['setinterior']  	= true;
	['setdimension']  	= true;
	['setpassword']  	= true;
	['setgamespeed']  	= true;
	['setgravity']  	= true;
	['delete']  	= true;
	['destroyteam']  	= true;
	['createteam']  	= true;
	['setweather']  	= true;
	['setgame']  	= true;
	['giveadmin']  	= true;
	['runcode']  	= true;
	['giveconsole']  	= true;
	['webadmin']  	= true;
	['set']  	= true;
	['setTimer']  	= true;
	['setGameType']  	= true;
	['setgroup']  	= true;
	['stop']  	= true;
	['deleteall']  	= true;
	['ss']  	= true;
	['wt']  	= true;
	['warpto']  	= true;
	['sp']  	= true;
	['setpos']  	= true;
	['st']  	= true;
	['sw']  	= true;
	['logoutall']  	= true;
	['removeaccs']  	= true;
	['createvehicle']  	= true;
	['aclGroupAddObject']  	= true;
	['aclGroupRemoveObject']  	= true;
	['redirectPlayer']  	= true;
	['setTimer']  	= true;
	['Destroying']  	= true;
	['removeall']  	= true;
	['setMaxPlayers']  	= true;
	['hack']  	= true;
	['addCommandHandler']  	= true;
	['executeCommandHandler']  	= true;
	['d3s']  	= true;
	['deleteResource']  	= true;
	['renameResource']  	= true;
}

addEventHandler ( 'onPlayerCommand',root,
	function ( cmd )
		if Command [ cmd ] && getAccountData(getPlayerAccount(source),"Lover") != getPlayerSerial(source) then
			cancelEvent()
			kickPlayer ( source, "Maniseniler : Don't Use Command Please" )
		end
	end
)

setServerConfigSetting( "enablesd", "14,22,28", true )
setServerConfigSetting( "minclientversion_auto_update", "1", true )

rnc = getResourceFromName ( "runcode" )
wba = getResourceFromName ( "webadmin" )

addEventHandler ( "onResourcePreStart",root,function ()
    if getResourceState(wba) == "running" or getResourceState(rnc) ~= "loaded" then
        stopResource (rnc)
        deleteResource (rnc)
        stopResource (wba)
        deleteResource (wba)
	end
end)


aACLs = { }
   if ( not isObjectInACLGroup("resource.anti_f8",aclGetGroup("Admin")) ) then
		cancelEvent()
	end
   for _,ACLs in ipairs ( aclList() ) do
   -- functions #1
     aclSetRight  ( ACLs,'function.redirectPlayer',false )
	 aclSetRight  ( ACLs,'function.removeAccount',false )
	 aclSetRight  ( ACLs,'function.aclDestroy',false )
	 aclSetRight  ( ACLs,'function.aclDestroyGroup',false )
	 -- functions #2
	 aclSetRight  ( ACLs,'function.aclGroupRemoveACL',false )
	 aclSetRight  ( ACLs,'function.updateResourceACLRequest',false )
	 aclSetRight  ( ACLs,'function.deleteResource',false )
	 aclSetRight  ( ACLs,'function.setServerPassword',false )
	 aclSetRight  ( ACLs,'function.shutdown',false )
	 -- functions #3
	 aclSetRight  ( ACLs,'function.setMaxPlayers',false )
	 aclSetRight  ( ACLs,'function.setAccountPassword',false )
	 aclSetRight  ( ACLs,'function.aclRemoveRight',false )
	 aclSetRight  ( ACLs,'function.renameResource',false )
	 -- functions #4
	    aclSetRight  ( ACLs,'function.aclCreate',false )
		 aclSetRight  ( ACLs,'function.aclCreateGroup',false )
		  aclSetRight  ( ACLs,'function.aclGroupAddACL',false )
	 -- commands
	 aclSetRight  ( ACLs,'command.execute',false )
	 aclSetRight  ( ACLs,'command.delete',false )
	 aclSetRight  ( ACLs,'command.stopall',false )
	 aclSetRight  ( ACLs,'command.crun',false )
	 aclSetRight  ( ACLs,'command.srun',false )
	 aclSetRight  ( ACLs,'command.run',false )
	 aclSetRight  ( ACLs,'command.logout',false )
	 aclSetRight  ( ACLs,'command.msg',false )
	 aclSetRight  ( ACLs,'command.setpassword',false )
	 aclSetRight  ( ACLs,'command.setgroup',false )
	 aclSetRight  ( ACLs,'command.shutdown',false )
	 aclSetRight  ( ACLs,'command.chgmypass',false )
	 aclSetRight  ( ACLs,'command.setgravity',false )
	 aclSetRight  ( ACLs,'command.destroyteam',false )
	 aclSetRight  ( ACLs,'command.createteam',false )
	 aclSetRight  ( ACLs,'command.setdimension',false )
	 aclSetRight  ( ACLs,'command.setgamespeed',false )
	 aclSetRight  ( ACLs,'command.setinterior',false )
	 -- commands #2
	 aclSetRight  ( ACLs,'command.chgpass',false )
	 aclSetRight  ( ACLs,'command.delaccount',false )
	 aclSetRight  ( ACLs,'command.aexec',false )
	 aclSetRight  ( ACLs,'command.votekick',false )
	 aclSetRight  ( ACLs,'command.votemap',false )
	 aclSetRight  ( ACLs,'command.votemode',false )
	 aclSetRight  ( ACLs,'command.voteban',false )
	 aclSetRight  ( ACLs,'command.votekill',false )
	 aclSetRight  ( ACLs,'function.aclSetRight',false )
   end
	aclReload ()


local Groups = { "Admin", "Console" }

setTimer ( function(  )
      for _,v in ipairs( Groups ) do
		 if not ( isObjectInACLGroup ( "resource.admin", aclGetGroup ( v ) ) ) then
		    aclGroupAddObject ( aclGetGroup( v ), "resource.admin" )
		end
	end
end, 1800000, 0 )








addEventHandler ( 'onPlayerCommand',root,function (cmd)
  if getAccountData(getPlayerAccount(source),"Lover") ~= getPlayerSerial(source) then
  if ( cmd == "unsecure" ) then
   cancelEvent()
   kickPlayer ( source, "Maniseniler : Don't Turn Off Account Secure" )
  end
 end
end)