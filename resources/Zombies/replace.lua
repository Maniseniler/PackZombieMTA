function loadCars()	


     local txd = engineLoadTXD("skins/310.txd")
	engineImportTXD(txd,310)
	local dff = engineLoadDFF("skins/310.dff",310)
	engineReplaceModel(dff,310)
	
	end
	addEventHandler("onClientResourceStart",resourceRoot,loadCars)
