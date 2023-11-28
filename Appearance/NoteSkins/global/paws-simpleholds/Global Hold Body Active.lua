return Def.ActorFrame{
	InitCommand=function(self)
		self:SetHeight(128)
	end,
	Def.ActorFrame{
		InitCommand=function(self)
			self:spin():effectclock("beat"):effectmagnitude(0,800,0):y(-64)
		end,
		Def.Model{
			Meshes=NOTESKIN:GetPath('','tail'),
			Materials=NOTESKIN:GetPath('','tail'),
			Bones=NOTESKIN:GetPath('','tail')
		}
	}
}