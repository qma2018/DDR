return Def.ActorFrame {
	InitCommand=function (self)
		self:Center()
	end,
	Def.Quad {
		InitCommand= function(self)
			self:zoomto(64, 64):spin()
		end,
		ToggleConsoleDisplayMessageCommand=function(self)
			self:zoomto(345, 345):visible(true)
		end
	}
}