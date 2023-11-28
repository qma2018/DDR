return Def.ActorFrame{
    CountCommand=function(self,params)
        self:GetChild("Count"):settext(params.Count)
        self:visible(true)
        if params.Count <= 0 then
            self:visible(false)
        end
    end,
    Def.Model {
        Meshes=NOTESKIN:GetPath("","_RES/DON.txt"),
        Materials=NOTESKIN:GetPath("","_RES/MAT_RED.txt"),
        Bones=NOTESKIN:GetPath("","_RES/DON.txt")
    },
    Def.Sprite{
        Texture=NOTESKIN:GetPath("Active","Balloon"),
        InitCommand=function(self)
            self:halign(0):x(8):y(-16)
        end
    },
    Def.BitmapText{
        Name="Count",
        Font="Common Normal",
        InitCommand=function(self)
            self:xy(100,-14):diffuse(0,0,0,1):zoom(1.2)
        end
    }
}