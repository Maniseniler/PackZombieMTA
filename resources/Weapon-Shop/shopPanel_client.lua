outputChatBox("#FF9900 * #00B7FFShop Panel By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)
local sWidth, sHeight = guiGetScreenSize()

local tabPanel = {}
local buttons = {}
local labels = {}
local images = {}

local player = localPlayer

function shopInterface()
GUIEditor = {
    staticimage = {},
    label = {},
    button = {},
    window = {},
    memo = {}
}

local screenW, screenH = guiGetScreenSize()

	shop_window = guiCreateWindow((screenW - 789) / 2, (screenH - 614) / 2, 789, 614, "[ Weapons Shop | By | Elian Host Panel ]", false)
	guiSetVisible(shop_window, false)
	guiWindowSetSizable(shop_window, false)
        GUIEditor.memo[1] = guiCreateMemo(396, 430, 384, 164, "                  Welcome To Elian Host Panel\n\n   انشاء الله تقضو معانا اوقاة ممتعة                               \n\nMod : Weapons Shop\n        By : Mr_DeaD\n                      Time : 04:20 Am\n                                              Date : 02/06/2018", false, shop_window)
guiMemoSetReadOnly(GUIEditor.memo[1], true)		
 GUIEditor.label[47] = guiCreateLabel(384, 404, 396, 22, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, shop_window)
        guiSetFont(GUIEditor.label[47], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[47], 0, 203, 255)
		GUIEditor.label[45] = guiCreateLabel(384, 147, 396, 22, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, shop_window)
        guiSetFont(GUIEditor.label[45], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[45], 0, 203, 255)
		
		
		----------------------------------------------------------
		
		        GUIEditor.label[14] = guiCreateLabel(375, 23, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[14], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[14], 255, 0, 252)
        GUIEditor.label[15] = guiCreateLabel(375, 41, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[15], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[15], 255, 0, 252)
        GUIEditor.label[16] = guiCreateLabel(375, 61, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[16], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[16], 255, 0, 252)
        GUIEditor.label[17] = guiCreateLabel(375, 79, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[17], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[17], 255, 0, 252)
        GUIEditor.label[18] = guiCreateLabel(375, 99, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[18], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[18], 255, 0, 252)
        GUIEditor.label[19] = guiCreateLabel(375, 119, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[19], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[19], 255, 0, 252)
        GUIEditor.label[20] = guiCreateLabel(375, 141, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[20], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[20], 255, 0, 252)
        GUIEditor.label[21] = guiCreateLabel(375, 161, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[21], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[21], 255, 0, 252)
        GUIEditor.label[22] = guiCreateLabel(375, 179, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[22], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[22], 255, 0, 252)
        GUIEditor.label[23] = guiCreateLabel(375, 215, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[23], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[23], 255, 0, 252)
        GUIEditor.label[24] = guiCreateLabel(375, 197, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[24], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[24], 255, 0, 252)
        GUIEditor.label[25] = guiCreateLabel(375, 235, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[25], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[25], 255, 0, 252)
        GUIEditor.label[26] = guiCreateLabel(375, 253, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[26], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[26], 255, 0, 252)
        GUIEditor.label[27] = guiCreateLabel(375, 271, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[27], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[27], 255, 0, 252)
        GUIEditor.label[28] = guiCreateLabel(375, 291, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[28], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[28], 255, 0, 252)
        GUIEditor.label[29] = guiCreateLabel(375, 309, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[29], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[29], 255, 0, 252)
        GUIEditor.label[30] = guiCreateLabel(375, 327, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[30], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[30], 255, 0, 252)
        GUIEditor.label[31] = guiCreateLabel(375, 345, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[31], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[31], 255, 0, 252)
        GUIEditor.label[32] = guiCreateLabel(375, 365, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[32], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[32], 255, 0, 252)
        GUIEditor.label[33] = guiCreateLabel(375, 382, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[33], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[33], 255, 0, 252)
        GUIEditor.label[34] = guiCreateLabel(375, 406, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[34], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[34], 255, 0, 252)
        GUIEditor.label[35] = guiCreateLabel(375, 426, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[35], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[35], 255, 0, 252)
        GUIEditor.label[36] = guiCreateLabel(375, 444, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[36], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[36], 255, 0, 252)
        GUIEditor.label[37] = guiCreateLabel(375, 464, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[37], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[37], 255, 0, 252)
        GUIEditor.label[38] = guiCreateLabel(375, 482, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[38], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[38], 255, 0, 252)
        GUIEditor.label[39] = guiCreateLabel(375, 502, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[39], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[39], 255, 0, 252)
        GUIEditor.label[40] = guiCreateLabel(375, 519, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[40], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[40], 255, 0, 252)
        GUIEditor.label[41] = guiCreateLabel(375, 543, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[41], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[41], 255, 0, 252)
        GUIEditor.label[42] = guiCreateLabel(375, 563, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[42], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[42], 255, 0, 252)
        GUIEditor.label[43] = guiCreateLabel(375, 584, 15, 28, "|", false, shop_window)
        guiSetFont(GUIEditor.label[43], "default-bold-small")
        guiLabelSetColor(GUIEditor.label[43], 255, 0, 252)
		
		-------------------------------------------------------------
		
	labels.body = guiCreateLabel(395, 23, 120, 18, "Body:", false, shop_window)
	guiLabelSetColor(labels.body, 26, 117, 255)
	guiSetFont(labels.body, "default-bold-small")
	
	labels.Skills = guiCreateLabel(394, 171, 197, 18, "Skills :                       Weapons Skills", false, shop_window)
	guiLabelSetColor(labels.Skills, 26, 117, 255)
	guiSetFont(labels.Skills, "default-bold-small")

	labels.Weapons = guiCreateLabel(31, 23, 120, 18, "Weapons:", false, shop_window)
	guiLabelSetColor(labels.Weapons, 26, 117, 255)
	guiSetFont(labels.Weapons, "default-bold-small")


	buttons.skill_M4 = guiCreateButton(410, 219, 82, 18, "M4", false, shop_window) -- M4 skill
	labels.price_M4 = guiCreateLabel(410, 237, 82, 18, "$ 4.500", false, shop_window)
	guiLabelSetVerticalAlign(labels.price_M4, "center")
	guiLabelSetHorizontalAlign(labels.price_M4, "center", false)
	guiSetFont(labels.price_M4, "default-bold-small")
	guiLabelSetColor(labels.price_M4, 222, 255, 0)
	
	guiSetFont(buttons.skill_M4, "default-bold-small")
    guiSetProperty(buttons.skill_M4, "NormalTextColour", "FF30FF00")

	buttons.skill_AK47  = guiCreateButton(509, 221, 82, 18, "Ak-47", false, shop_window) -- AK47 skill
	labels.price_AK47 = guiCreateLabel(509, 237, 91, 18, "$ 4.500", false, shop_window)
	guiLabelSetVerticalAlign(labels.price_AK47, "center")
	guiLabelSetColor(labels.price_AK47, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_AK47, "center", false)
	guiSetFont(labels.price_AK47, "default-bold-small")
	
    guiSetFont(buttons.skill_AK47, "default-bold-small")
    guiSetProperty(buttons.skill_AK47, "NormalTextColour", "FF30FF00") 
	
	buttons.skill_SawnOff = guiCreateButton(610, 221, 146, 18, "Sawn-Off Shotgun", false, shop_window) -- Sawn-off Shotgun skill
	labels.price_SawnOff = guiCreateLabel(620,237, 91, 18, "$ 4.800", false, shop_window)
	guiLabelSetColor(labels.price_SawnOff, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_SawnOff, "center")
	guiLabelSetHorizontalAlign(labels.price_SawnOff, "center", false)
	guiSetFont(labels.price_SawnOff, "default-bold-small")
	
guiSetFont(buttons.skill_SawnOff, "default-bold-small")
guiSetProperty(buttons.skill_SawnOff, "NormalTextColour", "FF30FF00")

	buttons.skill_Shotgun = guiCreateButton(410, 255, 82, 18, "Shotgun", false, shop_window) -- Shotgun skill
	labels.price_Shotgun = guiCreateLabel(410, 271, 91, 18, "$ 4.300", false, shop_window)
	guiLabelSetColor(labels.price_Shotgun, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_Shotgun, "center")
	guiLabelSetHorizontalAlign(labels.price_Shotgun, "center", false)
	guiSetFont(labels.price_Shotgun, "default-bold-small")
	
	guiSetFont(buttons.skill_Shotgun, "default-bold-small")
guiSetProperty(buttons.skill_Shotgun, "NormalTextColour", "FF30FF00")

	buttons.skill_SPAZ12 = guiCreateButton(510, 253, 82, 18, "Spaz-12", false, shop_window) -- SPAZ-12 skill
	labels.price_SPAZ12 = guiCreateLabel(510, 273, 91, 18, "$ 4.300", false, shop_window)
	guiLabelSetColor(labels.price_SPAZ12, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_SPAZ12, "center")
	guiLabelSetHorizontalAlign(labels.price_SPAZ12, "center", false)
	guiSetFont(labels.price_SPAZ12, "default-bold-small")
	
	guiSetFont(buttons.skill_SPAZ12, "default-bold-small")
guiSetProperty(buttons.skill_SPAZ12, "NormalTextColour", "FF30FF00")

	buttons.skill_SilencedPistol = guiCreateButton(610, 255, 146, 18, "Silenced Pistol", false, shop_window) -- Silenced Pistol skill
	labels.price_SilencedPistol = guiCreateLabel(620, 271, 91, 18, "$ 4.000", false, shop_window)
	guiLabelSetColor(labels.price_SilencedPistol, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_SilencedPistol, "center")
	guiLabelSetHorizontalAlign(labels.price_SilencedPistol, "center", false)
	guiSetFont(labels.price_SilencedPistol, "default-bold-small")
	
	guiSetFont(buttons.skill_SilencedPistol, "default-bold-small")
guiSetProperty(buttons.skill_SilencedPistol, "NormalTextColour", "FF30FF00")

	buttons.skill_DesertEagle = guiCreateButton(410, 291, 82, 18, "Desert Eagle", false, shop_window) -- Desert eagle skill
	labels.price_DesertEagle = guiCreateLabel(410, 309, 91, 18, "$ 4.500", false, shop_window)
	guiLabelSetColor(labels.price_DesertEagle, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_DesertEagle, "center")
	guiLabelSetHorizontalAlign(labels.price_DesertEagle, "center", false)
	guiSetFont(labels.price_DesertEagle, "default-bold-small")
	
	guiSetFont(buttons.skill_DesertEagle, "default-bold-small")
guiSetProperty(buttons.skill_DesertEagle, "NormalTextColour", "FF30FF00")

	buttons.skill_Pistol = guiCreateButton(510, 291, 82, 18, "Pistol", false, shop_window) -- Pistol skill
	labels.price_Pistol = guiCreateLabel(510, 309, 91, 18, "$ 4.100", false, shop_window)
	guiLabelSetColor(labels.price_Pistol, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_Pistol, "center")
	guiLabelSetHorizontalAlign(labels.price_Pistol, "center", false)
	guiSetFont(labels.price_Pistol, "default-bold-small")

	guiSetFont(buttons.skill_Pistol, "default-bold-small")
guiSetProperty(buttons.skill_Pistol, "NormalTextColour", "FF30FF00")
	
	buttons.skill_MP5 = guiCreateButton(610, 291, 146, 18, "MP5", false, shop_window) -- MP5 skill
	labels.price_MP5 = guiCreateLabel(620, 309, 91, 18, "$ 4.200", false, shop_window)
	guiLabelSetColor(labels.price_MP5, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_MP5, "center")
	guiLabelSetHorizontalAlign(labels.price_MP5, "center", false)
	guiSetFont(labels.price_MP5, "default-bold-small")
	
	guiSetFont(buttons.skill_MP5, "default-bold-small")
guiSetProperty(buttons.skill_MP5, "NormalTextColour", "FF30FF00")

	buttons.skill_UziAndTEC9 = guiCreateButton(410, 327, 82, 18, "Uzi/Tec-9", false, shop_window) -- Micro Uzi and TEC-9 skill
	labels.price_UziAndTEC9 = guiCreateLabel(429, 347, 91, 18, "$ 4.800", false, shop_window)
	guiLabelSetColor(labels.price_UziAndTEC9, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_UziAndTEC9, "center")
	guiLabelSetHorizontalAlign(labels.price_UziAndTEC9, "center", false)
	guiSetFont(labels.price_UziAndTEC9, "default-bold-small")
	
	guiSetFont(buttons.skill_UziAndTEC9, "default-bold-small")
guiSetProperty(buttons.skill_UziAndTEC9, "NormalTextColour", "FF30FF00")

	buttons.skill_Sniper = guiCreateButton(546, 327, 146, 18, "Sniper rifle", false, shop_window) -- Sniper rifle skill
	labels.price_Sniper = guiCreateLabel(566, 347, 91, 18, "$ 4.000", false, shop_window)
	guiLabelSetColor(labels.price_Sniper, 222, 255, 0)
	guiLabelSetVerticalAlign(labels.price_Sniper, "center")
	guiLabelSetHorizontalAlign(labels.price_Sniper, "center", false)
	guiSetFont(labels.price_Sniper, "default-bold-small")
	
	guiSetFont(buttons.skill_Sniper, "default-bold-small")
guiSetProperty(buttons.skill_Sniper, "NormalTextColour", "FF30FF00")
----------------------------------------------------------------------------------------------------
	buttons.skill_MaxHealth = guiCreateButton(656, 58, 100, 21, "Max health", false, shop_window) -- Max Health skill
	labels.price_MaxHealth = guiCreateLabel(656, 79, 91, 18, "$ 3.800", false, shop_window)
	guiLabelSetColor(labels.price_MaxHealth, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_MaxHealth, "center", false)
	guiSetFont(labels.price_MaxHealth, "default-bold-small")
	
	guiSetFont(buttons.skill_MaxHealth, "default-bold-small")
    guiSetProperty(buttons.skill_MaxHealth, "NormalTextColour", "FFFF0000")

	buttons.skill_Stamina = guiCreateButton(420, 105, 100, 21, "Stamina", false, shop_window) -- Stamina skill
	labels.price_Stamina = guiCreateLabel(420, 129, 91, 18, "$ 1.000", false, shop_window)
	guiLabelSetColor(labels.price_Stamina, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_Stamina, "center", false)
	guiSetFont(labels.price_Stamina, "default-bold-small")

		guiSetFont(buttons.skill_Stamina, "default-bold-small")
    guiSetProperty(buttons.skill_Stamina, "NormalTextColour", "FFFF0000")
	
	buttons.buy_armor = guiCreateButton(620, 105, 100, 21, "Armor", false, shop_window) -- Armor
	labels.price_Armor = guiCreateLabel(620, 126, 91, 18, "$ 850", false, shop_window)
	guiLabelSetColor(labels.price_Armor, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_Armor, "center", false)
	guiSetFont(labels.price_Armor, "default-bold-small")
	
		guiSetFont(buttons.buy_armor, "default-bold-small")
    guiSetProperty(buttons.buy_armor, "NormalTextColour", "FFFF0000")

	buttons.skill_Fat = guiCreateButton(520, 58, 100, 21, "Fat", false, shop_window) -- Fat skill
	labels.price_MaxFat = guiCreateLabel(520, 79, 91, 18, "$ 1.300", false, shop_window)
	guiLabelSetColor(labels.price_MaxFat, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_MaxFat, "center", false)
	guiSetFont(labels.price_MaxFat, "default-bold-small")
	
		guiSetFont(buttons.skill_Fat, "default-bold-small")
    guiSetProperty(buttons.skill_Fat, "NormalTextColour", "FFFF0000")

	buttons.skill_Muscle = guiCreateButton(395, 58, 100, 21, "Muscle", false, shop_window) -- Muscle skill
	labels.price_Muscle = guiCreateLabel(395, 79, 91, 18, "$ 2.600", false, shop_window)
	guiLabelSetColor(labels.price_Muscle, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.price_Muscle, "center", false)
	guiSetFont(labels.price_Muscle, "default-bold-small")
	
		guiSetFont(buttons.skill_Muscle, "default-bold-small")
    guiSetProperty(buttons.skill_Muscle, "NormalTextColour", "FFFF0000")


-- Tab 2: Buy weapons


	images.Pistol = guiCreateStaticImage(28, 41, 93, 78, "weapons/22.png", false, shop_window)
	buttons.buy_Pistol = guiCreateButton(29, 136, 92, 24, "Pistol", false, shop_window)
	labels.buy_Pistol = guiCreateLabel(29, 118, 91, 18, "$ 8.000", false, shop_window)
	guiSetFont(labels.buy_Pistol, "default-bold-small")
	guiLabelSetColor(labels.buy_Pistol, 222, 255, 0)
	guiLabelSetHorizontalAlign(labels.buy_Pistol, "center", false)
	
	 guiSetFont(buttons.buy_Pistol, "default-bold-small")
        guiSetProperty(buttons.buy_Pistol, "NormalTextColour", "FF00B4FF")

	images.SilencedPistol = guiCreateStaticImage(131, 41, 93, 78, "weapons/23.png", false, shop_window)
	buttons.buy_SilencedPistol = guiCreateButton(132, 136, 92, 24, "Silenced Pistol", false, shop_window)
	labels.buy_SilencedPistol = guiCreateLabel(132, 119, 91, 18, "$8.300", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_SilencedPistol, "center", false)
	
	
	guiSetFont(labels.buy_SilencedPistol, "default-bold-small")
	guiLabelSetColor(labels.buy_SilencedPistol, 102, 255, 0)
	 guiSetFont(buttons.buy_SilencedPistol, "default-bold-small")
        guiSetProperty(buttons.buy_SilencedPistol, "NormalTextColour", "FF00B4FF")

	buttons.buy_DesertEagle = guiCreateButton(234, 136, 92, 24, "Desert eagle", false, shop_window)
	images.DesertEagle = guiCreateStaticImage(234, 41, 93, 78, "weapons/24.png", false, shop_window)
	labels.buy_DesertEagle = guiCreateLabel(234, 119, 91, 18, "$9.200", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_DesertEagle, "center", false)
	
		guiSetFont(labels.buy_DesertEagle, "default-bold-small")
	guiLabelSetColor(labels.buy_DesertEagle, 255, 0, 0)
	 guiSetFont(buttons.buy_DesertEagle, "default-bold-small")
        guiSetProperty(buttons.buy_DesertEagle, "NormalTextColour", "FF00B4FF")

	images.Shotgun = guiCreateStaticImage(29, 179, 93, 78, "weapons/25.png", false, shop_window)
	buttons.buy_Shotgun = guiCreateButton(30, 277, 92, 24, "Buy Shotgun", false, shop_window)
	labels.buy_Shotgun = guiCreateLabel(52, 257, 91, 18, "$9.100", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_Shotgun, "center", false)
	
		guiSetFont(labels.buy_Shotgun, "default-bold-small")
	guiLabelSetColor(labels.buy_Shotgun, 222, 255, 0)
	 guiSetFont(buttons.buy_Shotgun, "default-bold-small")
        guiSetProperty(buttons.buy_Shotgun, "NormalTextColour", "FF00B4FF")

	images.SawnOff = guiCreateStaticImage(132, 179, 92, 78, "weapons/26.png", false, shop_window)
	buttons.buy_SawnOff = guiCreateButton(132, 277, 92, 24, "Sawn-Off Shotgun", false, shop_window)
	labels.buy_SawnOff = guiCreateLabel(132, 257, 91, 18, "$9.800", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_SawnOff, "center", false)
	
		guiSetFont(labels.buy_SawnOff, "default-bold-small")
	guiLabelSetColor(labels.buy_SawnOff, 255, 0, 0)
	 guiSetFont(buttons.buy_SawnOff, "default-bold-small")
        guiSetProperty(buttons.buy_SawnOff, "NormalTextColour", "FF00B4FF")

	labels.buy_SPAZ12 = guiCreateLabel(235, 259, 91, 18, "$9.550", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_SPAZ12, "center", false)
	images.SPAZ12 = guiCreateStaticImage(235, 179, 92, 78, "weapons/27.png", false, shop_window)
	buttons.buy_SPAZ12 = guiCreateButton(235, 277, 92, 24, "SPAZ-12", false, shop_window)
	
		guiSetFont(labels.buy_SPAZ12, "default-bold-small")
	guiLabelSetColor(labels.buy_SPAZ12, 102, 255, 0)
	 guiSetFont(buttons.buy_SPAZ12, "default-bold-small")
        guiSetProperty(buttons.buy_SPAZ12, "NormalTextColour", "FF00B4FF")

	buttons.buy_Uzi = guiCreateButton(31, 420, 92, 24, "Micro Uzi", false, shop_window)
	images.Uzi = guiCreateStaticImage(30, 323, 93, 78, "weapons/28.png", false, shop_window)
	labels.buy_Uzi = guiCreateLabel(31, 401, 91, 18, "$9.400", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_Uzi, "center", false)
	
		guiSetFont(labels.buy_Uzi, "default-bold-small")
	guiLabelSetColor(labels.buy_Uzi, 255, 0, 0)
	 guiSetFont(buttons.buy_Uzi, "default-bold-small")
        guiSetProperty(buttons.buy_Uzi, "NormalTextColour", "FF00B4FF")

	images.MP5 = guiCreateStaticImage(133, 323, 91, 78, "weapons/29.png", false, shop_window)
	buttons.buy_MP5 = guiCreateButton(133, 420, 92, 24, "MP5", false, shop_window)
	labels.buy_MP5 = guiCreateLabel(133, 402, 91, 18, "$8.900", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_MP5, "center", false)
	
		guiSetFont(labels.buy_MP5, "default-bold-small")
	guiLabelSetColor(labels.buy_MP5, 222, 255, 0)
	 guiSetFont(buttons.buy_MP5, "default-bold-small")
        guiSetProperty(buttons.buy_MP5, "NormalTextColour", "FF00B4FF")

	images.TEC9 = guiCreateStaticImage(234, 323, 93, 78, "weapons/32.png", false, shop_window)
	buttons.buy_TEC9 = guiCreateButton(235, 420, 92, 24, "Tec-9", false, shop_window)
	labels.buy_TEC9 = guiCreateLabel(235, 401, 91, 18, "$9.250", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_TEC9, "center", false)
	
		guiSetFont(labels.buy_TEC9, "default-bold-small")
	guiLabelSetColor(labels.buy_TEC9, 102, 255, 0)
	 guiSetFont(buttons.buy_TEC9, "default-bold-small")
        guiSetProperty(buttons.buy_TEC9, "NormalTextColour", "FF00B4FF")

	images.AK47 = guiCreateStaticImage(31, 461, 92, 78, "weapons/30.png", false, shop_window)
	buttons.buy_AK47 = guiCreateButton(31, 557, 92, 24, "AK-47", false, shop_window)
	labels.buy_AK47 = guiCreateLabel(31, 539, 91, 18, "$9.900", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_AK47, "center", false)
	
		guiSetFont(labels.buy_AK47, "default-bold-small")
	guiLabelSetColor(labels.buy_AK47, 102, 255, 0)
	 guiSetFont(buttons.buy_AK47, "default-bold-small")
        guiSetProperty(buttons.buy_AK47, "NormalTextColour", "FF00B4FF")

	labels.buy_M4 = guiCreateLabel(133, 539, 91, 18, "$10.000", false, shop_window)
	guiLabelSetHorizontalAlign(labels.buy_M4, "center", false)
	buttons.buy_M4 = guiCreateButton(133, 557, 92, 24, "M4", false, shop_window)
	images.M4 = guiCreateStaticImage(133, 461, 92, 78, "weapons/31.png", false, shop_window)
	
		guiSetFont(labels.buy_M4, "default-bold-small")
	guiLabelSetColor(labels.buy_M4, 255, 0, 0)
	 guiSetFont(buttons.buy_M4, "default-bold-small")
        guiSetProperty(buttons.buy_M4, "NormalTextColour", "FF00B4FF")

	images.Sniper = guiCreateStaticImage(235, 461, 92, 78, "weapons/icon.png", false, shop_window)
	buttons.buy_Sniper = guiCreateButton(235, 557, 92, 24, "Sniper", false, shop_window)
	labels.buy_Sniper = guiCreateLabel(235, 539, 91, 18, "$9.500", false, shop_window)
	
		guiSetFont(labels.buy_Sniper, "default-bold-small")
	guiLabelSetColor(labels.buy_Sniper, 222, 255, 0)
	 guiSetFont(buttons.buy_Sniper, "default-bold-small")
        guiSetProperty(buttons.buy_Sniper, "NormalTextColour", "FF00B4FF")

	guiLabelSetHorizontalAlign(labels.buy_Sniper, "center", false)

	for _, button in pairs(buttons) do guiSetProperty(button, "HoverTextColour", "FF1AB1FF") end

end
addEventHandler("onClientResourceStart", resourceRoot, shopInterface)

addEventHandler("onClientGUIClick", root, 
function()
local theVehicle = getPedOccupiedVehicle(player)
local money = getPlayerMoney(player)
		if (source == buttons.skill_M4) then  -- Buy: M4 max skill
			local price_M4 = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_M4, 78)
			
		elseif (source == buttons.skill_AK47) then  -- Buy: AK-47 max skill
			local price_AK47 = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_AK47, 77)
			
		elseif (source == buttons.skill_SawnOff) then  -- Buy: Sawn-off Shotgun max skill
			local price_SawnOff = 4800
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SawnOff, 73)
			
		elseif (source == buttons.skill_Shotgun) then  -- Buy: Shotgun max skill
			local price_Shotgun = 4300
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Shotgun, 72)
			
		elseif (source == buttons.skill_SPAZ12) then  -- Buy: SPAZ-12 max skill
			local price_SPAZ12 = 4300
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SPAZ12, 74)
			
		elseif (source == buttons.skill_SilencedPistol) then  -- Buy: Silenced pistol max skill
			local price_SilencedPistol = 4000
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_SilencedPistol, 70)
			
		elseif (source == buttons.skill_DesertEagle) then  -- Buy: Desert eagle max skill
			local price_DesertEagle = 4500
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_DesertEagle, 71)
			
		elseif (source == buttons.skill_Pistol) then  -- Buy: Pistol max skill
			local price_Pistol = 4100
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Pistol, 69)
			
		elseif (source == buttons.skill_MP5) then  -- Buy: MP5 max skill
			local price_MP5 = 4200
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_MP5, 76)
			
		elseif (source == buttons.skill_UziAndTEC9) then  -- Buy: Uzi and Tec-9 max skill
			local price_Uzi = 4800
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Uzi, 75)
			
		elseif (source == buttons.skill_Sniper) then  -- Buy: Sniper max skill
			local price_Sniper = 4000
			triggerServerEvent("onPlayerRequestWeaponSkill", player, price_Sniper, 79)
			
		elseif (source == buttons.skill_MaxHealth) then  -- Buy: Max health
			local price_MaxHealth = 3800
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxHealth, 24)
				
		elseif (source == buttons.skill_Stamina) then  -- Buy: Max stamina
			local price_MaxStamina = 1000
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxStamina, 22)
			
		elseif (source == buttons.skill_Muscle) then  -- Buy: Max muscle
			local price_MaxMuscle = 2600
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxMuscle, 23)
			
		elseif (source == buttons.skill_Fat) then  -- Buy: Max fat
			local price_MaxFat = 1300
			triggerServerEvent("onPlayerRequestMaxSkill", player, price_MaxFat, 21)
			
		elseif (source == buttons.buy_armor) then  -- Buy: Full armor
			local price_Armor = 850
			triggerServerEvent("onPlayerRequestArmor", player, price_Armor)
			
		elseif (source == buttons.damageProof) then -- Buy: vehicle damage proof	
			local price_DamageProof = 16000
			triggerServerEvent("onPlayerRequestDamageProof", player, price_DamageProof)
			
		elseif (source == buttons.nitro10x) then -- Buy: Nitro 10x
			local price_nitro10x = 500
			triggerServerEvent("onPlayerRequestVehicleUpgrade", player, price_nitro10x, 1010)

		elseif (source == buttons.buy_repair) then  -- Buy: Fix vehicle
			local price_repair = 2000
			triggerServerEvent("onPlayerRequestFixVehicle", player, price_repair)
			
		elseif (source == buttons.buy_flip) then  -- Buy: Flip vehicle
			local price_flip = 1900
			triggerServerEvent("onPlayerRequestFlipVehicle", player, price_flip)
			
		elseif (source == buttons.buy_hydraulics) then  -- Buy: Hydraulics
			local price_hydraulics = 1150
			triggerServerEvent("onPlayerRequestVehicleUpgrade", player, price_hydraulics, 1087)
		end
