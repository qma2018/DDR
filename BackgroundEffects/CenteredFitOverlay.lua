local Color1 = color(Var "Color1");

local t = Def.ActorFrame {
	LoadActor(Var "File1") .. {
		OnCommand=function(self)
			self:xy(_screen.cx, _screen.cy)
				:diffuse(Color1)
				:scaletofit(0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
				:SetEffectMode( "EffectMode_AlphaBlack" )
				:SetTextureFiltering(false)
		end
	}
}

return t