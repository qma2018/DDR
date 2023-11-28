function OptionNameString(str)
	return THEME:GetString('OptionNames',str)
end

function Actor:PlayerFade(pn, val)
	assert(pn)
	if pn == PLAYER_1 then self:diffuseleftedge(val or Color.Black) return self end
	if pn == PLAYER_2 then self:diffuserightedge(val or Color.Black) return self end
end

function GameState:BothPlayersEnabled()
	return GAMESTATE:IsPlayerEnabled(PLAYER_1) and GAMESTATE:IsPlayerEnabled(PLAYER_2)
end

local ColorTable = LoadModule("Theme.Colors.lua")( LoadModule("Config.Load.lua")("SoundwavesSubTheme","Save/OutFoxPrefs.ini") )

GameColor = {
    PlayerColors = {
        PLAYER_1 = color("#C85D49"),
        PLAYER_2 = color("#2F97CF"),
		both = color("#FFFFFF"),
    },
    PlayerDarkColors = {
        PLAYER_1 = color("#843122"),
        PLAYER_2 = color("#20568c"),
		both = color("#F5E1E1"),
    },
	PlayerCompColors = {
        PLAYER_1 = color("#C787B9"),
        PLAYER_2 = color("#53D484"),
		both = color("#F5E1E1"),
    },
    Difficulty = {
        --[[ These are for 'Custom' Difficulty Ranks. It can be very  useful
        in some cases, especially to apply new colors for stuff you
        couldn't before. (huh? -aj) ]]
        Beginner    = ColorTable["difficultyBeginner"],
        Easy        = ColorTable["difficultyEasy"],
        Medium      = ColorTable["difficultyMedium"],
        Hard        = ColorTable["difficultyHard"],
        Challenge   = ColorTable["difficultyChallenge"],
        Edit        = ColorTable["difficultyEdit"],
		D7			= color("0.8,0.8,0.8,1"),	-- TODO
		D8			= color("0.8,0.8,0.8,1"),	-- TODO
		D9			= color("0.8,0.8,0.8,1"),	-- TODO
		D10			= color("0.8,0.8,0.8,1"),	-- TODO
		D11			= color("0.8,0.8,0.8,1"),	-- TODO
		D12			= color("0.8,0.8,0.8,1"),	-- TODO
		D13			= color("0.8,0.8,0.8,1"),	-- TODO
		D14			= color("0.8,0.8,0.8,1"),	-- TODO
		D15			= color("0.8,0.8,0.8,1"),	-- TODO
        Couple      = ColorTable["difficultyCouple"],
        Routine     = ColorTable["difficultyRoutine"],
        --[[ These are for courses, so let's slap them here in case someone
        wanted to use Difficulty in Course and Step regions. ]]
        Difficulty_Beginner = ColorTable["difficultyBeginner"],
        Difficulty_Easy     = ColorTable["difficultyEasy"],
        Difficulty_Medium   = ColorTable["difficultyMedium"],
        Difficulty_Hard     = ColorTable["difficultyHard"],
        Difficulty_Challenge    = ColorTable["difficultyChallenge"],
		Difficulty_D7			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D8			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D9			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D10			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D11			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D12			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D13			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D14			= color("0.8,0.8,0.8,1"),	-- TODO
		Difficulty_D15			= color("0.8,0.8,0.8,1"),	-- TODO
        Difficulty_Edit     = ColorTable["difficultyEdit"],
        Difficulty_Couple   = ColorTable["difficultyCouple"],
        Difficulty_Routine  = ColorTable["difficultyRoutine"]
    },
    Stage = {
        Stage_1st   = color("#6C94D7"),
        Stage_2nd   = color("#6C94D7"),
        Stage_3rd   = color("#6C94D7"),
        Stage_4th   = color("#6C94D7"),
        Stage_5th   = color("#6C94D7"),
        Stage_6th   = color("#6C94D7"),
        Stage_Next  = color("#6C94D7"),
        Stage_Final = color("#00AEFF"),
        Stage_Extra1    = color("#FF8000"),
        Stage_Extra2    = color("#FF2300"),
        Stage_Nonstop   = color("#934BDD"),
        Stage_Oni   = color("#934BDD"),
        Stage_Endless   = color("#934BDD"),
        Stage_Event = color("#6C94D7"),
        Stage_Demo  = color("#6C94D7")
    },
    Judgment = {
        JudgmentLine_ProW1     = color("#FFFFFF"),
        JudgmentLine_ProW2     = color("#AEEDF3"),
        JudgmentLine_ProW3     = color("#71DDE8"),
        JudgmentLine_ProW4     = color("#A0DBF1"),
        JudgmentLine_ProW5     = color("#7EC2D7"),
        JudgmentLine_W1     = color("#A0DBF1"),
        JudgmentLine_W2     = color("#F1E4A2"),
        JudgmentLine_W3     = color("#ABE39B"),
        JudgmentLine_W4     = color("#86ACD6"),
        JudgmentLine_W5     = color("#958CD6"),
        JudgmentLine_Held   = color("#FFFFFF"),
        JudgmentLine_Miss   = color("#F97E7E"),
        JudgmentLine_MaxCombo   = color("#f0dc9f")
	}
}

function PlayerCompColor( pn )
	local pn_to_color_name= {[PLAYER_1]= "PLAYER_1", [PLAYER_2]= "PLAYER_2"}
	if not GameColor or not GameColor.PlayerCompColors then
		return default_color
	end
	return GameColor.PlayerCompColors[pn_to_color_name[pn]] or default_color
end

GameColor.Difficulty["Crazy"]       = GameColor.Difficulty["Hard"]
GameColor.Difficulty["Freestyle"]   = GameColor.Difficulty["Easy"]
GameColor.Difficulty["Nightmare"]   = GameColor.Difficulty["Challenge"]
GameColor.Difficulty["HalfDouble"]  = GameColor.Difficulty["Medium"]


LoadModule("Row.Prefs.lua")(LoadModule("Options.Prefs.lua"))

function thified_curstage_index(on_eval)
	local numbered_stages= {
		Stage_1st= true,
		Stage_2nd= true,
		Stage_3rd= true,
		Stage_4th= true,
		Stage_5th= true,
		Stage_6th= true,
		Stage_Next= true
	}
	local cur_stage= GAMESTATE:GetCurrentStage()
	local adjust= 1
	-- hack: ScreenEvaluation shows the current stage, but it needs to show
	-- the last stage instead.  Adjust the amount.
	if on_eval then
		adjust= 0
	end
	if numbered_stages[cur_stage] then
		return FormatNumberAndSuffix(GAMESTATE:GetCurrentStageIndex() + adjust)
	else
		return ToEnumShortString(cur_stage)
	end
end

Branch.AfterTitleMenu = function()
	return Branch.StartGame()
end

Branch.AfterSelectMusic = function()
	if SCREENMAN:GetTopScreen():GetGoToOptions() then
		return SelectFirstOptionsScreen()
	else
		return "ScreenLoadGameplayElements"
	end
end

Branch.PlayerOptions = function()
	local pm = GAMESTATE:GetPlayMode()
	local restricted = { PlayMode_Oni= true, PlayMode_Rave= true,
		--"PlayMode_Battle" -- ??
	}
	local optionsScreen = "ScreenPlayerOptions"
	if restricted[pm] then
		optionsScreen = "ScreenPlayerOptionsRestricted"
	end
	if SCREENMAN:GetTopScreen():GetGoToOptions() then
		return optionsScreen
	else
		return "ScreenLoadGameplayElements"
	end
end

Branch.SongOptions = function()
	if SCREENMAN:GetTopScreen():GetGoToOptions() then
		return "ScreenSongOptions"
	else
		return "ScreenLoadGameplayElements"
	end
end

Branch.AfterSelectProfile = function()
	if getenv("StartFitness") == true then
		return "ScreenFitnessOptions"
	end
	if ( THEME:GetMetric("Common","AutoSetStyle") == true ) then
		-- use SelectStyle in online...
		-- If we're on kbx, skip, as we don't need this.
		if IsGame("kbx") then
			return "ScreenSelectPlayMode"
		end
		return IsNetConnected() and "ScreenSelectStyle" or "ScreenSelectPlayMode"
	else
		return "ScreenSelectStyle"
	end
end

function check_stop_course_early()
	return course_stopped_by_pause_menu
end

function IsWidescreen()
	return SCREEN_WIDTH > 1150
end

function SPOChoices( itemSet )
	local TimingMode = GAMESTATE:GetCurrentGame():GetName() ~= "para" and "Timing," or ""
	local GHMode = GAMESTATE:GetCurrentGame():GetName() == "gh" and "GH," or ""
	local GDDMMode = GAMESTATE:GetCurrentGame():GetName() == "gddm" and "GDDM," or ""

	-- Only GH for now.
	local Backplates = GAMESTATE:GetCurrentGame():GetName() == "gh" and "BackPlates," or ""

	local Items = {
		["Main"] = "SPM,SPV,NS,14,Mini,SF,FilterColor,".. TimingMode .."Judg,"..Backplates.."13,LuaRate,LuaHaste,LuaSoundEffect,"..GDDMMode.."18",
		["Special"] = "RotateFieldX,RotateFieldZ,MC,MCD,MCB,DLW,JudgImg,Combo,Toasty,ToastDraw,SP,OVG,OB,12",
		["Effects"] = "2,3A,3B,4,5,6,7,9,R1,"..GHMode.."10,11"
	}
	
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
		Items["Main"] = Items["Main"] .. ",P1_16"
	end
	
	if GAMESTATE:IsHumanPlayer(PLAYER_2) then
		Items["Main"] = Items["Main"] .. ",P2_16"
	end

	if LoadModule("Characters.AnyoneHasChar.lua")() then
		Items["Main"] = Items["Main"] .. ",St"
	end

	return Items[itemSet] .. ",PNScr"
end

function PlayerOptionsDefineNextScreen()
	if GAMESTATE:Env()["PlayerOptionsNextScreen"] then
		return GAMESTATE:Env()["PlayerOptionsNextScreen"]
	end
	return Branch.SongOptions()
end

function ExtraColorPreference()
	local Modes = {
		dance = 10,
		pump = 21,
		['be-mu'] = 12,
		kb7 = 10,
		para = 10,
		techno = 10,
		lights = 10, -- lights shouldn't be playable
		kickbox= 100, -- extra color is lame
	}
	local ret = {
		["old"] = 10,
		["X"] = 15,
		["pump"] = 21,
	}
	if ret[LoadModule("Config.Load.lua")("PreferredMeter","Save/OutFoxPrefs.ini")] == "old" then 
		return Modes[CurGameName()] or 10
	else
		return ret[LoadModule("Config.Load.lua")("PreferredMeter","Save/OutFoxPrefs.ini")]
	end
end

function ArtistSetConversion(self)
	local Title=self:GetChild("Title");
	local Subtitle=self:GetChild("Subtitle");
	local Artist=self:GetChild("Artist");
	if Subtitle:GetText() == "" then
		Title:zoom(1.25):maxwidth(260):xy(-190,-6)
		Subtitle:visible(false)
		Artist:visible(false)
	else
		Title:zoom(1.25):maxwidth(260):xy(-190,-16)
		Subtitle:visible(true):zoom(0.8):maxwidth(516*0.8):xy(-190,14-3)
		Artist:visible(false)
	end
end

-- It's the same as the function above, but for courses.
function CourseSetConversion(self)
	local Title=self:GetChild("Title");
	local Subtitle=self:GetChild("Subtitle");
	local Artist=self:GetChild("Artist");
	if Subtitle:GetText() == "" then
		Title:zoom(1):maxwidth(SCREEN_WIDTH*0.5625):xy(-280,0)
		Subtitle:visible(false)
		Artist:visible(false)
	else
		Title:zoom(1):maxwidth(SCREEN_WIDTH*0.5625):xy(-280,-12)
		Subtitle:visible(true):zoom(0.75):maxwidth(SCREEN_WIDTH*0.8203125):xy(-280,14)
		Artist:visible(false)
	end
end
