-- Do not remove the green text!
-- ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

-- Script by: John_Scott
-- Skype: dekaman12
-- Release date: 2013.01.06
-- Made in Hungary
-- Original langue: Hungaryan

-- >>>>> Hard Bytes Team <<<<<
-- facebook.com/HardBytesTeam
-- IP: 91.82.85.203:22076
-- >>>>> Hard Bytes Team <<<<<
 
-- ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
-- Do not remove the green text!


function PlayerLogin(username,password,checksave)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if ( account ~= false ) then
				logIn(source, account, password)

				triggerClientEvent (source,"hideLoginWindow",getRootElement())
				
					if checksave == true then
						triggerClientEvent(source,"saveLoginToXML",getRootElement(),username,password)
					else
						triggerClientEvent(source,"resetSaveXML",getRootElement(),username,password)
					end
				
			else
				triggerClientEvent(source,"set_warning_text",getRootElement(),"Login","Wrong username and/or password")
			end
		else
			triggerClientEvent(source,"set_warning_text",getRootElement(),"Login","Please enter your password!")
		end
	else
		triggerClientEvent(source,"set_warning_text",getRootElement(),"Login","Please enter your username!")
	end
end
addEvent("onRequestLogin",true)
addEventHandler("onRequestLogin",getRootElement(),PlayerLogin)



function registerPlayer(username,password,passwordConfirm)
	if not (username == "") then
		if not (password == "") then
			if not (passwordConfirm == "") then
				if password == passwordConfirm then
					local account = getAccount (username,password)
					if (account == false) then
						local accountAdded = addAccount(tostring(username),tostring(password))
						if (accountAdded) then
							outputChatBox ("#00FF00Sikeresen regisztráltál! [Username: #FFFFFF" .. username .. " #00FF00| Password: #FFFFFF" .. password .. "#00FF00 ]",source,255,255,255,true )
							outputChatBox ("#FF0000- HBT - Login Panel By.: John_Scott",source,255,255,255,true )
						else
							triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","Error! Please try again with new username or password!")
						end
					else
						triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","This username already taken!")
					end
				else
					triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","The passwords does not match!")
				end
			else
				triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","Please confirm your password!")
			end
		else
			triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","Please enter yout password!")
		end
	else
		triggerClientEvent(source,"set_warning_text",getRootElement(),"Register","Please enter your username!")
	end
end
addEvent("onRequestRegister",true)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)


