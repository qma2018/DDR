TimingWindow = {}

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Original",
		Timings= {
			['TapNoteScore_W1']=0.0225,
			['TapNoteScore_W2']=0.0450,
			['TapNoteScore_W3']=0.0900,
			['TapNoteScore_W4']=0.1350,
			['TapNoteScore_W5']=0.1800,
			['TapNoteScore_HitMine']=0.0900,
			['TapNoteScore_Attack']=0.1350,
			['TapNoteScore_Hold']=0.2500,
			['TapNoteScore_Roll']=0.5000,
			['TapNoteScore_Checkpoint']=0.1664,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Advanced",
		Timings= {
			['TapNoteScore_ProW1']=0.000703125,
			['TapNoteScore_ProW2']=0.00140625,
			['TapNoteScore_ProW3']=0.0028125,
			['TapNoteScore_ProW4']=0.005625,
			['TapNoteScore_ProW5']=0.01125,
			['TapNoteScore_W1']=0.0225,
			['TapNoteScore_W2']=0.0450,
			['TapNoteScore_W3']=0.0900,
			['TapNoteScore_W4']=0.1350,
			['TapNoteScore_W5']=0.1800,
			['TapNoteScore_HitMine']=0.0900,
			['TapNoteScore_Attack']=0.1350,
			['TapNoteScore_Hold']=0.2500,
			['TapNoteScore_Roll']=0.5000,
			['TapNoteScore_Checkpoint']=0.1664,
		},
		Scoring = {
			["TapNoteScore_W1"] = 10,
			["TapNoteScore_W2"] = GAMESTATE:ShowW1() and 9 or 10,
			["TapNoteScore_W3"] = 5,
			["TapNoteScore_ProW1"] = 20,
			["TapNoteScore_ProW2"] = 18,
			["TapNoteScore_ProW3"] = 16,
			["TapNoteScore_ProW4"] = 14,
			["TapNoteScore_ProW5"] = 12,
			["TapNoteScore_MaxScore"] = 20,
		},
		Percent = {
			["TapNoteScore_W1"] = 10,
			["TapNoteScore_W2"] = GAMESTATE:ShowW1() and 9 or 10,
			["TapNoteScore_W3"] = 5,
			["TapNoteScore_ProW1"] = 20,
			["TapNoteScore_ProW2"] = 18,
			["TapNoteScore_ProW3"] = 16,
			["TapNoteScore_ProW4"] = 14,
			["TapNoteScore_ProW5"] = 12,
			["TapNoteScore_MaxScore"] = 20,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "ITG",
		Timings= {
			['TapNoteScore_W1']=0.023000,
			['TapNoteScore_W2']=0.044500,
			['TapNoteScore_W3']=0.103500,
			['TapNoteScore_W4']=0.136500,
			['TapNoteScore_W5']=0.181200,
			['TapNoteScore_HitMine']=0.070000,
			['TapNoteScore_Attack']=0.131500,
			['TapNoteScore_Hold']=0.321500,
			['TapNoteScore_Roll']=0.351500,
			['TapNoteScore_Checkpoint']=0.1679, -- without this holds will never drop.
		},
		Shared = {
			--Others not used here will be taken from a fallback value.
			["TapNoteScore_W1"] = 5,
			["TapNoteScore_W2"] = GAMESTATE:ShowW1() and 4 or 5,
			["TapNoteScore_W3"] = 2,
			["TapNoteScore_W4"] = 0,
			["TapNoteScore_W5"] = -6,
			["TapNoteScore_Miss"] = -12,
			["HoldNoteScore_LetGo"] = 0,
			["HoldNoteScore_Held"] = 5,
			["TapNoteScore_HitMine"] = -6,
			["TapNoteScore_MaxScore"] = 5
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "ITG Advanced",
		Timings = {
			['TapNoteScore_ProW1']=0.000671875,
			['TapNoteScore_ProW2']=0.00134375,
			['TapNoteScore_ProW3']=0.00226875,
			['TapNoteScore_ProW4']=0.005375,
			['TapNoteScore_ProW5']=0.01075,
			['TapNoteScore_W1']=0.023000,
			['TapNoteScore_W2']=0.044500,
			['TapNoteScore_W3']=0.103500,
			['TapNoteScore_W4']=0.136500,
			['TapNoteScore_W5']=0.181200,
			['TapNoteScore_HitMine']=0.070000,
			['TapNoteScore_Attack']=0.131500,
			['TapNoteScore_Hold']=0.321500,
			['TapNoteScore_Roll']=0.351500,
			['TapNoteScore_Checkpoint']=0.1679, -- without this holds will never drop.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "FAPlus",
		Timings = {
			["TapNoteScore_ProW5"]=0.014000,
			['TapNoteScore_W1']=0.023000,
			['TapNoteScore_W2']=0.044500,
			['TapNoteScore_W3']=0.103500,
			['TapNoteScore_W4']=0.136500,
			['TapNoteScore_W5']=0.181500,
			['TapNoteScore_HitMine']=0.070000,
			['TapNoteScore_Attack']=0.131500,
			['TapNoteScore_Hold']=0.321500,
			['TapNoteScore_Roll']=0.351500,
			['TapNoteScore_Checkpoint']=0.1679, -- without this holds will never drop.
		},
		Shared = {
			--Others not used here will be taken from a fallback value.
			["TapNoteScore_ProW5"] = 5,
			["TapNoteScore_W1"] = 5,
			["TapNoteScore_W2"] = GAMESTATE:ShowW1() and 4 or 5,
			["TapNoteScore_W3"] = 2,
			["TapNoteScore_W4"] = 1,
			["TapNoteScore_W5"] = 0,
			["TapNoteScore_Miss"] = -12,
			["HoldNoteScore_LetGo"] = 0,
			["HoldNoteScore_Held"] = 5,
			["TapNoteScore_HitMine"] = -6,
			["TapNoteScore_MaxScore"] = 5,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "ECFA",
		Timings = {
			['TapNoteScore_ProW5']=0.0140,
			['TapNoteScore_W1']=0.023000,
			['TapNoteScore_W2']=0.044500,
			['TapNoteScore_W3']=0.103500,
			['TapNoteScore_W4']=0.136500,
			['TapNoteScore_W5']=0.181200,
			['TapNoteScore_HitMine']=0.070000,
			['TapNoteScore_Attack']=0.131500,
			['TapNoteScore_Hold']=0.321500,
			['TapNoteScore_Roll']=0.351500,
			['TapNoteScore_Checkpoint']=0.1679, -- without this holds will never drop.
		},
		Shared = {
			--Others not used here will be taken from a fallback value.
			["TapNoteScore_ProW5"]=10,
			["TapNoteScore_W1"]=9,
			["TapNoteScore_W2"]=GAMESTATE:ShowW1() and 6 or 9,
			["TapNoteScore_W3"]=3,
			["TapNoteScore_W4"]=0,
			["TapNoteScore_W5"]=0,
			["TapNoteScore_Miss"]=0,
			["HoldNoteScore_LetGo"]=0,
			["HoldNoteScore_Held"]=6,
			["TapNoteScore_HitMine"]=-3,
			["TapNoteScore_MaxScore"] = 10,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Pump Normal",
		Timings = {
			['TapNoteScore_W1']			= 0.062500,
			['TapNoteScore_W2']			= 0.104166,
			['TapNoteScore_W3']			= 0.145833,
			['TapNoteScore_W4']			= 0.187500,
			['TapNoteScore_HitMine']	= 0.145833,
			['TapNoteScore_Attack']		= 0.104166,
			['TapNoteScore_Hold']		= 0.125000,
			['TapNoteScore_Roll']		= 0.350000,
			['TapNoteScore_Checkpoint']	= 0,
		},
		Shared = {
			["TapNoteScore_W1"] = 6,
			["TapNoteScore_W2"] = 4,
			["TapNoteScore_W3"] = 2,
			["TapNoteScore_W4"] = 0,
			["TapNoteScore_Miss"] = -3,
			["TapNoteScore_HitMine"] = 0,
			["TapNoteScore_CheckpointHit"] = 0,
			["TapNoteScore_CheckpointMiss"] = -1,
			["TapNoteScore_LetGo"] = 0,
			["TapNoteScore_MaxScore"] = 6,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Pump Hard",
		Timings = {
			['TapNoteScore_W1']			= 0.045833,
			['TapNoteScore_W2']			= 0.087500,
			['TapNoteScore_W3']			= 0.129166,
			['TapNoteScore_W4']			= 0.170833,
			['TapNoteScore_HitMine']	= 0.145833,
			['TapNoteScore_Attack']		= 0.104166,
			['TapNoteScore_Hold']		= 0.125000,
			['TapNoteScore_Roll']		= 0.350000,
			['TapNoteScore_Checkpoint']	= 0,
		},
		Shared = {
			["TapNoteScore_W1"] = 6,
			["TapNoteScore_W2"] = 4,
			["TapNoteScore_W3"] = 2,
			["TapNoteScore_W4"] = 0,
			["TapNoteScore_Miss"] = -3,
			["TapNoteScore_HitMine"] = 0,
			["TapNoteScore_CheckpointHit"] = 0,
			["TapNoteScore_CheckpointMiss"] = -1,
			["TapNoteScore_LetGo"] = 0,
			["TapNoteScore_MaxScore"] = 6,
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Pump Very Hard",
		Timings = {
			['TapNoteScore_W1']			= 0.029166,
			['TapNoteScore_W2']			= 0.062500,
			['TapNoteScore_W3']			= 0.095833,
			['TapNoteScore_W4']			= 0.129166,
			['TapNoteScore_HitMine']	= 0.095833,
			['TapNoteScore_Attack']		= 0.062500,
			['TapNoteScore_Hold']		= 0.083333,
			['TapNoteScore_Roll']		= 0.350000,
			['TapNoteScore_Checkpoint']	= 0,
		},
		Shared = {
			["TapNoteScore_W1"] = 6,
			["TapNoteScore_W2"] = 4,
			["TapNoteScore_W3"] = 2,
			["TapNoteScore_W4"] = 0,
			["TapNoteScore_Miss"] = -3,
			["TapNoteScore_HitMine"] = 0,
			["TapNoteScore_CheckpointHit"] = 0,
			["TapNoteScore_CheckpointMiss"] = -1,
			["TapNoteScore_LetGo"] = 0,
			["TapNoteScore_MaxScore"] = 6,
		},
		Life = {
			["TapNoteScore_CheckpointMiss"] = 0
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Taitai",
		Timings = function( baseDiff )
			local t = {
				['TapNoteScore_HitMine']=0.0900, -- Dunno this value, use Original.
				['TapNoteScore_Attack']=0.1350, -- Dunno this value, use Original.
				['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
				['TapNoteScore_Roll']=0.5000, -- Dunno this value, use Original.
				['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
			}

			-- Detect difficulty index because string enums don't seem to cut it.
			local numindex = 0
			for i,v in pairs(Difficulty) do
				if v == baseDiff then numindex = i break end
			end

			-- Is it hard difficulty or higher?
			if numindex >= 4 then
				-- muzu / ura
				t['TapNoteScore_W1']=0.0250 -- Good
				t['TapNoteScore_W2']=0.0750 -- OK
				t['TapNoteScore_W5']=0.1084 -- Bad
			else
				-- kantan / futsuu
				t['TapNoteScore_W1']=0.0417 -- Good
				t['TapNoteScore_W2']=0.1084 -- OK
				t['TapNoteScore_W5']=0.1251 -- Bad
			end

			return t
		end
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "KBX",
		Timings= {
			['TapNoteScore_W1']=0.0500,
			['TapNoteScore_W2']=0.1000,
			['TapNoteScore_W3']=0.1500,
			['TapNoteScore_W4']=0.2000,
			['TapNoteScore_W5']=0.2500,
			['TapNoteScore_HitMine']=0.1000,
			['TapNoteScore_Attack']=0,
			['TapNoteScore_Hold']=0.5000,
			['TapNoteScore_Roll']=0.5000,
			['TapNoteScore_Checkpoint']=0.1000
		},
		Shared = {
			["TapNoteScore_W1"] = 60,
			["TapNoteScore_W2"] = 40,
			["TapNoteScore_W3"] = 20,
			['TapNoteScore_W4'] = 0,
			['TapNoteScore_W5'] = 0,
			["TapNoteScore_Miss"] = -30,
			["TapNoteScore_HitMine"] = -30,
			["TapNoteScore_CheckpointHit"] = 0,
			["TapNoteScore_CheckpointMiss"] = 0,
			["HoldNoteScore_LetGo"] = 0,
			["HoldNoteScore_Held"] = 0,
			["TapNoteScore_MaxScore"] = 60
		},
		Scoring = {
			["TapNoteScore_CheckpointHit"] = 1,
			["TapNoteScore_CheckpointMiss"] = -1
		},
		ScoreLimit = 0,
		Life = {
			['TapNoteScore_Checkpoint'] = 0,
			["TapNoteScore_CheckpointMiss"] = 0
		},
		Combo = {
			["5"] = 80,
			["4"] = 60,
			["3"] = 40,
			["2"] = 20
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "DDR",
		Timings = {
			['TapNoteScore_W1']=0.0170, -- Marvelous
			['TapNoteScore_W2']=0.0340, -- Perfect
			['TapNoteScore_W3']=0.0840, -- Great
			['TapNoteScore_W4']=0.1240, -- Good
			['TapNoteScore_W5']=0.1600, -- Boo
			['TapNoteScore_HitMine']=0.0900, -- Dunno this value, use Original.
			['TapNoteScore_Attack']=0.1350, -- Dunno this value, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- Dunno this value, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "BeatmaniaIIDX",
		Timings= {
			['TapNoteScore_W1']=0.0200, -- PGreat
			['TapNoteScore_W2']=0.0400, -- Great
			['TapNoteScore_W3']=0.1050, -- Good
			-- W4 and W5 don't exist.
			['TapNoteScore_HitMine']=0.0900, -- IIDX doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- IIDX doesn't have, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- IIDX doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Pop'n Music",
		Timings= {
			['TapNoteScore_W1']=0.0250, -- Cool
			['TapNoteScore_W2']=0.0500, -- Great
			['TapNoteScore_W3']=0.1000, -- Good
			-- W4 and W5 don't exist.
			['TapNoteScore_HitMine']=0.0900, -- Pop'n doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- Pop'n doesn't have, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- Pop'n doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "GuitarFreaks",
		Timings = {
			['TapNoteScore_W1']=0.0330, -- Perfect
			['TapNoteScore_W2']=0.0570, -- Great
			['TapNoteScore_W3']=0.0810, -- Good
			['TapNoteScore_W4']=0.1770, -- Ok
			-- W5 doesn't exist.
			['TapNoteScore_HitMine']=0.0900, -- GuitarFreaks doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- GuitarFreaks doesn't have, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- GuitarFreaks doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "GuitarHero",
		Timings = {
			['TapNoteScore_W1']=0.1200, -- Perfect
			['TapNoteScore_HitMine']=0.0900, -- GuitarHero doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- GuitarHero doesn't have, use Original.
			['TapNoteScore_Hold']=0.5000, -- Dunno this value.
			['TapNoteScore_Roll']=0.5000, -- GuitarHero doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		},
		Shared = {
			--Others not used here will be taken from a fallback value.
			["TapNoteScore_W1"] = 1,
			["TapNoteScore_W2"] = 0,
			["TapNoteScore_W3"] = 0,
			["TapNoteScore_W4"] = 0,
			["TapNoteScore_W5"] = 0,
			["TapNoteScore_Miss"] = 0,
			["HoldNoteScore_LetGo"] = 0,
			["HoldNoteScore_Held"] = 1,
			["TapNoteScore_HitMine"] = 0,
			["TapNoteScore_MaxScore"] = 1
		},
		Combo = {
			["4"] = 30,
			["3"] = 20,
			["2"] = 10
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "Drummania",
		Timings= {
			['TapNoteScore_W1']=0.0270, -- Perfect
			['TapNoteScore_W2']=0.0480, -- Great
			['TapNoteScore_W3']=0.0720, -- Good
			['TapNoteScore_W4']=0.0960, -- Ok
			-- W5 doesn't exist.
			['TapNoteScore_HitMine']=0.0900, -- Drummania doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- Drummania doesn't have, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- Drummania doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "ParaParaParadise",
		Timings= {
			['TapNoteScore_W1']=0.080, -- Great
			['TapNoteScore_W2']=0.180, -- Good
			-- W3/4/5 don't exist.
			['TapNoteScore_HitMine']=0.0900, -- Para doesn't have, use Original.
			['TapNoteScore_Attack']=0.1350, -- Para doesn't have, use Original.
			['TapNoteScore_Hold']=0.2500, -- Dunno this value, use Original.
			['TapNoteScore_Roll']=0.5000, -- Para doesn't have, use Original.
			['TapNoteScore_Checkpoint']=0.1664, -- Dunno this value, use Original.
		}
	}
end

TimingWindow[#TimingWindow+1] = function()
	return {
		Name = "SMX",
		Timings= {
			['TapNoteScore_W1']=0.023000, -- Dunno the value, using ITG
			['TapNoteScore_W2']=0.044500, -- Dunno the value, using ITG
			['TapNoteScore_W3']=0.103500, -- Dunno the value, using ITG
			['TapNoteScore_W4']=0.135600, -- Dunno the value, using ITG
			['TapNoteScore_HitMine']=0.070000, -- Dunno this value, use ITG.
			['TapNoteScore_Attack']=0.1350, -- Dunno this value, use Original.
			['TapNoteScore_Hold']=0.32150, -- Dunno this value, use ITG.
			['TapNoteScore_Roll']=0.35150, -- Dunno this value, use ITG.
			-- Make lifting from the hold more tolerable, seems to behave similar to ITG.
			['TapNoteScore_Checkpoint']=0.5,
		}
	}
end

function GetWindowSeconds(TimingWindow, Scale, Add)
	local fSecs = TimingWindow
	fSecs = fSecs * (Scale or 1.0) -- Timing Window Scale
	fSecs = fSecs + (Add or 0) --Timing Window Add
	return fSecs
end

------------------------------------------------------------------------------
-- Timing Call Definitions. -- Dont edit below this line - Jous
------------------------------------------------------------------------------

TimingModes = {}
for i,v in ipairs(TimingWindow) do
	local TW = TimingWindow[i]()
	table.insert(TimingModes,TW.Name)
end

function TimingOrder(TimTab)
	local con = {}
	local availableJudgments = {
		"ProW1","ProW2","ProW3","ProW4","ProW5",
		"W1","W2","W3","W4","W5",
		"HitMine","Attack","Hold","Roll","Checkpoint"
	}
	
	-- Iterate all judgments that are available.
	for k,v in pairs(TimTab) do
		for a,s in pairs( availableJudgments ) do
			if k == ('TapNoteScore_' .. s)  then
				con[ #con+1 ] = {k,v,a}
				break
			end
		end
	end
	
	-- Sort for later use.
	table.sort( con, function(a,b) return a[3] < b[3] end )
	return con
end