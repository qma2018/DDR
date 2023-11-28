local sButton = Var "Button"

local Colours = {
	["Left Crash"] = "#FF6395",
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

local Extras = Def.ActorFrame{}

if sButton == "Hi-Hat Pedal" or sButton == "Kick" then
	Extras = Def.ActorFrame{
		InitCommand=function(self)
			if sButton == "Hi-Hat Pedal" then self:zoomx(-1) end
		end,
		Def.Sprite{
			Texture=NOTESKIN:GetPath( "_Tap Note", "Foot" ),
			InitCommand=function(self)
				self:diffuse(ColorLightTone(color(Colours[sButton]))):effectclock("beat"):wag()
			end
		}
	}
elseif sButton == "Crash" or sButton == "Ride" then
	Extras = Def.ActorFrame{
		InitCommand=function(self)
			self:zoom(.5)
			if sButton == "Ride" then self:zoomx(-.5) end
		end,
		Def.Sprite{
			Texture=NOTESKIN:GetPath( "_Receptor Crash", "Bottom" ),
			InitCommand=function(self)
				self:diffuse(ColorLightTone(color(Colours[sButton]))):effectclock("beat"):squish()
			end
		},
		Def.Sprite{
			Texture=NOTESKIN:GetPath( "_Receptor Crash", "Top" ),
			InitCommand=function(self)
				self:effectclock("beat"):squish()
			end
		}
	}
elseif sButton == "Hi-Hat" then
	Extras = Def.ActorFrame{
		InitCommand=function(self)
			self:zoom(.5)
		end,
		Def.Sprite{
			Texture=NOTESKIN:GetPath( "_Receptor Hat", "Bottom" ),
			InitCommand=function(self)
				self:diffuse(ColorLightTone(color(Colours[sButton]))):effectclock("beat"):squish()
			end
		},
		Def.Sprite{
			Texture=NOTESKIN:GetPath( "_Receptor Hat", "Top" ),
			InitCommand=function(self)
				self:effectclock("beat"):squish()
			end
		}
	}
end

return Def.ActorFrame{
	Extras,
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_note", "tex" ),
		InitCommand=function(self)
			self:scaletoclipped(64,12)
				:diffuse(ColorLightTone(color(Colours[sButton])))
		end
	}
}