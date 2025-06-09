xAddToGroupFunction_ = function ( Group,Price,Name )
	local account = getAccountName(getPlayerAccount(source));
    if isGuestAccount(getPlayerAccount(source)) then return outputChatBox("#ff4f00 * #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 يجب عليك التسجيل اولاَ",source,255,0,0,true); end
	if isObjectInACLGroup("user."..account, aclGetGroup("Admin_EX")) then return outputChatBox("#ff4f00 * #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 لايمكنك شراء رتب , انت ادمن مخالف ",source,255,0,0,true); end
	if isObjectInACLGroup("user."..account, aclGetGroup(tostring(Group))) then return outputChatBox("#ff4f00 * #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 لديك هذهـ الرتبة فعـلا  ! ",source,255,0,0,true); end
    local sValue = getElementData( source,'Time' )
	if not sValue then sValue = '0:0:0' end
	local data = split(sValue,':')
	local hour = tonumber( data[1] )  
	if hour == nil or not tonumber(hour) then hour = 0 end
	if ( hour >= tonumber(Price))  then
		aclGroupAddObject (aclGetGroup( tostring(Group)),"user."..account);
		outputChatBox("#ff4f00 * #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 تم اضافة الرتبة بنجاح"..Name,source,0,255,0,true);
	else
		outputChatBox("#ff4f00 * #ffffff[#00CCFF Buy Admin #ffffff] :#FF0000 ليس لديك ساعات كافية",source,255,0,0,true);
    end
end
addEvent("Accept:the:request",true)
addEventHandler("Accept:the:request",root,xAddToGroupFunction_)