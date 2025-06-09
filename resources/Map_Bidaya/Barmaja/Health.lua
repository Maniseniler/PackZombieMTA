local mrk = createMarker(852.48291, -2128.82666 ,13.65282 -1,"cylinder",1.3, 255, 128, 0)



addEventHandler("onMarkerHit",mrk,
	function ( source )
	
	
	setElementHealth(source,200)
	
	setPedArmor(source,100)
outputChatBox("#FF9900 * #FFFFFF[#FF0000 Health Armor #FFFFFF] :#0099FF تم اعطاؤك دم ودرع",source,255,255,255,true)

end
)