local pn = ...

local function XPOS(self,offset)
    self:x(pn==PLAYER_1 and (SCREEN_LEFT+240)+offset or (SCREEN_RIGHT-240)+offset)
end

local yspacing = 46
local keyset = {0,0}

local function PlayerPanel()
    local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
    
    SetCommand=function(s)
        local c = s:GetChildren();
        local song = GAMESTATE:GetCurrentSong() or GAMESTATE:GetCurrentCourse()
        if song then
            local steps = GAMESTATE:GetCurrentSteps(pn) or GAMESTATE:GetCurrentTrail(pn)
            if steps then
                c.Bar_underlay:visible(true)
                scorelist = PROFILEMAN:GetProfile(pn):GetHighScoreList(song,steps)
                assert(scorelist)
                local scores = scorelist:GetHighScores()
                assert(scores)
                local topscore=0
                local temp=#scores
                if scores[1] then
                    if ThemePrefs.Get("ConvertScoresAndGrades") then
                        topscore = SN2Scoring.GetSN2ScoreFromHighScore(steps, scores[1])
                        topgrade = SN2Grading.ScoreToGrade(topscore,steps)
                    else
                        topscore = scores[1]:GetScore()
                        topgrade = scores[1]:GetGrade()
                    end
                    RStats = scores[1];
                end
                assert(topscore)
                if topscore ~= 0 then
                    local misses = RStats:GetTapNoteScore("TapNoteScore_Miss")+RStats:GetTapNoteScore("TapNoteScore_CheckpointMiss")
                    local boos = RStats:GetTapNoteScore("TapNoteScore_W5")
                    local goods = RStats:GetTapNoteScore("TapNoteScore_W4")
                    local greats = RStats:GetTapNoteScore("TapNoteScore_W3")
                    local perfects = RStats:GetTapNoteScore("TapNoteScore_W2")
                    local marvelous = RStats:GetTapNoteScore("TapNoteScore_W1")
                    c.Bar_underlay:diffuse(Color.White)
                    c.Img_place:visible(true)
                    c.Text_score:settext(commify(topscore))
                    if scores[1]:GetName() ~= nil then
                        c.Text_name:settext(PROFILEMAN:GetProfile(pn):GetDisplayName())
                    else
                        c.Text_Name:settext("STEP")
                    end
                    c.Bar_underlay:diffuse(PlayerColor(pn))
                    c.Img_grade:visible(true)
                    c.Img_grade:Load(THEME:GetPathG("myMusicWheel/GradeDisplayEval",ToEnumShortString(topgrade)))
                    if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                        if (greats+perfects) == 0 then
                          c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W1"])
                          :glowblink():effectperiod(0.20)
                        elseif greats == 0 then
                          c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W2"])
                          :glowshift()
                        elseif (misses+boos+goods) == 0 then
                          c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W3"])
                          :stopeffect()
                        elseif (misses+boos) == 0 then
                          c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W4"])
                          :stopeffect()
                        end;
                        c.Img_fc:diffusealpha(0.8);
                    else
                        c.Img_fc:visible(false)
                    end;
                    for i=1,temp do
                        if scores[i] then
                            topscore = scores[i];
                            assert(topscore)
                            c.Bar_judgments:diffusealpha(1)
                            c.Text_judgmenttitles:diffusealpha(1)
                            c.Text_judgments:settext(topscore:GetTapNoteScore("TapNoteScore_W1").."\n"
                            ..topscore:GetTapNoteScore("TapNoteScore_W2").."\n"
                            ..topscore:GetTapNoteScore("TapNoteScore_W3").."\n"
                            ..topscore:GetTapNoteScore("TapNoteScore_W4").."\n"
                            ..topscore:GetHoldNoteScore("HoldNoteScore_Held").."\n"
                            ..topscore:GetTapNoteScore("TapNoteScore_W5")+topscore:GetTapNoteScore("TapNoteScore_Miss")):diffusealpha(1)
                        else
                            c.Text_judgments:settext("0\n0\n0\n0\n0\n0"):diffusealpha(0.15)
                            c.Bar_judgments:diffusealpha(0.15)
                            c.Text_judgmenttitles:diffusealpha(0.15)
                        end;
                    end;
                else
                    c.Img_place:visible(false)
                    c.Bar_underlay:diffuse(color("#eaeaea"))
                    c.Text_score:settext("")
                    c.Text_name:settext("")
                    c.Img_grade:visible(false)
                    c.Img_fc:visible(false)
                    c.Text_judgments:settext("0\n0\n0\n0\n0\n0"):diffusealpha(0.15)
                    c.Bar_judgments:diffusealpha(0.15)
                    c.Text_judgmenttitles:diffusealpha(0.15)
                end
            end
        else
            c.Img_place:visible(false)
            c.Bar_underlay:diffuse(color("#eaeaea"))
            c.Text_score:settext("")
            c.Text_name:settext("")
            c.Img_grade:visible(false)
            c.Img_fc:visible(false)
            c.Text_judgments:settext("0\n0\n0\n0\n0\n0"):diffusealpha(0.15)
            c.Bar_judgments:diffusealpha(0.15)
            c.Text_judgmenttitles:diffusealpha(0.15)
        end
    end,
    Def.Quad{
        Name="Bar_underlay",
        InitCommand=function(s) s:y(-20):setsize(380,50):shadowlengthy(1.5):shadowcolor(color("#eaeaea")) end,
    };
    Def.Sprite{
        Texture=THEME:GetPathG("","_rival/_rival"),
        Name="Img_place",
        InitCommand=function(s) s:x(-160):y(-20):zoom(1.2):diffuse(color("#2e2e2e")):animate(false):setstate(0) end,
    };
    Def.BitmapText{
        Font="Common normal",
        Text=rival;
        Name="Text_place",
        InitCommand=function(s) s:addx(-180):y(-20):zoom(1.2):diffuse(Color.White) end,
    };
    Def.BitmapText{
        Font="Common normal",
        Text="";
        Name="Text_name",
        InitCommand=function(s) s:addx(-135):y(-20):halign(0):zoom(1.2):diffuse(color("#000000")) end,
    };
    Def.BitmapText{
        Font="Common normal",
        Text="";
        Name="Text_score",
        InitCommand=function(s) s:xy(140,-20):halign(1):zoom(1.2):diffuse(color("#000000")) end,
    };
    Def.Sprite{
        Texture=THEME:GetPathG("Player","Badge FullCombo"),
        Name="Img_fc",
        InitCommand=function(s) s:zoom(0.525):xy(175,-27.5) end,
    };
    Def.Sprite{
        Name="Img_grade",
        InitCommand=function(s) s:x(160):y(-20) end,
    };
    Def.Quad{
        Name="Bar_judgments",
        InitCommand=function(s) s:setsize(380,140):addy(80) end,
    };
    Def.BitmapText{
        Font="Common normal",
        Name="Text_judgmenttitles",
        InitCommand=function(s) s:zoom(0.9):diffuse(color("#000000")):halign(0):addx(-180):addy(80) end,
        OnCommand=function(s) s:settext("Marvelous\nPerfect\nGreat\nGood\nOK\nMiss") end,
    };
    Def.BitmapText{
        Font="Common normal",
        Name="Text_judgments";
        InitCommand=function(s) s:zoom(0.9):diffuse(color("#000000")):halign(1):addx(150):addy(80) end,
    };
}
return t
end

