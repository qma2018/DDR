local t = Def.ActorFrame{};

t[#t+1] = Def.ActorScroller{
  NumItemsToDraw=15,
  SecondsPerItem=0.4,
  TransformFunction=function(self,offset,itemIndex,numItems)
		self:y(-240*offset)
	end;

  Def.ActorFrame{
    LoadActor("logo/1st.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(1):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    }
  };
  Def.ActorFrame{
    LoadActor("logo/2nd.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(1.4):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/3rd.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(1.8):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/4th.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(2.2):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/5th.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(2.6):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/MAX.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(3):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/MAX2.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(3.4):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/8th.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(3.8):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/SN1.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(4.2):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/SN2.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(4.6):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/X.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(5):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/X2.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(5.4):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/X3.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(5.8):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/2013.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(6.2):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/A.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(6.6):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.2):diffusealpha(0)
      end;
    };
  };
  Def.ActorFrame{
    LoadActor("logo/new.png")..{
      OnCommand=function(self)
        self:zoom(0.75):diffusealpha(0):addx(-300)
        self:sleep(7):linear(0.2):diffusealpha(1):addx(300):sleep(2):linear(0.4):zoom(100):addx(660)
      end;
    };
  };

  InitCommand=cmd(xy,SCREEN_LEFT+300,SCREEN_CENTER_Y-600),
  OnCommand=cmd(sleep,1;queuecommand,"Scroll");
  ScrollCommand=cmd(scrollwithpadding,0,2);
};

return t;
