local sButton = Var "Button"
if sButton == "Right" then sButton = "Left" end 

return Def.Sprite{
	Texture=NOTESKIN:GetPath("_"..sButton,"Tap Red")
}
