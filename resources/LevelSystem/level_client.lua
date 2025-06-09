local sx, sy = guiGetScreenSize()

function drawExperience()
    dxDrawRectangle((310/1024)*sx,(698/768)*sy,(481/1024)*sx,(36/768)*sy,tocolor(255,255,255,35),false)
    dxDrawRectangle((315/1024)*sx,(703/768)*sy,(472/1024)*sx,(26/768)*sy,tocolor(0,0,255,255),false)
	local experience = getElementData(localPlayer,"experience") or 0
	local experience_n = getElementData(localPlayer,"experience_n") or 0
	local level = getElementData(localPlayer,"level") or 1
	local percent = (experience / experience_n * 100)
	if (percent >= 100) then
		percent = 100
	elseif (experience_n < 1) then
		percent = 0
	end
	dxDrawRectangle((320/1024)*sx,(706/768)*sy,(tonumber(percent)*4.64/1024)*sx,(20/768)*sy,tocolor(255, 255, 0, math.abs(math.sin(getTickCount()/700))*150),false)
	dxDrawBorderedText("Level:".. tostring(level) .." | Experience Points: ".. tostring(experience) .." > ".. tostring(experience_n),(430/1024)*sx,(707/768)*sy,(667/1024)*sx,(724/768)*sy,tocolor(255,0,0,255),(sx/1024)*0.6,"bankgothic","center","center",false,false,false)
end
addEventHandler("onClientRender",root,drawExperience)

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false ) -- black
	dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y, w - 1, h, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y, w + 1, h, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 1, w, h - 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 1, w, h + 1, tocolor ( 255, 255, 255, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end



addEvent ( "LevelUpEffect", true )
addEventHandler ( "LevelUpEffect", root,
	function ( )
		PlayerLevelUpSound()
		addEventHandler("onClientRender",root,DrawLevelUp)
		setTimer(function()
			removeEventHandler("onClientRender",root,DrawLevelUp)
		end, 4000, 1)
	end
)

function PlayerLevelUpSound()
	local sound = playSound("levelup.mp3")
	setSoundVolume(sound, 1)
end

function DrawLevelUp()
	dxDrawBorderedText( "LEVEL UP!!!", sx/2, sy/15, sx/2, sx/2, tocolor(255,144,0,255),(sx/1024)*2.5,"bankgothic","center","center",false,false,false )
end

