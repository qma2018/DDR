return Def.ActorFrame{
  StorageDevicesChangedMessageCommand=function(self, params)
		MemCardInsert()
	end;
  loadfile(THEME:GetPathB("","_Dancer/default.lua"))()..{
    InitCommand = function(s) s:xy(_screen.cx-540,_screen.cy+30) end,
    OnCommand=function(s) s:diffusealpha(0):linear(0.3):diffusealpha(1) end,
  };
  loadfile(THEME:GetPathB("","_Logo/default.lua"))()..{
    InitCommand=function(s) s:Center():zoom(2):diffusealpha(0) end,
    OnCommand=function(s) s:decelerate(0.5):diffusealpha(1):zoom(1) end,
  };
  Def.Sprite{
    InitCommand=function(s)
      if MonthOfYear() == 4 and DayOfMonth() == 1 then
        s:Load(THEME:GetPathB("","_Logo/itglogo.png"))
      else
        s:Load(THEME:GetPathB("","_Logo/xxlogo.png"))
      end
      s:xy(_screen.cx+104,_screen.cy+16):blend(Blend.Add):diffusealpha(0)
    end,
    OnCommand=function(s) s:sleep(0.45):diffusealpha(1):linear(1):diffusealpha(0):zoom(1.5):sleep(0):zoom(1):queuecommand("Anim") end,
    AnimCommand=function(s) s:diffusealpha(0):sleep(1):linear(0.75):diffusealpha(0.3):sleep(0.1):linear(0.4):diffusealpha(0):queuecommand("Anim") end,
    OffCommand=function(s) s:stoptweening() end,
  };
  --[[Def.ActorFrame{
    Def.Quad{
      InitCommand = function(s) s:zoomto(80,504):xy(_screen.cx-562,_screen.cy+4):skewx(3):MaskSource(true) end,
      OnCommand = function(s) s:queuecommand("Animate") end,
      AnimateCommand = function(s) s:x(_screen.cx-562):linear(0.8):addx(1500):sleep(7):queuecommand("Animate") end,
    };
    LoadActor("xxlogo.png") .. {
    -- Using WriteOnFail here allows us to display only what is UNDER the
    -- mask instead of only what is NOT UNDER it.
    InitCommand = function(s) s:xy(_screen.cx+104,_screen.cy+16):MaskDest():ztestmode("ZTestMode_WriteOnFail") end,
    };
  };]]
  Def.Quad{
    InitCommand=function(s) s:FullScreen():diffuse(Alpha(Color.Black,0)) end,
    OnCommand=function(s) s:diffusealpha(0):sleep(20):linear(0.297):diffusealpha(1) end,
  };
  Def.Sprite{
    InitCommand=function(s) s:xy(_screen.cx,_screen.cy+340):diffuseshift():effectcolor1(Color.White):effectcolor2(color("#B4FF01")) end,
    BeginCommand=function(s) s:queuecommand("Set") end,
    OnCommand=function(s) s:diffusealpha(0):linear(0.2):diffusealpha(1) end,
    CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
    SetCommand=function(s)
      local coinmode = GAMESTATE:GetCoinMode()
      if coinmode == 'CoinMode_Free' then
      s:Load(THEME:GetPathB("","ScreenTitleJoin underlay/_press start"))
      else
      if GAMESTATE:EnoughCreditsToJoin() == true then
        s:Load(THEME:GetPathB("","ScreenTitleJoin underlay/_press start"))
      else
        s:Load(THEME:GetPathB("","ScreenTitleJoin underlay/_insert coin"))
      end
      end
    end
    };
    Def.ActorFrame{
      OnCommand=function(self)
        SCREENMAN:GetTopScreen():AddInputCallback(DDRInput(self))
        GAMESTATE:Reset()
      end,
      StartReleaseCommand=function(self)
        if GAMESTATE:EnoughCreditsToJoin() then
          GAMESTATE:JoinInput(self.pn)
          if GAMESTATE:GetCoinMode() ~= "CoinMode_Home" then
            SCREENMAN:GetTopScreen():SetNextScreenName(Branch.StartGame()):StartTransitioningScreen("SM_GoToNextScreen")
            self:queuecommand("Anim")
          else
            SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectMode"):StartTransitioningScreen("SM_GoToNextScreen")
          end
          SOUND:PlayOnce(THEME:GetPathS("","Common start"))
        end
      end;
      MenuRightCommand=function(s)
        SCREENMAN:GetTopScreen():SetNextScreenName("ScreenDemonstration"):StartTransitioningScreen("SM_GoToNextScreen")
        SCREENMAN:GetTopScreen():RemoveInputCallback(DDRInput(self))
      end,
      Def.Quad{
        InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
        AnimCommand=function(s) 
            s:linear(0.2):diffusealpha(1):sleep(1)
        end,
      },
    };
    Def.Actor{
      BeginCommand=function(s)
        s:queuecommand("Delay")
      end,
      DelayCommand=function(s) s:sleep(20):queuecommand("SetScreen") end,
      SetScreenCommand=function(s)
        SCREENMAN:GetTopScreen():SetNextScreenName("ScreenDemonstration"):StartTransitioningScreen("SM_GoToNextScreen")
        SCREENMAN:GetTopScreen():RemoveInputCallback(DDRInput(self))
      end,
    };
};
