outputChatBox('#FF9900 * #00B7FFTAG By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R',150,150,150,true)
 
 addEventHandler( "onClientResourceStart", resourceRoot, function(  )
  TimerDownload = setTimer( function(   )
   if ( isTransferBoxActive (    ) ~= true ) then
		  triggerServerEvent ( "Everyone", localPlayer )
         killTimer( TimerDownload )
      end
   end, 5000, 0 )
end )

