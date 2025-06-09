sezi = 200 -- الحجم    (-1488.89160 -6173.69189 109.17812)
x,y,z = 791.0283203125, -2168.658203125, 100.955365180969 -- الاحداثيات
Col = createColRectangle (x,y,z,sezi)
Radar = createRadarArea (x,y,z,sezi,255,0,0,100,root)

addEventHandler("onColShapeHit",Col,function (HitElement)
if getElementType(HitElement) == "vehicle" then
destroyElement( HitElement )
elseif getElementType(HitElement) == "player" then
outputChatBox("#FF0000* #FFFFFF[ #FF0000 انت الان داخل الحماية ـ #FFFFFF]",HitElement,255,0,0,true)
toggleControl (HitElement,"fire",false)
toggleControl (HitElement,"aim_weapon",false)
end 
end)
addEventHandler("onColShapeLeave",Col,function (LeaveElement)
if getElementType(LeaveElement) == "player"  then
outputChatBox("#FF0000* #FFFFFF[ #00FF00 انت الان خارج الحماية ـ #FFFFFF]",LeaveElement,0,255,0,true)
toggleControl (LeaveElement,"fire",true)
toggleControl (LeaveElement,"aim_weapon",true)
end 
end)
