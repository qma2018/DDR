return Def.ActorFrame {
	Def.Sprite {
		Texture="_receptor HandLrLeft",
		Frame0000=0,
		Delay0000=1,
		InitCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'InitCommand'),
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'NoneCommand')
	},
	Def.Sprite {
		Texture="HandLrLeft Tap Explosion Dim",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:diffusealpha(0):zoom(1.3):blend('add') end,
		PressCommand=function(self) self:diffusealpha(0.8) end,
		LiftCommand=function(self) self:diffusealpha(0) end,
		NoneCommand=function(self) self:diffusealpha(0) end
	}
}
