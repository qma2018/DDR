local sButton = Var "Button"
local sPlayer = Var "Player"
if not GHReceptor then GHReceptor = {} end
if not GHReceptor[sPlayer] then GHReceptor[sPlayer] = {} end
if not GHReceptor[sPlayer][sButton] then GHReceptor[sPlayer][sButton] = {} end

local Buttons = {
	"Fret 1",
	"Fret 2",
	"Fret 3",
	"Fret 4",
	"Fret 5"
}

local ComboPer = false

if sButton == "Strum Up" then
	return Def.ActorFrame{
		Def.ActorFrame{
			OnCommand=function(self) self:xy(80,52):z(-16) end,
			Def.Quad{		
				OnCommand=function(self) 
					self:zoomto(160,32):diffuse(0,0,0,1)		
				end
			},
			Def.Quad{
				OnCommand=function(self) 
					self:zoomto(155,22):diffuse(0,0,.4,1):cropright(1)
				end,
				FeverMessageCommand=function(self,params)
					if params.pn ~= sPlayer then return end
					if params.Active then
						self.Active = true
						self:linear((self.Amount /125)*15):cropright(1)
					else
						self.Active = false
					end
				end,
				FeverScoreMessageCommand=function(self,params)
					if params.pn ~= sPlayer then return end
					self.Amount = params.Amount;
					self:stoptweening():linear(.1):cropright(1-(params.Amount /125))
					if not self.Active then
						if params.Amount >= 50 then 
							self:diffuse(0,0,.8,1)
						else 
							self:diffuse(0,0,.4,1) 
						end
					else
						self:stoptweening():linear((self.Amount /125)*15):cropright(1)
					end
				end
			},	
			Def.BitmapText{
				Text="FEVER READY!",
				Font="Common Normal",
				OnCommand=function(self) self:diffusealpha(0):zoom(.8) end,
				FeverMessageCommand=function(self,params)
					if params.pn ~= sPlayer then return end
					self.Active = params.Active;
					ComboPer = params.Active
					if params.Active then
						self:diffusealpha(0)
					end
				end,
				FeverScoreMessageCommand=function(self,params)
					if params.pn ~= sPlayer then return end
					if not self.Active then
						if params.Amount >= 50 then 
							self:diffusealpha(1):rainbow():settext("FEVER READY!")
						else
							self:stopeffect():diffuse(1,1,1,1):settext(math.floor(params.Amount + 0.5))
						end
					end
				end
			},
			PressCommand=function(self)
				local FretActive = false
				for _,v in ipairs(Buttons) do
					if GHReceptor[sPlayer][v][2] then
						GHReceptor[sPlayer][v][1]:stoptweening():bounceend(.1):z(6):bounceend(.1):z(0)	
						FretActive = true
						end
				end					
				if not FretActive then
					for _,v in ipairs(Buttons) do
						GHReceptor[sPlayer][v][1]:stoptweening():bounceend(.1):z(6):bounceend(.1):z(0)	
					end
				end
			end
		},
		Def.ActorFrame{
			OnCommand=function(self) self:xy(-80,52):z(-16) end,
			Def.Quad{		
				OnCommand=function(self) 
					self:zoomto(160,32):diffuse(0,0,0,1)		
				end
			},
			Def.BitmapText{
				Text="1x",
				Font="Common Normal",
				OnCommand=function(self) self:zoom(.8):halign(0):x(-74) end,
				ComboChangedMessageCommand=function(self,params)
					if params.Player ~= sPlayer then return end
					local curCombo = params.PlayerStageStats:GetCurrentCombo()
					local percent = 1
					
					if curCombo >= 30 then percent = 4
					elseif curCombo >= 20 then percent = 3
					elseif curCombo >= 10 then percent = 2
					end
					
					if ComboPer then percent = percent*2 end
					
					self:settext(percent.."x")
				end
			},
			Def.BitmapText{
				Text="0",
				Font="Common Normal",
				OnCommand=function(self) self:zoom(.8):halign(1):x(74) end,
				ComboChangedMessageCommand=function(self,params)	
					if params.Player ~= sPlayer then return end				
					self:settext(params.PlayerStageStats:GetScore())
				end
			}
		}
	}
end

local Push = Def.ActorFrame{}

for i = 1,4 do 
Push[#Push+1] = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_".. sButton, "Receptor Go" ),
		InitCommand=function(self) self:effectclock("beat") end,
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand"),
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command"),
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command"),
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command"),
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command"),
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command")
	},
	Def.Sprite {
		Texture=NOTESKIN:GetPath( "_".. sButton, "Receptor Press" ),
		InitCommand=function(self) self:diffusealpha(0) end,
		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand"),
		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand")
	}
}
end

return Def.ActorFrame {
	InitCommand=function(self)
		GHReceptor[sPlayer][sButton][1] = self
		GHReceptor[sPlayer][sButton][2] = false
	end,
	PressCommand=function(self) self:stoptweening():bounceend(.1):z(6):bounceend(.1):z(0)	
		GHReceptor[sPlayer][sButton][2] = true
	end,
	LiftCommand=function(self)
		GHReceptor[sPlayer][sButton][2] = false
	end,
	Push..{
		FeverMessageCommand=function(self,params)
			if params.pn ~= sPlayer then return end
			if params.Active then
				self:glow(0,0,1,.8)
			else
				self:glow(1,1,1,0)
			end
		end
	},
}