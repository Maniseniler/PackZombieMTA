function hafiz()
    local money = math.random (5000,15000)
	givePlayerMoney( getRootElement(), money )
	outputChatBox("#FF9900 * #FFFFFF[#FF0000 Hafiz System #FFFFFF] :#0099cc من قبل مود حافز #000000[ #00ff00 $"..money.."  #000000] #0099cc تم توزيع لجميع اللاعبين #ff0000❤" ,getRootElement(),255,0,0,true)
end
setTimer(hafiz,150000,0)