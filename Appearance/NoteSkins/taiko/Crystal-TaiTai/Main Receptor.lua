local pn = Var "Player"

local TaiTai = {}

local Colours = {
	["Taiko Left Outside"] = "#0000FF",
	["Taiko Right Outside"] = "#0000FF",
	["Taiko Left Inside"] = "#FF0000",
	["Taiko Right Inside"] = "#FF0000",
}

function TaiTai.Input(event)
	if not event.PlayerNumber then return end
	if ToEnumShortString(event.type) == "FirstPress" and event.PlayerNumber == pn then
		if TaiTai.Buttons:GetChild("Taiko Drum"):GetChild(event.button) then
			TaiTai.Buttons:GetChild("Taiko Drum"):GetChild(event.button):stoptweening():queuecommand("Push")
			TaiTai.Buttons:GetChild("Background"):stoptweening():diffuse(color(Colours[event.button])):queuecommand("Push")			
		end
	end
end

return Def.ActorFrame{
	OnCommand=function(self) TaiTai.Buttons = self; SCREENMAN:GetTopScreen():AddInputCallback(TaiTai.Input) end,
	Def.ActorFrame{
		Name="Taiko Drum",
		OnCommand=function(self) self:x(-128) end,
			Def.Sprite{
				Texture="Drum Receptor (doubleres).png",
			},
			Def.Sprite{
				Name="Taiko Left Outside",
				Texture="Outside Receptor",
				PushCommand=function(self) self:diffuse(0,0,1,1):linear(0.2):diffuse(1,1,1,1) end,
			},
			Def.Sprite{
				Name="Taiko Right Outside",
				Texture="Outside Receptor",
				OnCommand=function(self) self:rotationy(180) end,
				PushCommand=function(self) self:diffuse(0,0,1,1):linear(0.2):diffuse(1,1,1,1) end,
			},
			Def.Sprite{
				Name="Taiko Left Inside",
				Texture="Inside Receptor",
				PushCommand=function(self) self:diffuse(1,0,0,1):linear(0.2):diffuse(1,1,1,1) end,
			},
			Def.Sprite{
				Name="Taiko Right Inside",
				Texture="Inside Receptor",
				OnCommand=function(self) self:rotationy(180) end,
				PushCommand=function(self) self:diffuse(1,0,0,1):linear(0.2):diffuse(1,1,1,1) end,
			},
		},
	Def.Quad {
		Name="Background",
		OnCommand=function(self) self:valign(0):xy(256-64,-64):scaletoclipped(512,128):faderight(1):diffusealpha(0) end,
		PushCommand=function(self) self:diffusealpha(1):linear(0.2):diffusealpha(0) end,
	},
	LoadActor("_Receptor"),
}