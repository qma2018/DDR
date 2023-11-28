return Def.BitmapText{
	Font="Common Normal",
	CountCommand=function(self,params)
		self:zoom(1.5)
			:strokecolor(0,0,0,1)
			:settext(params.Count)
		if params.Count < 0 then self:visible(false) else self:visible(true) end
	end
}
