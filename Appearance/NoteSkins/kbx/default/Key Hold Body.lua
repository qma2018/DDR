local sButton = Var "Button"

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
	InitCommand=function(self) self:SetHeight(16) end,
	Def.Quad {
		InitCommand=function(self) self:diffuse(color("#3c345c")):scaletoclipped(64,16) end
	},
	Def.Quad {
		InitCommand=function(self) self:diffuse(color(Colour[sButton])):scaletoclipped(4,16):x(-30) end
	},
	Def.Quad {
		InitCommand=function(self) self:diffuse(color(Colour[sButton])):scaletoclipped(4,16):x(30) end
	}
}
