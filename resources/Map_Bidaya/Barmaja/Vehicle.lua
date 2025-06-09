

Vehicles = {}
 
VehicleM = createMarker ( 823.46472, -1924.91931, 10.27680, "cylinder", 3, 255, 0, 128 )
ColorM = createMarker (  850.46973, -1924.42688, 10.99505, "cylinder", 3, 128, 0, 255)
 
addEventHandler( "onMarkerHit", root,
    function ( hitElement )
        if source == VehicleM and getElementType( hitElement ) == "player" then
            if Vehicles[hitElement] and getElementType( Vehicles[hitElement] ) == "vehicle" then
                destroyElement( Vehicles[hitElement] )
            end
            local x,y,z = getElementPosition( hitElement )
            Vehicles[hitElement] = createVehicle ( 470, x, y, z )
            if Vehicles[hitElement] then
                warpPedIntoVehicle( hitElement, Vehicles[hitElement] )
                outputChatBox( "#FF9900 * #FFFFFF[#FF0000 Vehicle System #FFFFFF] :#0099FF تم اعطائك سيارة", hitElement, 255, 0, 0, true )
            end
        elseif source == ColorM and getElementType( hitElement) == "player" and isPedInVehicle( hitElement ) then
            local player = getPedOccupiedVehicle( hitElement )
            setVehicleColor( player, math.random(255), math.random(255), math.random(255) )
            outputChatBox( "#FF9900 * #FFFFFF[#FF0000 Color System #FFFFFF] :#0099FF تم تلوين سيارتك ", hitElement, 0, 255, 0, true )
        end
    end
)
 
addEventHandler( "onVehicleExplode", root,
    function( )
        setTimer( destroyElement, 2000, 1, source )
    end
)
 
addEventHandler( "onPlayerQuit", root,
    function( )
        if Vehicles[source] then
            destroyElement( Vehicles[source] )
        end
    end
)
