--Let's see if I can handle my own with .lua coding effects.

local t = Def.ActorFrame {
	--Hold Explosion Commands
	Def.Sprite {
		Texture="_Fallback Tap Mine";
		InitCommand=function(self)
		--self:blend('Modulate'): in case I want it translucent.
			self:effectclock("beat"):wag()
		end;
	};
}

return t;