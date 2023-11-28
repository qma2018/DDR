local xPosPlayer = {
    P1 = SCREEN_LEFT+16,
    P2 = SCREEN_RIGHT-16
}

local midimage = "mid.png"
local midglowimage = "midglow.png"

if GAMESTATE:IsAnExtraStage() then
	midimage = "midextra.png"
	midglowimage = "midglowextra.png"
end

local yval = SCREEN_BOTTOM-60;

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(s)
		if GAMESTATE:IsDemonstration() then
			s:visible(false)
		else
			s:visible(true)
		end
	end,
	Def.ActorFrame{
		InitCommand=function(s) s:xy(_screen.cx,yval+6) end,
		Def.Sprite{ Texture=midimage, },
		Def.Sprite{ Texture=midglowimage,
			OnCommand=function(s)
				s:diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.5")):effectclock('beatnooffset')
			end
		},
	},
	Def.TextBanner{
		InitCommand = function(self) self:Load("TextBannerGameplay")
	  		:x(SCREEN_CENTER_X):y(yval+6):zoom(1.1)
	  		if GAMESTATE:GetCurrentSong() then
				self:SetFromSong(GAMESTATE:GetCurrentSong())
	  		end
		end;
		CurrentSongChangedMessageCommand = function(self)
	  		self:SetFromSong(GAMESTATE:GetCurrentSong())
		end;
	},
};

--ScoreFrames
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1]=Def.ActorFrame{
	InitCommand=function(self)
		local short = ToEnumShortString(pn)
		self:x(xPosPlayer[short])
		self:halign(pn=="PlayerNumber_P2" and 1 or 0)
	end,
	Def.Sprite{
		Texture="frame",
		InitCommand=function(s) s:zoomx(pn=="PlayerNumber_P2" and -1 or 1):halign(0):y(yval) end,
	};
	Def.ActorFrame{
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
				self:y(SCREEN_TOP+134);
				self:x(0)
			else
				self:y(yval-50);
				self:x(pn==PLAYER_2 and 21 or 0)
			end;
		end;
		Def.Sprite{
			Texture="diffframe",
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
					self:zoomy(-1)
				else
					self:zoomy(1)
				end;
				self:halign(pn==PLAYER_2 and 1 or 0)
			end;
		};
		Def.ActorFrame{
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
					self:y(-4)
				else
					self:y(6)
				end;
			end;
			Def.ActorFrame{
				InitCommand=function(self)
					local steps;
					if GAMESTATE:IsCourseMode() then
						steps = ToEnumShortString(GAMESTATE:GetCurrentTrail(pn):GetDifficulty());
					else
						steps = ToEnumShortString(GAMESTATE:GetCurrentSteps(pn):GetDifficulty());
					end
					local diffP1X = {
						["Beginner"] = 176,
						["Easy"] = 156,
						["Medium"] = 176,
						["Hard"] = 160,
						["Challenge"] = 176,
						["Edit"] = 156,
					};
					local diffP2X = {
						["Beginner"] = -352,
						["Easy"] = -368,
						["Medium"] = -352,
						["Hard"] = -364,
						["Challenge"] = -352,
						["Edit"] = -136,
					};
					self:x(pn==PLAYER_2 and diffP2X[steps] or diffP1X[steps])
				end;
				Def.BitmapText{
					Font="_avenirnext lt pro bold/20px",
					Name="Difficulty Label";
					SetCommand=function(s)
						s:halign(1)
						local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
						s:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff))):uppercase(true):diffuse(CustomDifficultyToColor(diff))
					end;
					CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
				};
				Def.BitmapText{
					Font="_avenirnext lt pro bold/20px",
					Name = "Difficulty Meter";
					InitCommand=function(self)
						self:x(16)
					end;
					SetCommand=function(s)
						  local meter = GAMESTATE:GetCurrentSteps(pn):GetMeter()
						s:settext(meter)
					end;
					CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
				};
			};
			Def.BitmapText{
				Font="_avenirnext lt pro bold/20px",
				Name = "Profile Name";
				InitCommand=function(self)
					self:x(pn==PLAYER_2 and -170 or 360):playcommand("Set")
				end;
				SetCommand=function(s)
					s:maxwidth(150);
					if PROFILEMAN:IsPersistentProfile(pn) then
						s:settext(PROFILEMAN:GetProfile(pn):GetDisplayName())
					else
						s:settext(pn=='PlayerNumber_P2' and "PLAYER 2" or "PLAYER 1")
					end;
				end;
				CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
			};
		};
	};
};


t[#t+1] = loadfile(THEME:GetPathG("ScreenGameplay","ScoreFrame/score_counter/default.lua"))(pn);

end;

return t;
