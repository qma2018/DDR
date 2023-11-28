return Def.ActorFrame {
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootCenter","Mask"),
		InitCommand=function(self)
			self:MaskSource(true)
		end
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootCenter","Colour"),
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
			self:effectclock('beat'):diffuse(1,1,0,1):texcoordvelocity(0,0.25):MaskDest()
		end
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootCenter","Tap Note")
	}
}
