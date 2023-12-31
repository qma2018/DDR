-- from scratch, with various references.
local Noteskin = ... or {};

-- element redirs
Noteskin.ElementRedirs = {
	-- ["element"] = "redir_element";
};

-- button redirs (since this is a bar noteskin, it's all the same)
Noteskin.ButtonRedirs = {
	Key1		= "Bar";
	Key2		= "Bar";
	Key3		= "Bar";
	Key4		= "Bar";
	Key5		= "Bar";
	Key6		= "Bar";
	Key7		= "Bar";
	Key8		= "Bar";
	Key9		= "Bar";
	Key10		= "Bar";
	Key11		= "Bar";
	Key12		= "Bar";
	Key13		= "Bar";
	Key14		= "Bar";
	Key15		= "Bar";
	Key16		= "Bar";
	Key17		= "Bar";
	Key18		= "Bar";
	Key19		= "Bar";
};

-- things to blank out
Noteskin.Hide = {
	-- ["element"] = true/false;
};

-- rotations
Noteskin.BaseRotX = {
	Left	= 0;
	UpLeft	= 0;
	Up		= 0;
	Down	= 0;
	UpRight	= 0;
	Right	= 0;
};
Noteskin.BaseRotY = {
	Left	= 0;
	UpLeft	= 0;
	Up		= 0;
	Down	= 0;
	UpRight	= 0;
	Right	= 0;
};

local function NoteskinLoader()
	local Button = Var "Button"
	local Element = Var "Element"

	if Noteskin.Hide[Element] then
		-- Return a blank element. If SpriteOnly is set, we need to return a
		-- sprite; otherwise just return a dummy actor.
		local t;
		if Var "SpriteOnly" then
			t = LoadActor( "_blank" );
		else
			t = Def.Actor {};
		end
		return t .. {
			function(self)
				self:visible(false)
			end;
		};
	end;

	-- load element and button, using redirs
	local LoadElement = Noteskin.ElementRedirs[Element]
	if not LoadElement then
		LoadElement = Element;
	end;

	local LoadButton = Noteskin.ButtonRedirs[Button]
	if not LoadButton then
		LoadButton = Button;
	end;

	-- get path to thing
	local sPath = NOTESKIN:GetPath( LoadButton, LoadElement );

	-- make actor
	local t = LoadActor( sPath );

	-- apply rotation
	t.BaseRotationX=Noteskin.BaseRotX[sButton]
	t.BaseRotationY=Noteskin.BaseRotY[sButton]

	return t;
end

Noteskin.Load = NoteskinLoader;
Noteskin.CommonLoad = NoteskinLoader;
return Noteskin;
