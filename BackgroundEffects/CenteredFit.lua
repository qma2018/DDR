local Color1 = color(Var "Color1");

local t = Def.ActorFrame {
	LoadActor(Var "File1") .. {
		OnCommand= function(self)
			self:xy(_screen.cx, _screen.cy):diffuse(Color1):effectclock("music"):play()
			-- Explanation in StretchNoLoop.lua.
			if self.GetTexture then
				self:GetTexture():rate(self:GetParent():GetUpdateRate())
			end
			self:scaletofit(0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
		end,
		LoseFocusCommand=function(self) self:pause() end
	};
};

return t;
