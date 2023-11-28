collectgarbage();

local TimeFiles = {}

if Hour() > 20 or Hour() < 8 then
    --Night
    TimeFiles[1] = "Cricket.ogg"
    TimeFiles[2] = color("0,0,0,1")
else
    --Day 
    TimeFiles[1] = "Bird.ogg"
    TimeFiles[2] = color("1,1,1,1")
end

local Letters = Def.ActorFrame{}
local Sizestr = 0

for i = 1,6 do
    Letters[#Letters+1] = Def.Sprite{
        Texture=i..".png",
        InitCommand=function(self) 
            self:x(-90+Sizestr):halign(0):valign(1):y(30):zoom(1/12)
            Sizestr = Sizestr + (self:GetWidth()/12) + 2
        end,
        OnCommand=function(self)
            self:sleep(1.5+((.8*i)-(.06*(i*i)))):linear(0.25):zoomy(1.5/12):y(-5):bounceend(0.125):zoomy(1/12):y(0)
        end
    }
end

return Def.ActorFrame {
    InitCommand=function(self)
        self:zoom(3)
    end,
    Def.Quad {
        InitCommand=function(self)
            self:FullScreen():diffuse(TimeFiles[2]):xy(0,-SCREEN_CENTER_Y/2)
        end
    },
    Def.ActorFrame{
        InitCommand=function(self) self:y(-290) end,
        OnCommand=function(self) 
            self:accelerate(2.2):y(-10) -- O
                :decelerate(.3):y(-50)
                :accelerate(.3):y(-10) -- U
                :decelerate(.25):y(-50)
                :accelerate(.25):y(-10) -- T
                :decelerate(.2):y(-50)
                :accelerate(.2):y(-10) -- F
                :decelerate(.15):y(-50)
                :accelerate(.15):y(-10) -- O
                :decelerate(.1):y(-50)
                :accelerate(.1):y(-10) -- X
                :decelerate(.6):y(-160)
                :accelerate(.6):y(-90)
        end,
        Def.Sprite{
            Texture="Fox.png",   
            InitCommand=function(self) self:zoom(1/42):x(-410) end,
            OnCommand=function(self) 
                self:decelerate(2.2):x(-80) -- O
                    :accelerate(.3):x(-65)
                    :decelerate(.3):x(-50) -- U
                    :accelerate(.25):x(-35)
                    :decelerate(.25):x(-20) -- T
                    :accelerate(.2):x(-5)
                    :decelerate(.2):x(10) -- F
                    :accelerate(.15):x(25)
                    :decelerate(.15):x(40) -- O
                    :accelerate(.1):x(55)
                    :decelerate(.1):x(70) -- X
                    :accelerate(.6):x(30)
                    :decelerate(.6):x(0)
                    :sleep(0):linear(1):zoom(1/6):rotationz(360*2)
            end
        },
        Def.Sound{
            File="Grass.ogg",
            OnCommand=function(self)
                self:sleep(2.2):queuecommand("Play")
                    :sleep(.6):queuecommand("Play")
                    :sleep(.5):queuecommand("Play")
                    :sleep(.4):queuecommand("Play")
                    :sleep(.3):queuecommand("Play")
                    :sleep(.2):queuecommand("Play")
            end,
            PlayCommand=function(self) self:play() end        
        },
        Def.Sound{
            File=TimeFiles[1],
            OnCommand=function(self)
                self:sleep(4.6):queuecommand("Play")
            end,
            PlayCommand=function(self) self:play() end        
        }
    },
	
	Letters,
	
	Def.Quad {
		InitCommand=function(self)
			self:FullScreen():diffuse(TimeFiles[2]):x(0):fadetop(.005)
		end
	},
	
	Def.Quad {
		InitCommand=function(self)
			self:FullScreen():diffuse(0,0,0,1):xy(0,-SCREEN_CENTER_Y/2):linear(1):diffusealpha(0):sleep(6.6):linear(1):diffusealpha(1):sleep(1):queuecommand("Transfer")
		end,
		TransferCommand=function(self) 
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen");
		end
	}
}
