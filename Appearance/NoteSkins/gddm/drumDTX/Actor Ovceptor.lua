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
					:bounceend(.1)
					:y(5)
					:diffuse(BoostColor((color(Colours[sButton])),1.5))
			end,
			LiftCommand=function(self)
				self:stoptweening()
					:bounceend(.1)
					:y(0)
					:diffuse(color(Colours[sButton]))
			end
		},
		Def.Sprite {
			Texture=NOTESKIN:GetPath( "_Receptor", Buttons[sButton].."Top" ),
			PressCommand=function(self)
				self:stoptweening()
					:y(0)
					:bounceend(.1)
					:y(5)
			end,
			LiftCommand=function(self)
				self:stoptweening()
					:bounceend(.1)
					:y(0)
			end
		}
	},
	Explosion
}