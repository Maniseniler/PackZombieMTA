﻿addEventHandler( "onClientResourceStart", resourceRoot,
    function()
        if getVersion ().sortable < "1.1.0" then
            outputChatBox( "resource wont work on this client." )
            return
        end

texShader = dxCreateShader ( "shader/texreplace.fx" )
siteM16 = dxCreateTexture("hud/siteM16.png")


dxSetShaderValue(texShader,"gTexture",siteM16)
engineApplyShaderToWorldTexture(texShader,"siteM16")
        end
)