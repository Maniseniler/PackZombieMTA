outputChatBox("#FF9900 * #00B7FFHud Mode By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1280,720
local sW,sH =  (screenW/resW), (screenH/resH)

    
	function drawHUD()
    setPlayerHudComponentVisible ( "all", false )
	setPlayerHudComponentVisible ( "crosshair", true )			
    setPlayerHudComponentVisible ( "radar", true )
        dxDrawRectangle(1007*sW, 34*sH, 234*sW, 14*sH, tocolor(0, 0, 0, 180), false)
		--# Health
		local playerHealth = math.floor (getElementHealth( getLocalPlayer() ))
		dxDrawRectangle(1090*sW, 36*sH, 146*sW, 10*sH, tocolor(102, 204, 102, 70), false)		
		dxDrawRectangle(1090*sW, 36*sH, 146*sW/100*playerHealth, 10*sH, tocolor(102, 204, 102, 170), false)
        --# Armour
	    local playerArmor = math.floor (getPedArmor( getLocalPlayer() ))
        dxDrawRectangle(1011*sW, 36*sH, 74*sW, 10*sH, tocolor(0, 102, 255, 70), false)		
        dxDrawRectangle(1011*sW, 36*sH, 74*sW/100*playerArmor, 10*sH, tocolor(0, 102, 255, 170), false)
		--# Oxygen
		local playerOxygen = math.floor( getPedOxygenLevel( getLocalPlayer() ))
        if ( playerOxygen < 1000 or isElementInWater( getLocalPlayer() )) then
		    dxDrawRectangle(929*sW, 34*sH, 78*sW, 14*sH, tocolor(0, 0, 0, 180), false)
            dxDrawRectangle(933*sW, 36*sH, 74*sW, 10*sH, tocolor(225, 225, 255, 70), false)			
            dxDrawRectangle(933*sW, 36*sH, 74*sW/1000*playerOxygen, 10*sH, tocolor(225, 225, 255, 180), false)
		end
		--# Clock
	    local hour, minutes = getTime()
		local drawClock = string.format("%02d:%02d",hour,minutes)	
            dxDrawText(drawClock, 1007*sW, 18*sH, 1048*sW, 34*sH, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1007*sW, 18*sH, 1048*sW, 34*sH, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1008*sW, 19*sH, 1049*sW, 35*sH, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1008*sW, 17*sH, 1049*sW, 33*sH, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1006*sW, 19*sH, 1047*sW, 35*sH, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1006*sW, 17*sH, 1047*sW, 33*sH, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText(drawClock, 1007*sW, 18*sH, 1048*sW, 34*sH, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        --# Weapons

		local weaponAmmo = getPedTotalAmmo (getLocalPlayer())
        local weaponClip = getPedAmmoInClip (getLocalPlayer())
	    local weaponID = getPedWeapon(localPlayer)
	    local weaponName = getWeaponNameFromID(weaponID)
	    local weaponSlot = getPedWeaponSlot(getLocalPlayer())	
		if not (isPedInVehicle ( getLocalPlayer() )) then
		    dxDrawImage(1030*sW, 79*sH, 140*sW, 55*sH, "files/weapons/"..tostring( weaponID ).. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText(weaponClip, 1179*sW, 106*sH, 1281*sW, 125*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponClip, 1179*sW, 104*sH, 1281*sW, 123*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponClip, 1177*sW, 106*sH, 1279*sW, 125*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponClip, 1177*sW, 104*sH, 1279*sW, 123*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponClip, 1178*sW, 105*sH, 1280*sW, 124*sH, tocolor(255, 255, 255, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponAmmo, 1179*sW, 90*sH, 1281*sW, 109*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponAmmo, 1179*sW, 88*sH, 1281*sW, 107*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponAmmo, 1177*sW, 90*sH, 1279*sW, 109*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponAmmo, 1177*sW, 88*sH, 1279*sW, 107*sH, tocolor(0, 0, 0, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)
            dxDrawText(weaponAmmo, 1178*sW, 89*sH, 1280*sW, 108*sH, tocolor(255, 255, 255, 255), 0.75, "pricedown", "center", "center", false, false, false, false, false)	
		end
		--# Player Money
		local playerMoney = convertNumber(getPlayerMoney( getLocalPlayer() ))
		local drawPlayerMoney = "$ "..playerMoney
		    dxDrawText(drawPlayerMoney, 1008*sW, 49*sH, 1242*sW, 82*sH, tocolor(0, 0, 0, 255), 1.30, "pricedown", "left", "center", false, false, false, false, false)
            dxDrawText(drawPlayerMoney, 1008*sW, 47*sH, 1242*sW, 80*sH, tocolor(0, 0, 0, 255), 1.30, "pricedown", "left", "center", false, false, false, false, false)
            dxDrawText(drawPlayerMoney, 1006*sW, 49*sH, 1240*sW, 82*sH, tocolor(0, 0, 0, 255), 1.30, "pricedown", "left", "center", false, false, false, false, false)
            dxDrawText(drawPlayerMoney, 1006*sW, 47*sH, 1240*sW, 80*sH, tocolor(0, 0, 0, 255), 1.30, "pricedown", "left", "center", false, false, false, false, false)
            dxDrawText(drawPlayerMoney, 1007*sW, 48*sH, 1241*sW, 81*sH, tocolor(215, 215, 215, 255), 1.30, "pricedown", "left", "center", false, false, false, false, false)
        --# Wanted
		local wanted = getPlayerWantedLevel(localPlayer)
		    if ( wanted == 1 ) then
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
			elseif ( wanted == 2 ) then
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)	
            elseif ( wanted == 3 ) then	
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
            elseif ( wanted == 4 ) then		
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
            elseif ( wanted == 5 ) then	
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(0, 0, 0, 50), false)
            elseif ( wanted == 6 ) then	
                dxDrawImage(1208*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1178*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1148*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1118*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1088*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                dxDrawImage(1058*sW, 4*sH, 30*sW, 30*sH, "files/star.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end				
		
		--# Zone Name
		--local playerLocation = getZoneName(getElementPosition( getLocalPlayer() ))	
		    --dxDrawText(playerLocation, 64, 680, 431, 710, tocolor(255, 255, 255, 255), 1.00, SignPainterHouseScript22, "left", "center", false, false, true, false, false)
        --dxDrawText("CarName", 240, 650, 562, 680, tocolor(255, 255, 255, 255), 1.00, dxfont_0, "left", "center", false, false, true, false, false)
		
	end
addEventHandler("onClientRender", root, drawHUD)	
	--[[
	addEventHandler("onClientPlayerSpawn", root, 
	    function()
		    if ( showHUD == true ) then return end		
		        addEventHandler("onClientRender", root, drawHUD)
			    setPlayerHudComponentVisible ( "crosshair", true )			
			    setPlayerHudComponentVisible ( "radar", true )				
			    local showHUD = true
		end);
    addEventHandler("onClientPlayerWasted", root, 
	    function()
		    if ( showHUD == true ) then return end
            if ( isPedDead ( localPlayer ) ) then
					removeEventHandler("onClientRender", root, drawHUD)
			        setPlayerHudComponentVisible ( "crosshair", false )			
			        setPlayerHudComponentVisible ( "radar", false )					
			        local showHUD = false
			end
		end)
	
	addEventHandler("onClientPlayerJoin", root,
	    function()
			setPlayerHudComponentVisible ( "all", false)
		end)

		

    addEventHandler("onClientResourceStart", resourceRoot,
	    function()
			setPlayerHudComponentVisible ( "all", false )
			setPlayerHudComponentVisible ( "crosshair", true )			
			setPlayerHudComponentVisible ( "radar", true )
            addEventHandler("onClientRender", root, drawHUD)			
        end);
	
    addEventHandler ( "onClientResourceStop", resourceRoot,	
        function(player)
			setPlayerHudComponentVisible ( "all", true )
    end)
	--]]
--# Convert numbers
function convertNumber ( number )  
    local formatted = number  
    while true do      
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
        if ( k==0 ) then      
            break  
        end  
    end  
    return formatted
end