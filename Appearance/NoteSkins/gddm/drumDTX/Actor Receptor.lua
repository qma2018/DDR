local sButton = Var "Button"
local sPlayer = Var "Player"

local Reverse = string.find(GAMESTATE:GetPlayerState(sPlayer):GetPlayerOptionsString("ModsLevel_Preferred"):lower(), "reverse") and -1 or 1

local Buttons = {
	["Left Crash"] = "Crash ",
	["Hi-Hat"] = "Hat ",
	["Hi-Hat Pedal"] = "Hi ",
	["Snare"] = "",
	["High Tom"] = "",
	["Kick"] = "Foot ",
	["Mid Tom"] = "",
	["Floor Tom"] = "",
	["Ride"] = "Crash ",
	["Right Crash"] = "Crash "
}

local Colours = {
	["Left Crash"] = "#FF0A59",
	["Hi-Hat"] = "#0D8EFF",
	["Hi-Hat Pedal"] = "#FF4DC3",
	["Snare"] = "#FFDE25",
	["High Tom"] = "#38FF25",
	["Kick"] = "#9381FF",
	["Mid Tom"] = "#FF2525",
	["Floor Tom"] = "#FF610A",
	["Ride"] = "#00FFFF",
	["Right Crash"] = "#A5FF00"
}

local Pos = {
	["Left Crash"] = 36,
	["Hi-Hat"] = 36,
	["Hi-Hat Pedal"] = 38,
	["Snare"] = 44,
	["High Tom"] = 36,
	["Kick"] = 38,
	["Mid Tom"] = 36,
	["Floor Tom"] = 44,
	["Ride"] = 36,
	["Right Crash"] = 36
}

return Def.ActorFrame {
	Def.ActorFrame{
		OnCommand=function(self) self:diffusealpha(0):zoomy(5):y(6) end,
		PressCommand=function(self) self:stoptweening():diffusealpha(.6) end,
		LiftCommand=function(self) self:linear(.15):diffusealpha(0) end,
		Def.Sprite {
		Texture="_Global Note Flash Center (res 1x60).png",
		OnCommand=function(self)
			self:diffuse(color(Colours[sButton]))
			self:valign(1):zoomx(64)
		end	
		}
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_receptor", "tex" ),
		InitCommand=function(self)
			self:scaletoclipped(64,12):diffuse(1,1,0,1)
		end
	}
}