end
)

function buyWeapon()
local money = getPlayerMoney(player)
		if (source == buttons.buy_Pistol) then  -- Buy: Pistol
			local priceWeapon_Pistol = 8000
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Pistol, 22, 700)

		elseif (source == buttons.buy_SilencedPistol) then	-- Buy: Silenced pistol
			local priceWeapon_SilencedPistol = 8300
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SilencedPistol, 23, 680)
			
		elseif (source == buttons.buy_DesertEagle) then  -- Buy: Desert eagle
			local priceWeapon_DesertEagle = 9200
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_DesertEagle, 24, 600)

		elseif (source == buttons.buy_Shotgun) then  -- Buy: Shotgun
			local priceWeapon_Shotgun = 9100
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Shotgun, 25, 600)

		elseif (source == buttons.buy_SawnOff) then  -- Buy: Sawn-off Shotgun
			local priceWeapon_SawnOff = 9800
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SawnOff, 26, 600)

		elseif (source ==  buttons.buy_SPAZ12) then  -- Buy: SPAZ-12
			local priceWeapon_SPAZ12 = 9550
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_SPAZ12, 27, 610)

		elseif (source == buttons.buy_Uzi) then  -- Buy: Micro Uzi
			local priceWeapon_Uzi = 9400
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Uzi, 28, 860)

		elseif (source == buttons.buy_MP5) then  -- Buy: MP5
			local priceWeapon_MP5 = 8900
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_MP5, 29, 790)

		elseif (source == buttons.buy_TEC9) then  -- Buy: TEC-9
			local priceWeapon_TEC9 = 9250
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_TEC9, 32, 850)

		elseif (source == buttons.buy_AK47) then  -- Buy: AK-47
			local priceWeapon_AK47 = 9900
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_AK47, 30, 810)

		elseif (source == buttons.buy_M4) then  -- Buy: M4
			local priceWeapon_M4 = 10000
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_M4, 31, 900)

		elseif (source == buttons.buy_Sniper) then  -- Buy: Sniper
			local priceWeapon_Sniper = 9500
			triggerServerEvent("onPlayerRequestWeapon", player, priceWeapon_Sniper, 34, 580)
		end
