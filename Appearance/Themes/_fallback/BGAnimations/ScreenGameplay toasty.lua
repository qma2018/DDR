return LoadActor(THEME:GetPathS("", "_toasty")) .. {
	StartTransitioningCommand= function (self)
		self:play()
	end
};
