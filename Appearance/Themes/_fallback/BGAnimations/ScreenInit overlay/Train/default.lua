local Sizestr = 0

local Carts = Def.ActorFrame{}
local Letters = Def.ActorFrame{}
local Christmas = Def.ActorFrame{
	OnCommand=function(self) self:xy(-SCREEN_CENTER_X,-SCREEN_CENTER_Y-180) end
}
local function Xmas()
	if MonthOfYear()+1 == 12 then return true end
	return false
end

if Xmas() then
	Christmas[#Christmas+1] = Def.Sprite {
		Name="Flake",
		Texture="snow 4x1.png",
		InitCommand=function(self) self:xy(0,-50) end,
		OnCommand=function(self) self:sleep(8):linear(1):diffusealpha(0) end
	}
	Christmas[#Christmas+1] = Def.Sound {
		File="Bells.ogg",
		OnCommand=function(self) self:play() end
	}
	for i = 1,500 do
		Christmas[#Christmas+1] = Def.ActorProxy {
			InitCommand=function(self)
				self:SetTarget(self:GetParent()
					:GetChild("Flake"))
					:wag()
					:effectoffset(math.random())
					:rotationz(180)
					:zoom(.5)
			end,
			OnCommand=function(self) 
				local randy = math.random(-200,SCREEN_HEIGHT)
				local randx = math.random(0,SCREEN_WIDTH)
				self:xy(randx,randy)
					:linear((SCREEN_HEIGHT-randy)/100)
					:y(SCREEN_HEIGHT)
					:queuecommand("Loop")
			end,
			LoopCommand=function(self) 
				local randx = math.random(0,SCREEN_WIDTH)
				self:xy(randx,0)
					:linear(10)
					:y(SCREEN_HEIGHT)
					:queuecommand("Loop")
			end,
			StopTweenMessageCommand=function(self)
				self:stoptweening()
			end
		}		
	end
end


for i = 1,2 do
    Carts[#Carts+1] = Def.ActorFrame {
        OnCommand=function(self) self:x(680):linear(10):x(-680) end,
        Def.Sprite {
            Texture="Cart.png",
            InitCommand=function(self) self:SetTextureFiltering(false):x(-240+58+(116*i)) end   
         }
    }
end

for i = 1,6 do
    Letters[#Letters+1] = Def.ActorFrame {
        OnCommand=function(self) self:x(680):linear(5):x(0) end,
        Def.Sprite {
            Texture=i..".png",
            InitCommand=function(self) 
                self:x(-100+Sizestr):halign(0):valign(1):y(5):SetTextureFiltering(false):zoom(0.1)
                Sizestr = Sizestr + (self:GetWidth()*0.1)
            end
        }
    }
end

return Def.ActorFrame {
    InitCommand=function(self)
        self:zoom(3)
    end,
    Def.Quad {
        InitCommand=function(self)
            self:FullScreen():diffuse(color("#d47984")):xy(0,-SCREEN_CENTER_Y/2)
        end
    },
    Def.Sprite {
        Texture="BG.png",
        InitCommand=function(self) self:SetTextureFiltering(false):y(-104):zoom(1.6) end
    },
    Def.Sprite {
        Texture=Xmas() and "Tree" or "Tower.png",
        InitCommand=function(self) self:SetTextureFiltering(false):y(-40) end
    },
    Carts,
    Def.ActorFrame {
        OnCommand=function(self) self:x(680):linear(10):x(-680) end,
        Def.Sprite {
            Texture="smoke 1x3.png",
            InitCommand=function(self) self:y(-16):SetTextureFiltering(false):SetAllStateDelays(0.125):x(-270) end
        },
        Def.Sprite {
            Texture="Train 1x12.png",
            InitCommand=function(self) self:y(-16):SetTextureFiltering(false):SetAllStateDelays(0.0625):x(-270) end
        },
        Def.Sprite {
            Texture="Coal.png",
            InitCommand=function(self) self:y(-16):SetTextureFiltering(false):x(-160) end
        },
        Def.Sound {
            File="Rail.ogg",
            OnCommand=function(self) self:play() end
        },
        Def.Sound {
            File="Train.ogg",
            OnCommand=function(self) self:play() end
        },
        Def.Sound {
            File="Horn.ogg",
            OnCommand=function(self) self:sleep(5):queuecommand("Play") end,
            PlayCommand=function(self) self:play() end
        }
    },
    Def.Quad {
        InitCommand=function(self)
            self:FullScreen():diffuse(0,0,0,0):xy(0,-SCREEN_CENTER_Y/2):sleep(8):linear(1):diffusealpha(1)
        end
    },
    Def.Sprite {
        Texture="Fox.png",
        InitCommand=function(self) self:SetTextureFiltering(false):y(-50):diffusealpha(0.25):valign(1) end,
        OnCommand=function(self) self:zoom(.05):sleep(8):linear(1):diffusealpha(1):zoom(.2) end
    },
	
	Letters,
	Christmas,
	Def.Quad {
		InitCommand=function(self)
				self:FullScreen():diffuse(0,0,0,1):xy(0,-SCREEN_CENTER_Y/2):linear(1):diffusealpha(0):sleep(9.2):linear(1):diffusealpha(1):queuecommand("Transfer")
		end,
		TransferCommand=function(self) 
			MESSAGEMAN:Broadcast("StopTween")
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		end
	}
}
