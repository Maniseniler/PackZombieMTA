--- Edit by DeaD
GUIEditor = {
    button = {},
    window = {},
    edit = {}
}
local screenW, screenH = guiGetScreenSize()
GUIEditor.window[1] = guiCreateWindow((screenW - 293) / 2, (screenH - 113) / 2, 293, 113, "[ مود توزيع ساعات ]", false)
guiWindowSetSizable(GUIEditor.window[1], false)

GUIEditor.edit[1] = guiCreateEdit(9, 31, 182, 32, "", false, GUIEditor.window[1])
GUIEditor.button[1] = guiCreateButton(191, 32, 91, 35, "توزيع الان", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[1], "default-bold-small")
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF008CFF")
GUIEditor.button[2] = guiCreateButton(100, 67, 91, 35, "فتح لتوزيع", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[2], "default-bold-small")
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FF008CFF")
GUIEditor.button[3] = guiCreateButton(9, 67, 91, 35, "اغلاق", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[3], "default-bold-small")
guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FF008CFF")
GUIEditor.button[4] = guiCreateButton(192, 67, 91, 35, "ايقاف التوزيع", false, GUIEditor.window[1])
guiSetFont(GUIEditor.button[4], "default-bold-small")
guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FF008CFF")

addEventHandler("onClientGUIClick",root,function ()
if source == GUIEditor.button[1] then
local houres = guiGetText(GUIEditor.edit[1])
triggerServerEvent("Give;Houres",localPlayer,houres)
outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : [#0077FF DePouTy #0051B3CoNsole #FFFFFF] Set Some Hours As A Gift",255,255,0,true)
elseif source == GUIEditor.button[2] then
triggerServerEvent("Enable;Houres",localPlayer,'true')
outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : [#0077FF DePouTy #0051B3CoNsole #FFFFFF] Hours Collect On",255,255,0,true)
elseif source == GUIEditor.button[4] then
triggerServerEvent("Enable;Houres",localPlayer,'false')
outputChatBox("#FF9900 * #FFFFFF[ #008CFFTime #FFFFFF] : [#0077FF DePouTy #0051B3CoNsole #FFFFFF] Hours Collect Off",255,255,0,true)
elseif source == GUIEditor.button[3] then
    guiSetInputEnabled(false)
    showCursor(false)
    guiSetVisible(GUIEditor.window[1],false)

end end)
guiSetVisible (GUIEditor.window[1], false )
function OpenWin()
    if guiGetVisible (GUIEditor.window[1]) then   
       guiSetVisible (GUIEditor.window[1], false )
       showCursor(false)
       guiSetInputEnabled(false)
    else
          triggerServerEvent("SHOW_s",localPlayer)
    end
end
bindKey("F4", "down", OpenWin)

 addEvent('SHOW',true)
 addEventHandler('SHOW',root,
 function ()
  guiSetVisible (GUIEditor.window[1], true )
 showCursor(true)
 guiSetInputEnabled(true)
 end
 )