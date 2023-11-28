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

local function command(self)
	self:stoptweening()
		:diffusealpha(1)
		:zoom(1)
		:linear(.12)
		:zoom(1.2)
		:diffusealpha(0)
end

local function alsoCommand(self)
	self:rotationz(0)
		:stoptweening()
		:diffusealpha(1)
		:zoom(.8)
		:linear(.07)
		:zoom(1.2)
		:rotationz(21)
		:linear(.07)
		:rotationz(42)
		:diffusealpha(0)
		:zoom(0.8)
end
local function Notcommand(self) self:stoptweening():zoom(1):diffusealpha(0) end

if not string.find(sButton, "wailing") and not string.find(sButton, "open") then
	Texture = Def.ActorFrame {
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Tap", "Explosion" ),
			InitCommand=function(self)
				self:diffuse(color(Colours[sButton]))
			end,
			MissCommand=Notcommand,
			W5Command=Notcommand,
			W4Command=Notcommand,
			W3Command=command,
			W2Command=command,
			W1Command=command
		},
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_flare", "white" ),
			InitCommand=function(self)
				self:diffuse(BoostColor((color(Colours[sButton])),2.3)):blend('add') 
			end,
			MissCommand=Notcommand,
			W5Command=Notcommand,
			W4Command=Notcommand,
			W3Command=alsoCommand,
			W2Command=alsoCommand,
			W1Command=alsoCommand,
			BrightCommand=function(self) self:visible(false) end,
			DimCommand=function(self) self:visible(true) end,
		},
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_flare", "particle" ),
			InitCommand=function(self)
				self:diffuse(BoostColor((color(Colours[sButton])),2.3)):blend('add') 
			end,
			MissCommand=Notcommand,
			W5Command=Notcommand,
			W4Command=Notcommand,
			W3Command=alsoCommand,
			W2Command=alsoCommand,
			W1Command=alsoCommand,
			BrightCommand=function(self) self:visible(true) end,
			DimCommand=function(self) self:visible(false) end,
		}
	}
elseif string.find(sButton, "open") then
	for i = 1,numnotes do
		Texture[#Texture+1] = Def.Sprite {
			Texture=NOTESKIN:GetPath( "_flare", "particle" ),
			InitCommand=function(self)
				self:diffuse(color(Colours["Fret "..i])):x((i*64)-((numnotes/2)*64)-32):blend('add') 
			end,
			MissCommand=Notcommand,
			W5Command=Notcommand,
			W4Command=Notcommand,
			W3Command=alsoCommand,
			W2Command=alsoCommand,
			W1Command=alsoCommand
		}
	end
end

return Def.ActorFrame{Texture}