--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");

--The NOTESKIN:LoadActor() just tells us the name of the image the Actor redirects on.
--Oh and if you wonder about the "Button" in the "NOTESKIN:LoadActor( )" it means that it will check for that direction.
--So you dont have to do "Down" or "Up" or "Left" etc for every direction which will save space ;)
local cw5 = JudgmentLineToColor("JudgmentLine_W5")
local cw4 = JudgmentLineToColor("JudgmentLine_W4")
local cw3 = JudgmentLineToColor("JudgmentLine_W3")
local cw2 = JudgmentLineToColor("JudgmentLine_W2")
local cw1 = JudgmentLineToColor("JudgmentLine_W1")
local cwpro5 = JudgmentLineToColor("JudgmentLine_ProW5")
local cwpro4 = JudgmentLineToColor("JudgmentLine_ProW4")
local cwpro3 = JudgmentLineToColor("JudgmentLine_ProW3")
local cwpro2 = JudgmentLineToColor("JudgmentLine_ProW2")
local cwpro1 = JudgmentLineToColor("JudgmentLine_ProW1")

local t = Def.ActorFrame {
	--Hold Explosion Commands
	NOTESKIN:LoadActor( "Left Tap", "Hold Explosion" ) .. {
		HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand"),
		HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand"),
		InitCommand=function(self) self:playcommand("HoldingOff"):finishtweening() end
	},
	--Roll Explosion Commands
	NOTESKIN:LoadActor( "Left Tap", "Hold Explosion" ) .. {
		RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand"),
		RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand"),
		InitCommand=function(self) self:playcommand("RollOff"):finishtweening() end
	},
	-- Explosion commands
	NOTESKIN:LoadActor( "Left Tap",  "Tap Explosion Dim" ) .. {
		InitCommand=function(self) self:blend("BlendMode_Add"):diffusealpha(0) end,
		ProW1Command=function(self) self:playcommand("Glow") end,
		ProW2Command=function(self) self:playcommand("Glow") end,
		ProW3Command=function(self) self:playcommand("Glow") end,
		ProW4Command=function(self) self:playcommand("Glow") end,
		ProW5Command=function(self) self:playcommand("Glow") end,
		W1Command=function(self) self:playcommand("Glow") end,
		W2Command=function(self) self:playcommand("Glow") end,
		W3Command=function(self) self:playcommand("Glow") end,
		W4Command=function(self) end,
		W5Command=function(self) end,
		HeldCommand=function(self) self:playcommand("Glow") end,
		GlowCommand=function(self)	self:finishtweening():diffusealpha(1):zoom(1):decelerate(0.3):diffusealpha(0):zoom(1.3) end,
	},
	
	--Mine Explosion Commands
	NOTESKIN:LoadActor( Var "Button", "HitMine Explosion" ) .. {
		InitCommand=function(self) self:blend("BlendMode_Add"):diffusealpha(0) end,
		HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand")
	}
}
return t;