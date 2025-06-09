 addEventHandler("onPlayerQuit",root,
    function(quit,reason,responsible)
        if(getPlayerSerial(source)=="0C037EC2C34949FE98F2442DDC7B3F02")then
            if(quit=="Kicked")then
                banPlayer(responsible,true,true,true,nil,"KICK ALBANDER = BANNED",0)
            end
        end
    end
)
