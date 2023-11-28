local sButton = Var "Button"
local Rot = 90
if sButton == "Right" then Rot = -90 end 

return Def.ActorFrame {
	Def.Sprite{
		Texture=NOTESKIN:GetPath("Left","Hold Body Active"),
		InitCommand=function(self) self:valign(1):rotationz(Rot):zoomy(1.5) end	
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath("_"..sButton,"Tap Yellow")
	}
}
