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

local numnotes = 5
if string.find(sButton, "open six") then numnotes = 6 end
if string.find(sButton, "open short") then numnotes = 3 end

local function command(self) self:stoptweening():zoom(1):diffusealpha(1):linear(.1):zoom(1.5):diffusealpha(0) end
local function Notcommand(self) self:stoptweening():zoom(1):diffusealpha(0) end

if not string.find(sButton, "wailing") and not string.find(sButton, "open") then
	Texture = Def.Sprite {
		Texture=NOTESKIN:GetPath("_explosion", "note"),
		InitCommand=function(self)
			self:diffuse(color(Colours[sButton]))
		end,
		MissCommand=Notcommand,
		W5Command=Notcommand,
		W4Command=Notcommand,
		W3Command=command,
		W2Command=command,
		W1Command=command
	}
elseif string.find(sButton, "open") then
	for i = 1,numnotes do
		Texture[#Texture+1] = Def.Sprite {
			Texture=NOTESKIN:GetPath("_explosion", "note"),
			InitCommand=function(self)
				self:diffuse(color(Colours["Fret "..i])):x((i*64)-((numnotes/2)*64)-32)
			end,
			MissCommand=Notcommand,
			W5Command=Notcommand,
			W4Command=Notcommand,
			W3Command=command,
			W2Command=command,
			W1Command=command
		}
	end
end

return Def.ActorFrame{Texture}