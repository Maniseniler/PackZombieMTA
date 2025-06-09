outputChatBox("#FF9900 * #FFFFFF[#FF0000 Bidaya #FFFFFF] : #0077FFاكتب سيارة للانتقال لمكان السيارة ",255,0,0,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 local g_screenX, g_screenY = guiGetScreenSize();
    local gScale = 0.2;
    local gAlphaDistance = 50;
    local gMaxDistance = 50; -- Max Distance
    local gTextAlpha = 120;
    local gTextSize = 1;
    local gAlphaDiff = gMaxDistance - gAlphaDistance;
    gScale = 1 / gScale * 800 / g_screenY;
    local gMaxScaleCurve = { { 0, 0 }, { 3, 3 }, { 13, 5 } };
    local gTextScaleCurve = { { 0, 0.8 }, { 0.8, 1.2 }, { 99, 99 } };
    local gTextAlphaCurve = { { 0, 0 }, { 25, 100 }, { 120, 190 }, { 255, 190 } };
    local Marker = createMarker( 823.46472, -1924.91931, 13.27680, 'cylinder', 1.0, 0, 0, 0, 0 );
     
    addEventHandler ( 'onClientRender', root,
        function ( )
            local x, y, z = getCameraMatrix();
            local x1, y1, z1 = getElementPosition ( Marker );
           
            local distance_1 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 );
            if distance_1 <= gMaxDistance then
            local x1_, y1_ = getScreenFromWorldPosition( x1, y1, z1 + 0.95, 0.06 );
            if x1_ and y1_ then
            local scale = 1 / ( gScale * ( distance_1 / gMaxDistance ) );
            local alpha = ( ( distance_1 - gAlphaDistance ) / gAlphaDiff );
            alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha );
            scale = math.evalCurve( gMaxScaleCurve, scale );
            local textscale = math.evalCurve( gTextScaleCurve, scale );
            local textalpha = math.evalCurve( gTextAlphaCurve, alpha );
                    dxDrawText( "سيارة", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
					dxDrawText( "سيارة", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
                end 
            end
        end
    );
     
function math.evalCurve( curve, input )
        if input < curve[ 1 ][ 1 ] then
            return curve[ 1 ][ 2 ];
        end
        for idx = 2, #curve do
            if input < curve[ idx ][ 1 ] then
                local x1 = curve[ idx - 1 ][ 1 ];
                local y1 = curve[ idx - 1 ][ 2 ];
                local x2 = curve[ idx ][ 1 ];
                local y2 = curve[ idx ][ 2 ];
                local alpha = ( input - x1 ) / ( x2 - x1 );
                return math.lerp( y1, y2, alpha );
            end
        end
        return curve[ #curve ][ 2 ];
    end
     
    function math.lerp( from, to, alpha )
        return from + ( to-from ) * alpha;
    end 
	
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	 local g_screenX, g_screenY = guiGetScreenSize();
    local gScale = 0.2;
    local gAlphaDistance = 50;
    local gMaxDistance = 50; -- Max Distance
    local gTextAlpha = 120;
    local gTextSize = 1;
    local gAlphaDiff = gMaxDistance - gAlphaDistance;
    gScale = 1 / gScale * 800 / g_screenY;
    local gMaxScaleCurve = { { 0, 0 }, { 3, 3 }, { 13, 5 } };
    local gTextScaleCurve = { { 0, 0.8 }, { 0.8, 1.2 }, { 99, 99 } };
    local gTextAlphaCurve = { { 0, 0 }, { 25, 100 }, { 120, 190 }, { 255, 190 } };
    local Marker = createMarker( 850.46973, -1924.42688, 13.99505, 'cylinder', 1.0, 0, 0, 0, 0 );
     
    addEventHandler ( 'onClientRender', root,
        function ( )
            local x, y, z = getCameraMatrix();
            local x1, y1, z1 = getElementPosition ( Marker );
           
            local distance_1 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 );
            if distance_1 <= gMaxDistance then
            local x1_, y1_ = getScreenFromWorldPosition( x1, y1, z1 + 0.95, 0.06 );
            if x1_ and y1_ then
            local scale = 1 / ( gScale * ( distance_1 / gMaxDistance ) );
            local alpha = ( ( distance_1 - gAlphaDistance ) / gAlphaDiff );
            alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha );
            scale = math.evalCurve( gMaxScaleCurve, scale );
            local textscale = math.evalCurve( gTextScaleCurve, scale );
            local textalpha = math.evalCurve( gTextAlphaCurve, alpha );
                    dxDrawText( "تلوين السيارة", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
					dxDrawText( "تلوين السيارة", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
                end 
            end
        end
    );
     
function math.evalCurve( curve, input )
        if input < curve[ 1 ][ 1 ] then
            return curve[ 1 ][ 2 ];
        end
        for idx = 2, #curve do
            if input < curve[ idx ][ 1 ] then
                local x1 = curve[ idx - 1 ][ 1 ];
                local y1 = curve[ idx - 1 ][ 2 ];
                local x2 = curve[ idx ][ 1 ];
                local y2 = curve[ idx ][ 2 ];
                local alpha = ( input - x1 ) / ( x2 - x1 );
                return math.lerp( y1, y2, alpha );
            end
        end
        return curve[ #curve ][ 2 ];
    end
     
    function math.lerp( from, to, alpha )
        return from + ( to-from ) * alpha;
    end 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	 local g_screenX, g_screenY = guiGetScreenSize();
    local gScale = 0.2;
    local gAlphaDistance = 50;
    local gMaxDistance = 50; -- Max Distance
    local gTextAlpha = 120;
    local gTextSize = 1;
    local gAlphaDiff = gMaxDistance - gAlphaDistance;
    gScale = 1 / gScale * 800 / g_screenY;
    local gMaxScaleCurve = { { 0, 0 }, { 3, 3 }, { 13, 5 } };
    local gTextScaleCurve = { { 0, 0.8 }, { 0.8, 1.2 }, { 99, 99 } };
    local gTextAlphaCurve = { { 0, 0 }, { 25, 100 }, { 120, 190 }, { 255, 190 } };
    local Marker = createMarker(833.21552, -2128.86963, 13.65282, 'cylinder', 1.0, 0, 0, 0, 0 );
     
    addEventHandler ( 'onClientRender', root,
        function ( )
            local x, y, z = getCameraMatrix();
            local x1, y1, z1 = getElementPosition ( Marker );
           
            local distance_1 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 );
            if distance_1 <= gMaxDistance then
            local x1_, y1_ = getScreenFromWorldPosition( x1, y1, z1 + 0.95, 0.06 );
            if x1_ and y1_ then
            local scale = 1 / ( gScale * ( distance_1 / gMaxDistance ) );
            local alpha = ( ( distance_1 - gAlphaDistance ) / gAlphaDiff );
            alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha );
            scale = math.evalCurve( gMaxScaleCurve, scale );
            local textscale = math.evalCurve( gTextScaleCurve, scale );
            local textalpha = math.evalCurve( gTextAlphaCurve, alpha );
                    dxDrawText( "شراء شخصية", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
					dxDrawText( "شراء شخصية", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
                end 
            end
        end
    );
     
function math.evalCurve( curve, input )
        if input < curve[ 1 ][ 1 ] then
            return curve[ 1 ][ 2 ];
        end
        for idx = 2, #curve do
            if input < curve[ idx ][ 1 ] then
                local x1 = curve[ idx - 1 ][ 1 ];
                local y1 = curve[ idx - 1 ][ 2 ];
                local x2 = curve[ idx ][ 1 ];
                local y2 = curve[ idx ][ 2 ];
                local alpha = ( input - x1 ) / ( x2 - x1 );
                return math.lerp( y1, y2, alpha );
            end
        end
        return curve[ #curve ][ 2 ];
    end
     
    function math.lerp( from, to, alpha )
        return from + ( to-from ) * alpha;
    end 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	 local g_screenX, g_screenY = guiGetScreenSize();
    local gScale = 0.2;
    local gAlphaDistance = 50;
    local gMaxDistance = 50; -- Max Distance
    local gTextAlpha = 120;
    local gTextSize = 1;
    local gAlphaDiff = gMaxDistance - gAlphaDistance;
    gScale = 1 / gScale * 800 / g_screenY;
    local gMaxScaleCurve = { { 0, 0 }, { 3, 3 }, { 13, 5 } };
    local gTextScaleCurve = { { 0, 0.8 }, { 0.8, 1.2 }, { 99, 99 } };
    local gTextAlphaCurve = { { 0, 0 }, { 25, 100 }, { 120, 190 }, { 255, 190 } };
    local Marker = createMarker( 852.48291, -2128.82666 ,13.65282, 'cylinder', 1.0, 0, 0, 0, 0 );
     
    addEventHandler ( 'onClientRender', root,
        function ( )
            local x, y, z = getCameraMatrix();
            local x1, y1, z1 = getElementPosition ( Marker );
           
            local distance_1 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 );
            if distance_1 <= gMaxDistance then
            local x1_, y1_ = getScreenFromWorldPosition( x1, y1, z1 + 0.95, 0.06 );
            if x1_ and y1_ then
            local scale = 1 / ( gScale * ( distance_1 / gMaxDistance ) );
            local alpha = ( ( distance_1 - gAlphaDistance ) / gAlphaDiff );
            alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha );
            scale = math.evalCurve( gMaxScaleCurve, scale );
            local textscale = math.evalCurve( gTextScaleCurve, scale );
            local textalpha = math.evalCurve( gTextAlphaCurve, alpha );
                    dxDrawText( "دم و درع", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
					dxDrawText( "دم و درع", x1_, y1_, x1_, y1_, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "default-bold-small", "center", "bottom", false, false, false, true )
                end 
            end
        end
    );
     
function math.evalCurve( curve, input )
        if input < curve[ 1 ][ 1 ] then
            return curve[ 1 ][ 2 ];
        end
        for idx = 2, #curve do
            if input < curve[ idx ][ 1 ] then
                local x1 = curve[ idx - 1 ][ 1 ];
                local y1 = curve[ idx - 1 ][ 2 ];
                local x2 = curve[ idx ][ 1 ];
                local y2 = curve[ idx ][ 2 ];
                local alpha = ( input - x1 ) / ( x2 - x1 );
                return math.lerp( y1, y2, alpha );
            end
        end
        return curve[ #curve ][ 2 ];
    end
     
    function math.lerp( from, to, alpha )
        return from + ( to-from ) * alpha;
    end 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------