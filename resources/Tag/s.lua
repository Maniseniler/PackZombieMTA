timer = {}

addCommandHandler("77",
	function (player)
		if hasObjectPermissionTo(player,"command.kick",true) then
			if isTimer(timer[player]) then outputChatBox("# You Have To Wait 5 Seconds",player,255,0,0) return end
			for i=1,15 do
				outputChatBox(" ")
			end
			outputChatBox("#FF9900 *  #006FFF# - #CCCCCCThe Admin#FF0000〖#5E00FF " .. getPlayerName(player) .. " #FF0000〗 #CCCCCCHas Clear The Chat !",root,255,0,0,true)
			timer[player] = setTimer(function () end,5000,1)
		else
			outputChatBox("# You Don't Have Permission To Do This",player,255,0,0)
		end
	end
)
local Tags = {'سير فر','قحب','خرا','زب','ابحث','حياة واقعية','وناسة','طاره','سيرفرات','رومات','توزيع','حياكم','سيرفر','سي رفر','كس','امك','ابوك','اختك','معرس','جرار','مخنث','محنه','روم','كلب','حيوان','زق','حصريات','.m.1','T.B','k.g','gta','كلاب','Server','t.d','انيك','ازغب','كس','خرق','فتحه','مخنوث','مخانيث','الكلب','توزيع','Gta-Pro','T.B','w.T','W.T','M.1','الرياض','6arh','server','ip'}
addEventHandler('onPlayerChat',root,
function(text)
 for i,v in pairs(Tags) do                            
  if ( string.find(text,v) ) then
  cancelEvent()
  return outputChatBox('#5E00FF〖#FFF700 " كلمات ممنوعة في السيرفر " #5E00FF〗',source,255,0,0,true)
  end
 end
 if ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Console')) ) then
 cancelEvent()
 outputChatBox('#00A2FF * #FFFFFF[ #FF0000S#DE0000e#C70000r#B30000v#A60202e#BD0000R #8C0000O#800000w#750000N#630000e#4F0000R #FFFFFF ] '..getPlayerName(source)..' #FFFFFF:#c0c0c0 '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('OwNeR')) ) then
 cancelEvent()
 outputChatBox('#00A2FF * #FFFFFF[ #FF0000S#DE0000e#C70000r#B30000v#A60202e#BD0000R #8C0000O#800000w#750000N#630000e#4F0000R #FFFFFF ] '..getPlayerName(source)..' #FFFFFF:#c0c0c0 '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Moderator1')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #00ff99Moderator#c0c0c0 #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Admin')) ) then
 cancelEvent()
outputChatBox('#00A2FF * #c0c0c0[ #C00000 Developer Server #c0c0c0 ]#C00000 '..getPlayerName(source)..' #FFFFFF:#c0c0c0 '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Moderator_Plus')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ff0000Moderator PluS#FFFFFF ]'..getPlayerName(source)..' #FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Pro_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ff0000Pro Moderator#FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('iDeal_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ff0000iDeal Moderator#FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('General_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #612511General Moderator #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Super_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #8cccccSuper Moderator #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Super_Moderator_Plus')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #0000FFSuper Moderator Plus #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Pro_Super_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #900000Pro Super Moderator #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('iDeal_Super_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #121212iDeal Super Moderator #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('King_Super_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #612311King Super Moderator #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('General_Super_Moderator')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #756435General Super Moderator #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Admin1')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #FFFAAAAdmiN#FFFFFF ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Admin_Plus')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #124312Admin Plus#FFFFFF ] '..getPlayerName(source)..' #00FF00: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Pro_Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #714214Pro Admin #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('iDeal_Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ff0000iDeal Admin #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('king_admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #612141king admin #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('General Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #918271General Admin #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Supervisor')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #00A2FF Super ViSoR #FFFFFF ] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Supervisor_Plus')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #918214Supervisor Plus #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Pro_Supervisor')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #FF0000 Pro Supervisor #FFFFFF] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Admin_EX')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #969696AdmiN_Ex#FFFFFF ] '..getPlayerName(source)..'#FFFFFF : '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('iDeal_Supervisor')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ffCC00iDeal Supervisor #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('General_Supervisor')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #ff6040General Supervisor #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('King_of_Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #FFCC00 KinG Of AdmiN #FFFFFF ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('King_of_Admin_Plus')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #b0c4deKing of Admin Plus #FFFFFF] '..getPlayerName(source)..' #00ffff: '..text..'',root,255,255,255,true)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Pro_King_of_Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #b0c4dePro King of Admin #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('iDeal_King_of_Admin')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ iDeal King of Admin #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Youtube')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #0044FFCam #ff0000YouTube #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Assiesnt CoNsole')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #6C0000 Assiesnt #AB0000CoNsole  #c0c0c0 ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('DePouty CoNsole')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #0077FF DePouTy #0051B3CoNsole  #c0c0c0 ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('King Of Time')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #0077FF King #0051B3Of #0011FFTime #c0c0c0 ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('King Drift')) ) then
 cancelEvent() 
outputChatBox('#FF9900 * #FFFFFF[ #6C0000 King #AB0000Drift  #c0c0c0 ] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('Programing Of ServeR')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[#00A2FFP#0095EBr#0088D6o#007BC2g#0071B3r#0068A8a#005E99m#00538Ai#004E82n#004675g #003961O#003357f #004675S#00538Ae#005E99r#0068A8v#0071B3e#00A2FFR#c0c0c0]#4000FF '..getPlayerName(source)..' #FFFFFF:#c0c0c0 '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('PoLice')) ) then
 cancelEvent()
outputChatBox('#FF9900 * #FFFFFF[ #11FF00PoLice #c0c0c0 ] '..getPlayerName(source)..'#FFFFFF: '..text..'',root,255,255,255,true)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 elseif ( isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(source)),aclGetGroup('AraB_GuesT')) ) then
 local team = getTeamName(getPlayerTeam(source)) or 'Download'
 cancelEvent()
 outputChatBox('#FF9900 * #FFFFFF[ #00FFFF AraB GuesT  #FFFFFF] '..getPlayerName(source)..' #FFFFFF: '..text..'',root,255,255,255,true)
 end
end
)

