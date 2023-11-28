local sPlayer = Var "Player"
local Reverse = string.find(GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptionsString("ModsLevel_Preferred"):lower(), "reverse") and 1 or -1

return Def.ActorFrame {
	InitCommand=function(self) self:zoomy(Reverse) end,
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_Key","Receptor"),
		InitCommand=function(self) self:y(-16) end
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_Key","Press"),
		InitCommand=function(self) self:y(-16):visible(false) end,
		PressCommand=function(self) self:visible(true) end,
		LiftCommand=function(self) self:visible(false) end
	}
}