return Def.ActorFrame {
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootDownLeft","Mask"),
		InitCommand=function(self)
			self:MaskSource(true)
		end
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootDownLeft","Colour"),
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
			self:effectclock('beat'):diffuse(0,0,1,1):texcoordvelocity(0.25,-0.25):MaskDest()
		end
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_FootDownLeft","Tap Note")
	}
}
