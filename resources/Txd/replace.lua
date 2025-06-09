function loadCars()	

        local txd = engineLoadTXD("data/287.txd")
	engineImportTXD (txd,284)
	local dff = engineLoadDFF ("data/287.dff", 284)
	engineReplaceModel(dff,284)

 ---------------------------------------------------------
	local txd = engineLoadTXD("data/patriot.txd")
	engineImportTXD (txd,470)
	local dff = engineLoadDFF ("data/patriot.dff", 470)
	engineReplaceModel(dff,470)


end
addEventHandler("onClientResourceStart",resourceRoot,loadCars)