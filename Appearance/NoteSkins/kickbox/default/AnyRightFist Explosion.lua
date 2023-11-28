local t = Def.ActorFrame {
	LoadActor( "_AnyRightFist Tap Explosion Bright" ) .. {
		HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand"),
		HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand"),
		InitCommand=function(self) self:playcommand("HoldingOff"):finishtweening() end
	},
	LoadActor( "_AnyRightFist Tap Explosion Bright" ) .. {
		RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand"),
		RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand"),
		InitCommand=function(self) self:playcommand("RollOff"):finishtweening() end
	},
	Def.Sprite {
		Texture="_AnyRightFist Tap Explosion Dim",
		InitCommand=function(self) self:diffusealpha(0) end,
		W5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W5Command"),
		W4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W4Command"),
		W3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W3Command"),
		W2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W2Command"),
		W1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		ProW1Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		ProW2Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		ProW3Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		ProW4Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		ProW5Command=NOTESKIN:GetMetricA("GhostArrowDim", "W1Command"),
		HeldCommand=NOTESKIN:GetMetricA("GhostArrowDim", "HeldCommand"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(false) end,
		DimCommand=function(self) self:visible(true) end
	},
	Def.Sprite {
		Texture="_AnyRightFist Tap Explosion Bright",
		InitCommand=function(self) self:diffusealpha(0) end,
		W5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command"),
		W4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command"),
		W3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command"),
		W2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W2Command"),
		W1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		ProW1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		ProW2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		ProW3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		ProW4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		ProW5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command"),
		HeldCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HeldCommand"),
		JudgmentCommand=function(self) self:finishtweening() end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(false) end
	},
	LoadActor( "Fallback HitMine Explosion" ) .. {
		InitCommand=function(self) self:blend('add'):diffusealpha(0) end,
		HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand")
	}
}
return t;
