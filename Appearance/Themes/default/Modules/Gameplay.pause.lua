local Paused = false
local CurSel = 1

local Choices = {
	{
		Name = "continue_playing",
		Action = function( screen )
			screen:PauseGame(false)
		end
	},
	{
		Name = "restart_song",
		Action = function( screen )
			screen:SetPrevScreenName('ScreenLoadGameplayElements'):begin_backing_out()
		end
	},
	{
		Name = "forfeit_song",
		Action = function( screen )
			screen:SetPrevScreenName(SelectMusicOrCourse()):begin_backing_out()
		end
	},
}

if GAMESTATE:IsCourseMode() then
	Choices = {
		{
			Name = "continue_playing",
			Action = function( screen )
				screen:PauseGame(false)
			end
		},
		{
			Name = "skip_song",
			Action = function( screen )
				screen:PostScreenMessage('SM_NotesEnded', 0)
			end
		},
		{
			Name = "forfeit_course",
			Action = function( screen )
				screen:SetPrevScreenName(SelectMusicOrCourse()):begin_backing_out()
			end
		},
		{
			Name = "end_course",
			Action = function( screen )
				screen:PostScreenMessage('SM_LeaveGameplay', 0)
			end
		},
	}
end

local Selections = Def.ActorFrame{
	Name="Selections",
	InitCommand=function(self)
		-- As this process is starting, we'll already highlight the first option with the color.
		self:GetChild(1):playcommand("GainFocus")
	end
}

local function ChangeSel(self,offset)
	-- Do not allow cursor to move if we're not in the pause menu.
	if not Paused then return end

	CurSel = CurSel + offset
	if CurSel < 1 then CurSel = 1 end
	if CurSel > #Choices then CurSel = #Choices end
	
	for i = 1,#Choices do
		self:GetChild("Selections"):GetChild(i):playcommand( i == CurSel and "GainFocus" or "LoseFocus" )
	end
end

local ColorTable = LoadModule("Theme.Colors.lua")( LoadModule("Config.Load.lua")("SoundwavesSubTheme","Save/OutFoxPrefs.ini") )
local menu_item_height = 64
local menu_spacing= menu_item_height + 12
local menu_bg_width= SCREEN_WIDTH * .2
local menu_text_width= SCREEN_WIDTH * .35
local middlepoint = menu_item_height * #Choices
for i,v in ipairs(Choices) do
	Selections[#Selections+1] = Def.ActorFrame {
		Name=i,
		InitCommand=function(self)
			self:y( (- (middlepoint*.6) ) +((menu_item_height + 8)*i))
		end,
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(menu_bg_width,menu_item_height):diffuse( ColorTable["menuBlockBase"] )
			end
		},
		Def.ActorFrame {
			InitCommand= function(self) self:playcommand("LoseFocus") end,
			LoseFocusCommand= function(self) self:diffusealpha(0.2) end,
			GainFocusCommand= function(self) self:diffusealpha(0.8)	end,
			-- Fade BG
			Def.Quad {InitCommand=function(self) self:halign(1):faderight(0.9):zoomto(menu_bg_width/2,menu_item_height):diffuse( ColorTable["menuBlockGlow"] ) end,},
			Def.Quad {InitCommand=function(self) self:halign(0):fadeleft(0.9):zoomto(menu_bg_width/2,menu_item_height):diffuse( ColorTable["menuBlockGlow"] ) end,},
			-- Stripeys
			Def.Quad {InitCommand=function(self) self:y(menu_item_height/2):vertalign(bottom):zoomto(menu_bg_width,menu_item_height*0.11):diffuse(  ColorTable["menuBlockHighlightA"] ):diffuserightedge(  ColorTable["menuBlockHighlightB"] ):blend("Add") end,},
			Def.Quad {InitCommand=function(self) self:y(-(menu_item_height/2)):vertalign(top):zoomto(menu_bg_width,menu_item_height*0.11):diffuse(  ColorTable["menuBlockHighlightA"] ):diffuserightedge(  ColorTable["menuBlockHighlightB"] ):blend("Add") end,},
		},
		Def.BitmapText{
			Font="_Medium",
			Text=THEME:GetString("PauseMenu", v.Name),
			InitCommand= function(self)
				self:diffuse( ColorTable["menuTextGainFocus"] ):playcommand("LoseFocus")
			end,
			LoseFocusCommand= function(self) self:diffusealpha(0.5) end,
			GainFocusCommand= function(self) self:diffusealpha(1) end,
		}
	}
end

return Def.ActorFrame{
	OnCommand=function(self)
		SCREENMAN:GetTopScreen():AddInputCallback(LoadModule("Lua.InputSystem.lua")(self))
		self:visible(false):Center()
	end,
	CurrentSongChangedMessageCommand=function(self)
		SCREENMAN:GetTopScreen():PauseGame(false)
	end,
	NonGameBackCommand=function(self)
		if not Paused then 
			SCREENMAN:GetTopScreen():PauseGame(true)
			ChangeSel(self,0)
			MESSAGEMAN:Broadcast("PlayerHitPause", {pn = self.pn})
			self:visible(true)
			self:GetChild("Dim"):playcommand("ShowOrHide",{state="show"})
		end
		Paused = true
	end,
	StartCommand=function(self)
		if Paused then 
			Choices[CurSel].Action( SCREENMAN:GetTopScreen() )
			self:visible(false)
			self:GetChild("Dim"):playcommand("ShowOrHide",{state="hide"})
		end
		Paused = false
	end,
	MenuLeftCommand=function(self) if Paused then ChangeSel(self,-1) end end,
	MenuRightCommand=function(self) if Paused then ChangeSel(self,1) end end,
	MenuUpCommand=function(self) if Paused then ChangeSel(self,-1) end end,
	MenuDownCommand=function(self) if Paused then ChangeSel(self,1) end end,
	Def.Quad{
		Name="Dim",
		InitCommand=function(self)
			self:stretchto(SCREEN_WIDTH*-1,SCREEN_HEIGHT*-1,SCREEN_WIDTH,SCREEN_HEIGHT):diffuse( Color.Black ):diffusealpha(0)
		end,
		ShowOrHideCommand=function(self,param)
			self:stoptweening():linear(0.2):diffusealpha( param.state == "show" and 0.5 or 0 )
		end
	},
	Selections
}