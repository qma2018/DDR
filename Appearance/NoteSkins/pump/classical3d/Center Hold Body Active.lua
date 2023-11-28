return Def.ActorFrame{
	InitCommand=function(self)
		self:SetHeight(20)
	end,
	Def.ActorFrame{
		InitCommand=function(self)
			self:y(0)
		end,
		Def.Model{
			Meshes=NOTESKIN:GetPath('','PIUHoldYellow'),
			Materials=NOTESKIN:GetPath('','PIUHoldYellow'),
			Bones=NOTESKIN:GetPath('','PIUHoldYellow')
		}
	}
}
