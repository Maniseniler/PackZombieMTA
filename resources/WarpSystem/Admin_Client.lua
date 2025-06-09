outputChatBox("#FF9900 * #00B7FFWarp Panel By #FF0000M#DE0000a#C70000n#B30000i#A60202s#BD0000e#8C0000n#800000i#750000l#630000e#4F0000R",255,0,0,true)

----------------------
-- Setting
----------------------


local Key = "F6"

local Admin = {
{"كبار الشخصيات","V.I.P","25"},
{"كنق الدرفت","King.Drift","35"},
{"كنق الوقت","King.Of.Time","50"},
{"منظم الدايري","Police","70"},
{"كنق شرطي","K-Police","90"},
{"سوبر شرطي","Super.Police","100"},
{"مشرف1","Moderator1","120"},
{"مشرف2","Moderator2","150"},
{"مراقب1","SuperModerator1","180"},
{"مراقب2","SuperModerator2","200"},
{"أدمن","Admin1","240"},
{"سوبر أدمن","Super.Admin","280"},
{"بيق أدمن","Big.Admin","320"},
{"هيد أدمن","Head.Admin","380"},
}
----------------------
-- Setting
----------------------
alamaken = {
	{"المقر                ",843.86114501953, -2126.0563964844, 13.652822494507},
	{"مقر الشركة                ",155.39674, -1895.65405, 3.77344},
	{"(1) المطار الاول                ",1992.7768554688, -2313.3220214844, 13.546875},
	{"(2) المطار الثاني                ",-1542.7303466797, -198.95301818848, 14.1484375},
	{"(3) المطار الثالث                ",1596.6934814453, 1640.1815185547, 10.8203125},
	{"(4) مطار الجيش                ", 413.9172668457, 2536.8041992188, 19.1484375},
	{"(1) المعرض الاول                ",-1640.3355712891, 1203.7691650391, 7.2378988265991},
	{"(2) المعرض الثاني                ",539.51983642578, -1289.4432373047, 17.2421875},
	{"(3) المعرض الثالث                ",-1969.0849609375, 294.23532104492, 35.171875},
	{"(4) المعرض الرابع                ", 1939.5388183594, 2185.1809082031, 10.8203125},
	{"مقر الجيش                ",214.68426513672, 1861.2706298828, 13.140625},
	{"محل الاسلحة                ",1350.3056640625, -1279.5877685547, 13.3828125},
	{"القفزه الخونفشاريه                ",1541.0673828125, -1357.576171875, 329.46615600586},
	{"ساحة التفجير                ",-2049.0034179688, -107.08320617676, 35.254772186279},
	{"ساحة القتال                ",-2999.7297363281, -2903.0095214844, 5.2000007629395},
	{"مهمة الـبـنـك                ",593.50756835938,-1242.6812744141,18.018035888672},
	{"موقف الباصات                ",1790.2674560547,-1912.0159912109 , 13.396838188171},
	{"برج الفيصليه                ",1842.3481445313,858.84588623047 ,9.882495880127},
	{"الـدائـري                ",1753.3974609375, 776.7255859375, 10.8203125},
	{"النخيل                ",-2080.0642089844, 1623.8374023438, 10.8203125},
	{"تفتيش النخيل                ",2031.5137939453, 869.03118896484, 7.0002694129944},
	{"الشرقي                ",1054.6721191406,2729.0747070313 ,6.8798608779907},
	{"الغربي                ",1187.9227294922, 1354.2520751953, 8.7430381774902},
	{"الغروب                ",1712.9107666016,640.33990478516 , 6.9921875},
	{"شارع المحطة                ",-1311.6459960938, 2674.9191894531, 50.064270019531},
	{"الجسر المعلق                ",-2672.6545410156, 1283.4050292969, 56.484375},
	{"شارع الطويل                ",-2247.0627441406, -3001.6967773438, 16.417589187622},
	{"شارع العوشزية                ",-496.6276550293, 591.74462890625, 17.019058227539},
	{"شارع الفروسيه                ",2878.1115722656, -1110.029296875, 10.882762908936},
	{"شارع الدخل                ",975.81896972656, -1412.0753173828, 13.296061515808},
	{"شارع الحفريات                ",-2935.8588867188, -1368.9516601563, 11.714294433594},
	{"شارع البستان                ",2491.12109375, -1667.4482421875, 13.34375},
	{"الـطـعـوس                ",-2500.42578125, -2904.388671875, 1.2000000476837},
	{"المدينة الصناعية                ",2762.0681152344, -2389.3217773438, 13.6328125},
	{"شارع فاضي                 ",-619.20465087891, 828.47406005859, 135.89999389648},
	{"الشاطئ                ",253.8177947998, -1810.9669189453, 4.3108253479004},
}
----------------------
-- Setting
----------------------
GUIEditor = {
    label = {},
    button = {},
    window = {},
    gridlist = {},
    combobox = {}
}

