local sButton = Var "Button"
local sGameButton = INPUTFILTER:GameButtonToKeyMapped(Var "GameButton", Var "Player")
sGameButton = string.gsub(sGameButton, "Key", "")

local Colour = {
	Key1 = "#0000FF",
	Key2 = "#FF0000",
	Key3 = "#0000FF",
	Key4 = "#0000FF",
	Key5 = "#FF0000",
	Key6 = "#0000FF",
	Key7 = "#0000FF",
	Key8 = "#0000FF",
	Key9 = "#FF0000",
	Key10 = "#FFFF00",
	Key11 = "#FF0000",
	Key12 = "#0000FF",
	Key13 = "#0000FF",
	Key14 = "#0000FF",
	Key15 = "#FF0000",
	Key16 = "#0000FF",
	Key17 = "#0000FF",
	Key18 = "#FF0000",
	Key19 = "#0000FF",
}

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:valign(1):diffuse(1,0,0,0.2):scaletoclipped(64,64):fadetop(1) end
	},
	Def.Quad {
		InitCommand=function(self) self:scaletoclipped(64,16):diffuse(1,0,0,1):effectclock("beat"):queuecommand("Flash") end,
		FlashCommand=function(self) self:diffuseblink():effectcolor1(0.5,0,0,1):effectcolor2(1,0,0,1):effecttiming(0.5,0,0.5,0) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(12):valign(1):diffuse(color(Colour[sButton])):scaletoclipped(64,768):fadetop(1):diffusealpha(0) end,
		PressCommand=function(self) self:diffusealpha(0.5) end,
		LiftCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0) end
	}
}
