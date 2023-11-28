local sPlayer = Var "Player"

return Def.ActorFrame{
	Def.Sprite{
		JudgmentMessageCommand=function(self,params) 
			if params.Player ~= sPlayer then return end
			if params.TapNoteScore then self:playcommand(ToEnumShortString(params.TapNoteScore).."Fix") end 
		end,
		Texture=NOTESKIN:GetPath("_Tap", "Ghost"),
		W1FixCommand=function(self) self:stoptweening():zoom(1):diffuse(1,1,0,.5):linear(.3):zoom(3):diffusealpha(0) end,
		W2FixCommand=function(self) self:stoptweening():zoom(1):diffuse(1,1,1,.5):linear(.3):zoom(3):diffusealpha(0) end,
		W3FixCommand=function(self) self:stoptweening():zoom(1):diffuse(1,1,1,.5):linear(.3):zoom(3):diffusealpha(0) end,
		W4FixCommand=function(self) self:stoptweening():diffusealpha(0) end,
		W5FixCommand=function(self) self:stoptweening():diffusealpha(0) end,
		MissFixCommand=function(self) self:stoptweening():diffusealpha(0) end
	}
}