local screenW, screenH = guiGetScreenSize()
GUIEditor.window[1] = guiCreateWindow(710, 290, 479, 385, "[ Warp Panel | By | Elian Host Panel ]", false)
guiSetVisible(GUIEditor.window[1],false);
guiWindowSetSizable(GUIEditor.window[1], false);
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF0060FE") 
guiWindowSetMovable(GUIEditor.window[1], false)


GUIEditor.label[1] = guiCreateLabel(291, 423, 88, 18, "", false, GUIEditor.window[1])
guiSetFont(GUIEditor.label[1], "default-bold-small")

grid = guiCreateGridList(15, 26, 454, 311, false, GUIEditor.window[1])
guiGridListAddColumn(grid, "الاماكن", 0.9)
move = guiCreateButton(120, 347, 258, 28, "انتقال", false, GUIEditor.window[1]) 
guiSetFont(move, "default-bold-small")
guiSetProperty(move, "NormalTextColour", "FF127500")    
guiSetVisible(wnd,false)


for k,v in ipairs ( Admin ) do
row = guiGridListAddRow(GUIEditor.gridlist[1]);
guiGridListSetItemText(GUIEditor.gridlist[1],row,1,''..k..'-  ',false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,2,v[1],false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,3,v[2],false,false)
guiGridListSetItemText(GUIEditor.gridlist[1],row,4,v[3],false,false)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,1,0, 144, 255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,2,255,255,255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,3,0, 144, 255)
guiGridListSetItemColor(GUIEditor.gridlist[1],row,4,255,255,255)
guiSetFont (GUIEditor.gridlist[1],"default-bold-small")
end

xMainFunctions_ = function ( )
 local row, col = guiGridListGetSelectedItem ( GUIEditor.gridlist[1] ) 
local Group = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,3 ));
local Price = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,4 ));
local Name = tostring ( guiGridListGetItemText(GUIEditor.gridlist[1],row,2 ));
   if ( row and col and row ~= -1 and col ~= -1 ) then
triggerServerEvent("Accept:the:request",localPlayer,Group,Price,Name);
  else
outputChatBox("#ff4f00* ( #ffffffBuy Admin #ff4f00) : #ffffffألرجاء اختيار الرتبة", 255, 255, 255, true )
  end
end
addEventHandler("onClientGUIClick",GUIEditor.button[1],xMainFunctions_,false);

xBindFunction_ = function ()
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]));
	showCursor(guiGetVisible(GUIEditor.window[1]));
end
bindKey(Key,"down",xBindFunction_);

-------------------------------------------------------
addEventHandler ( "onClientMouseEnter", root,
	function ( )
		if source == X then
			guiSetAlpha ( X, 0.8 )
			playSoundFrontEnd ( 3 )		
		elseif source == GUIEditor.button[1] then
			guiSetAlpha ( GUIEditor.button[1], 0.8 )
			playSoundFrontEnd ( 3 )		
		end
	end
)

addEventHandler ( "onClientMouseLeave", root,
	function ( )	
		if source == X then
			guiSetAlpha ( X, 1 )
			playSoundFrontEnd ( 3 )		
		elseif source == GUIEditor.button[1] then
			guiSetAlpha ( GUIEditor.button[1], 1 )
			playSoundFrontEnd ( 3 )		
		end
	end
)
----------------------------------------------------------
addEventHandler("onClientGUIClick",root,
	function ()
		if ( source == X ) then
		guiSetVisible(GUIEditor.window[1], false)
		showCursor(false)
		end
	end
)
----------------------------------------------
-------------------------------
addEventHandler( "onClientGUIChanged", B7th,
function()
    guiGridListClear( grid )
    local Text = guiGetText( source )
    for _, Table in ipairs( alamaken ) do
        if ( string.find( Table[1], Text, 1, true ) ) then
            local Row = guiGridListAddRow( grid )
            guiGridListSetItemText( grid, Row, 1, Table[1], false, false )
            guiGridListSetItemData( grid, Row, 1, Table[2] )
            guiGridListSetItemColor( grid, Row, 1,0, 144, 255)
			guiSetFont( grid, Boy )
        end
    end
end )
---------------------------------------
for i,v in ipairs(alamaken) do
	local row = guiGridListAddRow(grid)
	guiGridListSetItemText(grid,row,1,v[1],false,false)
	guiGridListSetItemData(grid,row,1,{v[2],v[3],v[4]})
	guiGridListSetItemColor(grid,row,1,0, 144, 255)
	guiSetFont( grid, Boy )
end




addEventHandler("onClientGUIClick",root,
	function ()
		local sel = guiGridListGetSelectedItem(grid)
		if source == move then
			if sel ~= -1 then
				local x,y,z = unpack(guiGridListGetItemData(grid,sel,1))
				setElementPosition(localPlayer,x,y,z)
			else
				outputChatBox("* من فضلك اختار مكان للانقال اليه",255,0,0)
			end
		end
	end
)
----------------------------------------------

fileDelete("Admin_Client.lua")