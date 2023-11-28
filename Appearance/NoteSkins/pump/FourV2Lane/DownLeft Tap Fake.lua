local offset = 0
if string.find(Var "Button", "Down") then
	offset = 6
end

return Def.Sprite {
	Texture=NOTESKIN:GetPath( '_DownLeft', 'Tap Fake' ),
	Frame0000=1+offset,
	Delay0000=0.1666666,
	Frame0001=2+offset,
	Delay0001=0.1666666,
	Frame0002=3+offset,
	Delay0002=0.1666666,
	Frame0003=4+offset,
	Delay0003=0.1666666,
	Frame0004=5+offset,
	Delay0004=0.1666666,
	Frame0005=6+offset,
	Delay0005=0.1666666
}
