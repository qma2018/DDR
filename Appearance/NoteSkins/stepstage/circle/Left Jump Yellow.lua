local sButton = Var "Button"
if sButton == "Right" then sButton = "Left" end 

return Def.ActorFrame {
	Def.Sprite{
		Texture=NOTESKIN:GetPath("Left","Hold Yellow Body Active"),
		InitCommand=function(self) self:valign(1):rotationz(90):zoomy(1.5) end	
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_"..sButton,"Tap Yellow")
	}
}
