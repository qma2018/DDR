local Button = Var "Button"

return Def.ActorFrame {
	--explosion
	NOTESKIN:LoadActor( Var "Button", "Tap Explosion Dim" ) .. {
		InitCommand=function(self) self:blend("BlendMode_Add"):diffusealpha(0) end,
		ProW1Command=function(self) self:playcommand("Glow") end,
		ProW2Command=function(self) self:playcommand("Glow") end,
		ProW3Command=function(self) self:playcommand("Glow") end,
		ProW4Command=function(self) self:playcommand("Glow") end,
		ProW5Command=function(self) self:playcommand("Glow") end,
		W1Command=function(self) self:playcommand("Glow") end,
		W2Command=function(self) self:playcommand("Glow") end,
		W3Command=function(self) self:playcommand("Glow") end,
		W4Command=function(self) end,
		W5Command=function(self) end,
		HitMineCommand=function(self) self:playcommand("Glow") end,
		HeldCommand=function(self) self:playcommand("Glow") end,
		GlowCommand=function(self)	self:finishtweening():diffusealpha(1):zoom(1):decelerate(0.3):diffusealpha(0):zoom(1.3) end,
	},
	NOTESKIN:LoadActor( Var "Button", "Ring" ) .. {
		InitCommand=function(self) self:blend("BlendMode_Add"):zoomy(0.4):diffusealpha(0) end,
		ProW1Command=function(self) self:playcommand("Glow") end,
		ProW2Command=function(self) self:playcommand("Glow") end,
		ProW3Command=function(self) self:playcommand("Glow") end,
		ProW4Command=function(self) self:playcommand("Glow") end,
		ProW5Command=function(self) self:playcommand("Glow") end,
		W1Command=function(self) self:playcommand("Glow") end,
		W2Command=function(self) self:playcommand("Glow") end,
		W3Command=function(self) self:playcommand("Glow") end,
		W4Command=function(self) end,
		W5Command=function(self) end,
		HitMineCommand=function(self) self:playcommand("Glow") end,
		HeldCommand=function(self) self:playcommand("Glow") end,
		GlowCommand=function(self)	self:finishtweening():diffusealpha(1):zoomx(1):decelerate(0.36):diffusealpha(0):zoomx(1.3) end,
	},
	--Hold Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Ring" ) .. {
		HoldingOnCommand=function(self) self:diffusealpha(0.6):squish():effectperiod(1):effectperiod(0.1) end,
		HoldingOffCommand=function(self) self:diffusealpha(0.0) end,
		InitCommand=function(self) self:playcommand("HoldingOff"):blend('add'):finishtweening() end;
	},
	--Roll Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "Ring" ) .. {
		RollOnCommand=function(self) self:diffusealpha(0.6):squish():effectperiod(1):effectperiod(0.1) end,
		RollOffCommand=function(self) self:diffusealpha(0.0) end,
		InitCommand=function(self) self:playcommand("RollOff"):blend('add'):finishtweening() end;
	},
}