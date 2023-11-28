-- upper left corner
local Color1 = color(Var "Color1");

local t = Def.ActorFrame {
	LoadActor(Var "File1") .. {
		OnCommand=function(self)
			self:diffuse(Color1):effectclock("music"):play()
			-- Explanation in StretchNoLoop.lua.
			if self.GetTexture then
				self:GetTexture():rate(self:GetParent():GetUpdateRate())
			end
		end,
		LoseFocusCommand=function(self) self:pause() end
	};
};

return t;

