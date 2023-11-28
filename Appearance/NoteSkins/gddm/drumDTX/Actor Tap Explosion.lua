local sButton = Var "Button"

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

local function Explosion(self)
	self:stoptweening()
		:diffusealpha(1)
		:zoom(1)
		:linear(.12)
		:zoom(1.2)
		:diffusealpha(0)
end

local function AlsoExplosion(self)
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

return Def.ActorFrame{
	-- Put in empty ActorFrane, Else colour doesnt work.
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_Tap", "Explosion" ),
		InitCommand=function(self) self:diffuse(ColorLightTone(color(Colours[sButton]))):blend('add') end,
		W1Command=function(self) Explosion(self) end,
		W2Command=function(self) Explosion(self) end,
		W3Command=function(self) Explosion(self) end,
		W4Command=function(self) self:diffusealpha(0) end,
		W5Command=function(self) self:diffusealpha(0) end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_flare", "white" ),
		InitCommand=function(self) 
			self:diffuse(BoostColor((color(Colours[sButton])),2.3))
				:blend('add') 
			end,
		BrightCommand=function(self) self:visible(false) end,
		DimCommand=function(self) self:visible(true) end,
		W1Command=function(self) AlsoExplosion(self) end,
		W2Command=function(self) AlsoExplosion(self) end,
		W3Command=function(self) AlsoExplosion(self) end,
		W4Command=function(self) self:diffusealpha(0) end,
		W5Command=function(self) self:diffusealpha(0) end
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_flare", "particle" ),
		InitCommand=function(self) 
			self:diffuse(BoostColor((color(Colours[sButton])),2.3))
				:blend('add') 
			end,
		BrightCommand=function(self) self:visible(true) end,
		DimCommand=function(self) self:visible(false) end,
		W1Command=function(self) AlsoExplosion(self) end,
		W2Command=function(self) AlsoExplosion(self) end,
		W3Command=function(self) AlsoExplosion(self) end,
		W4Command=function(self) self:diffusealpha(0) end,
		W5Command=function(self) self:diffusealpha(0) end
	}
}

