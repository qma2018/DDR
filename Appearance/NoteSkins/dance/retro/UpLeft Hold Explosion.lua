return LoadActor("UpLeft Tap Explosion Bright")..{
	CheckpointHitCommand=function(self)
		self:diffusealpha(0)
	end;
};