local NumExplosions = 20

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
	["Left Crash"] = "#FF00FF",
	["Hi-Hat"] = "#00FFFF",
	["Hi-Hat Pedal"] = "#FF00FF",
	["Snare"] = "#FFFF00",
	["High Tom"] = "#00FF00",
	["Kick"] = "#800080",
	["Mid Tom"] = "#FF0000",
	["Floor Tom"] = "#FFA500",
	["Ride"] = "#00FFFF",
	["Right Crash"] = "#A5FF00"
}

local Pos = {
	["Left Crash"] = 32,
	["Hi-Hat"] = 32,
	["Hi-Hat Pedal"] = 32,
	["Snare"] = 48,
	["High Tom"] = 32,
	["Kick"] = 32,
	["Mid Tom"] = 32,
	["Floor Tom"] = 48,
	["Ride"] = 32,
	["Right Crash"] = 32
}

local CurBar = 1

local Explosion = Def.ActorFrame{
	W1Command=function(self) self:stoptweening():queuecommand("Increase") end,
	W2Command=function(self) self:stoptweening():queuecommand("Increase") end,
	W3Command=function(self) self:stoptweening():queuecommand("Increase") end,
	IncreaseCommand=function() 
		CurBar = CurBar + 1
		if CurBar > NumExplosions then CurBar = 1 end
	end
}

for i = 1,NumExplosions do
	for j = -1,1,2 do
		Explosion[#Explosion+1] = Def.ActorFrame {
			InitCommand=function(self) self:diffusealpha(0) end,
			W1Command=function(self) self:playcommand("Move") end,
			W2Command=function(self) self:playcommand("Move") end,
			W3Command=function(self) self:playcommand("Move") end,
			MoveCommand=function(self)
				if CurBar == i then
					self:stoptweening()
						:x(96*j)
						:diffusealpha(1)
						:rotationz(0)
						:linear(.5)
						:rotationz(180*j*Reverse)
						:diffusealpha(0)
				end
			end,
			Def.Quad {
				InitCommand=function(self) self:scaletoclipped(32,12):diffuse(color(Colours[sButton])) end,
				W1Command=function(self) self:playcommand("Move") end,
				W2Command=function(self) self:playcommand("Move") end,
				W3Command=function(self) self:playcommand("Move") end,
				MoveCommand=function(self)
					if CurBar == i then
						self:stoptweening()
							:x(-80*j)
							:rotationz(0)
							:linear(.5)
							:rotationz(360*j*Reverse)
					end
				end
			}
		}
	end
end

return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self)
			self:scaletoclipped(64,12):diffuse(1,1,0,1)
		end
	},
	Def.ActorFrame{
		InitCommand=function(self)
			self:y(Pos[sButton]*Reverse)
			if sButton == "Ride" then self:zoomx(-1) end
			if sButton == "Right Crash" then self:zoomx(-.8) end
		end,
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Receptor", Buttons[sButton].."Bottom" ),
			InitCommand=function(self)
				self:diffuse(color(Colours[sButton]))
			end,
			PressCommand=function(self)
				self:stoptweening()
					:y(0)
					:bounceend(.075)
					:y(10)
			end,
			LiftCommand=function(self)
				self:stoptweening()
					:bounceend(.075)
					:y(0)
			end
		},
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Receptor", Buttons[sButton].."Top" ),
			PressCommand=function(self)
				self:stoptweening()
					:y(0)
					:bounceend(.075)
					:y(10)
					:diffusealpha(0)
			end,
			LiftCommand=function(self)
				self:stoptweening()
					:bounceend(.075)
					:y(0)
					:diffusealpha(1)
			end
		}
	},
	Explosion
}