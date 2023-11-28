local Paused = false
-- Global variable because ???
-- Betting old themes use this variable a lot.
course_stopped_by_pause_menu = false
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
			screen:SetPrevScreenName('ScreenStageInformation'):begin_backing_out()
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
				course_stopped_by_pause_menu = true
				screen:PostScreenMessage('SM_LeaveGameplay', 0)
			end
		},
	}
end

local Selections = Def.ActorFrame{
	Name="Selections",
	InitCommand=function(self)
		-- As this process is starting, we'll already highlight the first option with the color.
		self:GetChild(1):diffuse(Color.Red)
	end
}

local function ChangeSel(self,offset)
	-- Do not allow cursor to move if we're not in the pause menu.
	if not Paused then return end

	CurSel = CurSel + offset
	if CurSel < 1 then CurSel = 1 end
	if CurSel > #Choices then CurSel = #Choices end
	
	for i = 1,#Choices do
		self:GetChild("Selections"):GetChild(i):diffuse( i == CurSel and Color.Red or Color.White )
	end
end

for i,v in ipairs(Choices) do
	Selections[#Selections+1] = Def.BitmapText{
		Name=i,
		Font="common normal",
		Text=THEME:GetString("PauseMenu", v.Name),
		OnCommand=function(self) self:y(-80+(40*i)):strokecolor(Color.Black) end
	}
end

return Def.ActorFrame{
	OnCommand=function(self)
		SCREENMAN:GetTopScreen():AddInputCallback(LoadModule("Lua.InputSystem.lua")(self))
		self:visible(false):Center()
	end,
	NonGameBackCommand=function(self)
		if not Paused then 
			SCREENMAN:GetTopScreen():PauseGame(true) 
			ChangeSel(self,0)
			self:visible(true)
		end
		Paused = true
	end,
	StartCommand=function(self)
		if Paused then 
			Choices[CurSel].Action( SCREENMAN:GetTopScreen() )
			self:visible(false) 
		end
		Paused = false
	end,
	MenuLeftCommand=function(self) if Paused then ChangeSel(self,-1) end end,
	MenuRightCommand=function(self) if Paused then ChangeSel(self,1) end end,
	MenuUpCommand=function(self) if Paused then ChangeSel(self,-1) end end,
	MenuDownCommand=function(self) if Paused then ChangeSel(self,1) end end,
	Selections
}