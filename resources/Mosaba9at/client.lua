outputChatBox("#FF9900 * #FFD900P#EBCC00r#E3C900i#D4BF00m#C2B200a#B8AC00i#A69E02r#948F00e #948F00W#A69E02r#B8AC00i#C2B200t#D4BF00e #00B7FFBy #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
GUIEditor = {
    edit = {},
    button = {},
    window = {},
    label = {},
    memo = {}
}

local screenW, screenH = guiGetScreenSize()

br = { button = {}, window = {}, label = {}, edit = {} }

br["window"]["event"] = guiCreateWindow((screenW - 412) / 2, (screenH - 213) / 2, 412, 213, "[ لوحة مسابقات ]", false)
guiWindowSetSizable(br["window"]["event"], false)
guiSetVisible(br["window"]["event"], false)

        GUIEditor.label[1] = guiCreateLabel(249, 32, 157, 16, "هنا الكلمة او السؤال", false, br["window"]["event"])
        guiSetFont(GUIEditor.label[1], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[1], 0, 172, 252)
        GUIEditor.label[2] = guiCreateLabel(10, 32, 157, 16, "هنا اعادة الكلمة او الجواب", false, br["window"]["event"])
        guiSetFont(GUIEditor.label[2], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[2], 0, 172, 252)

		GUIEditor.memo[1] = guiCreateMemo(128, 102, 162, 93, "مود اول من يكتب في الشات\nمن صنع  : DeaD\n\nDate : 06/06/2018", false, br["window"]["event"])    

		
br["edit"]["answer"] = guiCreateEdit(10, 58, 157, 34, "الإجابة", false, br["window"]["event"])
br["edit"]["prize"] = guiCreateEdit(8888, 8888, 100, 37, "الجائزة $", false, br["window"]["event"])
br["edit"]["Ques"] = guiCreateEdit(245, 58, 157, 34, "السؤال", false, br["window"]["event"])
br["button"]["apply"] = guiCreateButton(10, 170, 88, 27, "تطبيق", false, br["window"]["event"])
guiSetFont(br["button"]["apply"], "default-bold-small")
guiSetProperty(br["button"]["apply"], "NormalTextColour", "FF4DFE00")
br["button"]["close"] = guiCreateButton(314, 170, 88, 27, "إغلاق", false, br["window"]["event"])
guiSetFont(br["button"]["close"], "default-bold-small")
guiSetProperty(br["button"]["close"], "NormalTextColour", "FFFE0000")


addEvent( "Client:CallPanel", true )
addEventHandler( "Client:CallPanel", getRootElement(),
function()
if guiGetVisible(br["window"]["event"]) then
guiSetVisible(br["window"]["event"], false)
showCursor(false)
else
guiSetVisible(br["window"]["event"], true)
showCursor(true)
guiSetText(br["edit"]["answer"],"")
guiSetText(br["edit"]["prize"],"1000")
guiSetText(br["edit"]["Ques"],"")
end
end)

addEventHandler( "onClientGUIClick",root,
function ()
local Answer = guiGetText(br["edit"]["answer"])
local Prize = guiGetText(br["edit"]["prize"])
local Ques = guiGetText(br["edit"]["Ques"])
if source == br["edit"]["answer"] then
if Answer == "الإجابة" then
guiSetText(br["edit"]["answer"],"")
end
elseif source == br["edit"]["prize"] then
if Prize == "الجائزة $" then
guiSetText(br["edit"]["prize"],"")
end
elseif source == br["edit"]["Ques"] then
if Ques == "السؤال" then
guiSetText(br["edit"]["Ques"],"")
end
elseif source == br["button"]["close"] then
guiSetVisible(br["window"]["event"], false)
showCursor(false)
elseif source == br["button"]["apply"] then
if Answer == "" or Answer ==" " then return outputChatBox("[Primaire Write System] : ادخل الاجابة",255,0,0) end
if Ques == "" or Ques ==" " then return outputChatBox("[Primaire Write System] : ادخل السؤال رجاء",255,0,0) end
if not tonumber(Prize) or Prize =="" then return outputChatBox("[Primaire Write System] : الجائزة تكون ارقام فقط ",255,0,0) end
triggerServerEvent("CreateEvent", getLocalPlayer(), Answer,Ques, tonumber(Prize))
end
end)