local function DifficultyPanel()
    local t = Def.ActorFrame{};
    for diff in ivalues(Difficulty) do
        t[#t+1] = Def.ActorFrame{
            InitCommand=function(s) s:y((Difficulty:Reverse()[diff] * yspacing)) end,
            SetCommand=function(s)
                local c = s:GetChildren()
                local song = GAMESTATE:GetCurrentSong() or GAMESTATE:GetCurrentCourse()
                local bHasStepsTypeAndDifficulty = false;
                local curDiff;
                local steps;
                if song then
                    local st = GAMESTATE:GetCurrentStyle():GetStepsType()
                    if not GAMESTATE:IsCourseMode() then
                        bHasStepsTypeAndDifficulty = song:HasStepsTypeAndDifficulty(st, diff)
                        steps = song:GetOneSteps(st,diff)
                    else
                        steps = GAMESTATE:GetCurrentTrail(pn)
                    end
                    if steps then
                        c.Bar_meter:diffuse(CustomDifficultyToColor(diff)):visible(true)
                        if not GAMESTATE:IsCourseMode() then
                            c.Text_meter:settext(steps:GetMeter()):visible(true)
                        end
                        c.Text_difficulty:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff))):visible(true)
                        local cursteps = GAMESTATE:GetCurrentSteps(pn) or GAMESTATE:GetCurrentTrail(player)
                        if steps:GetRadarValues(pn):GetValue('RadarCategory_Mines') ~= 0 then
                            c.Img_important:visible(true)
                        else
                            c.Img_important:visible(false)
                        end
                        if cursteps then
                            curDiff = cursteps:GetDifficulty(pn)
                            if ToEnumShortString(curDiff) == ToEnumShortString(diff) then
                                c.Bar_underlay:diffuse(CustomDifficultyToColor(diff))
                                c.Text_difficulty:diffuse(Color.White)
                            else
                                c.Bar_underlay:diffuse(Color.White)
                                c.Text_difficulty:diffuse(CustomDifficultyToColor(diff))
                            end
                        end
                        scorelist = PROFILEMAN:GetProfile(pn):GetHighScoreList(song,steps)
                        assert(scorelist)
                        local scores = scorelist:GetHighScores()
                        assert(scores)
                        local topscore=0
                        local temp=#scores
                        if scores[1] then
                            if ThemePrefs.Get("ConvertScoresAndGrades") then
                                topscore = SN2Scoring.GetSN2ScoreFromHighScore(steps, scores[1])
                                topgrade = SN2Grading.ScoreToGrade(topscore,steps)
                            else
                                topscore = scores[1]:GetScore()
                                topgrade = scores[1]:GetGrade()
                            end
                            RStats = scores[1];
                        end
                        assert(topscore)
                        if topscore ~= 0 then
                            local misses = RStats:GetTapNoteScore("TapNoteScore_Miss")+RStats:GetTapNoteScore("TapNoteScore_CheckpointMiss")
                            local boos = RStats:GetTapNoteScore("TapNoteScore_W5")
                            local goods = RStats:GetTapNoteScore("TapNoteScore_W4")
                            local greats = RStats:GetTapNoteScore("TapNoteScore_W3")
                            local perfects = RStats:GetTapNoteScore("TapNoteScore_W2")
                            local marvelous = RStats:GetTapNoteScore("TapNoteScore_W1")
                            c.Text_score:settext(commify(topscore))
                            c.Img_grade:visible(true)
                            c.Img_grade:Load(THEME:GetPathG("myMusicWheel/GradeDisplayEval",ToEnumShortString(topgrade)))
                            if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                                if (greats+perfects) == 0 then
                                  c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W1"])
                                  :glowblink():effectperiod(0.20)
                                elseif greats == 0 then
                                  c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W2"])
                                  :glowshift()
                                elseif (misses+boos+goods) == 0 then
                                  c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W3"])
                                  :stopeffect()
                                elseif (misses+boos) == 0 then
                                  c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W4"])
                                  :stopeffect()
                                end;
                                c.Img_fc:diffusealpha(0.8);
                            else
                                c.Img_fc:visible(false)
                            end;
                        else
                            c.Text_score:settext("")
                            c.Img_grade:visible(false)
                            c.Img_fc:visible(false)
                        end
                    else
                        c.Bar_underlay:diffuse(Color.White)
                        c.Bar_meter:visible(false)
                        c.Text_meter:settext("")  
                        c.Text_difficulty:settext("")
                        c.Img_important:visible(false)
                        c.Text_score:settext("")
                        c.Img_grade:visible(false) 
                        c.Img_fc:visible(false)
                    end
                else
                    c.Bar_underlay:diffuse(color("#ffffff"))
                    c.Bar_meter:visible(false)
                    c.Text_meter:settext("")
                    c.Text_difficulty:settext("")
                    c.Img_important:visible(false)
                    c.Text_score:settext("")
                    c.Img_grade:visible(false)
                    c.Img_fc:visible(false)
                end
            end;
            Def.ActorFrame{
                Name="Bar_underlay";
                Def.Quad{
                    InitCommand=function(s) s:setsize(380,42):faderight(0.75):diffusealpha(0.15) end,
                };
                Def.Quad{
                    InitCommand=function(s) s:y(-18):setsize(380,2):faderight(0.5):diffusealpha(0.15) end,
                };
            };
            Def.Quad{
                Name="Bar_meter",
                InitCommand=function(s) s:x(-166):setsize(42,42) end,
            };
            Def.BitmapText{
                Font="_avenirnext lt pro bold/25px",
                Name="Text_meter";
                InitCommand=function(s) s:x(-166):strokecolor(Alpha(Color.Black,0.5)) end,
            };
            Def.BitmapText{
                Font="_avenirnext lt pro bold/20px",
                Name="Text_difficulty",
                InitCommand=function(s) s:x(-130):halign(0):strokecolor(Alpha(Color.Black,0.5)) end,
            };
            Def.BitmapText{
                Name="Text_score",
                Font="_avenirnext lt pro bold/20px",
                InitCommand=function(s) s:x(140):halign(1):diffuse(Color.White):strokecolor(Color.Black) end,
            };
            Def.Sprite{
            Texture=THEME:GetPathG("Player","Badge FullCombo"),
                Name="Img_fc",
                InitCommand=function(s) s:zoom(0.35):xy(186,-5) end,
            };
            Def.Sprite{
                Name="Img_grade",
                InitCommand=function(s) s:x(166) end,
            };
            Def.Sprite{
                Name="Img_important",
                Texture="../_ShockArrow_mark "..ToEnumShortString(pn),
                InitCommand=function(s) s:y(-30):halign(0):zoom(0.3):diffuseshift()
                    :effectcolor1(Color.White):effectcolor2(Alpha(Color.White,0.5))
                    :effectclock('beatnooffset')
                end,
                OnCommand=function(s)
                    s:xy(pn==PLAYER_1 and 131 or -131,0):rotationy(180)
                end,
            }
        };
    end
    return t
