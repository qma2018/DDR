return Def.ActorFrame {
	InitCommand=function(self) self:SetHeight(64) end,
	Def.Quad {
		InitCommand=function(self) self:diffuse(color("#009900")):scaletoclipped(64,64) end
	}
}
