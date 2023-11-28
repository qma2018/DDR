return Def.ActorFrame {
	Def.Sprite{
		BaseZoomY=-1,
		Texture=NOTESKIN:GetPath("_FootDownLeft","Mask"),
		InitCommand=function(self)
			self:MaskSource(true)
		end
	},
	Def.Sprite{
		BaseZoomY=-1,
		Texture=NOTESKIN:GetPath("_FootDownLeft","Colour"),
		InitCommand=function(self)
			self:set_use_effect_clock_for_texcoords(true)
			self:effectclock('beat'):diffuse(1,0,0,1):texcoordvelocity(0.25,-0.25):MaskDest()
		end
	},
	Def.Sprite{
		BaseZoomY=-1,
		Texture=NOTESKIN:GetPath("_FootDownLeft","Tap Note")
	}
}
