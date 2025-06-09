--***********************************--
--***********************************--
--          [Missions]Transporter    --
--            By DeaD             --
--***********************************--
--***********************************--

--
MISSION_TIME_MIN = 7 -- Mission Time
MARKER_TYPE = "cylinder" -- Mission Start Marker Type
MARKER_SIZE = 1.3 -- Mission Start Marker Size
DROP_MARKER_TYPE = "cylinder" -- Drop Marker Type
DROP_MARKER_SIZE = 4 -- Drop Marker Size
TRANSPORTER_CAR_MODEL = 409 -- Transporter Car Model ID
TRANSPORTER_PED_MODEL = 294 -- Transporter Ped Model ID
FLOOD_TIME = 3 -- Anti Mission Flood time [ in minutes ]
DXTEXT = true
DXTEXT_MAX_DISTINANCE = 25
--

transPosz =	{ -- Transport Missions Start Positions [ posX , posY , posZ ]
	{1849,-1863,12.5},
}

dropPosz =	{ -- Transport Mission Drop Positions [ posX , posY , posZ ]
	{-586.33917236328,-1073.0401611328,23},
	{1652.3948974609,-1063.6213378906,23},
	{834.78527832031,-2051.2744140625,12.5},
}
planes = {[511] = true, [592] = true, [577] = true}
local planelist = {
{511, "KLM  Fokker 50 Cityhopper"},
{577, "KLM  Boeing 737-800"},
{592, "KLM  Boeing 747-400"}}