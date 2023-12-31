local iPN = ...;
assert(iPN,"[Graphics/PaneDisplay text.lua] No PlayerNumber Provided.");

local PaneItems = Def.ActorFrame{}
local DanceGames = {
	["dance"] = true,
	["pump"] = true,
	["techno"] = true,
	["para"] = true,
	["maniax"] = true,
	["ds3ddx"] = true,
	["stepstage"] = true,
	["ez2"] = true,
	["smx"] = true
}
local gm = GAMESTATE:GetCurrentGame():GetName()

local function GetRadarData( pnPlayer, rcRadarCategory )
	local tRadarValues;
	local StepsOrTrail;
	local fDesiredValue = 0;
	if GAMESTATE:GetCurrentSteps( pnPlayer ) then
		StepsOrTrail = GAMESTATE:GetCurrentSteps( pnPlayer );
		fDesiredValue = StepsOrTrail:GetRadarValues( pnPlayer ):GetValue( rcRadarCategory );
	elseif GAMESTATE:GetCurrentTrail( pnPlayer ) then
		StepsOrTrail = GAMESTATE:GetCurrentTrail( pnPlayer );
		fDesiredValue = StepsOrTrail:GetRadarValues( pnPlayer ):GetValue( rcRadarCategory );
	else
		StepsOrTrail = nil;
	end;
	return fDesiredValue;
end;

local function CreatePaneDisplayItem( _pnPlayer, _sLabel, _rcRadarCategory )
	return Def.ActorFrame {
		Def.BitmapText {
			Font="_Bold";
			Text=ToUpper(THEME:GetString("PaneDisplay",_sLabel) .. ":");
			InitCommand=function(self) self:horizalign(left) end;
			OnCommand=function(self) self:zoom(0.9):diffuse(color("0.9,0.9,0.9")):shadowlength(1) end;
		};
		Def.BitmapText {
			Font="_Medium";
			Text=string.format("%04i", 0);
			InitCommand=function(self) self:x(130):horizalign(right) end;
			OnCommand=function(self) self:zoom(0.9):shadowlength(1) end;
			CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if not song and not course then
					self:settextf("%i", 0);
				else
					self:settextf("%i", GetRadarData( _pnPlayer, _rcRadarCategory ) );
				end
			end;
		};
	};
end;

local function CreatePaneDisplayGraph( _pnPlayer, _sLabel, _rcRadarCategory )
	return Def.ActorFrame {
		Def.BitmapText {
			Font="_Medium";
			Text=_sLabel;
			InitCommand=function(self) self:horizalign(left) end;
			OnCommand=function(self) self:zoom(0.5):shadowlength(1) end;
		};
		Def.Quad { 
			InitCommand=function(self) self:x(12):zoomto(50,10):horizalign(left) end;
			OnCommand=function(self) self:diffuse(Color("Black")):shadowlength(1):diffusealpha(0.5) end;
		};
		Def.Quad {
			InitCommand=function(self) self:x(12):zoomto(50,10):horizalign(left) end;
			OnCommand=function(self) self:shadowlength(0):diffuse(Color("Green")):diffusebottomedge(ColorLightTone(Color("Green"))) end;
			CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if not song and not course then
					self:stoptweening();
					self:decelerate(0.2);
					self:zoomtowidth(0);
				else
					self:stoptweening();
					self:decelerate(0.2);
					self:zoomtowidth( clamp(GetRadarData( _pnPlayer, _rcRadarCategory ) * 50,0,50) );
				end
			end;
		};
		Def.BitmapText {
			Font="_Medium";
			InitCommand=function(self) self:x(14):zoom(0.5):halign(0) end;
			OnCommand=function(self) self:shadowlength(1):strokecolor(color("0.15,0.15,0.15,0.625")) end;
			CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentTrailP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
			CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end;
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if not song and not course then
					self:settext("")
				else
					self:settext("%i%%", GetRadarData( _pnPlayer, _rcRadarCategory ) * 100 );
				end
			end;
		};
	};
end;

--[[ Numbers ]]
if DanceGames[gm] == true then
	PaneItems[#PaneItems+1] = Def.ActorFrame {
		-- Left 
		CreatePaneDisplayItem( iPN, "Taps", 'RadarCategory_TapsAndHolds' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.4):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Jumps", 'RadarCategory_Jumps' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14+24) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.5):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Holds", 'RadarCategory_Holds' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14+24*2) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.6):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Mines", 'RadarCategory_Mines' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14+24*3) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.7):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		-- Center
		CreatePaneDisplayItem( iPN, "Hands", 'RadarCategory_Hands' ) .. {
			InitCommand=function(self) self:x(50):y(-14) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.4):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Rolls", 'RadarCategory_Rolls' ) .. {
			InitCommand=function(self) self:x(50):y(-14+24) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.5):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Lifts", 'RadarCategory_Lifts' ) .. {
			InitCommand=function(self) self:x(50):y(-14+24*2) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.6):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Fakes", 'RadarCategory_Fakes' ) .. {
			InitCommand=function(self) self:x(50):y(-14+24*3) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.7):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		}
	}
	else
	PaneItems[#PaneItems+1] = Def.ActorFrame {
		CreatePaneDisplayItem( iPN, "Notes", 'RadarCategory_TapsAndHolds' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.4):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Holds", 'RadarCategory_Holds' ) .. {
			InitCommand=function(self) self:x(50):y(-14) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.6):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
		CreatePaneDisplayItem( iPN, "Mines", 'RadarCategory_Mines' ) .. {
			InitCommand=function(self) self:x(-128+16+8):y(-14+24*1) end;
			OnCommand=function(self) self:zoomy(0.8):diffusealpha(0):sleep(0.7):linear(0.3):diffusealpha(1):zoomy(1) end;
			OffCommand=function(self) self:linear(0.1):diffusealpha(0):zoomy(0.8) end;
		},
	}
	end
	
return Def.ActorFrame {
	PaneItems
}
