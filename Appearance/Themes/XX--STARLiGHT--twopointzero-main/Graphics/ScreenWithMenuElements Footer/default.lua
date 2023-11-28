
local screen = Var "LoadingScreen"
local screenName = THEME:GetMetric(screen,"FooterText");

local out = Def.ActorFrame{
  InitCommand=function(s) s:xy(_screen.cx,SCREEN_BOTTOM+140):diffusealpha(0):zoom(0.7)  end,
  OnCommand = function(s)
		s:smooth(0.3):y(SCREEN_BOTTOM-68):diffusealpha(1):zoom(1)
	end,
	OffCommand = function(s)
		s:accelerate(0.3):y(SCREEN_BOTTOM+140):diffusealpha(0):zoom(0.7)
	end,
  Def.Sprite{
    Texture="base",
  };
  Def.Sprite{
    Texture="side glow",
    InitCommand=function(s) s:y(0) end,
    OnCommand=function(s) 
      if screen ~= "ScreenSelectProfilePrefs" then
        s:cropleft(0.5):cropright(0.5):sleep(0.3):decelerate(0.4):cropleft(0):cropright(0):sleep(0.5):queuecommand("Anim")
      end
    end,
    AnimCommand=function(s) s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.5")):effectperiod(2) end,
  };
  Def.ActorFrame{
    OnCommand=function(s) 
      if screen ~= "ScreenSelectProfilePrefs" then
        s:diffusealpha(0):sleep(0.3):decelerate(0.5):diffusealpha(1)
      end
    end,
    Def.Sprite{
      Texture="arrow",
      InitCommand=function(s) s:xy(1,-36) end,
      OnCommand=function(s) 
        if screen ~= "ScreenSelectProfilePrefs" then
          s:addy(100):sleep(0.25):decelerate(0.4):addy(-100)
        end
      end
    };
  };
};

if screenName then
	table.insert(out,Def.Sprite{
    Texture="text/"..screenName..".png",
		InitCommand=function(s) s:xy(0,26):diffusealpha(0) end,
    OnCommand=function(s)
      if screen ~= "ScreenSelectProfilePrefs" then
        s:diffusealpha(0):sleep(0.25):linear(0.05):diffusealpha(0.5)
        :linear(0.05):diffusealpha(0):linear(0.05):diffusealpha(1)
        :linear(0.05):diffusealpha(0):linear(0.05):diffusealpha(0.5)
        :decelerate(0.1):diffusealpha(1):sleep(0.1):queuecommand("Anim")
      else
        s:diffusealpha(1):queuecommand("Anim")
      end
    end,
    AnimCommand=function(s) s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.5")):effectperiod(0.4) end,
    OffCommand =function(s) 
      if screen ~= "ScreenSelectProfile" then
        s:linear(0.05):diffusealpha(0)
      end
    end
	})
end;



return out;
