
Value = false

function Open(player)
local accName = getAccountName ( getPlayerAccount ( player ) ) 
	local accName = getAccountName ( getPlayerAccount ( player ) )
       if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) )  or isObjectInACLGroup ("user."..accName, aclGetGroup ( "FA3LYAT" ) )  then  
         triggerClientEvent (player, "Client:CallPanel", player)
   end
end	
addCommandHandler("OpenE",Open);

addEvent("CreateEvent", true)
addEventHandler("CreateEvent", root,
function(Answer,Ques, Prize)
setElementData(getResourceRootElement( getThisResource( ) ), "Answer", Answer)
setElementData(getResourceRootElement( getThisResource( ) ), "Ques", Ques)
setElementData(getResourceRootElement( getThisResource( ) ), "Prize", Prize)
outputChatBox("#00FFFF * #FF0000[ #FFD900P#EBCC00r#E3C900i#D4BF00m#C2B200a#B8AC00i#A69E02r#948F00e #948F00W#A69E02r#B8AC00i#C2B200t#D4BF00e #FF0000] #FFFFFF: #00FF66"..Ques,root,255,0,0,true)
Value = true
end)

addEventHandler("onPlayerChat",root,
function (msg)
      local Answer = getElementData(getResourceRootElement( getThisResource( ) ), "Answer")
       local Ques = getElementData(getResourceRootElement( getThisResource( ) ), "Ques")
        local Prize = getElementData(getResourceRootElement( getThisResource( ) ), "Prize")
         Answers = Answer
         if msg == Answers then
         if Value then
         outputChatBox("#00FFFF * #FF0000[ #FFD900P#EBCC00r#E3C900i#D4BF00m#C2B200a#B8AC00i#A69E02r#948F00e #948F00W#A69E02r#B8AC00i#C2B200t#D4BF00e #FF0000] #FFFFFF: #2ad100$"..Prize.." #FFFFFF|#12A6E0 وقد ربح #FFFFFF[ ".. getPlayerName(source) .."#FFFFFF ]#12A6E0 الفائز",root,255,0,0,true)
        givePlayerMoney(source,Prize)
       Value = false
     end
   end
end)

