return Def.Sprite {
	Texture=NOTESKIN:GetPath( 'downleft', 'tap lift' );
	InitCommand=function(self)
		self:animate(false):pulse():effectclock("beat"):effectmagnitude(0.9,1,1):effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.8"))
	end;
};