end

local function RivalsPanel(rival)
    local t = Def.ActorFrame{};
    local rivals = {1,2,3,4,5}
    for rival in ivalues(rivals) do
        t[#t+1] = Def.ActorFrame{
            InitCommand=function(s) s:y((rivals[rival]*yspacing)-yspacing) end,
            SetCommand=function(s)
                local c = s:GetChildren();
                local song = GAMESTATE:GetCurrentSong()
                if song then
                    local steps = GAMESTATE:GetCurrentSteps(pn)
                    if steps then
                        c.Bar_underlay:visible(true)
                        if rival == 1 then
                            c.Bar_place:diffuse(color("#3cbbf6"))
                        elseif rival == 2 then
                            c.Bar_place:diffuse(color("#d6d7d4"))
                        elseif rival == 3 then
                            c.Bar_place:diffuse(color("#f6cc40"))
                        else
                            c.Bar_place:diffuse(color("#f22133"))
                        end
                    end
                    local profile = PROFILEMAN:GetMachineProfile();
                    scorelist = PROFILEMAN:GetMachineProfile():GetHighScoreList(song,steps)
                    local scores = scorelist:GetHighScores()
                    local topscore = 0
                    if scores[rival] then
                        if ThemePrefs.Get("ConvertScoresAndGrades") then
                            topscore = SN2Scoring.GetSN2ScoreFromHighScore(steps, scores[rival])
                            topgrade = SN2Grading.ScoreToGrade(topscore,steps)
                        else
                            topscore = scores[rival]:GetScore()
                            topgrade = scores[rival]:GetGrade()
                        end
                    end
                    RStats = scores[1];
                    if topscore ~= 0 then
                        local misses = RStats:GetTapNoteScore("TapNoteScore_Miss")+RStats:GetTapNoteScore("TapNoteScore_CheckpointMiss")
                        local boos = RStats:GetTapNoteScore("TapNoteScore_W5")
                        local goods = RStats:GetTapNoteScore("TapNoteScore_W4")
                        local greats = RStats:GetTapNoteScore("TapNoteScore_W3")
                        local perfects = RStats:GetTapNoteScore("TapNoteScore_W2")
                        local marvelous = RStats:GetTapNoteScore("TapNoteScore_W1")
                        c.Bar_underlay:diffuse(Color.White)
                        c.Text_score:settext(commify(topscore))
                        if scores[rival]:GetName() ~= nil then
                            if scores[rival]:GetName() == "" then
                                c.Text_name:settext("NO NAME")
                            else
                                c.Text_name:settext(scores[rival]:GetName())
                            end
                        else
                            c.Text_name:settext("STEP")
                        end
                        c.Img_grade:visible(true)
                        c.Img_grade:Load(THEME:GetPathG("myMusicWheel/GradeDisplayEval",ToEnumShortString(topgrade)))
                        if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                            if (greats+perfects) == 0 then
                                c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W1"])
                                :glowblink():effectperiod(0.20)
                            elseif greats == 0 then
                                c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W2"])
                                :glowshift()
                            elseif (misses+boos+goods) == 0 then
                                c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W3"])
                                :stopeffect()
                            elseif (misses+boos) == 0 then
                                c.Img_fc:visible(true):diffuse(GameColor.Judgment["JudgmentLine_W4"])
                                :stopeffect()
                            end;
                            c.Img_fc:diffusealpha(0.8);
                        else
                            c.Img_fc:visible(false)
                        end;
                    else
                        c.Bar_underlay:diffuse(color("#eaeaea"))
                        c.Text_score:settext("")
                        c.Text_name:settext("")
                        c.Img_grade:visible(false)
                        c.Img_fc:visible(false) 
                    end
                end
            end,
            Def.ActorFrame{
                Name="Bar_underlay";
                Def.Quad{
                    InitCommand=function(s) s:setsize(380,42):faderight(0.75):diffusealpha(0.15) end,
                };
                Def.Quad{
                    InitCommand=function(s) s:y(-18):setsize(380,2):faderight(0.5):diffusealpha(0.15) end,
                };
            };
            Def.Quad{
                Name="Bar_place",
                InitCommand=function(s) s:x(-166):setsize(42,42) end,
            };
            Def.BitmapText{
                Font="_avenirnext lt pro bold/25px",
                Name="Text_place";
                Text=rival;
                InitCommand=function(s) s:x(-166):strokecolor(Alpha(Color.Black,0.5)) end,
            };
            Def.BitmapText{
                Name="Text_name",
                Font="_avenirnext lt pro bold/20px",
                InitCommand=function(s) s:x(-130):halign(0):diffuse(Color.White):strokecolor(Color.Black) end,
            };
            Def.BitmapText{
                Name="Text_score",
                Font="_avenirnext lt pro bold/20px",
                InitCommand=function(s) s:x(140):halign(1):diffuse(Color.White):strokecolor(Color.Black) end,
            };
            Def.Sprite{
            Texture=THEME:GetPathG("Player","Badge FullCombo"),
                Name="Img_fc",
                InitCommand=function(s) s:zoom(0.35):xy(186,-5) end,
            };
            Def.Sprite{
                Name="Img_grade",
                InitCommand=function(s) s:x(166) end,
            };
        }
    end
    return t
