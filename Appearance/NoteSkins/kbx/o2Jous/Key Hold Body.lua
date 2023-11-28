local sButton = Var "Button"

local Colour = {
	Key1 = "#3f6a81",
	Key2 = "#936f6f",
	Key3 = "#3f6a81",
	Key4 = "#3f6a81",
	Key5 = "#936f6f",
	Key6 = "#3f6a81",
	Key7 = "#3f6a81",
	Key8 = "#3f6a81",
	Key9 = "#936f6f",
	Key10 = "#816a40",
	Key11 = "#936f6f",
	Key12 = "#3f6a81",
	Key13 = "#3f6a81",
	Key14 = "#3f6a81",
	Key15 = "#936f6f",
	Key16 = "#3f6a81",
	Key17 = "#3f6a81",
	Key18 = "#936f6f",
	Key19 = "#3f6a81",
}

return Def.ActorFrame {
	InitCommand=function(self) self:SetHeight(16) end,
	Def.Quad {
		InitCommand=function(self) self:diffuse(color(Colour[sButton])):scaletoclipped(64,16) end
	}
}
