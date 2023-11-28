return Def.ActorFrame{
	InitCommand=function(self)
		self:SetHeight(128)
	end,
	Def.ActorFrame{
		InitCommand=function(self)
			self:y(-64)
		end,
		Def.Model{
			Meshes=NOTESKIN:GetPath('','tail'),
			Materials=NOTESKIN:GetPath('','tail'),
			Bones=NOTESKIN:GetPath('','tail')
		}
	}
}