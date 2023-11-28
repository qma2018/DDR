local sButton = Var "Button"

local Colour = {
	Key1 = "#00A5FF",
	Key2 = "#FFA5A5",
	Key3 = "#00A5FF",
	Key4 = "#00A5FF",
	Key5 = "#FFA5A5",
	Key6 = "#00A5FF",
	Key7 = "#00A5FF",
	Key8 = "#00A5FF",
	Key9 = "#FFA5A5",
	Key10 = "#FFA500",
	Key11 = "#FFA5A5",
	Key12 = "#00A5FF",
	Key13 = "#00A5FF",
	Key14 = "#00A5FF",
	Key15 = "#FFA5A5",
	Key16 = "#00A5FF",
	Key17 = "#00A5FF",
	Key18 = "#FFA5A5",
	Key19 = "#00A5FF",
}

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:diffuse(color(Colour[sButton])):scaletoclipped(64,16) end
	},
	Def.Quad {
		InitCommand=function(self) self:x(-31):diffuse(color("#A5A5A5")):scaletoclipped(2,192):fadetop(0.5):fadebottom(0.5) end
	},
	Def.Quad {
		InitCommand=function(self) self:x(31):diffuse(color("#A5A5A5")):scaletoclipped(2,192):fadetop(0.5):fadebottom(0.5) end
	}
}