end

local function RadarPanel()
    local GR = {
        {-1,-122, "Stream"}, --STREAM
        {-120,-43, "Voltage"}, --VOLTAGE
        {-108,72, "Air"}, --AIR
        {108,72, "Freeze"}, --FREEZE
        {120,-43, "Chaos"}, --CHAOS
    };
    local t = Def.ActorFrame{};
    t[#t+1] = Def.ActorFrame{
        Def.ActorFrame{
            Name="Radar",
            Def.Sprite{
                Texture=THEME:GetPathB("ScreenSelectMusic","overlay/RadarHandler/GrooveRadar base.png"),
            };
            Def.Sprite{
                Texture=THEME:GetPathB("ScreenSelectMusic","overlay/RadarHandler/sweep.png"),
                InitCommand = function(s) s:zoom(1.275):spin():effectmagnitude(0,0,100) end,
            };
            create_ddr_groove_radar("radar",0,0,pn,125,Alpha(PlayerColor(pn),0.25));
        };
    };
    for i,v in ipairs(GR) do
        t[#t+1] = Def.ActorFrame{
            InitCommand=function(s)
                s:xy(v[1],v[2])
            end;
            Def.Sprite{
                Texture=THEME:GetPathB("ScreenSelectMusic","overlay/RadarHandler/RLabels"),
                OnCommand=function(s) s:animate(0):setstate(i-1) end,
            };
            Def.BitmapText{
                Font="_avenirnext lt pro bold/20px";
                SetCommand=function(s)
                    local song = GAMESTATE:GetCurrentSong();
                    if song then
                        local steps = GAMESTATE:GetCurrentSteps(pn)
                        local value = lookup_ddr_radar_values(song, steps, pn)[i]
                        s:settext(math.floor(value*100+0.5))
                    else
                        s:settext("")
                    end
                    s:strokecolor(color("#1f1f1f")):y(28)
                end,
            };
        };
    end
    return t
