local sButton = Var "Button"

local Colours = {
	["Fret 1"] = "#FF0000",
	["Fret 2"] = "#00FF00",
	["Fret 3"] = "#0000FF",
	["Fret 4"] = "#FFFF00",
	["Fret 5"] = "#FF00FF",
	["Fret 6"] = "#00FFFF",
}

local Texture = Def.ActorFrame{}

if string.find(sButton, "wailing") then
	Texture = Def.Sprite {
		Texture=NOTESKIN:GetPath("_Receptor", "Wailing"),
		InitCommand=function(self)
			self:diffuse(1,1,0,1)
		end
	}
elseif not string.find(sButton, "open") then
	Texture = Def.ActorFrame { 
		Def.Quad {
			InitCommand=function(self)
				self:scaletoclipped(12,9999):diffuse(color(Colours[sButton])):diffusealpha(0)
			end,
			PressCommand=function(self) self:diffusealpha(.5) end,
			LiftCommand=function(self) self:diffusealpha(0) end
		},
		Def.Quad {
			InitCommand=function(self)
				self:scaletoclipped(64,12):diffuse(1,1,0,1)
			end
		}
	}
end

return Def.ActorFrame{Texture}