-- This screen is meant to be used with elements that require to always be on top of
-- anything, such as on-screen help.

local Screen = Var "LoadingScreen"
return Def.ActorFrame{
    Def.BitmapText{
        Font="ScreenEdit PlayRecordHelp",
        Text=THEME:GetString(Screen,"PlayRecordHelpText"),
        InitCommand=function(self)
            self:xy(20, SCREEN_BOTTOM-20):align(0,0):shadowlength(1):visible(false)
        end,
        EditorStateChangedMessageCommand=function(self,param)
            self:visible( param.EditState == "EditState_Playing" )
        end
    }
}