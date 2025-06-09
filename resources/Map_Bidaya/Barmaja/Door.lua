Door3 = createObject(980,844.40002441406,-2065.6999511719,14.60000038147,0,0,0)
markerDoor3 = createMarker(844.20001220703,-2066,12.89999961853,'cylinder',9.5,0,0,0,0)

addEventHandler('onMarkerHit',markerDoor3,
function ( hitElement )
     moveObject(Door3,1000,844.40002441406,-2065.6999511719,19.60000038147)
end
)

addEventHandler('onMarkerLeave',markerDoor3,
function ( hitElement )
     moveObject(Door3,1000,844.40002441406,-2065.6999511719,14.60000038147)
end
)

Door1 = createObject(980,828.90002441406,-2065.8999023438,14.60000038147,0,0,0)
markerDoor1 = createMarker(828.90002441406,-2065.3000488281,12.89999961853,'cylinder',10,0,0,0,0)

addEventHandler('onMarkerHit',markerDoor1,
function ( hitElement )
     moveObject(Door1,1000,828.90002441406,-2065.8999023438,19.89999961853)
end
)

addEventHandler('onMarkerLeave',markerDoor1,
function ( hitElement )
     moveObject(Door1,1000,828.90002441406,-2065.8999023438,14.60000038147)
end
)