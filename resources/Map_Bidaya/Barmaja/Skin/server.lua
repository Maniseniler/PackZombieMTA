    marker = createMarker( 833.21552, -2128.86963, 12.65282, "cylinder", 1.3, 0, 128, 255 )
	

       function buy(id)
        reskin = setElementModel(source, id)
        takePlayerMoney(source, 100)
        playeraccount = getPlayerAccount(source)
        setAccountData(playeraccount, "standardskin", id)
    end
    addEvent("useSkin",true)
    addEventHandler("useSkin", root, buy)
     
	
	function guishow(hitPlayer)
triggerClientEvent (hitPlayer,"guishowc",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker,guishow)
