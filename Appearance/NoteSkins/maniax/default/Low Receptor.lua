return Def.ActorFrame {
	-- We want this under the noteskin, so that we it looks like a laser (?)
	Def.Sprite {
	Texture=NOTESKIN:GetPath( "Low", "keypressblock" );
	InitCommand=function(self)
			self:vertalign(top):diffusealpha(0)
		end,
		-- Press/Lift allows this to appear and disappear
		PressCommand=function(self)
			self:finishtweening():decelerate(0.11):diffusealpha(0.75)
		end,
		LiftCommand=function(self)
			self:stoptweening():decelerate(0.11):diffusealpha(0)
		end
	},
	-- Overlay the receptor.
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "Low", "go receptor" );
		Frame0000=0;
		Delay0000=0.2;
		Frame0001=1;
		Delay0001=0.8;
		InitCommand=function(self) self:effectclock("beat") end;
		NoneCommand=NOTESKIN:GetMetricA('ReceptorArrow', 'NoneCommand');
	}
}