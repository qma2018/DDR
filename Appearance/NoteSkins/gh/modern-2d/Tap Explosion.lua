return Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_"..Var "Button", "Explosion" ),
		W5Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.4) end;
		W4Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.4) end;
		W3Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.4) end;
		W2Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.4) end;
		W1Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.4) end;
		ProW1Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.3) end;
		ProW2Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.3) end;
		ProW3Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.2) end;
		ProW4Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.2) end;
		ProW5Command=function (self) self:finishtweening():blend("add"):zoom(1):diffusealpha(0.9):linear(.2):diffusealpha(0):zoom(1.1) end;
		JudgmentCommand=function(self) self:finishtweening() end;
	}
}
