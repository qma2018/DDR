local sButton = Var "Button"
local sGameButton = INPUTFILTER:GameButtonToKeyMapped(Var "GameButton", Var "Player")
sGameButton = string.gsub(sGameButton, "Key", "")

local Colour = {
	Key1 = "#6df1d8",
	Key2 = "#d30cb8",
	Key3 = "#6df1d8",
	Key4 = "#6df1d8",
	Key5 = "#d30cb8",
	Key6 = "#6df1d8",
	Key7 = "#6df1d8",
	Key8 = "#6df1d8",
	Key9 = "#d30cb8",
	Key10 = "#5da4a6",
	Key11 = "#d30cb8",
	Key12 = "#6df1d8",
	Key13 = "#6df1d8",
	Key14 = "#6df1d8",
	Key15 = "#d30cb8",
	Key16 = "#6df1d8",
	Key17 = "#6df1d8",
	Key18 = "#d30cb8",
	Key19 = "#6df1d8"
}

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:valign(1):diffuse(1,0,0,0.2):scaletoclipped(64,64):fadetop(1) end
	},
	Def.Quad {
		InitCommand=function(self) self:scaletoclipped(64,24):diffuse(1,0,0,1):effectclock("beat"):queuecommand("Flash") end,
		FlashCommand=function(self) self:diffuseblink():effectcolor1(0.5,0,0,1):effectcolor2(1,0,0,1):effecttiming(0.5,0,0.5,0) end
	},
	Def.Quad {
		InitCommand=function(self) self:y(16):valign(1):diffuse(color(Colour[sButton])):scaletoclipped(64,768):fadetop(1):diffusealpha(0) end,
		PressCommand=function(self) self:diffusealpha(0.5) end,
		LiftCommand=function(self) self:stoptweening():linear(0.2):diffusealpha(0) end
	}
}
