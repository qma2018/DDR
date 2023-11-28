local sButton = Var "Button"
local sElement = Var "Element"

local Colours = {
	["Fret 1"] = "#FF0000",
	["Fret 2"] = "#00FF00",
	["Fret 3"] = "#0000FF",
	["Fret 4"] = "#FFFF00",
	["Fret 5"] = "#FF00FF",
	["Fret 6"] = "#00FFFF",
	["open short"] = "#FF00FF",
	["open long"] = "#FF00FF",
	["open six"] = "#FF00FF"
}

local Texture = Def.ActorFrame{}

if string.find(sButton, "wailing") then
	Texture[#Texture+1] = Def.Sprite {
		Texture=NOTESKIN:GetPath("_Note", sElement),
		InitCommand=function(self)
			self:diffuse(0,1,0,1)
						
		end
	}
else
	Texture[#Texture+1] = Def.Quad {
		InitCommand=function(self)
			self:scaletoclipped(64,12):diffuse(color(Colours[sButton]))
			if string.find(sButton, "open short") then
				self:scaletoclipped(64*3,12)
			elseif string.find(sButton, "open long") then
				self:scaletoclipped(64*5,12)
			elseif string.find(sButton, "open six") then
				self:scaletoclipped(64*6,12)
			end
		end
	}
end

if string.find(sButton, "open") then
	Texture[#Texture+1] = Def.BitmapText {
		Font="_noto sans Bold",
		Text="OPEN"
	}
end

return Def.ActorFrame{Texture}