end

local function PlayerInfo(pn)
    local t = Def.ActorFrame{};
    t[#t+1] = PlayerPanel()..{
        InitCommand=function(s) s:valign(1) end
    };
    return t
end

local function Scroller(pn)
    local t = Def.ActorFrame{};
    t[#t+1] = Def.ActorScroller{
        Name="ScrollerMain",
        NumItemsToDraw=1,
        SecondsPerItem=0.1,
        OnCommand=function(s)
            s:SetDestinationItem(0):SetFastCatchup(true)
            :SetMask(320,20):fov(60):zwrite(true):ztest(true)
            :draworder(8):z(8)
        end,
        TransformFunction=function(s,o,i,n)
            s:x(math.floor(o*(10))):diffusealpha(1-math.abs(o))
        end,
        CodeMessageCommand=function(s,p)
            local DI = s:GetCurrentItem();
            if p.PlayerNumber == PLAYER_1 and keyset[1] == 1 then
                if p.Name=="Left" then
                    if DI>0 then
                        s:SetDestinationItem(DI-1)
                        SOUND:PlayOnce(THEME:GetPathS("","MusicWheel expand"))
                    end
                end
                if p.Name=="Right" then
                    if DI<2 then
                        s:SetDestinationItem(DI+1)
                        SOUND:PlayOnce(THEME:GetPathS("","MusicWheel expand"))
                    end
                end
            elseif p.PlayerNumber == PLAYER_2 and keyset[2] == 1 then
                if p.Name=="Left" then
                    if DI>0 then
                        s:SetDestinationItem(DI-1)
                        SOUND:PlayOnce(THEME:GetPathS("","MusicWheel expand"))
                    end
                end
                if p.Name=="Right" then
                    if DI<2 then
                        s:SetDestinationItem(DI+1)
                        SOUND:PlayOnce(THEME:GetPathS("","MusicWheel expand"))
                    end
                end
            end
        end,
        Def.ActorFrame{
            Name="ScrollerItem1";
            DifficultyPanel()..{ InitCommand=function(s) s:y(-310) end,}
        };
        Def.ActorFrame{
            Name="ScrollerItem2";
            RadarPanel()..{
                InitCommand=function(s) s:y(-180) end,
            },
        };
        -- scores
	    Def.ActorFrame{
		    Name="ScrollerItem3";
		    RivalsPanel()..{
		        InitCommand=function(s) s:y(-310) end,
		    };
	};
    };
    return t
