return Def.ActorFrame {
	InitCommand=function(self) self:SetHeight(64) end,
	Def.Quad {
		InitCommand=function(self) self:diffuse(color("#5c2c6d")):scaletoclipped(64,64) end
	}
}