end
addEventHandler("onClientGUIClick", root, buyWeapon)

function changeLabelsTextOnTabClick()
local selectedTab = guiGetSelectedTab(tabPanel.myTabPanel)
	if (selectedTab == shop_window) then
		guiSetText(labels.body, "")
		guiSetText(labels.body_label, "")
		guiSetText(labels.Skills, "")
		guiSetText(labels.skills_label, "")
		guiSetText(labels.wnd_info_vehicle, "")
		guiSetText(labels.vehicleFunctions_label, "")
		guiSetText(labels.Weapons, "Weapons:")
		guiSetText(labels.weapons_label, "_________")
		
	elseif (selectedTab == shop_window) then
		guiSetText(labels.Weapons, "")
		guiSetText(labels.weapons_label, "")
		guiSetText(labels.body, "Body:")
		guiSetText(labels.vehicleFunctions_label, "____")
		guiSetText(labels.Skills, "Skills:")
		guiSetText(labels.skills_label, "_____")
		guiSetText(labels.wnd_info_vehicle, "Soon:")
		guiSetText(labels.body_label, "_____")
	end
end
addEventHandler("onClientClick", root, changeLabelsTextOnTabClick)
addEventHandler("onClientResourceStart", root, changeLabelsTextOnTabClick)

bindKey( "F3", "down", 
function()
	guiSetVisible(shop_window, not guiGetVisible(shop_window))
	showCursor(guiGetVisible(shop_window))
end
)