end

local t = Def.ActorFrame{
    InitCommand=function(s,p) XPOS(s,0) s:visible(false)
        if GAMESTATE:IsHumanPlayer(pn) then
            if pn == PLAYER_1 then
                set_ind = {PLAYER_1,PLAYER_2}
                key_ind = {keyset[1],keyset[2]};
            else
                set_ind = {PLAYER_2,PLAYER_1}
                key_ind = {keyset[2],keyset[1]};
            end
        end
    end,
    BeginCommand=function(s) s:playcommand("Set") end,
    OffCommand=function(s) s:sleep(0.5):decelerate(0.3):addx(pn==PLAYER_1 and -500 or 500) end,
    CurrentSongChangedMessageCommand=function(s,p) s:queuecommand("Set") end,
    CodeMessageCommand=function(s,p)
        if p.PlayerNumber == PLAYER_1 then
            if p.Name == "OpenPanes1" then
                keyset[1] = 1
                s:visible(true)
                SOUND:PlayOnce(THEME:GetPathS("MusicWheel","expand"))
            end
            if p.Name == "ClosePanes" then
                keyset[1] = 0
                s:visible(false)
                SOUND:PlayOnce(THEME:GetPathS("MusicWheel","expand"))
            end
        else
            if p.Name == "OpenPanes1" then
                keyset[2] = 1
                s:visible(true)
                SOUND:PlayOnce(THEME:GetPathS("MusicWheel","expand"))
            end
            if p.Name == "ClosePanes" then
                keyset[2] = 0
                s:visible(false)
                SOUND:PlayOnce(THEME:GetPathS("MusicWheel","expand"))
            end
        end
    end,
    ["CurrentSteps"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s,p) s:queuecommand("Set") end,
    ["CurrentTrail"..ToEnumShortString(pn).."ChangedMessageCommand"]=function(s,p) s:queuecommand("Set") end,
    Def.Quad{
        InitCommand=function(s) s:setsize(400,500):diffuse(color("#c3c3c3")):diffusealpha(0.7) end,
    };
    Def.ActorFrame{
        PlayerInfo(player)..{
            InitCommand=function(s) s:addy(90) end,
        };
        Scroller(player)..{
            InitCommand=function(s) s:addy(90) end,
        };
    }
};



return t;
