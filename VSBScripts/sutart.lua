-- By RealBredbeargotban
-- Script Name: Su Tart's Retribution
-- Original By Lord_Phantasmagoria (CKbackup)
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
    print("FE Compatibility code by Mokiros")
    local rp = RealPlayer
    script.Parent = rp.Character
   
    --RemoteEvent for communicating
    local Event = Instance.new("RemoteEvent")
    Event.Name = "UserInput_Event"
 
    --Fake event to make stuff like Mouse.KeyDown work
    local function fakeEvent()
        local t = {_fakeEvent=true,Functions={},Connect=function(self,f)table.insert(self.Functions,f) end}
        t.connect = t.Connect
        return t
    end
 
    --Creating fake input objects with fake variables
    local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
    local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
    local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
        CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
    end}
    --Merged 2 functions into one by checking amount of arguments
    CAS.UnbindAction = CAS.BindAction
 
    --This function will trigger the events that have been :Connect()'ed
    local function te(self,ev,...)
        local t = m[ev]
        if t and t._fakeEvent then
            for _,f in pairs(t.Functions) do
                f(...)
            end
        end
    end
    m.TrigEvent = te
    UIS.TrigEvent = te
 
    Event.OnServerEvent:Connect(function(plr,io)
        if plr~=rp then return end
        m.Target = io.Target
        m.Hit = io.Hit
        if not io.isMouse then
            local b = io.UserInputState == Enum.UserInputState.Begin
            if io.UserInputType == Enum.UserInputType.MouseButton1 then
                return m:TrigEvent(b and "Button1Down" or "Button1Up")
            end
            for _,t in pairs(CAS.Actions) do
                for _,k in pairs(t.Keys) do
                    if k==io.KeyCode then
                        t.Function(t.Name,io.UserInputState,io)
                    end
                end
            end
            m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
            UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
        end
    end)
    Event.Parent = NLS([==[
    local Player = game:GetService("Players").LocalPlayer
    local Event = script:WaitForChild("UserInput_Event")
 
    local Mouse = Player:GetMouse()
    local UIS = game:GetService("UserInputService")
    local input = function(io,a)
        if a then return end
        --Since InputObject is a client-side instance, we create and pass table instead
        Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
    end
    UIS.InputBegan:Connect(input)
    UIS.InputEnded:Connect(input)
 
    local h,t
    --Give the server mouse data 30 times every second, but only if the values changed
    --If player is not moving their mouse, client won't fire events
    while wait(1/30) do
        if h~=Mouse.Hit or t~=Mouse.Target then
            h,t=Mouse.Hit,Mouse.Target
            Event:FireServer({isMouse=true,Target=t,Hit=h})
        end
    end]==],Player.Character)
 
    ----Sandboxed game object that allows the usage of client-side methods and services
    --Real game object
    local _rg = game
 
    --Metatable for fake service
    local fsmt = {
        __index = function(self,k)
            local s = rawget(self,"_RealService")
            if s then return s[k] end
        end,
        __newindex = function(self,k,v)
            local s = rawget(self,"_RealService")
            if s then s[k]=v end
        end,
        __call = function(self,...)
            local s = rawget(self,"_RealService")
            if s then return s(...) end
        end
    }
    local function FakeService(t,RealService)
        t._RealService = typeof(RealService)=="string" and _rg:GetService(RealService) or RealService
        return setmetatable(t,fsmt)
    end
 
    --Fake game object
    local g = {
        GetService = function(self,s)
            return self[s]
        end,
        Players = FakeService({
            LocalPlayer = FakeService({GetMouse=function(self)return m end},Player)
        },"Players"),
        UserInputService = FakeService(UIS,"UserInputService"),
        ContextActionService = FakeService(CAS,"ContextActionService"),
    }
    rawset(g.Players,"localPlayer",g.Players.LocalPlayer)
    g.service = g.GetService
   
    g.RunService = FakeService({
        RenderStepped = _rg:GetService("RunService").Heartbeat,
        BindToRenderStep = function(self,name,_,fun)
            self._btrs[name] = self.Heartbeat:Connect(fun)
        end,
        UnbindFromRenderStep = function(self,name)
            self._btrs[name]:Disconnect()
        end,
    },"RunService")
 
    setmetatable(g,{
        __index=function(self,s)
            return _rg:GetService(s) or typeof(_rg[s])=="function"
            and function(_,...)return _rg[s](_rg,...)end or _rg[s]
        end,
        __newindex = fsmt.__newindex,
        __call = fsmt.__call
    })
    --Changing owner to fake player object to support owner:GetMouse()
    game,owner = g,g.Players.LocalPlayer
end

p = owner
ch = owner.Character
mouse = owner:GetMouse()
hum = ch.Humanoid
root = ch.HumanoidRootPart
local function createScript(scripttype,source,parent)
    scriptvarg = nil
    if scripttype == "Server" then
        scriptvarg = NS(source,parent)
    elseif scripttype == "Local" then
        scriptvarg = NLS(source,parent)
    else
        print("Incorrect scriptType!")
    end
    return scriptvarg
end
FC = createScript("Local",[[
    local success,errorMessage = pcall(function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        
        local camera = workspace.CurrentCamera
        
        while task.wait() do
            camera.CameraSubject = char.Humanoid
        end
        
    end)
    
    if success then
        print("Successfully fixed the camera!")
    else
        print(errorMessage)
    end
]],ch)

repeat
	game:GetService("RunService").Heartbeat:Wait()
until ch ~= nil

userinput = game:GetService("UserInputService")
debris = game:GetService("Debris")
tweenservice = game:GetService("TweenService")

attack = false
dadlol = false
musicetap = 0
dadattack = false
sine = 0
change = 1
speed = 16
jpower = 75
anim = "Idle"

Instance.new("ForceField",ch).Visible = false

--CONTROLS
-- Gui to Lua
-- Version: 3.2

-- Instances:

local ControlsGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local Controls = Instance.new("Frame")
local ScriptCredits = Instance.new("TextLabel")
local ScriptCredits_2 = Instance.new("TextLabel")
local Control = Instance.new("TextLabel")
local Control_2 = Instance.new("TextLabel")
local Control_3 = Instance.new("TextLabel")
local Control_4 = Instance.new("TextLabel")
local Control_5 = Instance.new("TextLabel")
local Control_6 = Instance.new("TextLabel")
local Control_7 = Instance.new("TextLabel")
local Control_8 = Instance.new("TextLabel")
local ScriptCredits_3 = Instance.new("TextLabel")
local ScriptCredits_4 = Instance.new("TextLabel")
local Control_9 = Instance.new("TextLabel")

--Properties:

ControlsGui.Name = "ControlsGui"
ControlsGui.Parent = owner:WaitForChild("PlayerGui")
ControlsGui.Enabled = false
ControlsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ControlsGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(118, 53, 0)
ToggleButton.BackgroundTransparency = 0.250
ToggleButton.BorderColor3 = Color3.fromRGB(118, 53, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.847512603, 0, 0.789571702, 0)
ToggleButton.Size = UDim2.new(0, 79, 0, 41)
ToggleButton.Font = Enum.Font.Cartoon
ToggleButton.Text = "Close Controls"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.TextSize = 14.000
ToggleButton.TextStrokeTransparency = 0.000
ToggleButton.TextWrapped = true

Controls.Name = "Controls"
Controls.Parent = ToggleButton
Controls.BackgroundColor3 = Color3.fromRGB(118, 53, 0)
Controls.BackgroundTransparency = 0.250
Controls.BorderColor3 = Color3.fromRGB(118, 53, 0)
Controls.BorderSizePixel = 0
Controls.Position = UDim2.new(-3.0050633, 0, -9.2443409, 0)
Controls.Size = UDim2.new(0, 238, 0, 420)

ScriptCredits.Name = "Script Credits"
ScriptCredits.Parent = Controls
ScriptCredits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits.BackgroundTransparency = 1.000
ScriptCredits.Position = UDim2.new(0.243412971, 0, 0.0360983163, 0)
ScriptCredits.Size = UDim2.new(0, 117, 0, 15)
ScriptCredits.Font = Enum.Font.Cartoon
ScriptCredits.Text = "Su Tart's Retribution"
ScriptCredits.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits.TextScaled = true
ScriptCredits.TextSize = 14.000
ScriptCredits.TextStrokeTransparency = 0.000
ScriptCredits.TextWrapped = true

ScriptCredits_2.Name = "Script Credits"
ScriptCredits_2.Parent = Controls
ScriptCredits_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_2.BackgroundTransparency = 1.000
ScriptCredits_2.Position = UDim2.new(0.168344483, 0, 0.0887225196, 0)
ScriptCredits_2.Size = UDim2.new(0, 156, 0, 16)
ScriptCredits_2.Font = Enum.Font.Cartoon
ScriptCredits_2.Text = "by Lord_Phantasmagoria"
ScriptCredits_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_2.TextScaled = true
ScriptCredits_2.TextSize = 14.000
ScriptCredits_2.TextStrokeTransparency = 0.000
ScriptCredits_2.TextWrapped = true

Control.Name = "Control"
Control.Parent = Controls
Control.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control.BackgroundTransparency = 1.000
Control.Position = UDim2.new(0.283754379, 0, 0.229198709, 0)
Control.Size = UDim2.new(0, 98, 0, 12)
Control.Font = Enum.Font.Cartoon
Control.Text = "Click - Blacon"
Control.TextColor3 = Color3.fromRGB(255, 255, 255)
Control.TextScaled = true
Control.TextSize = 14.000
Control.TextStrokeTransparency = 0.000
Control.TextWrapped = true

Control_2.Name = "Control"
Control_2.Parent = Controls
Control_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_2.BackgroundTransparency = 1.000
Control_2.Position = UDim2.new(0.283754379, 0, 0.313003838, 0)
Control_2.Size = UDim2.new(0, 98, 0, 12)
Control_2.Font = Enum.Font.Cartoon
Control_2.Text = "F - Taunt"
Control_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_2.TextScaled = true
Control_2.TextSize = 14.000
Control_2.TextStrokeTransparency = 0.000
Control_2.TextWrapped = true

Control_3.Name = "Control"
Control_3.Parent = Controls
Control_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_3.BackgroundTransparency = 1.000
Control_3.Position = UDim2.new(0.257448077, 0, 0.393451333, 0)
Control_3.Size = UDim2.new(0, 114, 0, 21)
Control_3.Font = Enum.Font.Cartoon
Control_3.Text = "Z - Staggering Stomp"
Control_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_3.TextScaled = true
Control_3.TextSize = 14.000
Control_3.TextStrokeTransparency = 0.000
Control_3.TextWrapped = true

Control_4.Name = "Control"
Control_4.Parent = Controls
Control_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_4.BackgroundTransparency = 1.000
Control_4.Position = UDim2.new(0.283754379, 0, 0.612318158, 0)
Control_4.Size = UDim2.new(0, 98, 0, 12)
Control_4.Font = Enum.Font.Cartoon
Control_4.Text = "C - Ceral Killer"
Control_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_4.TextScaled = true
Control_4.TextSize = 14.000
Control_4.TextStrokeTransparency = 0.000
Control_4.TextWrapped = true

Control_5.Name = "Control"
Control_5.Parent = Controls
Control_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_5.BackgroundTransparency = 1.000
Control_5.Position = UDim2.new(0.256341636, 0, 0.717529356, 0)
Control_5.Size = UDim2.new(0, 110, 0, 19)
Control_5.Font = Enum.Font.Cartoon
Control_5.Text = "V - Karmic Retribution"
Control_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_5.TextScaled = true
Control_5.TextSize = 14.000
Control_5.TextStrokeTransparency = 0.000
Control_5.TextWrapped = true

Control_6.Name = "Control"
Control_6.Parent = Controls
Control_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_6.BackgroundTransparency = 1.000
Control_6.Position = UDim2.new(0.274928361, 0, 0.928650618, 0)
Control_6.Size = UDim2.new(0, 98, 0, 12)
Control_6.Font = Enum.Font.Cartoon
Control_6.Text = "N - Nova"
Control_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_6.TextScaled = true
Control_6.TextSize = 14.000
Control_6.TextStrokeTransparency = 0.000
Control_6.TextWrapped = true

Control_7.Name = "Control"
Control_7.Parent = Controls
Control_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_7.BackgroundTransparency = 1.000
Control_7.Position = UDim2.new(0.171932042, 0, 1.01908636, 0)
Control_7.Size = UDim2.new(0, 156, 0, 18)
Control_7.Font = Enum.Font.Cartoon
Control_7.Text = "(also, M - (Un)Mute Music)"
Control_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_7.TextScaled = true
Control_7.TextSize = 14.000
Control_7.TextStrokeTransparency = 0.000
Control_7.TextWrapped = true

Control_8.Name = "Control"
Control_8.Parent = Controls
Control_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_8.BackgroundTransparency = 1.000
Control_8.Position = UDim2.new(0.235526323, 0, 0.492606521, 0)
Control_8.Size = UDim2.new(0, 120, 0, 21)
Control_8.Font = Enum.Font.Cartoon
Control_8.Text = "X - Flake Fragmetation"
Control_8.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_8.TextScaled = true
Control_8.TextSize = 14.000
Control_8.TextStrokeTransparency = 0.000
Control_8.TextWrapped = true

ScriptCredits_3.Name = "Script Credits"
ScriptCredits_3.Parent = Controls
ScriptCredits_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_3.BackgroundTransparency = 1.000
ScriptCredits_3.Position = UDim2.new(0.168344483, 0, 0.126817763, 0)
ScriptCredits_3.Size = UDim2.new(0, 156, 0, 16)
ScriptCredits_3.Font = Enum.Font.Cartoon
ScriptCredits_3.Text = "(CKbackup)"
ScriptCredits_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_3.TextScaled = true
ScriptCredits_3.TextSize = 14.000
ScriptCredits_3.TextStrokeTransparency = 0.000
ScriptCredits_3.TextWrapped = true

ScriptCredits_4.Name = "Script Credits"
ScriptCredits_4.Parent = Controls
ScriptCredits_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_4.BackgroundTransparency = 1.000
ScriptCredits_4.Position = UDim2.new(0.168344483, 0, 0.174436808, 0)
ScriptCredits_4.Size = UDim2.new(0, 156, 0, 16)
ScriptCredits_4.Font = Enum.Font.Cartoon
ScriptCredits_4.Text = "\"This guy!\""
ScriptCredits_4.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptCredits_4.TextScaled = true
ScriptCredits_4.TextSize = 14.000
ScriptCredits_4.TextStrokeTransparency = 0.000
ScriptCredits_4.TextWrapped = true

Control_9.Name = "Control"
Control_9.Parent = Controls
Control_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Control_9.BackgroundTransparency = 1.000
Control_9.Position = UDim2.new(0.241737574, 0, 0.825649798, 0)
Control_9.Size = UDim2.new(0, 117, 0, 22)
Control_9.Font = Enum.Font.Cartoon
Control_9.Text = "B - Father's Vengance"
Control_9.TextColor3 = Color3.fromRGB(255, 255, 255)
Control_9.TextScaled = true
Control_9.TextSize = 14.000
Control_9.TextStrokeTransparency = 0.000
Control_9.TextWrapped = true

-- Scripts:

-- ToggleButton.Open is disabled.
local function QTQSWO_fake_script() -- ToggleButton.Close 
	local script = Instance.new('Script', ToggleButton)

	function o2()
		script.Parent.Controls.Visible = false
		script.Parent.Open.Disabled = false
		script.Disabled = true
		script.Parent.Text = "Open Controls"
	end
	
	script.Parent.MouseButton1Down:Connect(o2)
end
coroutine.wrap(QTQSWO_fake_script)()


Player=game.Players:GetPlayerFromCharacter(script.Parent)
ControlsGui.Parent = Player.PlayerGui
ControlsGui.Enabled = true

-- Welds

neck = Instance.new("Weld",ch.Torso)
neck.Part0 = ch.Torso
neck.Part1 = ch.Head
neck.C0 = CFrame.new(0,1,0)
neck.C1 = CFrame.new(0,-0.5,0)

torso = Instance.new("Weld",root)
torso.Part0 = root
torso.Part1 = ch.Torso

rs = Instance.new("Weld",ch.Torso)
rs.Part0 = ch.Torso
rs.Part1 = ch["Right Arm"]
rs.C0 = CFrame.new(1.5,0.5,0)
rs.C1 = CFrame.new(0,0.5,0)

ls = Instance.new("Weld",ch.Torso)
ls.Part0 = ch.Torso
ls.Part1 = ch["Left Arm"]
ls.C0 = CFrame.new(-1.5,0.5,0)
ls.C1 = CFrame.new(0,0.5,0)

rh = Instance.new("Weld",ch.Torso)
rh.Part0 = ch.Torso
rh.Part1 = ch["Right Leg"]
rh.C0 = CFrame.new(0.5,-1,0)
rh.C1 = CFrame.new(0,1,0)

lh = Instance.new("Weld",ch.Torso)
lh.Part0 = ch.Torso
lh.Part1 = ch["Left Leg"]
lh.C0 = CFrame.new(-0.5,-1,0)
lh.C1 = CFrame.new(0,1,0)


-- Music
local music = Instance.new("Sound",ch)



local function CustomMusic()
	local randomassetid = math.random(1,4)
	if randomassetid == 1 then
		music.SoundId = "rbxasset://SuTart/Doom.mp3"
		musicetap = 1
	elseif randomassetid == 2 then
		music.SoundId = "rbxasset://SuTart/Extinction.mp3"
		musicetap = 2
	elseif randomassetid == 3 then
		music.SoundId = "rbxasset://SuTart/Terraria.mp3"
		musicetap = 3
	elseif randomassetid == 4 then
		music.SoundId = "rbxasset://SuTart/UGotThat.mp3"
		musicetap = 4
	end
	music.Volume = 2
	music.Looped = false
	music.PlaybackSpeed = 1
	music.Ended:Connect(function()
		if musicetap == 1 then
			musicetap = 2
			music.SoundId = "rbxasset://SuTart/Extinction.mp3"
			music.TimePosition = 0
			music:Play()
		elseif musicetap == 2 then
			musicetap = 3
			music.SoundId = "rbxasset://SuTart/Terraria.mp3"
			music.TimePosition = 0
			music:Play()
		elseif musicetap == 3 then
			musicetap = 4
			music.SoundId = "rbxasset://SuTart/UGotThat.mp3"
			music.TimePosition = 0
			music:Play()
		elseif musicetap == 4 then
			musicetap = 1
			music.SoundId = "rbxasset://SuTart/Doom.mp3"
			music.TimePosition = 0
			music:Play()
		end
	end)
end
CustomMusic()

-- Effects Folder

--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end

cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Folder0 = Instance.new("Folder")
MeshPart1 = Instance.new("MeshPart")
ParticleEmitter2 = Instance.new("ParticleEmitter")
Model3 = Instance.new("Model")
MeshPart4 = Instance.new("MeshPart")
MeshPart5 = Instance.new("MeshPart")
Decal6 = Instance.new("Decal")
Folder0.Name = "Effects"
Folder0.Parent = mas
MeshPart1.Name = "Ring"
MeshPart1.Parent = Folder0
MeshPart1.CFrame = CFrame.new(-54.7176056, -355.54187, -25.1743317, 1, 0, 0, 0, 0.866025388, 0.49999997, 0, -0.49999997, 0.866025388)
MeshPart1.Orientation = Vector3.new(-30, 0, 0)
MeshPart1.Position = Vector3.new(-54.71760559082031, -355.5418701171875, -25.174331665039062)
MeshPart1.Rotation = Vector3.new(-30, 0, 0)
MeshPart1.Color = Color3.new(0.854902, 0.521569, 0.254902)
MeshPart1.Transparency = 1
MeshPart1.Size = Vector3.new(1.159999966621399, 1.159999966621399, 0.1599999964237213)
MeshPart1.Anchored = true
MeshPart1.BrickColor = BrickColor.new("Bright orange")
MeshPart1.CanCollide = false
MeshPart1.Material = Enum.Material.Neon
MeshPart1.brickColor = BrickColor.new("Bright orange")
ParticleEmitter2.Name = "FireEffect"
ParticleEmitter2.Parent = Folder0
ParticleEmitter2.Speed = NumberRange.new(3.5, 4.5)
ParticleEmitter2.Rotation = NumberRange.new(-180, 180)
ParticleEmitter2.Color = ColorSequence.new(Color3.new(0.784314, 0.521569, 0),Color3.new(0.784314, 0.521569, 0))
ParticleEmitter2.Enabled = false
ParticleEmitter2.LightEmission = 100000
ParticleEmitter2.Texture = "rbxassetid://4753372559"
ParticleEmitter2.Transparency = NumberSequence.new(0,0.23999999463558197,0.4000000059604645,0,0.5,0.45625001192092896,0.5,0,0.20000000298023224,0)
ParticleEmitter2.Size = NumberSequence.new(2,1.75,1.649999976158142,1.5099999904632568,1.399999976158142,1.2999999523162842,0.949999988079071,0.5600000023841858,0.125)
ParticleEmitter2.Lifetime = NumberRange.new(0.10000000149011612, 0.699999988079071)
ParticleEmitter2.Rate = 75
ParticleEmitter2.RotSpeed = NumberRange.new(25, 50)
ParticleEmitter2.SpreadAngle = Vector2.new(10, 10)
ParticleEmitter2.VelocitySpread = 10
Model3.Name = "SunHead"
Model3.Parent = Folder0
MeshPart4.Name = "Head2"
MeshPart4.Parent = Model3
MeshPart4.CFrame = CFrame.new(39.8323822, -331.07019, -6.67431641, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart4.Position = Vector3.new(39.83238220214844, -331.0701904296875, -6.67431640625)
MeshPart4.Color = Color3.new(0.854902, 0.521569, 0.254902)
MeshPart4.Transparency = 1
MeshPart4.Size = Vector3.new(31.422542572021484, 30.916479110717773, 31.38298988342285)
MeshPart4.Anchored = true
MeshPart4.BrickColor = BrickColor.new("Bright orange")
MeshPart4.CanCollide = false
MeshPart4.Material = Enum.Material.Neon
MeshPart4.brickColor = BrickColor.new("Bright orange")
MeshPart5.Name = "Head1"
MeshPart5.Parent = Model3
MeshPart5.CFrame = CFrame.new(39.8323822, -331.07019, -6.67431641, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart5.Position = Vector3.new(39.83238220214844, -331.0701904296875, -6.67431640625)
MeshPart5.Transparency = 1
MeshPart5.Size = Vector3.new(28.61276626586914, 28.15195655822754, 28.576751708984375)
MeshPart5.Anchored = true
MeshPart5.CanCollide = false
MeshPart5.Material = Enum.Material.Neon
Decal6.Name = "face"
Decal6.Parent = MeshPart5
Decal6.Texture = "http://www.roblox.com/asset/?id=144080495"
Decal6.Transparency = 1


local effectsfolder = mas.Effects:Clone()
mas:Destroy()


local bullyfolder = Instance.new("Model")
bullyfolder.Name = "BOOLIES"

--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Part1 = Instance.new("Part")
Vector3Value2 = Instance.new("Vector3Value")
MeshPart3 = Instance.new("MeshPart")
Vector3Value4 = Instance.new("Vector3Value")
Motor6D5 = Instance.new("Motor6D")
MeshPart6 = Instance.new("MeshPart")
Vector3Value7 = Instance.new("Vector3Value")
Motor6D8 = Instance.new("Motor6D")
MeshPart9 = Instance.new("MeshPart")
Vector3Value10 = Instance.new("Vector3Value")
Motor6D11 = Instance.new("Motor6D")
MeshPart12 = Instance.new("MeshPart")
Vector3Value13 = Instance.new("Vector3Value")
Motor6D14 = Instance.new("Motor6D")
MeshPart15 = Instance.new("MeshPart")
Vector3Value16 = Instance.new("Vector3Value")
Motor6D17 = Instance.new("Motor6D")
MeshPart18 = Instance.new("MeshPart")
Vector3Value19 = Instance.new("Vector3Value")
Motor6D20 = Instance.new("Motor6D")
MeshPart21 = Instance.new("MeshPart")
Vector3Value22 = Instance.new("Vector3Value")
Motor6D23 = Instance.new("Motor6D")
MeshPart24 = Instance.new("MeshPart")
Vector3Value25 = Instance.new("Vector3Value")
Motor6D26 = Instance.new("Motor6D")
MeshPart27 = Instance.new("MeshPart")
Vector3Value28 = Instance.new("Vector3Value")
Motor6D29 = Instance.new("Motor6D")
MeshPart30 = Instance.new("MeshPart")
Vector3Value31 = Instance.new("Vector3Value")
Motor6D32 = Instance.new("Motor6D")
MeshPart33 = Instance.new("MeshPart")
Vector3Value34 = Instance.new("Vector3Value")
Motor6D35 = Instance.new("Motor6D")
MeshPart36 = Instance.new("MeshPart")
Vector3Value37 = Instance.new("Vector3Value")
Motor6D38 = Instance.new("Motor6D")
MeshPart39 = Instance.new("MeshPart")
Vector3Value40 = Instance.new("Vector3Value")
Motor6D41 = Instance.new("Motor6D")
MeshPart42 = Instance.new("MeshPart")
Vector3Value43 = Instance.new("Vector3Value")
Motor6D44 = Instance.new("Motor6D")
Humanoid45 = Instance.new("Humanoid")
Part46 = Instance.new("Part")
SpecialMesh47 = Instance.new("SpecialMesh")
Vector3Value48 = Instance.new("Vector3Value")
Motor6D49 = Instance.new("Motor6D")
Decal50 = Instance.new("Decal")
Weld51 = Instance.new("Weld")
Weld52 = Instance.new("Weld")
BodyColors53 = Instance.new("BodyColors")
ObjectValue54 = Instance.new("ObjectValue")
Accessory55 = Instance.new("Accessory")
Part56 = Instance.new("Part")
SpecialMesh57 = Instance.new("SpecialMesh")
StringValue58 = Instance.new("StringValue")
Vector3Value59 = Instance.new("Vector3Value")
Configuration60 = Instance.new("Configuration")
ObjectValue61 = Instance.new("ObjectValue")
CFrameValue62 = Instance.new("CFrameValue")
Script63 = Instance.new("Script")
StringValue64 = Instance.new("StringValue")
Animation65 = Instance.new("Animation")
StringValue66 = Instance.new("StringValue")
Animation67 = Instance.new("Animation")
StringValue68 = Instance.new("StringValue")
Animation69 = Instance.new("Animation")
NumberValue70 = Instance.new("NumberValue")
Animation71 = Instance.new("Animation")
NumberValue72 = Instance.new("NumberValue")
Animation73 = Instance.new("Animation")
NumberValue74 = Instance.new("NumberValue")
StringValue75 = Instance.new("StringValue")
Animation76 = Instance.new("Animation")
NumberValue77 = Instance.new("NumberValue")
Animation78 = Instance.new("Animation")
NumberValue79 = Instance.new("NumberValue")
Animation80 = Instance.new("Animation")
NumberValue81 = Instance.new("NumberValue")
StringValue82 = Instance.new("StringValue")
Animation83 = Instance.new("Animation")
NumberValue84 = Instance.new("NumberValue")
Animation85 = Instance.new("Animation")
NumberValue86 = Instance.new("NumberValue")
Animation87 = Instance.new("Animation")
NumberValue88 = Instance.new("NumberValue")
StringValue89 = Instance.new("StringValue")
Animation90 = Instance.new("Animation")
StringValue91 = Instance.new("StringValue")
Animation92 = Instance.new("Animation")
StringValue93 = Instance.new("StringValue")
Animation94 = Instance.new("Animation")
StringValue95 = Instance.new("StringValue")
Animation96 = Instance.new("Animation")
StringValue97 = Instance.new("StringValue")
Animation98 = Instance.new("Animation")
StringValue99 = Instance.new("StringValue")
Animation100 = Instance.new("Animation")
StringValue101 = Instance.new("StringValue")
Animation102 = Instance.new("Animation")
StringValue103 = Instance.new("StringValue")
Animation104 = Instance.new("Animation")
StringValue105 = Instance.new("StringValue")
Animation106 = Instance.new("Animation")
StringValue107 = Instance.new("StringValue")
Animation108 = Instance.new("Animation")
NumberValue109 = Instance.new("NumberValue")
StringValue110 = Instance.new("StringValue")
Animation111 = Instance.new("Animation")
StringValue112 = Instance.new("StringValue")
Animation113 = Instance.new("Animation")
StringValue114 = Instance.new("StringValue")
Animation115 = Instance.new("Animation")
BindableFunction116 = Instance.new("BindableFunction")
StringValue117 = Instance.new("StringValue")
Animation118 = Instance.new("Animation")
NumberValue119 = Instance.new("NumberValue")
Animation120 = Instance.new("Animation")
NumberValue121 = Instance.new("NumberValue")
StringValue122 = Instance.new("StringValue")
Animation123 = Instance.new("Animation")
NumberValue124 = Instance.new("NumberValue")
Shirt125 = Instance.new("Shirt")
Pants126 = Instance.new("Pants")
BodyColors127 = Instance.new("BodyColors")
Accessory128 = Instance.new("Accessory")
Part129 = Instance.new("Part")
SpecialMesh130 = Instance.new("SpecialMesh")
Vector3Value131 = Instance.new("Vector3Value")
BoolValue132 = Instance.new("BoolValue")
Script133 = Instance.new("Script")
Model0.Name = "Bully_1"
Model0.Parent = mas
Model0.PrimaryPart = Part1
Part1.Name = "HumanoidRootPart"
Part1.Parent = Model0
Part1.CFrame = CFrame.new(40.717453, 899.505127, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part1.Position = Vector3.new(40.71745300292969, 899.505126953125, 110.1295394897461)
Part1.Color = Color3.new(1, 0.8, 0.6)
Part1.Transparency = 1
Part1.Size = Vector3.new(2, 2, 1)
Part1.Anchored = true
Part1.BrickColor = BrickColor.new("Pastel brown")
Part1.brickColor = BrickColor.new("Pastel brown")
Vector3Value2.Name = "OriginalSize"
Vector3Value2.Parent = Part1
Vector3Value2.Value = Vector3.new(2, 2, 1)
MeshPart3.Name = "LeftHand"
MeshPart3.Parent = Model0
MeshPart3.CFrame = CFrame.new(39.217453, 899.305054, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart3.Position = Vector3.new(39.21745300292969, 899.3050537109375, 110.1295394897461)
MeshPart3.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart3.Size = Vector3.new(0.9999997615814209, 0.29999998211860657, 0.9999998807907104)
MeshPart3.BrickColor = BrickColor.new("Light orange")
MeshPart3.CanCollide = false
MeshPart3.brickColor = BrickColor.new("Light orange")
Vector3Value4.Name = "OriginalSize"
Vector3Value4.Parent = MeshPart3
Vector3Value4.Value = Vector3.new(0.9999997615814209, 0.29999998211860657, 0.9999998807907104)
Motor6D5.Name = "LeftWrist"
Motor6D5.Parent = MeshPart3
Motor6D5.C0 = CFrame.new(0.000478506088, -0.549999952, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D5.C1 = CFrame.new(0.000478863716, 0.149999991, 5.96046448e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D5.Part0 = MeshPart6
Motor6D5.Part1 = MeshPart3
Motor6D5.part1 = MeshPart3
MeshPart6.Name = "LeftLowerArm"
MeshPart6.Parent = Model0
MeshPart6.CFrame = CFrame.new(39.217453, 900.005066, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart6.Position = Vector3.new(39.21745300292969, 900.0050659179688, 110.1295394897461)
MeshPart6.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart6.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
MeshPart6.BrickColor = BrickColor.new("Light orange")
MeshPart6.CanCollide = false
MeshPart6.brickColor = BrickColor.new("Light orange")
Vector3Value7.Name = "OriginalSize"
Vector3Value7.Parent = MeshPart6
Vector3Value7.Value = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
Motor6D8.Name = "LeftElbow"
Motor6D8.Parent = MeshPart6
Motor6D8.C0 = CFrame.new(0.000479102135, -0.200000167, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D8.C1 = CFrame.new(0.000478506088, 0.25000003, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D8.Part0 = MeshPart9
Motor6D8.Part1 = MeshPart6
Motor6D8.part1 = MeshPart6
MeshPart9.Name = "LeftUpperArm"
MeshPart9.Parent = Model0
MeshPart9.CFrame = CFrame.new(39.217453, 900.455078, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart9.Position = Vector3.new(39.21745300292969, 900.455078125, 110.1295394897461)
MeshPart9.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart9.Size = Vector3.new(0.9999997615814209, 1.4000003337860107, 0.9999999403953552)
MeshPart9.BrickColor = BrickColor.new("Light orange")
MeshPart9.CanCollide = false
MeshPart9.brickColor = BrickColor.new("Light orange")
Vector3Value10.Name = "OriginalSize"
Vector3Value10.Parent = MeshPart9
Vector3Value10.Value = Vector3.new(0.9999997615814209, 1.4000003337860107, 0.9999999403953552)
Motor6D11.Name = "LeftShoulder"
Motor6D11.Parent = MeshPart9
Motor6D11.C0 = CFrame.new(-1.24989128, 0.549999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D11.C1 = CFrame.new(0.250109196, 0.449999809, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D11.Part0 = MeshPart21
Motor6D11.Part1 = MeshPart9
Motor6D11.part1 = MeshPart9
MeshPart12.Name = "RightHand"
MeshPart12.Parent = Model0
MeshPart12.CFrame = CFrame.new(42.217453, 899.305054, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart12.Position = Vector3.new(42.21745300292969, 899.3050537109375, 110.1295394897461)
MeshPart12.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart12.Size = Vector3.new(0.9999998807907104, 0.29999998211860657, 0.9999998807907104)
MeshPart12.BrickColor = BrickColor.new("Light orange")
MeshPart12.CanCollide = false
MeshPart12.brickColor = BrickColor.new("Light orange")
Vector3Value13.Name = "OriginalSize"
Vector3Value13.Parent = MeshPart12
Vector3Value13.Value = Vector3.new(0.9999998807907104, 0.29999998211860657, 0.9999998807907104)
Motor6D14.Name = "RightWrist"
Motor6D14.Parent = MeshPart12
Motor6D14.C0 = CFrame.new(1.1920929e-07, -0.549999952, -6.86244753e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D14.C1 = CFrame.new(3.57627869e-07, 0.149999991, 5.96046448e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D14.Part0 = MeshPart15
Motor6D14.Part1 = MeshPart12
Motor6D14.part1 = MeshPart12
MeshPart15.Name = "RightLowerArm"
MeshPart15.Parent = Model0
MeshPart15.CFrame = CFrame.new(42.217453, 900.005066, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart15.Position = Vector3.new(42.21745300292969, 900.0050659179688, 110.1295394897461)
MeshPart15.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart15.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
MeshPart15.BrickColor = BrickColor.new("Light orange")
MeshPart15.CanCollide = false
MeshPart15.brickColor = BrickColor.new("Light orange")
Vector3Value16.Name = "OriginalSize"
Vector3Value16.Parent = MeshPart15
Vector3Value16.Value = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
Motor6D17.Name = "RightElbow"
Motor6D17.Parent = MeshPart15
Motor6D17.C0 = CFrame.new(-5.96046448e-07, -0.200000167, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D17.C1 = CFrame.new(1.1920929e-07, 0.25000003, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D17.Part0 = MeshPart18
Motor6D17.Part1 = MeshPart15
Motor6D17.part1 = MeshPart15
MeshPart18.Name = "RightUpperArm"
MeshPart18.Parent = Model0
MeshPart18.CFrame = CFrame.new(42.217453, 900.455078, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart18.Position = Vector3.new(42.21745300292969, 900.455078125, 110.1295394897461)
MeshPart18.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart18.Size = Vector3.new(0.9999996423721313, 1.4000003337860107, 0.9999999403953552)
MeshPart18.BrickColor = BrickColor.new("Light orange")
MeshPart18.CanCollide = false
MeshPart18.brickColor = BrickColor.new("Light orange")
Vector3Value19.Name = "OriginalSize"
Vector3Value19.Parent = MeshPart18
Vector3Value19.Value = Vector3.new(0.9999996423721313, 1.4000003337860107, 0.9999999403953552)
Motor6D20.Name = "RightShoulder"
Motor6D20.Parent = MeshPart18
Motor6D20.C0 = CFrame.new(1.24998045, 0.549999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D20.C1 = CFrame.new(-0.250020266, 0.449999809, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D20.Part0 = MeshPart21
Motor6D20.Part1 = MeshPart18
Motor6D20.part1 = MeshPart18
MeshPart21.Name = "UpperTorso"
MeshPart21.Parent = Model0
MeshPart21.CFrame = CFrame.new(40.717453, 900.355103, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart21.Position = Vector3.new(40.71745300292969, 900.3551025390625, 110.1295394897461)
MeshPart21.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart21.Size = Vector3.new(2, 1.6000001430511475, 1.0000003576278687)
MeshPart21.BrickColor = BrickColor.new("Light orange")
MeshPart21.brickColor = BrickColor.new("Light orange")
Vector3Value22.Name = "OriginalSize"
Vector3Value22.Parent = MeshPart21
Vector3Value22.Value = Vector3.new(2, 1.6000001430511475, 1.0000003576278687)
Motor6D23.Name = "Waist"
Motor6D23.Parent = MeshPart21
Motor6D23.C0 = CFrame.new(-1.1920929e-07, 0.550000072, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D23.C1 = CFrame.new(-5.96046448e-08, -0.450000018, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D23.Part0 = MeshPart42
Motor6D23.Part1 = MeshPart21
Motor6D23.part1 = MeshPart21
MeshPart24.Name = "LeftFoot"
MeshPart24.Parent = Model0
MeshPart24.CFrame = CFrame.new(40.217453, 897.305115, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart24.Position = Vector3.new(40.21745300292969, 897.3051147460938, 110.1295394897461)
MeshPart24.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart24.Size = Vector3.new(1, 0.3000001907348633, 1)
MeshPart24.BrickColor = BrickColor.new("Light orange")
MeshPart24.CanCollide = false
MeshPart24.brickColor = BrickColor.new("Light orange")
Vector3Value25.Name = "OriginalSize"
Vector3Value25.Parent = MeshPart24
Vector3Value25.Value = Vector3.new(1, 0.3000001907348633, 1)
Motor6D26.Name = "LeftAnkle"
Motor6D26.Parent = MeshPart24
Motor6D26.C0 = CFrame.new(-1.78813934e-07, -0.749997616, 6.29340548e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D26.C1 = CFrame.new(-2.38418579e-07, 0.0500025749, 8.08154482e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D26.Part0 = MeshPart27
Motor6D26.Part1 = MeshPart24
Motor6D26.part1 = MeshPart24
MeshPart27.Name = "LeftLowerLeg"
MeshPart27.Parent = Model0
MeshPart27.CFrame = CFrame.new(40.217453, 898.105103, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart27.Position = Vector3.new(40.21745300292969, 898.1051025390625, 110.1295394897461)
MeshPart27.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart27.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
MeshPart27.BrickColor = BrickColor.new("Light orange")
MeshPart27.CanCollide = false
MeshPart27.brickColor = BrickColor.new("Light orange")
Vector3Value28.Name = "OriginalSize"
Vector3Value28.Parent = MeshPart27
Vector3Value28.Value = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
Motor6D29.Name = "LeftKnee"
Motor6D29.Parent = MeshPart27
Motor6D29.C0 = CFrame.new(5.96046448e-08, -0.299999952, -1.63912773e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D29.C1 = CFrame.new(-0, 0.249999642, -1.78813934e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D29.Part0 = MeshPart30
Motor6D29.Part1 = MeshPart27
Motor6D29.part1 = MeshPart27
MeshPart30.Name = "LeftUpperLeg"
MeshPart30.Parent = Model0
MeshPart30.CFrame = CFrame.new(40.217453, 898.65509, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart30.Position = Vector3.new(40.21745300292969, 898.6550903320312, 110.1295394897461)
MeshPart30.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart30.Size = Vector3.new(1.0000004768371582, 1.2165685892105103, 0.9999668598175049)
MeshPart30.BrickColor = BrickColor.new("Light orange")
MeshPart30.CanCollide = false
MeshPart30.brickColor = BrickColor.new("Light orange")
Vector3Value31.Name = "OriginalSize"
Vector3Value31.Parent = MeshPart30
Vector3Value31.Value = Vector3.new(1.0000003576278687, 1.499999761581421, 0.9999998807907104)
Motor6D32.Name = "LeftHip"
Motor6D32.Parent = MeshPart30
Motor6D32.C0 = CFrame.new(-0.500000119, -0.199999958, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D32.C1 = CFrame.new(5.96046448e-08, 0.5, -1.63912773e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D32.Part0 = MeshPart42
Motor6D32.Part1 = MeshPart30
Motor6D32.part1 = MeshPart30
MeshPart33.Name = "RightFoot"
MeshPart33.Parent = Model0
MeshPart33.CFrame = CFrame.new(41.217453, 897.305115, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart33.Position = Vector3.new(41.21745300292969, 897.3051147460938, 110.1295394897461)
MeshPart33.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart33.Size = Vector3.new(0.9999999403953552, 0.3000001907348633, 1)
MeshPart33.BrickColor = BrickColor.new("Light orange")
MeshPart33.CanCollide = false
MeshPart33.brickColor = BrickColor.new("Light orange")
Vector3Value34.Name = "OriginalSize"
Vector3Value34.Parent = MeshPart33
Vector3Value34.Value = Vector3.new(0.9999999403953552, 0.3000001907348633, 1)
Motor6D35.Name = "RightAnkle"
Motor6D35.Parent = MeshPart33
Motor6D35.C0 = CFrame.new(-0, -0.750000477, 9.82746205e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D35.C1 = CFrame.new(-0, 0.0499997139, 9.84534345e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D35.Part0 = MeshPart36
Motor6D35.Part1 = MeshPart33
Motor6D35.part1 = MeshPart33
MeshPart36.Name = "RightLowerLeg"
MeshPart36.Parent = Model0
MeshPart36.CFrame = CFrame.new(41.217453, 898.105103, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart36.Position = Vector3.new(41.21745300292969, 898.1051025390625, 110.1295394897461)
MeshPart36.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart36.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
MeshPart36.BrickColor = BrickColor.new("Light orange")
MeshPart36.CanCollide = false
MeshPart36.brickColor = BrickColor.new("Light orange")
Vector3Value37.Name = "OriginalSize"
Vector3Value37.Parent = MeshPart36
Vector3Value37.Value = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
Motor6D38.Name = "RightKnee"
Motor6D38.Parent = MeshPart36
Motor6D38.C0 = CFrame.new(-0, -0.299999952, 4.36005103e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D38.C1 = CFrame.new(-0, 0.249999642, 4.35260044e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D38.Part0 = MeshPart39
Motor6D38.Part1 = MeshPart36
Motor6D38.part1 = MeshPart36
MeshPart39.Name = "RightUpperLeg"
MeshPart39.Parent = Model0
MeshPart39.CFrame = CFrame.new(41.217453, 898.65509, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart39.Position = Vector3.new(41.21745300292969, 898.6550903320312, 110.1295394897461)
MeshPart39.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart39.Size = Vector3.new(1.0000004768371582, 1.2165685892105103, 0.9999668598175049)
MeshPart39.BrickColor = BrickColor.new("Light orange")
MeshPart39.CanCollide = false
MeshPart39.brickColor = BrickColor.new("Light orange")
Vector3Value40.Name = "OriginalSize"
Vector3Value40.Parent = MeshPart39
Vector3Value40.Value = Vector3.new(1.0000004768371582, 1.499999761581421, 0.9999998807907104)
Motor6D41.Name = "RightHip"
Motor6D41.Parent = MeshPart39
Motor6D41.C0 = CFrame.new(0.499999881, -0.199999958, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D41.C1 = CFrame.new(-0, 0.5, -1.04308128e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D41.Part0 = MeshPart42
Motor6D41.Part1 = MeshPart39
Motor6D41.part1 = MeshPart39
MeshPart42.Name = "LowerTorso"
MeshPart42.Parent = Model0
MeshPart42.CFrame = CFrame.new(40.717453, 899.355103, 110.129539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart42.Position = Vector3.new(40.71745300292969, 899.3551025390625, 110.1295394897461)
MeshPart42.Color = Color3.new(0.917647, 0.721569, 0.572549)
MeshPart42.Size = Vector3.new(1.999999761581421, 0.3999999761581421, 1.0000001192092896)
MeshPart42.BrickColor = BrickColor.new("Light orange")
MeshPart42.brickColor = BrickColor.new("Light orange")
Vector3Value43.Name = "OriginalSize"
Vector3Value43.Parent = MeshPart42
Vector3Value43.Value = Vector3.new(1.999999761581421, 0.3999999761581421, 1.0000001192092896)
Motor6D44.Name = "Root"
Motor6D44.Parent = MeshPart42
Motor6D44.C1 = CFrame.new(-1.1920929e-07, 0.150000036, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D44.Part0 = Part1
Motor6D44.Part1 = MeshPart42
Motor6D44.part1 = MeshPart42
Humanoid45.Parent = Model0
Humanoid45.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid45.Health = 5000
Humanoid45.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid45.HipHeight = 1.350000023841858
Humanoid45.LeftLeg = MeshPart30
Humanoid45.MaxHealth = 5000
Humanoid45.RigType = Enum.HumanoidRigType.R15
Humanoid45.RightLeg = MeshPart39
Humanoid45.Torso = Part1
Humanoid45.WalkSpeed = 50
Humanoid45.maxHealth = 5000
Part46.Name = "Head"
Part46.Parent = Model0
Part46.CFrame = CFrame.new(40.717453, 901.65509, 110.129814, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part46.Position = Vector3.new(40.71745300292969, 901.6550903320312, 110.12981414794922)
Part46.Color = Color3.new(0.917647, 0.721569, 0.572549)
Part46.Size = Vector3.new(2, 1, 1)
Part46.BottomSurface = Enum.SurfaceType.Smooth
Part46.BrickColor = BrickColor.new("Light orange")
Part46.TopSurface = Enum.SurfaceType.Smooth
Part46.brickColor = BrickColor.new("Light orange")
SpecialMesh47.Parent = Part46
SpecialMesh47.Scale = Vector3.new(1.25, 1.25, 1.25)
Vector3Value48.Name = "OriginalSize"
Vector3Value48.Parent = Part46
Vector3Value48.Value = Vector3.new(2, 1, 1)
Motor6D49.Name = "Neck"
Motor6D49.Parent = Part46
Motor6D49.C0 = CFrame.new(-5.96046448e-08, 0.799999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D49.C1 = CFrame.new(-0, -0.500000119, -0.000272244215, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Motor6D49.Part0 = MeshPart21
Motor6D49.Part1 = Part46
Motor6D49.part1 = Part46
Decal50.Name = "Face"
Decal50.Parent = Part46
Decal50.Texture = "rbxasset://textures/face.png"
Weld51.Name = "HeadWeld"
Weld51.Parent = Part46
Weld51.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld51.C1 = CFrame.new(-4.94768356e-05, -0.608176947, 0.195032001, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Weld51.Part0 = Part46
Weld51.Part1 = Part56
Weld51.part1 = Part56
Weld52.Name = "HeadWeld"
Weld52.Parent = Part46
Weld52.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld52.Part0 = Part46
Weld52.Part1 = Part129
Weld52.part1 = Part129
BodyColors53.Parent = Model0
BodyColors53.HeadColor = BrickColor.new("Medium stone grey")
BodyColors53.HeadColor3 = Color3.new(0.639216, 0.635294, 0.647059)
BodyColors53.LeftArmColor = BrickColor.new("Medium stone grey")
BodyColors53.LeftArmColor3 = Color3.new(0.639216, 0.635294, 0.647059)
BodyColors53.LeftLegColor = BrickColor.new("Medium stone grey")
BodyColors53.LeftLegColor3 = Color3.new(0.639216, 0.635294, 0.647059)
BodyColors53.RightArmColor = BrickColor.new("Medium stone grey")
BodyColors53.RightArmColor3 = Color3.new(0.639216, 0.635294, 0.647059)
BodyColors53.RightLegColor = BrickColor.new("Medium stone grey")
BodyColors53.RightLegColor3 = Color3.new(0.639216, 0.635294, 0.647059)
BodyColors53.TorsoColor = BrickColor.new("Medium stone grey")
BodyColors53.TorsoColor3 = Color3.new(0.639216, 0.635294, 0.647059)
ObjectValue54.Name = "flambro"
ObjectValue54.Parent = Model0
Accessory55.Name = "Toony Antlers"
Accessory55.Parent = Model0
Accessory55.AttachmentForward = Vector3.new(-3.029981271446139e-15, 4.1444258024012927e-16, -1)
Accessory55.AttachmentPoint = CFrame.new(-4.94768356e-05, -0.608176947, 0.195032001, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Accessory55.AttachmentPos = Vector3.new(-0.00004947683555656113, -0.6081769466400146, 0.195032000541687)
Accessory55.AttachmentRight = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
Accessory55.AttachmentUp = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
Part56.Name = "Handle"
Part56.Parent = Accessory55
Part56.CFrame = CFrame.new(40.7175026, 902.763245, 109.934784, 1, -7.87137555e-09, -3.02998127e-15, 7.87137555e-09, 1, 4.14442554e-16, 3.02998127e-15, -4.1444258e-16, 1)
Part56.Position = Vector3.new(40.71750259399414, 902.7632446289062, 109.93478393554688)
Part56.Size = Vector3.new(1, 1, 1)
Part56.BottomSurface = Enum.SurfaceType.Smooth
Part56.CanCollide = false
Part56.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh57.Name = "SpecialMesh"
SpecialMesh57.Parent = Part56
SpecialMesh57.MeshId = "rbxassetid://5197531506"
SpecialMesh57.TextureId = "rbxassetid://6202042346"
SpecialMesh57.MeshType = Enum.MeshType.FileMesh
StringValue58.Name = "AvatarPartScaleType"
StringValue58.Parent = Part56
StringValue58.Value = "Classic"
Vector3Value59.Name = "OriginalSize"
Vector3Value59.Parent = Part56
Vector3Value59.Value = Vector3.new(1, 1, 1)
Configuration60.Name = "ThumbnailConfiguration"
Configuration60.Parent = Accessory55
ObjectValue61.Name = "ThumbnailCameraTarget"
ObjectValue61.Parent = Configuration60
ObjectValue61.Value = Part56
CFrameValue62.Name = "ThumbnailCameraValue"
CFrameValue62.Parent = Configuration60
CFrameValue62.Value = CFrame.new(-0.604797363, 0.209094048, -1.78956604, -0.97160399, 0.0267423093, -0.235097095, 0, 0.99359268, 0.113021217, 0.236613169, 0.109811865, -0.965378523)
Script63.Name = "Animate"
Script63.Parent = Model0
Script63.Enabled = false
table.insert(cors,sandbox(Script63,function()
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")
local pose = "Standing"

local userNoUpdateOnLoopSuccess, userNoUpdateOnLoopValue = pcall(function() return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop") end)
local userNoUpdateOnLoop = userNoUpdateOnLoopSuccess and userNoUpdateOnLoopValue

local userEmoteToRunThresholdChange do
	local success, value = pcall(function()
		return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange")
	end)
	userEmoteToRunThresholdChange = success and value
end

local userPlayEmoteByIdAnimTrackReturn do
	local success, value = pcall(function()
		return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2")
	end)
	userPlayEmoteByIdAnimTrackReturn = success and value
end

local animateScriptEmoteHookFlagExists, animateScriptEmoteHookFlagEnabled = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAnimateScriptEmoteHook")
end)
local FFlagAnimateScriptEmoteHook = animateScriptEmoteHookFlagExists and animateScriptEmoteHookFlagEnabled

local FFlagUserFixLoadAnimationError do
	local success, result = pcall(function()
		return UserSettings():IsUserFeatureEnabled("UserFixLoadAnimationError")
	end)
	FFlagUserFixLoadAnimationError = success and result
end

local AnimationSpeedDampeningObject = script:FindFirstChild("ScaleDampeningPercent")
local HumanoidHipHeight = 2

local EMOTE_TRANSITION_TIME = 0.1

local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0

local runAnimTrack = nil
local runAnimKeyframeHandler = nil

local PreloadedAnims = {}

local animTable = {}
local animNames = { 
	idle = 	{	
		{ id = "http://www.roblox.com/asset/?id=507766666", weight = 1 },
		{ id = "http://www.roblox.com/asset/?id=507766951", weight = 1 },
		{ id = "http://www.roblox.com/asset/?id=507766388", weight = 9 }
	},
	walk = 	{ 	
		{ id = "http://www.roblox.com/asset/?id=507777826", weight = 10 } 
	}, 
	run = 	{
		{ id = "http://www.roblox.com/asset/?id=507767714", weight = 10 } 
	}, 
	swim = 	{
		{ id = "http://www.roblox.com/asset/?id=507784897", weight = 10 } 
	}, 
	swimidle = 	{
		{ id = "http://www.roblox.com/asset/?id=507785072", weight = 10 } 
	}, 
	jump = 	{
		{ id = "http://www.roblox.com/asset/?id=507765000", weight = 10 } 
	}, 
	fall = 	{
		{ id = "http://www.roblox.com/asset/?id=507767968", weight = 10 } 
	}, 
	climb = {
		{ id = "http://www.roblox.com/asset/?id=507765644", weight = 10 } 
	}, 
	sit = 	{
		{ id = "http://www.roblox.com/asset/?id=2506281703", weight = 10 } 
	},	
	toolnone = {
		{ id = "http://www.roblox.com/asset/?id=507768375", weight = 10 } 
	},
	toolslash = {
		{ id = "http://www.roblox.com/asset/?id=522635514", weight = 10 } 
	},
	toollunge = {
		{ id = "http://www.roblox.com/asset/?id=522638767", weight = 10 } 
	},
	wave = {
		{ id = "http://www.roblox.com/asset/?id=507770239", weight = 10 } 
	},
	point = {
		{ id = "http://www.roblox.com/asset/?id=507770453", weight = 10 } 
	},
	dance = {
		{ id = "http://www.roblox.com/asset/?id=507771019", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507771955", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507772104", weight = 10 } 
	},
	dance2 = {
		{ id = "http://www.roblox.com/asset/?id=507776043", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507776720", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507776879", weight = 10 } 
	},
	dance3 = {
		{ id = "http://www.roblox.com/asset/?id=507777268", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507777451", weight = 10 }, 
		{ id = "http://www.roblox.com/asset/?id=507777623", weight = 10 } 
	},
	laugh = {
		{ id = "http://www.roblox.com/asset/?id=507770818", weight = 10 } 
	},
	cheer = {
		{ id = "http://www.roblox.com/asset/?id=507770677", weight = 10 } 
	},
}

-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
local emoteNames = { wave = false, point = false, dance = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

math.randomseed(tick())

function findExistingAnimationInSet(set, anim)
	if set == nil or anim == nil then
		return 0
	end

	for idx = 1, set.count, 1 do 
		if set[idx].anim.AnimationId == anim.AnimationId then
			return idx
		end
	end

	return 0
end

function configureAnimationSet(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	local allowCustomAnimations = true

	local success, msg = pcall(function() allowCustomAnimations = game:GetService("StarterPlayer").AllowCustomAnimations end)
	if not success then
		allowCustomAnimations = true
	end

	-- check for config values
	local config = script:FindFirstChild(name)
	if (allowCustomAnimations and config ~= nil) then
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))

		local idx = 0
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				local newWeight = 1
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject ~= nil) then
					newWeight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				idx = animTable[name].count
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				animTable[name][idx].weight = newWeight
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				table.insert(animTable[name].connections, childPart.ChildAdded:connect(function(property) configureAnimationSet(name, fileList) end))
				table.insert(animTable[name].connections, childPart.ChildRemoved:connect(function(property) configureAnimationSet(name, fileList) end))
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
		end
	end

	-- preload anims
	for i, animType in pairs(animTable) do
		for idx = 1, animType.count, 1 do
			if PreloadedAnims[animType[idx].anim.AnimationId] == nil then
				Humanoid:LoadAnimation(animType[idx].anim)
				PreloadedAnims[animType[idx].anim.AnimationId] = true
			end				
		end
	end
end

------------------------------------------------------------------------------------------------------------

function configureAnimationSetOld(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	local allowCustomAnimations = true

	local success, msg = pcall(function() allowCustomAnimations = game:GetService("StarterPlayer").AllowCustomAnimations end)
	if not success then
		allowCustomAnimations = true
	end

	-- check for config values
	local config = script:FindFirstChild(name)
	if (allowCustomAnimations and config ~= nil) then
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
		local idx = 1
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject == nil) then
					animTable[name][idx].weight = 1
				else
					animTable[name][idx].weight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
				idx = idx + 1
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
			-- print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
		end
	end

	-- preload anims
	for i, animType in pairs(animTable) do
		for idx = 1, animType.count, 1 do 
			Humanoid:LoadAnimation(animType[idx].anim)
		end
	end
end

-- Setup animation objects
function scriptChildModified(child)
	local fileList = animNames[child.Name]
	if (fileList ~= nil) then
		configureAnimationSet(child.Name, fileList)
	end	
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)


for name, fileList in pairs(animNames) do 
	configureAnimationSet(name, fileList)
end	

-- ANIMATION

-- declarations
local toolAnim = "None"
local toolAnimTime = 0

local jumpAnimTime = 0
local jumpAnimDuration = 0.31

local toolTransitionTime = 0.1
local fallTransitionTime = 0.2

local currentlyPlayingEmote = false

-- functions

function stopAllAnimations()
	local oldAnim = currentAnim

	-- return to idle if finishing an emote
	if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
		oldAnim = "idle"
	end

	if FFlagAnimateScriptEmoteHook and currentlyPlayingEmote then
		oldAnim = "idle"
		currentlyPlayingEmote = false
	end

	currentAnim = ""
	currentAnimInstance = nil
	if (currentAnimKeyframeHandler ~= nil) then
		currentAnimKeyframeHandler:disconnect()
	end

	if (currentAnimTrack ~= nil) then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end

	-- clean up walk if there is one
	if (runAnimKeyframeHandler ~= nil) then
		runAnimKeyframeHandler:disconnect()
	end

	if (runAnimTrack ~= nil) then
		runAnimTrack:Stop()
		runAnimTrack:Destroy()
		runAnimTrack = nil
	end

	return oldAnim
end

function getHeightScale()
	if Humanoid then
		if not Humanoid.AutomaticScalingEnabled then
			return 1
		end

		local scale = Humanoid.HipHeight / HumanoidHipHeight
		if AnimationSpeedDampeningObject == nil then
			AnimationSpeedDampeningObject = script:FindFirstChild("ScaleDampeningPercent")
		end
		if AnimationSpeedDampeningObject ~= nil then
			scale = 1 + (Humanoid.HipHeight - HumanoidHipHeight) * AnimationSpeedDampeningObject.Value / HumanoidHipHeight
		end
		return scale
	end	
	return 1
end

local function rootMotionCompensation(speed)
	local speedScaled = speed * 1.25
	local heightScale = getHeightScale()
	local runSpeed = speedScaled / heightScale
	return runSpeed
end

local smallButNotZero = 0.0001
local function setRunSpeed(speed)
	local normalizedWalkSpeed = 0.5 -- established empirically using current `913402848` walk animation
	local normalizedRunSpeed  = 1
	local runSpeed = rootMotionCompensation(speed)

	local walkAnimationWeight = smallButNotZero
	local runAnimationWeight = smallButNotZero
	local walkAnimationTimewarp = runSpeed/normalizedWalkSpeed
	local runAnimationTimerwarp = runSpeed/normalizedRunSpeed

	if runSpeed <= normalizedWalkSpeed then
		walkAnimationWeight = 1
	elseif runSpeed < normalizedRunSpeed then
		local fadeInRun = (runSpeed - normalizedWalkSpeed)/(normalizedRunSpeed - normalizedWalkSpeed)
		walkAnimationWeight = 1 - fadeInRun
		runAnimationWeight  = fadeInRun
		walkAnimationTimewarp = 1
		runAnimationTimerwarp = 1
	else
		runAnimationWeight = 1
	end
	currentAnimTrack:AdjustWeight(walkAnimationWeight)
	runAnimTrack:AdjustWeight(runAnimationWeight)
	currentAnimTrack:AdjustSpeed(walkAnimationTimewarp)
	runAnimTrack:AdjustSpeed(runAnimationTimerwarp)
end

function setAnimationSpeed(speed)
	if currentAnim == "walk" then
		setRunSpeed(speed)
	else
		if speed ~= currentAnimSpeed then
			currentAnimSpeed = speed
			currentAnimTrack:AdjustSpeed(currentAnimSpeed)
		end
	end
end

function keyFrameReachedFunc(frameName)
	if (frameName == "End") then
		if currentAnim == "walk" then
			if userNoUpdateOnLoop == true then
				if runAnimTrack.Looped ~= true then
					runAnimTrack.TimePosition = 0.0
				end
				if currentAnimTrack.Looped ~= true then
					currentAnimTrack.TimePosition = 0.0
				end
			else
				runAnimTrack.TimePosition = 0.0
				currentAnimTrack.TimePosition = 0.0
			end
		else
			local repeatAnim = currentAnim
			-- return to idle if finishing an emote
			if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
				repeatAnim = "idle"
			end

			if FFlagAnimateScriptEmoteHook and currentlyPlayingEmote then
				if currentAnimTrack.Looped then
					-- Allow the emote to loop
					return
				end

				repeatAnim = "idle"
				currentlyPlayingEmote = false
			end

			local animSpeed = currentAnimSpeed
			playAnimation(repeatAnim, 0.15, Humanoid)
			setAnimationSpeed(animSpeed)
		end
	end
end

function rollAnimation(animName)
	local roll = math.random(1, animTable[animName].totalWeight) 
	local origRoll = roll
	local idx = 1
	while (roll > animTable[animName][idx].weight) do
		roll = roll - animTable[animName][idx].weight
		idx = idx + 1
	end
	return idx
end

local function switchToAnim(anim, animName, transitionTime, humanoid)
	-- switch animation		
	if (anim ~= currentAnimInstance) then

		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop(transitionTime)
			currentAnimTrack:Destroy()
		end

		if (runAnimTrack ~= nil) then
			runAnimTrack:Stop(transitionTime)
			runAnimTrack:Destroy()
			if userNoUpdateOnLoop == true then
				runAnimTrack = nil
			end
		end

		currentAnimSpeed = 1.0

		-- load it to the humanoid; get AnimationTrack
		currentAnimTrack = humanoid:LoadAnimation(anim)
		currentAnimTrack.Priority = Enum.AnimationPriority.Core

		-- play the animation
		currentAnimTrack:Play(transitionTime)
		currentAnim = animName
		currentAnimInstance = anim

		-- set up keyframe name triggers
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
		currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)

		-- check to see if we need to blend a walk/run animation
		if animName == "walk" then
			local runAnimName = "run"
			local runIdx = rollAnimation(runAnimName)

			runAnimTrack = humanoid:LoadAnimation(animTable[runAnimName][runIdx].anim)
			runAnimTrack.Priority = Enum.AnimationPriority.Core
			runAnimTrack:Play(transitionTime)		

			if (runAnimKeyframeHandler ~= nil) then
				runAnimKeyframeHandler:disconnect()
			end
			runAnimKeyframeHandler = runAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)	
		end
	end
end

function playAnimation(animName, transitionTime, humanoid) 	
	local idx = rollAnimation(animName)
	local anim = animTable[animName][idx].anim

	switchToAnim(anim, animName, transitionTime, humanoid)
	currentlyPlayingEmote = false
end

function playEmote(emoteAnim, transitionTime, humanoid)
	switchToAnim(emoteAnim, emoteAnim.Name, transitionTime, humanoid)
	currentlyPlayingEmote = true
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

local toolAnimName = ""
local toolAnimTrack = nil
local toolAnimInstance = nil
local currentToolAnimKeyframeHandler = nil

function toolKeyFrameReachedFunc(frameName)
	if (frameName == "End") then
		playToolAnimation(toolAnimName, 0.0, Humanoid)
	end
end


function playToolAnimation(animName, transitionTime, humanoid, priority)	 		
	local idx = rollAnimation(animName)
	local anim = animTable[animName][idx].anim

	if (toolAnimInstance ~= anim) then

		if (toolAnimTrack ~= nil) then
			toolAnimTrack:Stop()
			toolAnimTrack:Destroy()
			transitionTime = 0
		end

		-- load it to the humanoid; get AnimationTrack
		toolAnimTrack = humanoid:LoadAnimation(anim)
		if priority then
			toolAnimTrack.Priority = priority
		end

		-- play the animation
		toolAnimTrack:Play(transitionTime)
		toolAnimName = animName
		toolAnimInstance = anim

		currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
	end
end

function stopToolAnimations()
	local oldAnim = toolAnimName

	if (currentToolAnimKeyframeHandler ~= nil) then
		currentToolAnimKeyframeHandler:disconnect()
	end

	toolAnimName = ""
	toolAnimInstance = nil
	if (toolAnimTrack ~= nil) then
		toolAnimTrack:Stop()
		toolAnimTrack:Destroy()
		toolAnimTrack = nil
	end

	return oldAnim
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- STATE CHANGE HANDLERS

function onRunning(speed)
	local movedDuringEmote =
		userEmoteToRunThresholdChange and currentlyPlayingEmote and Humanoid.MoveDirection == Vector3.new(0, 0, 0)
	local speedThreshold = movedDuringEmote and Humanoid.WalkSpeed or 0.75
	if speed > speedThreshold then
		local scale = 16.0
		playAnimation("walk", 0.2, Humanoid)
		setAnimationSpeed(speed / scale)
		pose = "Running"
	else
		if emoteNames[currentAnim] == nil and not currentlyPlayingEmote then
			playAnimation("idle", 0.2, Humanoid)
			pose = "Standing"
		end
	end
end

function onDied()
	pose = "Dead"
end

function onJumping()
	playAnimation("jump", 0.1, Humanoid)
	jumpAnimTime = jumpAnimDuration
	pose = "Jumping"
end

function onClimbing(speed)
	local scale = 5.0
	playAnimation("climb", 0.1, Humanoid)
	setAnimationSpeed(speed / scale)
	pose = "Climbing"
end

function onGettingUp()
	pose = "GettingUp"
end

function onFreeFall()
	if (jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	end
	pose = "FreeFall"
end

function onFallingDown()
	pose = "FallingDown"
end

function onSeated()
	pose = "Seated"
end

function onPlatformStanding()
	pose = "PlatformStanding"
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

function onSwimming(speed)
	if speed > 1.00 then
		local scale = 10.0
		playAnimation("swim", 0.4, Humanoid)
		setAnimationSpeed(speed / scale)
		pose = "Swimming"
	else
		playAnimation("swimidle", 0.4, Humanoid)
		pose = "Standing"
	end
end

function animateTool()
	if (toolAnim == "None") then
		playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
		return
	end

	if (toolAnim == "Slash") then
		playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end

	if (toolAnim == "Lunge") then
		playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end
end

function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end

local lastTick = 0

function stepAnimate(currentTime)
	local amplitude = 1
	local frequency = 1
	local deltaTime = currentTime - lastTick
	lastTick = currentTime

	local climbFudge = 0
	local setAngles = false

	if (jumpAnimTime > 0) then
		jumpAnimTime = jumpAnimTime - deltaTime
	end

	if (pose == "FreeFall" and jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	elseif (pose == "Seated") then
		playAnimation("sit", 0.5, Humanoid)
		return
	elseif (pose == "Running") then
		playAnimation("walk", 0.2, Humanoid)
	elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
		stopAllAnimations()
		amplitude = 0.1
		frequency = 1
		setAngles = true
	end

	-- Tool Animation handling
	local tool = Character:FindFirstChildOfClass("Tool")
	if tool and tool:FindFirstChild("Handle") then
		local animStringValueObject = getToolAnim(tool)

		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = currentTime + .3
		end

		if currentTime > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end

		animateTool()		
	else
		stopToolAnimations()
		toolAnim = "None"
		toolAnimInstance = nil
		toolAnimTime = 0
	end
end

-- connect events
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)

-- setup emote chat hook

-- emote bindable hook
if FFlagAnimateScriptEmoteHook then
	script:WaitForChild("PlayEmote").OnInvoke = function(emote)
		-- Only play emotes when idling
		if pose ~= "Standing" then
			return
		end

		if emoteNames[emote] ~= nil then
			-- Default emotes
			playAnimation(emote, EMOTE_TRANSITION_TIME, Humanoid)

			if userPlayEmoteByIdAnimTrackReturn then
				return true, currentAnimTrack
			else
				return true
			end
		elseif typeof(emote) == "Instance" and emote:IsA("Animation") then
			-- Non-default emotes
			playEmote(emote, EMOTE_TRANSITION_TIME, Humanoid)

			if userPlayEmoteByIdAnimTrackReturn then
				return true, currentAnimTrack
			else
				return true
			end
		end

		-- Return false to indicate that the emote could not be played
		return false
	end
end

if (not FFlagUserFixLoadAnimationError) or Character.Parent ~= nil then
	-- initialize to idle
	playAnimation("idle", 0.1, Humanoid)
	pose = "Standing"
end

-- loop to handle timed state transitions and tool animations
while Character.Parent ~= nil do
	local _, currentGameTime = wait(0.1)
	stepAnimate(currentGameTime)
end


end))
Script63.Disabled = true
StringValue64.Name = "cheer"
StringValue64.Parent = Script63
Animation65.Name = "CheerAnim"
Animation65.Parent = StringValue64
Animation65.AnimationId = "http://www.roblox.com/asset/?id=507770677"
StringValue66.Name = "swimidle"
StringValue66.Parent = Script63
Animation67.Name = "SwimIdle"
Animation67.Parent = StringValue66
Animation67.AnimationId = "http://www.roblox.com/asset/?id=742639812"
StringValue68.Name = "dance"
StringValue68.Parent = Script63
Animation69.Name = "Animation1"
Animation69.Parent = StringValue68
Animation69.AnimationId = "http://www.roblox.com/asset/?id=507771019"
NumberValue70.Name = "Weight"
NumberValue70.Parent = Animation69
NumberValue70.Value = 10
Animation71.Name = "Animation2"
Animation71.Parent = StringValue68
Animation71.AnimationId = "http://www.roblox.com/asset/?id=507771955"
NumberValue72.Name = "Weight"
NumberValue72.Parent = Animation71
NumberValue72.Value = 10
Animation73.Name = "Animation3"
Animation73.Parent = StringValue68
Animation73.AnimationId = "http://www.roblox.com/asset/?id=507772104"
NumberValue74.Name = "Weight"
NumberValue74.Parent = Animation73
NumberValue74.Value = 10
StringValue75.Name = "dance2"
StringValue75.Parent = Script63
Animation76.Name = "Animation1"
Animation76.Parent = StringValue75
Animation76.AnimationId = "http://www.roblox.com/asset/?id=507776043"
NumberValue77.Name = "Weight"
NumberValue77.Parent = Animation76
NumberValue77.Value = 10
Animation78.Name = "Animation2"
Animation78.Parent = StringValue75
Animation78.AnimationId = "http://www.roblox.com/asset/?id=507776720"
NumberValue79.Name = "Weight"
NumberValue79.Parent = Animation78
NumberValue79.Value = 10
Animation80.Name = "Animation3"
Animation80.Parent = StringValue75
Animation80.AnimationId = "http://www.roblox.com/asset/?id=507776879"
NumberValue81.Name = "Weight"
NumberValue81.Parent = Animation80
NumberValue81.Value = 10
StringValue82.Name = "dance3"
StringValue82.Parent = Script63
Animation83.Name = "Animation1"
Animation83.Parent = StringValue82
Animation83.AnimationId = "http://www.roblox.com/asset/?id=507777268"
NumberValue84.Name = "Weight"
NumberValue84.Parent = Animation83
NumberValue84.Value = 10
Animation85.Name = "Animation2"
Animation85.Parent = StringValue82
Animation85.AnimationId = "http://www.roblox.com/asset/?id=507777451"
NumberValue86.Name = "Weight"
NumberValue86.Parent = Animation85
NumberValue86.Value = 10
Animation87.Name = "Animation3"
Animation87.Parent = StringValue82
Animation87.AnimationId = "http://www.roblox.com/asset/?id=507777623"
NumberValue88.Name = "Weight"
NumberValue88.Parent = Animation87
NumberValue88.Value = 10
StringValue89.Name = "run"
StringValue89.Parent = Script63
Animation90.Name = "RunAnim"
Animation90.Parent = StringValue89
Animation90.AnimationId = "http://www.roblox.com/asset/?id=742638842"
StringValue91.Name = "climb"
StringValue91.Parent = Script63
Animation92.Name = "ClimbAnim"
Animation92.Parent = StringValue91
Animation92.AnimationId = "http://www.roblox.com/asset/?id=742636889"
StringValue93.Name = "fall"
StringValue93.Parent = Script63
Animation94.Name = "FallAnim"
Animation94.Parent = StringValue93
Animation94.AnimationId = "http://www.roblox.com/asset/?id=742637151"
StringValue95.Name = "laugh"
StringValue95.Parent = Script63
Animation96.Name = "LaughAnim"
Animation96.Parent = StringValue95
Animation96.AnimationId = "http://www.roblox.com/asset/?id=507770818"
StringValue97.Name = "point"
StringValue97.Parent = Script63
Animation98.Name = "PointAnim"
Animation98.Parent = StringValue97
Animation98.AnimationId = "http://www.roblox.com/asset/?id=507770453"
StringValue99.Name = "sit"
StringValue99.Parent = Script63
Animation100.Name = "SitAnim"
Animation100.Parent = StringValue99
Animation100.AnimationId = "http://www.roblox.com/asset/?id=2506281703"
StringValue101.Name = "toollunge"
StringValue101.Parent = Script63
Animation102.Name = "ToolLungeAnim"
Animation102.Parent = StringValue101
Animation102.AnimationId = "http://www.roblox.com/asset/?id=522638767"
StringValue103.Name = "toolnone"
StringValue103.Parent = Script63
Animation104.Name = "ToolNoneAnim"
Animation104.Parent = StringValue103
Animation104.AnimationId = "http://www.roblox.com/asset/?id=507768375"
StringValue105.Name = "toolslash"
StringValue105.Parent = Script63
Animation106.Name = "ToolSlashAnim"
Animation106.Parent = StringValue105
Animation106.AnimationId = "http://www.roblox.com/asset/?id=522635514"
StringValue107.Name = "wave"
StringValue107.Parent = Script63
Animation108.Name = "WaveAnim"
Animation108.Parent = StringValue107
Animation108.AnimationId = "http://www.roblox.com/asset/?id=507770239"
NumberValue109.Name = "ScaleDampeningPercent"
NumberValue109.Parent = Script63
NumberValue109.Value = 0.4000000059604645
StringValue110.Name = "walk"
StringValue110.Parent = Script63
Animation111.Name = "WalkAnim"
Animation111.Parent = StringValue110
Animation111.AnimationId = "http://www.roblox.com/asset/?id=742640026"
StringValue112.Name = "jump"
StringValue112.Parent = Script63
Animation113.Name = "!ID!"
Animation113.Parent = StringValue112
Animation113.AnimationId = "http://www.roblox.com/asset/?id=742637942"
StringValue114.Name = "swim"
StringValue114.Parent = Script63
Animation115.Name = "Swim"
Animation115.Parent = StringValue114
Animation115.AnimationId = "http://www.roblox.com/asset/?id=742639220"
BindableFunction116.Name = "PlayEmote"
BindableFunction116.Parent = Script63
StringValue117.Name = "idle"
StringValue117.Parent = Script63
Animation118.Name = "Animation1"
Animation118.Parent = StringValue117
Animation118.AnimationId = "http://www.roblox.com/asset/?id=742637544"
NumberValue119.Name = "Weight"
NumberValue119.Parent = Animation118
NumberValue119.Value = 9
Animation120.Name = "Animation2"
Animation120.Parent = StringValue117
Animation120.AnimationId = "http://www.roblox.com/asset/?id=742638445"
NumberValue121.Name = "Weight"
NumberValue121.Parent = Animation120
NumberValue121.Value = 1
StringValue122.Name = "pose"
StringValue122.Parent = Script63
Animation123.Name = "CartoonyPose"
Animation123.Parent = StringValue122
Animation123.AnimationId = "http://www.roblox.com/asset/?id=885477856"
NumberValue124.Name = "Weight"
NumberValue124.Parent = Animation123
Shirt125.Parent = Model0
Shirt125.ShirtTemplate = "http://www.roblox.com/asset/?id=6709022128"
Pants126.Parent = Model0
Pants126.PantsTemplate = "http://www.roblox.com/asset/?id=7196360722"
BodyColors127.Parent = Model0
BodyColors127.HeadColor = BrickColor.new("Light orange")
BodyColors127.HeadColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors127.LeftArmColor = BrickColor.new("Light orange")
BodyColors127.LeftArmColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors127.LeftLegColor = BrickColor.new("Light orange")
BodyColors127.LeftLegColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors127.RightArmColor = BrickColor.new("Light orange")
BodyColors127.RightArmColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors127.RightLegColor = BrickColor.new("Light orange")
BodyColors127.RightLegColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors127.TorsoColor = BrickColor.new("Light orange")
BodyColors127.TorsoColor3 = Color3.new(0.917647, 0.721569, 0.572549)
Accessory128.Name = "Ultra-Fabulous Hair"
Accessory128.Parent = Model0
Part129.Name = "Handle"
Part129.Parent = Accessory128
Part129.CFrame = CFrame.new(40.717453, 902.15509, 110.129814, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part129.Position = Vector3.new(40.71745300292969, 902.1550903320312, 110.12981414794922)
Part129.Size = Vector3.new(2, 2, 2)
Part129.BottomSurface = Enum.SurfaceType.Smooth
Part129.CanCollide = false
Part129.Locked = true
Part129.TopSurface = Enum.SurfaceType.Smooth
Part129.FormFactor = Enum.FormFactor.Symmetric
Part129.formFactor = Enum.FormFactor.Symmetric
SpecialMesh130.Parent = Part129
SpecialMesh130.MeshId = "http://www.roblox.com/asset/?id=16627529"
SpecialMesh130.Scale = Vector3.new(1.0499999523162842, 1.0499999523162842, 1.0499999523162842)
SpecialMesh130.TextureId = "http://www.roblox.com/asset/?id=16627494"
SpecialMesh130.MeshType = Enum.MeshType.FileMesh
Vector3Value131.Name = "OriginalSize"
Vector3Value131.Parent = Part129
Vector3Value131.Value = Vector3.new(2, 2, 2)
BoolValue132.Name = "IsRaider"
BoolValue132.Parent = Model0
BoolValue132.Value = true
Script133.Name = "AINEW"
Script133.Parent = Model0
Script133.Enabled = false
table.insert(cors,sandbox(Script133,function()
figure = script.Parent
root = figure.HumanoidRootPart
hum = figure.Humanoid
lolwhat =  {"LOSER ALERT","LOL LOOK AT THEM","EAT THAT LOSER","look at that freak","LOL U GOT NO VBUCKS"}
pathservice = game:GetService("PathfindingService")
tweenservice = game:GetService("TweenService")
debris = game:GetService("Debris")
-- Values

israider = figure.IsRaider
flambro = figure.flambro
boolying = true

-- Damage

for _,v in pairs(figure:GetChildren()) do
	if v:IsA("BasePart") then
		v.Touched:Connect(function(hit)
			if hit.Parent ~= figure and hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent:FindFirstChild("IsRaider") == nil and hit.Parent ~= flambro.Value then
				local dedlol = Instance.new("BoolValue",hit.Parent)
				dedlol.Name = "DED"
				hit.Parent:BreakJoints()
			end
		end)
	end
end

-- o no

spawn(function()
	for i = 1,34 do
		game:GetService("Chat"):Chat(figure.Head,tostring(lolwhat[math.random(#lolwhat)]),Enum.ChatColor.White)
		if hum.Health <= 0.1 then
			break
		end
		wait(0.5)
	end

	boolying = false
	figure:BreakJoints()

	function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
		local speedthing = 1
		local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
		tween:Play()
		if waitthing == true then
			tween.Completed:Wait()
			tween:Destroy()
		end
		return tween
	end

	for _,v in pairs(figure:GetDescendants()) do
		if v:IsA("BasePart") then
			local bv = Instance.new("BodyVelocity",v)
			bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			bv.Velocity = Vector3.new(0,20,0)
			local bg = Instance.new("BodyGyro",v)
			bg.MaxTorque = Vector3.new(400000,400000,400000)
			bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			bg.P = 1500
			tweenobject(v,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
			spawn(function()
				tweenobject(v,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,true)
				v:Destroy()
			end)
		end
	end

	wait(5)
	script.Parent:Destroy()
end)

while true do
	game:GetService("RunService").Heartbeat:Wait()
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChild("IsRaider") == nil and v ~= flambro.Value and v:FindFirstChild("LETMEGETYA") == nil and v:FindFirstChild("DED") == nil then
			local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso")
			local vhum = v:FindFirstChildOfClass("Humanoid")
			if vhum.Health > 0.1 then
				if vroot == nil then
				else
					repeat
						local alol = Instance.new("BoolValue",v)
						alol.Name = "LETMEGETYA"
						debris:AddItem(alol,0.25)
						local path = pathservice:CreatePath()
						path:ComputeAsync(root.Position,vroot.Position)
						local waypoints = path:GetWaypoints()

						if vhum.Health < 0.1 or path.Status == Enum.PathStatus.NoPath then
							break
						end
						for _,points in pairs(waypoints) do
							if vhum.Health < 0.1 or path.Status == Enum.PathStatus.NoPath then
								break
							end
							if points.Action == Enum.PathWaypointAction.Jump then
								hum:ChangeState(Enum.HumanoidStateType.Jumping)
							end
							hum:MoveTo(points.Position)
						end
					until vhum.Health < 0.1
				end
			end
		end
	end
end
end))
Script133.Disabled = true
for i,v in pairs(mas:GetChildren()) do
	v.Parent = bullyfolder
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end


-- Sutart Dad


--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Part1 = Instance.new("Part")
SpecialMesh2 = Instance.new("SpecialMesh")
Decal3 = Instance.new("Decal")
Weld4 = Instance.new("Weld")
Part5 = Instance.new("Part")
Motor6D6 = Instance.new("Motor6D")
Weld7 = Instance.new("Weld")
Part8 = Instance.new("Part")
Part9 = Instance.new("Part")
Part10 = Instance.new("Part")
Part11 = Instance.new("Part")
Part12 = Instance.new("Part")
Decal13 = Instance.new("Decal")
Motor6D14 = Instance.new("Motor6D")
Motor6D15 = Instance.new("Motor6D")
Motor6D16 = Instance.new("Motor6D")
Motor6D17 = Instance.new("Motor6D")
Motor6D18 = Instance.new("Motor6D")
Weld19 = Instance.new("Weld")
Weld20 = Instance.new("Weld")
Weld21 = Instance.new("Weld")
Weld22 = Instance.new("Weld")
Weld23 = Instance.new("Weld")
Humanoid24 = Instance.new("Humanoid")
Pants25 = Instance.new("Pants")
Shirt26 = Instance.new("Shirt")
BodyColors27 = Instance.new("BodyColors")
CharacterMesh28 = Instance.new("CharacterMesh")
CharacterMesh29 = Instance.new("CharacterMesh")
CharacterMesh30 = Instance.new("CharacterMesh")
CharacterMesh31 = Instance.new("CharacterMesh")
CharacterMesh32 = Instance.new("CharacterMesh")
Part33 = Instance.new("Part")
SpecialMesh34 = Instance.new("SpecialMesh")
Vector3Value35 = Instance.new("Vector3Value")
Model0.Name = "Dad"
Model0.Parent = mas
Model0.PrimaryPart = Part5
Part1.Name = "Head"
Part1.Parent = Model0
Part1.CFrame = CFrame.new(112.38237, 250.098083, 48.4256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part1.Orientation = Vector3.new(0, 90, 0)
Part1.Position = Vector3.new(112.38236999511719, 250.09808349609375, 48.42567443847656)
Part1.Rotation = Vector3.new(0, 90, 0)
Part1.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part1.Size = Vector3.new(2, 1, 1)
Part1.BrickColor = BrickColor.new("White")
Part1.CanCollide = false
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.brickColor = BrickColor.new("White")
Part1.FormFactor = Enum.FormFactor.Symmetric
Part1.formFactor = Enum.FormFactor.Symmetric
SpecialMesh2.Parent = Part1
SpecialMesh2.MeshId = "rbxassetid://83001675"
SpecialMesh2.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh2.MeshType = Enum.MeshType.FileMesh
Decal3.Name = "face"
Decal3.Parent = Part1
Decal3.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld4.Name = "Hair"
Weld4.Parent = Part1
Weld4.C0 = CFrame.new(0, 0.25, -0.250001907, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld4.Part0 = Part1
Weld4.Part1 = Part33
Weld4.part1 = Part33
Part5.Name = "HumanoidRootPart"
Part5.Parent = Model0
Part5.CFrame = CFrame.new(112.38237, 248.598083, 48.4256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part5.Orientation = Vector3.new(0, 90, 0)
Part5.Position = Vector3.new(112.38236999511719, 248.59808349609375, 48.42567443847656)
Part5.Rotation = Vector3.new(0, 90, 0)
Part5.Transparency = 1
Part5.Size = Vector3.new(2, 2, 1)
Part5.BottomSurface = Enum.SurfaceType.Smooth
Part5.LeftParamA = 0
Part5.LeftParamB = 0
Part5.RightParamA = 0
Part5.RightParamB = 0
Part5.TopSurface = Enum.SurfaceType.Smooth
Part5.FormFactor = Enum.FormFactor.Symmetric
Part5.formFactor = Enum.FormFactor.Symmetric
Motor6D6.Name = "RootJoint"
Motor6D6.Parent = Part5
Motor6D6.MaxVelocity = 0.10000000149011612
Motor6D6.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D6.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D6.Part0 = Part5
Motor6D6.Part1 = Part12
Motor6D6.part1 = Part12
Weld7.Name = "Root"
Weld7.Parent = Part5
Weld7.Part0 = Part5
Weld7.Part1 = Part12
Weld7.part1 = Part12
Part8.Name = "Left Arm"
Part8.Parent = Model0
Part8.CFrame = CFrame.new(112.38237, 248.598083, 49.9256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part8.Orientation = Vector3.new(0, 90, 0)
Part8.Position = Vector3.new(112.38236999511719, 248.59808349609375, 49.92567443847656)
Part8.Rotation = Vector3.new(0, 90, 0)
Part8.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part8.Size = Vector3.new(1, 2, 1)
Part8.BrickColor = BrickColor.new("White")
Part8.CanCollide = false
Part8.brickColor = BrickColor.new("White")
Part8.FormFactor = Enum.FormFactor.Symmetric
Part8.formFactor = Enum.FormFactor.Symmetric
Part9.Name = "Left Leg"
Part9.Parent = Model0
Part9.CFrame = CFrame.new(112.38237, 246.598083, 48.9256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part9.Orientation = Vector3.new(0, 90, 0)
Part9.Position = Vector3.new(112.38236999511719, 246.59808349609375, 48.92567443847656)
Part9.Rotation = Vector3.new(0, 90, 0)
Part9.Color = Color3.new(0.431373, 0.6, 0.792157)
Part9.Size = Vector3.new(1, 2, 1)
Part9.BottomSurface = Enum.SurfaceType.Smooth
Part9.BrickColor = BrickColor.new("Medium blue")
Part9.CanCollide = false
Part9.brickColor = BrickColor.new("Medium blue")
Part9.FormFactor = Enum.FormFactor.Symmetric
Part9.formFactor = Enum.FormFactor.Symmetric
Part10.Name = "Right Arm"
Part10.Parent = Model0
Part10.CFrame = CFrame.new(112.38237, 248.598083, 46.9256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part10.Orientation = Vector3.new(0, 90, 0)
Part10.Position = Vector3.new(112.38236999511719, 248.59808349609375, 46.92567443847656)
Part10.Rotation = Vector3.new(0, 90, 0)
Part10.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part10.Size = Vector3.new(1, 2, 1)
Part10.BrickColor = BrickColor.new("White")
Part10.CanCollide = false
Part10.brickColor = BrickColor.new("White")
Part10.FormFactor = Enum.FormFactor.Symmetric
Part10.formFactor = Enum.FormFactor.Symmetric
Part11.Name = "Right Leg"
Part11.Parent = Model0
Part11.CFrame = CFrame.new(112.38237, 246.598083, 47.9256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part11.Orientation = Vector3.new(0, 90, 0)
Part11.Position = Vector3.new(112.38236999511719, 246.59808349609375, 47.92567443847656)
Part11.Rotation = Vector3.new(0, 90, 0)
Part11.Color = Color3.new(0.431373, 0.6, 0.792157)
Part11.Size = Vector3.new(1, 2, 1)
Part11.BottomSurface = Enum.SurfaceType.Smooth
Part11.BrickColor = BrickColor.new("Medium blue")
Part11.CanCollide = false
Part11.brickColor = BrickColor.new("Medium blue")
Part11.FormFactor = Enum.FormFactor.Symmetric
Part11.formFactor = Enum.FormFactor.Symmetric
Part12.Name = "Torso"
Part12.Parent = Model0
Part12.CFrame = CFrame.new(112.38237, 248.598083, 48.4256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part12.Orientation = Vector3.new(0, 90, 0)
Part12.Position = Vector3.new(112.38236999511719, 248.59808349609375, 48.42567443847656)
Part12.Rotation = Vector3.new(0, 90, 0)
Part12.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part12.Size = Vector3.new(2, 2, 1)
Part12.BrickColor = BrickColor.new("White")
Part12.LeftParamA = 0
Part12.LeftParamB = 0
Part12.LeftSurface = Enum.SurfaceType.Weld
Part12.RightParamA = 0
Part12.RightParamB = 0
Part12.RightSurface = Enum.SurfaceType.Weld
Part12.brickColor = BrickColor.new("White")
Part12.FormFactor = Enum.FormFactor.Symmetric
Part12.formFactor = Enum.FormFactor.Symmetric
Decal13.Name = "roblox"
Decal13.Parent = Part12
Motor6D14.Name = "Right Shoulder"
Motor6D14.Parent = Part12
Motor6D14.MaxVelocity = 0.10000000149011612
Motor6D14.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D14.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D14.Part0 = Part12
Motor6D14.Part1 = Part10
Motor6D14.part1 = Part10
Motor6D15.Name = "Right Hip"
Motor6D15.Parent = Part12
Motor6D15.MaxVelocity = 0.10000000149011612
Motor6D15.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D15.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D15.Part0 = Part12
Motor6D15.Part1 = Part11
Motor6D15.part1 = Part11
Motor6D16.Name = "Neck"
Motor6D16.Parent = Part12
Motor6D16.MaxVelocity = 0.10000000149011612
Motor6D16.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D16.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D16.Part0 = Part12
Motor6D16.Part1 = Part1
Motor6D16.part1 = Part1
Motor6D17.Name = "Left Shoulder"
Motor6D17.Parent = Part12
Motor6D17.MaxVelocity = 0.10000000149011612
Motor6D17.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D17.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D17.Part0 = Part12
Motor6D17.Part1 = Part8
Motor6D17.part1 = Part8
Motor6D18.Name = "Left Hip"
Motor6D18.Parent = Part12
Motor6D18.MaxVelocity = 0.10000000149011612
Motor6D18.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D18.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D18.Part0 = Part12
Motor6D18.Part1 = Part9
Motor6D18.part1 = Part9
Weld19.Name = "LH"
Weld19.Parent = Part12
Weld19.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld19.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld19.Part0 = Part12
Weld19.Part1 = Part9
Weld19.part1 = Part9
Weld20.Name = "LS"
Weld20.Parent = Part12
Weld20.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld20.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld20.Part0 = Part12
Weld20.Part1 = Part8
Weld20.part1 = Part8
Weld21.Name = "Neck"
Weld21.Parent = Part12
Weld21.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld21.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld21.Part0 = Part12
Weld21.Part1 = Part1
Weld21.part1 = Part1
Weld22.Name = "RH"
Weld22.Parent = Part12
Weld22.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.Part0 = Part12
Weld22.Part1 = Part11
Weld22.part1 = Part11
Weld23.Name = "RS"
Weld23.Parent = Part12
Weld23.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld23.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld23.Part0 = Part12
Weld23.Part1 = Part10
Weld23.part1 = Part10
Humanoid24.Parent = Model0
Humanoid24.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid24.Health = inf
Humanoid24.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid24.LeftLeg = Part9
Humanoid24.MaxHealth = inf
Humanoid24.RightLeg = Part11
Humanoid24.Torso = Part5
Humanoid24.maxHealth = inf
Pants25.Name = "Pants"
Pants25.Parent = Model0
Pants25.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt26.Name = "Shirt"
Shirt26.Parent = Model0
Shirt26.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors27.Parent = Model0
BodyColors27.HeadColor = BrickColor.new("White")
BodyColors27.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors27.LeftArmColor = BrickColor.new("White")
BodyColors27.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors27.LeftLegColor = BrickColor.new("Medium blue")
BodyColors27.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors27.RightArmColor = BrickColor.new("White")
BodyColors27.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors27.RightLegColor = BrickColor.new("Medium blue")
BodyColors27.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors27.TorsoColor = BrickColor.new("White")
BodyColors27.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
CharacterMesh28.Name = "3.0 Male Left Arm"
CharacterMesh28.Parent = Model0
CharacterMesh28.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh28.MeshId = 82907977
CharacterMesh29.Name = "3.0 Male Left Leg"
CharacterMesh29.Parent = Model0
CharacterMesh29.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh29.MeshId = 81487640
CharacterMesh30.Name = "3.0 Male Right Arm"
CharacterMesh30.Parent = Model0
CharacterMesh30.BodyPart = Enum.BodyPart.RightArm
CharacterMesh30.MeshId = 82908019
CharacterMesh31.Name = "3.0 Male Right Leg"
CharacterMesh31.Parent = Model0
CharacterMesh31.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh31.MeshId = 81487710
CharacterMesh32.Name = "3.0 Male Torso"
CharacterMesh32.Parent = Model0
CharacterMesh32.BodyPart = Enum.BodyPart.Torso
CharacterMesh32.MeshId = 82907945
Part33.Name = "Hair"
Part33.Parent = Model0
Part33.CFrame = CFrame.new(112.13237, 250.348083, 48.4256744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Part33.Orientation = Vector3.new(0, 90, 0)
Part33.Position = Vector3.new(112.13236999511719, 250.34808349609375, 48.42567443847656)
Part33.Rotation = Vector3.new(0, 90, 0)
Part33.Size = Vector3.new(1, 1, 2)
Part33.BottomSurface = Enum.SurfaceType.Smooth
Part33.CanCollide = false
Part33.TopSurface = Enum.SurfaceType.Smooth
Part33.FormFactor = Enum.FormFactor.Symmetric
Part33.formFactor = Enum.FormFactor.Symmetric
SpecialMesh34.Parent = Part33
SpecialMesh34.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh34.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh34.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh34.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh34.MeshType = Enum.MeshType.FileMesh
Vector3Value35.Name = "OriginalSize"
Vector3Value35.Parent = Part33
Vector3Value35.Value = Vector3.new(1, 1, 2)

local dadclone = Model0:Clone()

local dad = dadclone:Clone()
mas:Destroy()
dadroot = dad.HumanoidRootPart
dadneck = dad.Torso.Neck
dadtorso = dadroot.Root
dadls = dad.Torso.LS
dadrs = dad.Torso.RS
dadlh = dad.Torso.LH
dadrh = dad.Torso.RH

dad.Humanoid.Died:Connect(function()
	dad = dadclone:Clone()
	dadroot = dad.HumanoidRootPart
	dadneck = dad.Torso.Neck
	dadtorso = dadroot.Root
	dadls = dad.Torso.LS
	dadrs = dad.Torso.RS
	dadlh = dad.Torso.LH
	dadrh = dad.Torso.RH
end)

-- Sutart

for _,v in pairs(ch:GetChildren()) do
	if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("BodyColors") or v:IsA("CharacterMesh") then
		v:Destroy()
	end
end

local light = Instance.new("PointLight",root)
light.Color = Color3.fromRGB(255,85,0)
light.Range = 8
light.Brightness = 0.35
light.Shadows = true
light.Enabled = false

local headmesh = Instance.new("SpecialMesh",ch.Head)
headmesh.MeshId = "rbxassetid://83001675"
headmesh.Scale = Vector3.new(1.25,1.25,1.25)

local hair = Instance.new("Part",ch)
hair.Anchored = false
hair.CanCollide = false
hair.Size = Vector3.new(1,1,1)
local hairmesh = Instance.new("SpecialMesh",hair)
hairmesh.MeshId = "rbxassetid://83293901"
hairmesh.TextureId = "rbxassetid://83284747"
hairmesh.VertexColor = Vector3.new(1.2,1.4,1.4)
hairmesh.Scale = Vector3.new(1,1.05,1)
local hairweld = Instance.new("Weld",hair)
hairweld.Part0 = hair
hairweld.Part1 = ch.Head
hairweld.C0 = CFrame.new(0, -0.25, 0.250000477, 1.00000322, 0, 0, 0, 1, 0, 0, 0, 1.00000322)
hairweld.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

Instance.new("Shirt",ch).ShirtTemplate = "rbxassetid://144076357"
Instance.new("Pants",ch).PantsTemplate = "rbxassetid://144076759"


--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Part0 = Instance.new("Part")
ParticleEmitter1 = Instance.new("ParticleEmitter")
ParticleEmitter2 = Instance.new("ParticleEmitter")
Part3 = Instance.new("Part")
ParticleEmitter4 = Instance.new("ParticleEmitter")
ParticleEmitter5 = Instance.new("ParticleEmitter")
ParticleEmitter6 = Instance.new("ParticleEmitter")
ParticleEmitter7 = Instance.new("ParticleEmitter")
ParticleEmitter8 = Instance.new("ParticleEmitter")
ParticleEmitter9 = Instance.new("ParticleEmitter")
Part0.Name = "ArmStuff"
Part0.Parent = mas
Part0.CFrame = CFrame.new(197.816116, -355.541748, 84.432373, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part0.Position = Vector3.new(197.8161163330078, -355.541748046875, 84.432373046875)
Part0.Transparency = 1
Part0.Size = Vector3.new(4, 1, 2)
Part0.Anchored = true
Part0.BottomSurface = Enum.SurfaceType.Smooth
Part0.CanCollide = false
Part0.TopSurface = Enum.SurfaceType.Smooth
ParticleEmitter1.Parent = mas
ParticleEmitter1.Speed = NumberRange.new(0, 0)
ParticleEmitter1.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter1.Enabled = false
ParticleEmitter1.LightEmission = 0.949999988079071
ParticleEmitter1.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter1.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter1.Size = NumberSequence.new(0.44999998807907104,0.44999998807907104)
ParticleEmitter1.Brightness = 6.039999961853027
ParticleEmitter1.Lifetime = NumberRange.new(0.15000000596046448, 0.6399999856948853)
ParticleEmitter1.Rate = 4500
ParticleEmitter1.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter2.Parent = mas
ParticleEmitter2.Speed = NumberRange.new(0, 0)
ParticleEmitter2.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter2.Enabled = false
ParticleEmitter2.LightEmission = 0.949999988079071
ParticleEmitter2.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter2.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter2.Size = NumberSequence.new(0.44999998807907104,0.44999998807907104)
ParticleEmitter2.Brightness = 6.039999961853027
ParticleEmitter2.Lifetime = NumberRange.new(0.15000000596046448, 0.6399999856948853)
ParticleEmitter2.Rate = 4500
ParticleEmitter2.RotSpeed = NumberRange.new(-850, -850)
Part3.Name = "Wings"
Part3.Parent = mas
Part3.CFrame = CFrame.new(197.816116, -355.541748, 84.432373, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part3.Position = Vector3.new(197.8161163330078, -355.541748046875, 84.432373046875)
Part3.Transparency = 1
Part3.Size = Vector3.new(4, 1, 2)
Part3.Anchored = true
Part3.BottomSurface = Enum.SurfaceType.Smooth
Part3.CanCollide = false
Part3.Locked = true
Part3.TopSurface = Enum.SurfaceType.Smooth
ParticleEmitter4.Parent = mas
ParticleEmitter4.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter4.Enabled = false
ParticleEmitter4.LightEmission = 0.949999988079071
ParticleEmitter4.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter4.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter4.Size = NumberSequence.new(1,0)
ParticleEmitter4.Brightness = 6.039999961853027
ParticleEmitter4.Acceleration = Vector3.new(0, 5, 0)
ParticleEmitter4.Lifetime = NumberRange.new(0, 2)
ParticleEmitter4.Rate = 65000
ParticleEmitter4.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter5.Parent = mas
ParticleEmitter5.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter5.Enabled = false
ParticleEmitter5.LightEmission = 0.949999988079071
ParticleEmitter5.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter5.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter5.Size = NumberSequence.new(0.75,0)
ParticleEmitter5.Brightness = 6.039999961853027
ParticleEmitter5.Acceleration = Vector3.new(0, -6, 0)
ParticleEmitter5.Lifetime = NumberRange.new(0.3499999940395355, 1.350000023841858)
ParticleEmitter5.Rate = 6500
ParticleEmitter5.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter6.Parent = mas
ParticleEmitter6.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter6.Enabled = false
ParticleEmitter6.LightEmission = 0.949999988079071
ParticleEmitter6.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter6.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter6.Size = NumberSequence.new(0.75,0)
ParticleEmitter6.Brightness = 6.039999961853027
ParticleEmitter6.Acceleration = Vector3.new(0, -6, 0)
ParticleEmitter6.Lifetime = NumberRange.new(0.3499999940395355, 1.350000023841858)
ParticleEmitter6.Rate = 6500
ParticleEmitter6.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter7.Parent = mas
ParticleEmitter7.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter7.Enabled = false
ParticleEmitter7.LightEmission = 0.949999988079071
ParticleEmitter7.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter7.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter7.Size = NumberSequence.new(1,0)
ParticleEmitter7.Brightness = 6.039999961853027
ParticleEmitter7.Acceleration = Vector3.new(0, 5, 0)
ParticleEmitter7.Lifetime = NumberRange.new(0, 2)
ParticleEmitter7.Rate = 65000
ParticleEmitter7.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter8.Parent = mas
ParticleEmitter8.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter8.Enabled = false
ParticleEmitter8.LightEmission = 0.949999988079071
ParticleEmitter8.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter8.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter8.Size = NumberSequence.new(0.8500000238418579,0)
ParticleEmitter8.Brightness = 6.039999961853027
ParticleEmitter8.Acceleration = Vector3.new(0, 15, 0)
ParticleEmitter8.Lifetime = NumberRange.new(0.3499999940395355, 1.4500000476837158)
ParticleEmitter8.Rate = 6500
ParticleEmitter8.RotSpeed = NumberRange.new(-850, -850)
ParticleEmitter9.Parent = mas
ParticleEmitter9.Color = ColorSequence.new(Color3.new(0.784314, 0.196078, 0),Color3.new(0.784314, 0.196078, 0))
ParticleEmitter9.Enabled = false
ParticleEmitter9.LightEmission = 0.949999988079071
ParticleEmitter9.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter9.Transparency = NumberSequence.new(0,0.949999988079071,0)
ParticleEmitter9.Size = NumberSequence.new(0.8500000238418579,0)
ParticleEmitter9.Brightness = 6.039999961853027
ParticleEmitter9.Acceleration = Vector3.new(0, 15, 0)
ParticleEmitter9.Lifetime = NumberRange.new(0.3499999940395355, 1.4500000476837158)
ParticleEmitter9.Rate = 6500
ParticleEmitter9.RotSpeed = NumberRange.new(-850, -850)

local wings = Part3:Clone()
local armstuff = Part0:Clone()

for _,v in pairs(wings:GetChildren()) do
	if v:IsA("Attachment") then
		v.Parent = ch.Torso
	end
end
wings:Destroy()

armstuff.LArm.Parent = ch["Left Arm"]
armstuff.RArm.Parent = ch["Right Arm"]

armstuff:Destroy()

local newcolor = Instance.new("BodyColors",ch)
newcolor.HeadColor = BrickColor.new("Institutional white")
newcolor.LeftArmColor = BrickColor.new("Institutional white")
newcolor.RightArmColor = BrickColor.new("Institutional white")
newcolor.LeftLegColor = BrickColor.new("Medium blue")
newcolor.RightLegColor = BrickColor.new("Medium blue")
newcolor.TorsoColor = BrickColor.new("Institutional white")

local newtorso = Instance.new("CharacterMesh",ch)
newtorso.BodyPart = Enum.BodyPart.Torso
newtorso.MeshId = 82907945
local newrarm = Instance.new("CharacterMesh",ch)
newrarm.BodyPart = Enum.BodyPart.RightArm
newrarm.MeshId = 82908019
local newlarm = Instance.new("CharacterMesh",ch)
newlarm.BodyPart = Enum.BodyPart.LeftArm
newlarm.MeshId = 82907977
local newrleg = Instance.new("CharacterMesh",ch)
newrleg.BodyPart = Enum.BodyPart.RightLeg
newrleg.MeshId = 81487710
local newlleg = Instance.new("CharacterMesh",ch)
newlleg.BodyPart = Enum.BodyPart.LeftLeg
newlleg.MeshId = 81487640

if ch.Head:FindFirstChild("face") ~= nil then
	ch.Head.face.Texture = "http://www.roblox.com/asset/?id=144080495"
else
	local newface = Instance.new("Decal",ch.Head)
	newface.Face = Enum.NormalId.Front
	newface.Texture = "http://www.roblox.com/asset/?id=144080495"
end


--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
MeshPart0 = Instance.new("MeshPart")
Trail1 = Instance.new("Trail")
ParticleEmitter2 = Instance.new("ParticleEmitter")
ParticleEmitter3 = Instance.new("ParticleEmitter")
MeshPart0.Name = "BaconBlade"
MeshPart0.Parent = mas
MeshPart0.CFrame = CFrame.new(391.881134, 13.1260834, 152.510132, 1, 0, 0, 0, 1, 0, 0, 0, 1)
MeshPart0.Position = Vector3.new(391.8811340332031, 13.126083374023438, 152.5101318359375)
MeshPart0.Size = Vector3.new(1, 0.5, 12)
MeshPart0.TextureID = "rbxassetid://5509388773"
Trail1.Parent = MeshPart0
Trail1.Attachment0 = nil
Trail1.Attachment1 = nil
Trail1.Color = ColorSequence.new(Color3.new(1, 0.333333, 0),Color3.new(1, 0.333333, 0))
Trail1.Enabled = false
Trail1.LightEmission = 1
Trail1.LightInfluence = 0.699999988079071
Trail1.Texture = "rbxassetid://2003679380"
Trail1.Lifetime = 0.6499999761581421
ParticleEmitter2.Parent = MeshPart0
ParticleEmitter2.Speed = NumberRange.new(0, 0)
ParticleEmitter2.Color = ColorSequence.new(Color3.new(1, 0.666667, 0),Color3.new(1, 0.666667, 0))
ParticleEmitter2.Enabled = false
ParticleEmitter2.LightEmission = 0.949999988079071
ParticleEmitter2.LightInfluence = 1
ParticleEmitter2.Texture = "http://www.roblox.com/asset/?id=5627269880"
ParticleEmitter2.Transparency = NumberSequence.new(0.699999988079071,0.699999988079071)
ParticleEmitter2.Size = NumberSequence.new(0.4000000059604645,0.4000000059604645)
ParticleEmitter2.Brightness = 6.039999961853027
ParticleEmitter2.Acceleration = Vector3.new(0, 5, 0)
ParticleEmitter2.Lifetime = NumberRange.new(1, 1)
ParticleEmitter2.Rate = 50
ParticleEmitter2.RotSpeed = NumberRange.new(-280, -280)
ParticleEmitter3.Name = "Aura"
ParticleEmitter3.Parent = MeshPart0
ParticleEmitter3.Speed = NumberRange.new(2, 2)
ParticleEmitter3.Color = ColorSequence.new(Color3.new(1, 0.333333, 0),Color3.new(1, 0.333333, 0))
ParticleEmitter3.Enabled = false
ParticleEmitter3.LightEmission = 1
ParticleEmitter3.Texture = "rbxasset://textures/particles/fire_main.dds"
ParticleEmitter3.ZOffset = -2
ParticleEmitter3.Brightness = 10
ParticleEmitter3.Shape = Enum.ParticleEmitterShape.Sphere
ParticleEmitter3.Acceleration = Vector3.new(0, 5, 0)
ParticleEmitter3.Drag = 1
ParticleEmitter3.Lifetime = NumberRange.new(0.4000000059604645, 0.4000000059604645)
ParticleEmitter3.LockedToPart = true
ParticleEmitter3.Rate = 100
ParticleEmitter3.VelocityInheritance = 1

local baconblade = MeshPart0:Clone()
MeshPart0:Destroy()

baconblade.Anchored = false
baconblade.CanCollide = false
local baconbladeweld = Instance.new("Weld",ch["Right Arm"])
baconbladeweld.Part0 = ch["Right Arm"]
baconbladeweld.Part1 = baconblade
baconbladeweld.C0 = CFrame.new(-0.000244140625, -1.10019004, -6.00039673, 0, -1, 0, 1, 0, -0, 0, 0, 1)
baconbladeweld.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
baconblade.Transparency = 1



--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Model1 = Instance.new("Model")
Part2 = Instance.new("Part")
SpecialMesh3 = Instance.new("SpecialMesh")
Decal4 = Instance.new("Decal")
Weld5 = Instance.new("Weld")
Part6 = Instance.new("Part")
Motor6D7 = Instance.new("Motor6D")
Weld8 = Instance.new("Weld")
Part9 = Instance.new("Part")
Part10 = Instance.new("Part")
Part11 = Instance.new("Part")
Part12 = Instance.new("Part")
Part13 = Instance.new("Part")
Decal14 = Instance.new("Decal")
Motor6D15 = Instance.new("Motor6D")
Motor6D16 = Instance.new("Motor6D")
Motor6D17 = Instance.new("Motor6D")
Motor6D18 = Instance.new("Motor6D")
Motor6D19 = Instance.new("Motor6D")
Weld20 = Instance.new("Weld")
Weld21 = Instance.new("Weld")
Weld22 = Instance.new("Weld")
Weld23 = Instance.new("Weld")
Weld24 = Instance.new("Weld")
Humanoid25 = Instance.new("Humanoid")
Pants26 = Instance.new("Pants")
Shirt27 = Instance.new("Shirt")
BodyColors28 = Instance.new("BodyColors")
Accessory29 = Instance.new("Accessory")
Part30 = Instance.new("Part")
SpecialMesh31 = Instance.new("SpecialMesh")
Vector3Value32 = Instance.new("Vector3Value")
CharacterMesh33 = Instance.new("CharacterMesh")
CharacterMesh34 = Instance.new("CharacterMesh")
CharacterMesh35 = Instance.new("CharacterMesh")
CharacterMesh36 = Instance.new("CharacterMesh")
CharacterMesh37 = Instance.new("CharacterMesh")
Script38 = Instance.new("Script")
Model39 = Instance.new("Model")
Part40 = Instance.new("Part")
SpecialMesh41 = Instance.new("SpecialMesh")
Decal42 = Instance.new("Decal")
Weld43 = Instance.new("Weld")
Part44 = Instance.new("Part")
Motor6D45 = Instance.new("Motor6D")
Weld46 = Instance.new("Weld")
Part47 = Instance.new("Part")
Part48 = Instance.new("Part")
Part49 = Instance.new("Part")
Part50 = Instance.new("Part")
Part51 = Instance.new("Part")
Decal52 = Instance.new("Decal")
Motor6D53 = Instance.new("Motor6D")
Motor6D54 = Instance.new("Motor6D")
Motor6D55 = Instance.new("Motor6D")
Motor6D56 = Instance.new("Motor6D")
Motor6D57 = Instance.new("Motor6D")
Weld58 = Instance.new("Weld")
Weld59 = Instance.new("Weld")
Weld60 = Instance.new("Weld")
Weld61 = Instance.new("Weld")
Weld62 = Instance.new("Weld")
Humanoid63 = Instance.new("Humanoid")
Pants64 = Instance.new("Pants")
Shirt65 = Instance.new("Shirt")
BodyColors66 = Instance.new("BodyColors")
Accessory67 = Instance.new("Accessory")
Part68 = Instance.new("Part")
SpecialMesh69 = Instance.new("SpecialMesh")
Vector3Value70 = Instance.new("Vector3Value")
CharacterMesh71 = Instance.new("CharacterMesh")
CharacterMesh72 = Instance.new("CharacterMesh")
CharacterMesh73 = Instance.new("CharacterMesh")
CharacterMesh74 = Instance.new("CharacterMesh")
CharacterMesh75 = Instance.new("CharacterMesh")
Script76 = Instance.new("Script")
Model77 = Instance.new("Model")
Part78 = Instance.new("Part")
SpecialMesh79 = Instance.new("SpecialMesh")
Decal80 = Instance.new("Decal")
Weld81 = Instance.new("Weld")
Part82 = Instance.new("Part")
Motor6D83 = Instance.new("Motor6D")
Weld84 = Instance.new("Weld")
Part85 = Instance.new("Part")
Part86 = Instance.new("Part")
Part87 = Instance.new("Part")
Part88 = Instance.new("Part")
Part89 = Instance.new("Part")
Decal90 = Instance.new("Decal")
Motor6D91 = Instance.new("Motor6D")
Motor6D92 = Instance.new("Motor6D")
Motor6D93 = Instance.new("Motor6D")
Motor6D94 = Instance.new("Motor6D")
Motor6D95 = Instance.new("Motor6D")
Weld96 = Instance.new("Weld")
Weld97 = Instance.new("Weld")
Weld98 = Instance.new("Weld")
Weld99 = Instance.new("Weld")
Weld100 = Instance.new("Weld")
Humanoid101 = Instance.new("Humanoid")
Pants102 = Instance.new("Pants")
Shirt103 = Instance.new("Shirt")
BodyColors104 = Instance.new("BodyColors")
Accessory105 = Instance.new("Accessory")
Part106 = Instance.new("Part")
SpecialMesh107 = Instance.new("SpecialMesh")
Vector3Value108 = Instance.new("Vector3Value")
CharacterMesh109 = Instance.new("CharacterMesh")
CharacterMesh110 = Instance.new("CharacterMesh")
CharacterMesh111 = Instance.new("CharacterMesh")
CharacterMesh112 = Instance.new("CharacterMesh")
CharacterMesh113 = Instance.new("CharacterMesh")
Script114 = Instance.new("Script")
Model115 = Instance.new("Model")
Part116 = Instance.new("Part")
SpecialMesh117 = Instance.new("SpecialMesh")
Decal118 = Instance.new("Decal")
Weld119 = Instance.new("Weld")
Part120 = Instance.new("Part")
Motor6D121 = Instance.new("Motor6D")
Weld122 = Instance.new("Weld")
Part123 = Instance.new("Part")
Part124 = Instance.new("Part")
Part125 = Instance.new("Part")
Part126 = Instance.new("Part")
Part127 = Instance.new("Part")
Decal128 = Instance.new("Decal")
Motor6D129 = Instance.new("Motor6D")
Motor6D130 = Instance.new("Motor6D")
Motor6D131 = Instance.new("Motor6D")
Motor6D132 = Instance.new("Motor6D")
Motor6D133 = Instance.new("Motor6D")
Weld134 = Instance.new("Weld")
Weld135 = Instance.new("Weld")
Weld136 = Instance.new("Weld")
Weld137 = Instance.new("Weld")
Weld138 = Instance.new("Weld")
Humanoid139 = Instance.new("Humanoid")
Pants140 = Instance.new("Pants")
Shirt141 = Instance.new("Shirt")
BodyColors142 = Instance.new("BodyColors")
Accessory143 = Instance.new("Accessory")
Part144 = Instance.new("Part")
SpecialMesh145 = Instance.new("SpecialMesh")
Vector3Value146 = Instance.new("Vector3Value")
CharacterMesh147 = Instance.new("CharacterMesh")
CharacterMesh148 = Instance.new("CharacterMesh")
CharacterMesh149 = Instance.new("CharacterMesh")
CharacterMesh150 = Instance.new("CharacterMesh")
CharacterMesh151 = Instance.new("CharacterMesh")
Script152 = Instance.new("Script")
Model153 = Instance.new("Model")
Part154 = Instance.new("Part")
SpecialMesh155 = Instance.new("SpecialMesh")
Decal156 = Instance.new("Decal")
Weld157 = Instance.new("Weld")
Part158 = Instance.new("Part")
Motor6D159 = Instance.new("Motor6D")
Weld160 = Instance.new("Weld")
Part161 = Instance.new("Part")
Part162 = Instance.new("Part")
Part163 = Instance.new("Part")
Part164 = Instance.new("Part")
Part165 = Instance.new("Part")
Decal166 = Instance.new("Decal")
Motor6D167 = Instance.new("Motor6D")
Motor6D168 = Instance.new("Motor6D")
Motor6D169 = Instance.new("Motor6D")
Motor6D170 = Instance.new("Motor6D")
Motor6D171 = Instance.new("Motor6D")
Weld172 = Instance.new("Weld")
Weld173 = Instance.new("Weld")
Weld174 = Instance.new("Weld")
Weld175 = Instance.new("Weld")
Weld176 = Instance.new("Weld")
Humanoid177 = Instance.new("Humanoid")
Pants178 = Instance.new("Pants")
Shirt179 = Instance.new("Shirt")
BodyColors180 = Instance.new("BodyColors")
Accessory181 = Instance.new("Accessory")
Part182 = Instance.new("Part")
SpecialMesh183 = Instance.new("SpecialMesh")
Vector3Value184 = Instance.new("Vector3Value")
CharacterMesh185 = Instance.new("CharacterMesh")
CharacterMesh186 = Instance.new("CharacterMesh")
CharacterMesh187 = Instance.new("CharacterMesh")
CharacterMesh188 = Instance.new("CharacterMesh")
CharacterMesh189 = Instance.new("CharacterMesh")
Script190 = Instance.new("Script")
Part191 = Instance.new("Part")
ParticleEmitter192 = Instance.new("ParticleEmitter")
Part193 = Instance.new("Part")
ParticleEmitter194 = Instance.new("ParticleEmitter")
Part195 = Instance.new("Part")
ParticleEmitter196 = Instance.new("ParticleEmitter")
Part197 = Instance.new("Part")
ParticleEmitter198 = Instance.new("ParticleEmitter")
Part199 = Instance.new("Part")
ParticleEmitter200 = Instance.new("ParticleEmitter")
Part201 = Instance.new("Part")
Weld202 = Instance.new("Weld")
Weld203 = Instance.new("Weld")
Weld204 = Instance.new("Weld")
Weld205 = Instance.new("Weld")
Weld206 = Instance.new("Weld")
Weld207 = Instance.new("Weld")
Weld208 = Instance.new("Weld")
Weld209 = Instance.new("Weld")
Weld210 = Instance.new("Weld")
Weld211 = Instance.new("Weld")
ParticleEmitter212 = Instance.new("ParticleEmitter")
Weld213 = Instance.new("Weld")
Weld214 = Instance.new("Weld")
Weld215 = Instance.new("Weld")
Weld216 = Instance.new("Weld")
Weld217 = Instance.new("Weld")
Part218 = Instance.new("Part")
ParticleEmitter219 = Instance.new("ParticleEmitter")
Part220 = Instance.new("Part")
ParticleEmitter221 = Instance.new("ParticleEmitter")
Part222 = Instance.new("Part")
ParticleEmitter223 = Instance.new("ParticleEmitter")
Part224 = Instance.new("Part")
ParticleEmitter225 = Instance.new("ParticleEmitter")
Part226 = Instance.new("Part")
ParticleEmitter227 = Instance.new("ParticleEmitter")
Model0.Name = "BaconRingLol"
Model0.Parent = mas
Model1.Name = "BaconHair"
Model1.Parent = Model0
Model1.PrimaryPart = Part6
Part2.Name = "Head"
Part2.Parent = Model1
Part2.CFrame = CFrame.new(103.354431, -350.698456, 65.5230026, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part2.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part2.Position = Vector3.new(103.35443115234375, -350.6984558105469, 65.52300262451172)
Part2.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part2.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part2.Size = Vector3.new(2, 1, 1)
Part2.BrickColor = BrickColor.new("White")
Part2.TopSurface = Enum.SurfaceType.Smooth
Part2.brickColor = BrickColor.new("White")
Part2.FormFactor = Enum.FormFactor.Symmetric
Part2.formFactor = Enum.FormFactor.Symmetric
SpecialMesh3.Parent = Part2
SpecialMesh3.MeshId = "rbxassetid://83001675"
SpecialMesh3.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh3.MeshType = Enum.MeshType.FileMesh
Decal4.Name = "face"
Decal4.Parent = Part2
Decal4.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld5.Name = "HeadWeld"
Weld5.Parent = Part2
Weld5.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld5.C1 = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld5.Part0 = Part2
Weld5.Part1 = Part30
Weld5.part1 = Part30
Part6.Name = "HumanoidRootPart"
Part6.Parent = Model1
Part6.CFrame = CFrame.new(103.354431, -352.198456, 65.5230026, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part6.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part6.Position = Vector3.new(103.35443115234375, -352.1984558105469, 65.52300262451172)
Part6.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part6.Transparency = 1
Part6.Size = Vector3.new(2, 2, 1)
Part6.BottomSurface = Enum.SurfaceType.Smooth
Part6.CanCollide = false
Part6.LeftParamA = 0
Part6.LeftParamB = 0
Part6.RightParamA = 0
Part6.RightParamB = 0
Part6.TopSurface = Enum.SurfaceType.Smooth
Part6.FormFactor = Enum.FormFactor.Symmetric
Part6.formFactor = Enum.FormFactor.Symmetric
Motor6D7.Name = "RootJoint"
Motor6D7.Parent = Part6
Motor6D7.MaxVelocity = 0.10000000149011612
Motor6D7.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D7.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D7.Part0 = Part6
Motor6D7.Part1 = Part13
Motor6D7.part1 = Part13
Weld8.Name = "Root"
Weld8.Parent = Part6
Weld8.Part0 = Part6
Weld8.Part1 = Part13
Weld8.part1 = Part13
Part9.Name = "Left Arm"
Part9.Parent = Model1
Part9.CFrame = CFrame.new(101.918228, -352.198456, 65.0901718, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part9.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part9.Position = Vector3.new(101.91822814941406, -352.1984558105469, 65.09017181396484)
Part9.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part9.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part9.Size = Vector3.new(1, 2, 1)
Part9.BrickColor = BrickColor.new("White")
Part9.CanCollide = false
Part9.brickColor = BrickColor.new("White")
Part9.FormFactor = Enum.FormFactor.Symmetric
Part9.formFactor = Enum.FormFactor.Symmetric
Part10.Name = "Left Leg"
Part10.Parent = Model1
Part10.CFrame = CFrame.new(102.875694, -354.198456, 65.3787231, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part10.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part10.Position = Vector3.new(102.87569427490234, -354.1984558105469, 65.37872314453125)
Part10.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part10.Color = Color3.new(0.431373, 0.6, 0.792157)
Part10.Size = Vector3.new(1, 2, 1)
Part10.BottomSurface = Enum.SurfaceType.Smooth
Part10.BrickColor = BrickColor.new("Medium blue")
Part10.CanCollide = false
Part10.brickColor = BrickColor.new("Medium blue")
Part10.FormFactor = Enum.FormFactor.Symmetric
Part10.formFactor = Enum.FormFactor.Symmetric
Part11.Name = "Right Arm"
Part11.Parent = Model1
Part11.CFrame = CFrame.new(104.790634, -352.198456, 65.9558334, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part11.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part11.Position = Vector3.new(104.79063415527344, -352.1984558105469, 65.9558334350586)
Part11.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part11.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part11.Size = Vector3.new(1, 2, 1)
Part11.BrickColor = BrickColor.new("White")
Part11.CanCollide = false
Part11.brickColor = BrickColor.new("White")
Part11.FormFactor = Enum.FormFactor.Symmetric
Part11.formFactor = Enum.FormFactor.Symmetric
Part12.Name = "Right Leg"
Part12.Parent = Model1
Part12.CFrame = CFrame.new(103.833168, -354.198456, 65.6672821, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part12.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part12.Position = Vector3.new(103.83316802978516, -354.1984558105469, 65.66728210449219)
Part12.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part12.Color = Color3.new(0.431373, 0.6, 0.792157)
Part12.Size = Vector3.new(1, 2, 1)
Part12.BottomSurface = Enum.SurfaceType.Smooth
Part12.BrickColor = BrickColor.new("Medium blue")
Part12.CanCollide = false
Part12.brickColor = BrickColor.new("Medium blue")
Part12.FormFactor = Enum.FormFactor.Symmetric
Part12.formFactor = Enum.FormFactor.Symmetric
Part13.Name = "Torso"
Part13.Parent = Model1
Part13.CFrame = CFrame.new(103.354431, -352.198456, 65.5230026, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part13.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part13.Position = Vector3.new(103.35443115234375, -352.1984558105469, 65.52300262451172)
Part13.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part13.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part13.Size = Vector3.new(2, 2, 1)
Part13.BrickColor = BrickColor.new("White")
Part13.LeftParamA = 0
Part13.LeftParamB = 0
Part13.LeftSurface = Enum.SurfaceType.Weld
Part13.RightParamA = 0
Part13.RightParamB = 0
Part13.RightSurface = Enum.SurfaceType.Weld
Part13.brickColor = BrickColor.new("White")
Part13.FormFactor = Enum.FormFactor.Symmetric
Part13.formFactor = Enum.FormFactor.Symmetric
Decal14.Name = "roblox"
Decal14.Parent = Part13
Motor6D15.Name = "Right Shoulder"
Motor6D15.Parent = Part13
Motor6D15.MaxVelocity = 0.10000000149011612
Motor6D15.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D15.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D15.Part0 = Part13
Motor6D15.Part1 = Part11
Motor6D15.part1 = Part11
Motor6D16.Name = "Right Hip"
Motor6D16.Parent = Part13
Motor6D16.MaxVelocity = 0.10000000149011612
Motor6D16.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D16.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D16.Part0 = Part13
Motor6D16.Part1 = Part12
Motor6D16.part1 = Part12
Motor6D17.Name = "Neck"
Motor6D17.Parent = Part13
Motor6D17.MaxVelocity = 0.10000000149011612
Motor6D17.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D17.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D17.Part0 = Part13
Motor6D17.Part1 = Part2
Motor6D17.part1 = Part2
Motor6D18.Name = "Left Shoulder"
Motor6D18.Parent = Part13
Motor6D18.MaxVelocity = 0.10000000149011612
Motor6D18.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D18.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D18.Part0 = Part13
Motor6D18.Part1 = Part9
Motor6D18.part1 = Part9
Motor6D19.Name = "Left Hip"
Motor6D19.Parent = Part13
Motor6D19.MaxVelocity = 0.10000000149011612
Motor6D19.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D19.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D19.Part0 = Part13
Motor6D19.Part1 = Part10
Motor6D19.part1 = Part10
Weld20.Name = "LH"
Weld20.Parent = Part13
Weld20.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld20.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld20.Part0 = Part13
Weld20.Part1 = Part10
Weld20.part1 = Part10
Weld21.Name = "LS"
Weld21.Parent = Part13
Weld21.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld21.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld21.Part0 = Part13
Weld21.Part1 = Part9
Weld21.part1 = Part9
Weld22.Name = "Neck"
Weld22.Parent = Part13
Weld22.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld22.Part0 = Part13
Weld22.Part1 = Part2
Weld22.part1 = Part2
Weld23.Name = "RH"
Weld23.Parent = Part13
Weld23.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld23.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld23.Part0 = Part13
Weld23.Part1 = Part12
Weld23.part1 = Part12
Weld24.Name = "RS"
Weld24.Parent = Part13
Weld24.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld24.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld24.Part0 = Part13
Weld24.Part1 = Part11
Weld24.part1 = Part11
Humanoid25.Parent = Model1
Humanoid25.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid25.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid25.LeftLeg = Part10
Humanoid25.RightLeg = Part12
Humanoid25.Torso = Part6
Pants26.Name = "Pants"
Pants26.Parent = Model1
Pants26.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt27.Name = "Shirt"
Shirt27.Parent = Model1
Shirt27.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors28.Parent = Model1
BodyColors28.HeadColor = BrickColor.new("White")
BodyColors28.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors28.LeftArmColor = BrickColor.new("White")
BodyColors28.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors28.LeftLegColor = BrickColor.new("Medium blue")
BodyColors28.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors28.RightArmColor = BrickColor.new("White")
BodyColors28.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors28.RightLegColor = BrickColor.new("Medium blue")
BodyColors28.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors28.TorsoColor = BrickColor.new("White")
BodyColors28.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
Accessory29.Name = "PalHair"
Accessory29.Parent = Model1
Accessory29.AttachmentPoint = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory29.AttachmentPos = Vector3.new(0, 0.25, 0.25)
Part30.Name = "Handle"
Part30.Parent = Accessory29
Part30.CFrame = CFrame.new(103.426567, -350.448456, 65.283638, 0.957466424, 0, -0.288551748, 0, 1, 0, 0.288551688, 0, 0.957466424)
Part30.Orientation = Vector3.new(0, -16.770999908447266, 0)
Part30.Position = Vector3.new(103.42656707763672, -350.4484558105469, 65.28363800048828)
Part30.Rotation = Vector3.new(0, -16.770999908447266, 0)
Part30.Size = Vector3.new(1, 1, 2)
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.CanCollide = false
Part30.TopSurface = Enum.SurfaceType.Smooth
Part30.FormFactor = Enum.FormFactor.Symmetric
Part30.formFactor = Enum.FormFactor.Symmetric
SpecialMesh31.Parent = Part30
SpecialMesh31.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh31.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh31.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh31.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh31.MeshType = Enum.MeshType.FileMesh
Vector3Value32.Name = "OriginalSize"
Vector3Value32.Parent = Part30
Vector3Value32.Value = Vector3.new(1, 1, 2)
CharacterMesh33.Name = "3.0 Male Left Arm"
CharacterMesh33.Parent = Model1
CharacterMesh33.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh33.MeshId = 82907977
CharacterMesh34.Name = "3.0 Male Left Leg"
CharacterMesh34.Parent = Model1
CharacterMesh34.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh34.MeshId = 81487640
CharacterMesh35.Name = "3.0 Male Right Arm"
CharacterMesh35.Parent = Model1
CharacterMesh35.BodyPart = Enum.BodyPart.RightArm
CharacterMesh35.MeshId = 82908019
CharacterMesh36.Name = "3.0 Male Right Leg"
CharacterMesh36.Parent = Model1
CharacterMesh36.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh36.MeshId = 81487710
CharacterMesh37.Name = "3.0 Male Torso"
CharacterMesh37.Parent = Model1
CharacterMesh37.BodyPart = Enum.BodyPart.Torso
CharacterMesh37.MeshId = 82907945
Script38.Name = "Animate"
Script38.Parent = Model1
table.insert(cors,sandbox(Script38,function()
bacon = script.Parent
hum = bacon.Humanoid
tweenservice = game:GetService("TweenService")
stopanim = false

-- Welds

neck = bacon.Torso.Neck
torso = bacon.HumanoidRootPart.Root
rs = bacon.Torso.RS
ls = bacon.Torso.LS
rh = bacon.Torso.RH
lh = bacon.Torso.LH

-- lol

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

-- Animation

tweenobject(ls,{C0 = CFrame.new(-1, 0.65, -0.38)*CFrame.Angles(math.rad(-153.8), math.rad(-23.2),math.rad(95.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(lh,{C0 = CFrame.new(-0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(neck,{C0 = CFrame.new(0, 1.02, 0.13)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rh,{C0 = CFrame.new(0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)


-- Humanoid Stuff
--[[ -- old code from first version of sutart aaa
hum.Died:Connect(function()
stopanim = true
end)

-- Animation 

while true do
game:GetService("RunService").Heartbeat:Wait()
if stopanim == false then
neck.C0 = neck.C0:Lerp(CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
torso.C0 = torso.C0:Lerp(CFrame.new(0,-1.15,0)*CFrame.Angles(math.rad(-35),math.rad(0),math.rad(0)),0.3)
rs.C0 = rs.C0:Lerp(CFrame.new(1.5,0.75,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5)),0.3)
ls.C0 = ls.C0:Lerp(CFrame.new(-1.3,0.5,-0.85)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)),0.3)
rh.C0 = rh.C0:Lerp(CFrame.new(0.5,-0.85,0)*CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),0.3)
lh.C0 = lh.C0:Lerp(CFrame.new(-0.5,0.25,-0.25)*CFrame.Angles(math.rad(35),math.rad(0),math.rad(0)),0.3)
elseif stopanim == true then
break
end
end]]
end))
Model39.Name = "BaconHair"
Model39.Parent = Model0
Model39.PrimaryPart = Part44
Part40.Name = "Head"
Part40.Parent = Model39
Part40.CFrame = CFrame.new(103.311798, -350.698456, 46.9850426, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part40.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part40.Position = Vector3.new(103.31179809570312, -350.6984558105469, 46.985042572021484)
Part40.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part40.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part40.Size = Vector3.new(2, 1, 1)
Part40.BrickColor = BrickColor.new("White")
Part40.TopSurface = Enum.SurfaceType.Smooth
Part40.brickColor = BrickColor.new("White")
Part40.FormFactor = Enum.FormFactor.Symmetric
Part40.formFactor = Enum.FormFactor.Symmetric
SpecialMesh41.Parent = Part40
SpecialMesh41.MeshId = "rbxassetid://83001675"
SpecialMesh41.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh41.MeshType = Enum.MeshType.FileMesh
Decal42.Name = "face"
Decal42.Parent = Part40
Decal42.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld43.Name = "HeadWeld"
Weld43.Parent = Part40
Weld43.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld43.C1 = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld43.Part0 = Part40
Weld43.Part1 = Part68
Weld43.part1 = Part68
Part44.Name = "HumanoidRootPart"
Part44.Parent = Model39
Part44.CFrame = CFrame.new(103.311798, -352.198456, 46.9850426, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part44.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part44.Position = Vector3.new(103.31179809570312, -352.1984558105469, 46.985042572021484)
Part44.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part44.Transparency = 1
Part44.Size = Vector3.new(2, 2, 1)
Part44.BottomSurface = Enum.SurfaceType.Smooth
Part44.CanCollide = false
Part44.LeftParamA = 0
Part44.LeftParamB = 0
Part44.RightParamA = 0
Part44.RightParamB = 0
Part44.TopSurface = Enum.SurfaceType.Smooth
Part44.FormFactor = Enum.FormFactor.Symmetric
Part44.formFactor = Enum.FormFactor.Symmetric
Motor6D45.Name = "RootJoint"
Motor6D45.Parent = Part44
Motor6D45.MaxVelocity = 0.10000000149011612
Motor6D45.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D45.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D45.Part0 = Part44
Motor6D45.Part1 = Part51
Motor6D45.part1 = Part51
Weld46.Name = "Root"
Weld46.Parent = Part44
Weld46.Part0 = Part44
Weld46.Part1 = Part51
Weld46.part1 = Part51
Part47.Name = "Left Arm"
Part47.Parent = Model39
Part47.CFrame = CFrame.new(104.743118, -352.198456, 46.5363464, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part47.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part47.Position = Vector3.new(104.74311828613281, -352.1984558105469, 46.536346435546875)
Part47.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part47.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part47.Size = Vector3.new(1, 2, 1)
Part47.BrickColor = BrickColor.new("White")
Part47.CanCollide = false
Part47.brickColor = BrickColor.new("White")
Part47.FormFactor = Enum.FormFactor.Symmetric
Part47.formFactor = Enum.FormFactor.Symmetric
Part48.Name = "Left Leg"
Part48.Parent = Model39
Part48.CFrame = CFrame.new(103.788902, -354.198456, 46.8354759, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part48.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part48.Position = Vector3.new(103.78890228271484, -354.1984558105469, 46.83547592163086)
Part48.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part48.Color = Color3.new(0.431373, 0.6, 0.792157)
Part48.Size = Vector3.new(1, 2, 1)
Part48.BottomSurface = Enum.SurfaceType.Smooth
Part48.BrickColor = BrickColor.new("Medium blue")
Part48.CanCollide = false
Part48.brickColor = BrickColor.new("Medium blue")
Part48.FormFactor = Enum.FormFactor.Symmetric
Part48.formFactor = Enum.FormFactor.Symmetric
Part49.Name = "Right Arm"
Part49.Parent = Model39
Part49.CFrame = CFrame.new(101.880478, -352.198456, 47.4337387, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part49.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part49.Position = Vector3.new(101.88047790527344, -352.1984558105469, 47.433738708496094)
Part49.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part49.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part49.Size = Vector3.new(1, 2, 1)
Part49.BrickColor = BrickColor.new("White")
Part49.CanCollide = false
Part49.brickColor = BrickColor.new("White")
Part49.FormFactor = Enum.FormFactor.Symmetric
Part49.formFactor = Enum.FormFactor.Symmetric
Part50.Name = "Right Leg"
Part50.Parent = Model39
Part50.CFrame = CFrame.new(102.834694, -354.198456, 47.1346092, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part50.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part50.Position = Vector3.new(102.8346939086914, -354.1984558105469, 47.13460922241211)
Part50.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part50.Color = Color3.new(0.431373, 0.6, 0.792157)
Part50.Size = Vector3.new(1, 2, 1)
Part50.BottomSurface = Enum.SurfaceType.Smooth
Part50.BrickColor = BrickColor.new("Medium blue")
Part50.CanCollide = false
Part50.brickColor = BrickColor.new("Medium blue")
Part50.FormFactor = Enum.FormFactor.Symmetric
Part50.formFactor = Enum.FormFactor.Symmetric
Part51.Name = "Torso"
Part51.Parent = Model39
Part51.CFrame = CFrame.new(103.311798, -352.198456, 46.9850426, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part51.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part51.Position = Vector3.new(103.31179809570312, -352.1984558105469, 46.985042572021484)
Part51.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part51.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part51.Size = Vector3.new(2, 2, 1)
Part51.BrickColor = BrickColor.new("White")
Part51.LeftParamA = 0
Part51.LeftParamB = 0
Part51.LeftSurface = Enum.SurfaceType.Weld
Part51.RightParamA = 0
Part51.RightParamB = 0
Part51.RightSurface = Enum.SurfaceType.Weld
Part51.brickColor = BrickColor.new("White")
Part51.FormFactor = Enum.FormFactor.Symmetric
Part51.formFactor = Enum.FormFactor.Symmetric
Decal52.Name = "roblox"
Decal52.Parent = Part51
Motor6D53.Name = "Right Shoulder"
Motor6D53.Parent = Part51
Motor6D53.MaxVelocity = 0.10000000149011612
Motor6D53.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D53.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D53.Part0 = Part51
Motor6D53.Part1 = Part49
Motor6D53.part1 = Part49
Motor6D54.Name = "Right Hip"
Motor6D54.Parent = Part51
Motor6D54.MaxVelocity = 0.10000000149011612
Motor6D54.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D54.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D54.Part0 = Part51
Motor6D54.Part1 = Part50
Motor6D54.part1 = Part50
Motor6D55.Name = "Neck"
Motor6D55.Parent = Part51
Motor6D55.MaxVelocity = 0.10000000149011612
Motor6D55.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D55.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D55.Part0 = Part51
Motor6D55.Part1 = Part40
Motor6D55.part1 = Part40
Motor6D56.Name = "Left Shoulder"
Motor6D56.Parent = Part51
Motor6D56.MaxVelocity = 0.10000000149011612
Motor6D56.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D56.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D56.Part0 = Part51
Motor6D56.Part1 = Part47
Motor6D56.part1 = Part47
Motor6D57.Name = "Left Hip"
Motor6D57.Parent = Part51
Motor6D57.MaxVelocity = 0.10000000149011612
Motor6D57.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D57.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D57.Part0 = Part51
Motor6D57.Part1 = Part48
Motor6D57.part1 = Part48
Weld58.Name = "LH"
Weld58.Parent = Part51
Weld58.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld58.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld58.Part0 = Part51
Weld58.Part1 = Part48
Weld58.part1 = Part48
Weld59.Name = "LS"
Weld59.Parent = Part51
Weld59.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld59.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld59.Part0 = Part51
Weld59.Part1 = Part47
Weld59.part1 = Part47
Weld60.Name = "Neck"
Weld60.Parent = Part51
Weld60.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld60.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld60.Part0 = Part51
Weld60.Part1 = Part40
Weld60.part1 = Part40
Weld61.Name = "RH"
Weld61.Parent = Part51
Weld61.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld61.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld61.Part0 = Part51
Weld61.Part1 = Part50
Weld61.part1 = Part50
Weld62.Name = "RS"
Weld62.Parent = Part51
Weld62.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld62.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld62.Part0 = Part51
Weld62.Part1 = Part49
Weld62.part1 = Part49
Humanoid63.Parent = Model39
Humanoid63.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid63.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid63.LeftLeg = Part48
Humanoid63.RightLeg = Part50
Humanoid63.Torso = Part44
Pants64.Name = "Pants"
Pants64.Parent = Model39
Pants64.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt65.Name = "Shirt"
Shirt65.Parent = Model39
Shirt65.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors66.Parent = Model39
BodyColors66.HeadColor = BrickColor.new("White")
BodyColors66.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors66.LeftArmColor = BrickColor.new("White")
BodyColors66.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors66.LeftLegColor = BrickColor.new("Medium blue")
BodyColors66.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors66.RightArmColor = BrickColor.new("White")
BodyColors66.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors66.RightLegColor = BrickColor.new("Medium blue")
BodyColors66.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors66.TorsoColor = BrickColor.new("White")
BodyColors66.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
Accessory67.Name = "PalHair"
Accessory67.Parent = Model39
Accessory67.AttachmentPoint = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory67.AttachmentPos = Vector3.new(0, 0.25, 0.25)
Part68.Name = "Handle"
Part68.Parent = Accessory67
Part68.CFrame = CFrame.new(103.386581, -350.448456, 47.2235947, -0.954213619, 0, -0.299131453, 0, 1, 0, 0.299131513, 0, -0.954213619)
Part68.Orientation = Vector3.new(0, -162.59500122070312, 0)
Part68.Position = Vector3.new(103.38658142089844, -350.4484558105469, 47.223594665527344)
Part68.Rotation = Vector3.new(180, -17.405000686645508, 180)
Part68.Size = Vector3.new(1, 1, 2)
Part68.BottomSurface = Enum.SurfaceType.Smooth
Part68.CanCollide = false
Part68.TopSurface = Enum.SurfaceType.Smooth
Part68.FormFactor = Enum.FormFactor.Symmetric
Part68.formFactor = Enum.FormFactor.Symmetric
SpecialMesh69.Parent = Part68
SpecialMesh69.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh69.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh69.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh69.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh69.MeshType = Enum.MeshType.FileMesh
Vector3Value70.Name = "OriginalSize"
Vector3Value70.Parent = Part68
Vector3Value70.Value = Vector3.new(1, 1, 2)
CharacterMesh71.Name = "3.0 Male Left Arm"
CharacterMesh71.Parent = Model39
CharacterMesh71.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh71.MeshId = 82907977
CharacterMesh72.Name = "3.0 Male Left Leg"
CharacterMesh72.Parent = Model39
CharacterMesh72.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh72.MeshId = 81487640
CharacterMesh73.Name = "3.0 Male Right Arm"
CharacterMesh73.Parent = Model39
CharacterMesh73.BodyPart = Enum.BodyPart.RightArm
CharacterMesh73.MeshId = 82908019
CharacterMesh74.Name = "3.0 Male Right Leg"
CharacterMesh74.Parent = Model39
CharacterMesh74.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh74.MeshId = 81487710
CharacterMesh75.Name = "3.0 Male Torso"
CharacterMesh75.Parent = Model39
CharacterMesh75.BodyPart = Enum.BodyPart.Torso
CharacterMesh75.MeshId = 82907945
Script76.Name = "Animate"
Script76.Parent = Model39
table.insert(cors,sandbox(Script76,function()
bacon = script.Parent
hum = bacon.Humanoid
tweenservice = game:GetService("TweenService")
stopanim = false

-- Welds

neck = bacon.Torso.Neck
torso = bacon.HumanoidRootPart.Root
rs = bacon.Torso.RS
ls = bacon.Torso.LS
rh = bacon.Torso.RH
lh = bacon.Torso.LH

-- lol

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

-- Animation

tweenobject(ls,{C0 = CFrame.new(-1, 0.65, -0.38)*CFrame.Angles(math.rad(-153.8), math.rad(-23.2),math.rad(95.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(lh,{C0 = CFrame.new(-0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(neck,{C0 = CFrame.new(0, 1.02, 0.13)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rh,{C0 = CFrame.new(0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)


-- Humanoid Stuff
--[[ -- old code from first version of sutart aaa
hum.Died:Connect(function()
stopanim = true
end)

-- Animation 

while true do
game:GetService("RunService").Heartbeat:Wait()
if stopanim == false then
neck.C0 = neck.C0:Lerp(CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
torso.C0 = torso.C0:Lerp(CFrame.new(0,-1.15,0)*CFrame.Angles(math.rad(-35),math.rad(0),math.rad(0)),0.3)
rs.C0 = rs.C0:Lerp(CFrame.new(1.5,0.75,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5)),0.3)
ls.C0 = ls.C0:Lerp(CFrame.new(-1.3,0.5,-0.85)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)),0.3)
rh.C0 = rh.C0:Lerp(CFrame.new(0.5,-0.85,0)*CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),0.3)
lh.C0 = lh.C0:Lerp(CFrame.new(-0.5,0.25,-0.25)*CFrame.Angles(math.rad(35),math.rad(0),math.rad(0)),0.3)
elseif stopanim == true then
break
end
end]]
end))
Model77.Name = "BaconHair"
Model77.Parent = Model0
Model77.PrimaryPart = Part82
Part78.Name = "Head"
Part78.Parent = Model77
Part78.CFrame = CFrame.new(114.416, -350.698456, 62.5367622, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part78.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part78.Position = Vector3.new(114.41600036621094, -350.6984558105469, 62.53676223754883)
Part78.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part78.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part78.Size = Vector3.new(2, 1, 1)
Part78.BrickColor = BrickColor.new("White")
Part78.TopSurface = Enum.SurfaceType.Smooth
Part78.brickColor = BrickColor.new("White")
Part78.FormFactor = Enum.FormFactor.Symmetric
Part78.formFactor = Enum.FormFactor.Symmetric
SpecialMesh79.Parent = Part78
SpecialMesh79.MeshId = "rbxassetid://83001675"
SpecialMesh79.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh79.MeshType = Enum.MeshType.FileMesh
Decal80.Name = "face"
Decal80.Parent = Part78
Decal80.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld81.Name = "HeadWeld"
Weld81.Parent = Part78
Weld81.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld81.C1 = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld81.Part0 = Part78
Weld81.Part1 = Part106
Weld81.part1 = Part106
Part82.Name = "HumanoidRootPart"
Part82.Parent = Model77
Part82.CFrame = CFrame.new(114.416, -352.198456, 62.5367622, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part82.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part82.Position = Vector3.new(114.41600036621094, -352.1984558105469, 62.53676223754883)
Part82.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part82.Transparency = 1
Part82.Size = Vector3.new(2, 2, 1)
Part82.BottomSurface = Enum.SurfaceType.Smooth
Part82.CanCollide = false
Part82.LeftParamA = 0
Part82.LeftParamB = 0
Part82.RightParamA = 0
Part82.RightParamB = 0
Part82.TopSurface = Enum.SurfaceType.Smooth
Part82.FormFactor = Enum.FormFactor.Symmetric
Part82.formFactor = Enum.FormFactor.Symmetric
Motor6D83.Name = "RootJoint"
Motor6D83.Parent = Part82
Motor6D83.MaxVelocity = 0.10000000149011612
Motor6D83.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D83.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D83.Part0 = Part82
Motor6D83.Part1 = Part89
Motor6D83.part1 = Part89
Weld84.Name = "Root"
Weld84.Parent = Part82
Weld84.Part0 = Part82
Weld84.Part1 = Part89
Weld84.part1 = Part89
Part85.Name = "Left Arm"
Part85.Parent = Model77
Part85.CFrame = CFrame.new(113.437302, -352.198456, 63.6734886, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part85.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part85.Position = Vector3.new(113.43730163574219, -352.1984558105469, 63.67348861694336)
Part85.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part85.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part85.Size = Vector3.new(1, 2, 1)
Part85.BrickColor = BrickColor.new("White")
Part85.CanCollide = false
Part85.brickColor = BrickColor.new("White")
Part85.FormFactor = Enum.FormFactor.Symmetric
Part85.formFactor = Enum.FormFactor.Symmetric
Part86.Name = "Left Leg"
Part86.Parent = Model77
Part86.CFrame = CFrame.new(114.089767, -354.198456, 62.9156723, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part86.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part86.Position = Vector3.new(114.08976745605469, -354.1984558105469, 62.915672302246094)
Part86.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part86.Color = Color3.new(0.431373, 0.6, 0.792157)
Part86.Size = Vector3.new(1, 2, 1)
Part86.BottomSurface = Enum.SurfaceType.Smooth
Part86.BrickColor = BrickColor.new("Medium blue")
Part86.CanCollide = false
Part86.brickColor = BrickColor.new("Medium blue")
Part86.FormFactor = Enum.FormFactor.Symmetric
Part86.formFactor = Enum.FormFactor.Symmetric
Part87.Name = "Right Arm"
Part87.Parent = Model77
Part87.CFrame = CFrame.new(115.394699, -352.198456, 61.4000359, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part87.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part87.Position = Vector3.new(115.39469909667969, -352.1984558105469, 61.4000358581543)
Part87.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part87.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part87.Size = Vector3.new(1, 2, 1)
Part87.BrickColor = BrickColor.new("White")
Part87.CanCollide = false
Part87.brickColor = BrickColor.new("White")
Part87.FormFactor = Enum.FormFactor.Symmetric
Part87.formFactor = Enum.FormFactor.Symmetric
Part88.Name = "Right Leg"
Part88.Parent = Model77
Part88.CFrame = CFrame.new(114.742233, -354.198456, 62.1578522, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part88.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part88.Position = Vector3.new(114.74223327636719, -354.1984558105469, 62.15785217285156)
Part88.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part88.Color = Color3.new(0.431373, 0.6, 0.792157)
Part88.Size = Vector3.new(1, 2, 1)
Part88.BottomSurface = Enum.SurfaceType.Smooth
Part88.BrickColor = BrickColor.new("Medium blue")
Part88.CanCollide = false
Part88.brickColor = BrickColor.new("Medium blue")
Part88.FormFactor = Enum.FormFactor.Symmetric
Part88.formFactor = Enum.FormFactor.Symmetric
Part89.Name = "Torso"
Part89.Parent = Model77
Part89.CFrame = CFrame.new(114.416, -352.198456, 62.5367622, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part89.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part89.Position = Vector3.new(114.41600036621094, -352.1984558105469, 62.53676223754883)
Part89.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part89.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part89.Size = Vector3.new(2, 2, 1)
Part89.BrickColor = BrickColor.new("White")
Part89.LeftParamA = 0
Part89.LeftParamB = 0
Part89.LeftSurface = Enum.SurfaceType.Weld
Part89.RightParamA = 0
Part89.RightParamB = 0
Part89.RightSurface = Enum.SurfaceType.Weld
Part89.brickColor = BrickColor.new("White")
Part89.FormFactor = Enum.FormFactor.Symmetric
Part89.formFactor = Enum.FormFactor.Symmetric
Decal90.Name = "roblox"
Decal90.Parent = Part89
Motor6D91.Name = "Right Shoulder"
Motor6D91.Parent = Part89
Motor6D91.MaxVelocity = 0.10000000149011612
Motor6D91.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D91.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D91.Part0 = Part89
Motor6D91.Part1 = Part87
Motor6D91.part1 = Part87
Motor6D92.Name = "Right Hip"
Motor6D92.Parent = Part89
Motor6D92.MaxVelocity = 0.10000000149011612
Motor6D92.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D92.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D92.Part0 = Part89
Motor6D92.Part1 = Part88
Motor6D92.part1 = Part88
Motor6D93.Name = "Neck"
Motor6D93.Parent = Part89
Motor6D93.MaxVelocity = 0.10000000149011612
Motor6D93.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D93.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D93.Part0 = Part89
Motor6D93.Part1 = Part78
Motor6D93.part1 = Part78
Motor6D94.Name = "Left Shoulder"
Motor6D94.Parent = Part89
Motor6D94.MaxVelocity = 0.10000000149011612
Motor6D94.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D94.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D94.Part0 = Part89
Motor6D94.Part1 = Part85
Motor6D94.part1 = Part85
Motor6D95.Name = "Left Hip"
Motor6D95.Parent = Part89
Motor6D95.MaxVelocity = 0.10000000149011612
Motor6D95.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D95.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D95.Part0 = Part89
Motor6D95.Part1 = Part86
Motor6D95.part1 = Part86
Weld96.Name = "LH"
Weld96.Parent = Part89
Weld96.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld96.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld96.Part0 = Part89
Weld96.Part1 = Part86
Weld96.part1 = Part86
Weld97.Name = "LS"
Weld97.Parent = Part89
Weld97.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld97.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld97.Part0 = Part89
Weld97.Part1 = Part85
Weld97.part1 = Part85
Weld98.Name = "Neck"
Weld98.Parent = Part89
Weld98.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld98.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld98.Part0 = Part89
Weld98.Part1 = Part78
Weld98.part1 = Part78
Weld99.Name = "RH"
Weld99.Parent = Part89
Weld99.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld99.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld99.Part0 = Part89
Weld99.Part1 = Part88
Weld99.part1 = Part88
Weld100.Name = "RS"
Weld100.Parent = Part89
Weld100.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld100.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld100.Part0 = Part89
Weld100.Part1 = Part87
Weld100.part1 = Part87
Humanoid101.Parent = Model77
Humanoid101.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid101.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid101.LeftLeg = Part86
Humanoid101.RightLeg = Part88
Humanoid101.Torso = Part82
Pants102.Name = "Pants"
Pants102.Parent = Model77
Pants102.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt103.Name = "Shirt"
Shirt103.Parent = Model77
Shirt103.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors104.Parent = Model77
BodyColors104.HeadColor = BrickColor.new("White")
BodyColors104.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors104.LeftArmColor = BrickColor.new("White")
BodyColors104.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors104.LeftLegColor = BrickColor.new("Medium blue")
BodyColors104.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors104.RightArmColor = BrickColor.new("White")
BodyColors104.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors104.RightLegColor = BrickColor.new("Medium blue")
BodyColors104.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors104.TorsoColor = BrickColor.new("White")
BodyColors104.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
Accessory105.Name = "PalHair"
Accessory105.Parent = Model77
Accessory105.AttachmentPoint = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory105.AttachmentPos = Vector3.new(0, 0.25, 0.25)
Part106.Name = "Handle"
Part106.Parent = Accessory105
Part106.CFrame = CFrame.new(114.226547, -350.448456, 62.3736458, 0.652468204, 0, 0.757818341, 0, 1, 0, -0.757818341, 0, 0.652468204)
Part106.Orientation = Vector3.new(0, 49.27199935913086, 0)
Part106.Position = Vector3.new(114.22654724121094, -350.4484558105469, 62.3736457824707)
Part106.Rotation = Vector3.new(0, 49.27199935913086, 0)
Part106.Size = Vector3.new(1, 1, 2)
Part106.BottomSurface = Enum.SurfaceType.Smooth
Part106.CanCollide = false
Part106.TopSurface = Enum.SurfaceType.Smooth
Part106.FormFactor = Enum.FormFactor.Symmetric
Part106.formFactor = Enum.FormFactor.Symmetric
SpecialMesh107.Parent = Part106
SpecialMesh107.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh107.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh107.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh107.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh107.MeshType = Enum.MeshType.FileMesh
Vector3Value108.Name = "OriginalSize"
Vector3Value108.Parent = Part106
Vector3Value108.Value = Vector3.new(1, 1, 2)
CharacterMesh109.Name = "3.0 Male Left Arm"
CharacterMesh109.Parent = Model77
CharacterMesh109.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh109.MeshId = 82907977
CharacterMesh110.Name = "3.0 Male Left Leg"
CharacterMesh110.Parent = Model77
CharacterMesh110.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh110.MeshId = 81487640
CharacterMesh111.Name = "3.0 Male Right Arm"
CharacterMesh111.Parent = Model77
CharacterMesh111.BodyPart = Enum.BodyPart.RightArm
CharacterMesh111.MeshId = 82908019
CharacterMesh112.Name = "3.0 Male Right Leg"
CharacterMesh112.Parent = Model77
CharacterMesh112.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh112.MeshId = 81487710
CharacterMesh113.Name = "3.0 Male Torso"
CharacterMesh113.Parent = Model77
CharacterMesh113.BodyPart = Enum.BodyPart.Torso
CharacterMesh113.MeshId = 82907945
Script114.Name = "Animate"
Script114.Parent = Model77
table.insert(cors,sandbox(Script114,function()
bacon = script.Parent
hum = bacon.Humanoid
tweenservice = game:GetService("TweenService")
stopanim = false

-- Welds

neck = bacon.Torso.Neck
torso = bacon.HumanoidRootPart.Root
rs = bacon.Torso.RS
ls = bacon.Torso.LS
rh = bacon.Torso.RH
lh = bacon.Torso.LH

-- lol

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

-- Animation

tweenobject(ls,{C0 = CFrame.new(-1, 0.65, -0.38)*CFrame.Angles(math.rad(-153.8), math.rad(-23.2),math.rad(95.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(lh,{C0 = CFrame.new(-0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(neck,{C0 = CFrame.new(0, 1.02, 0.13)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rh,{C0 = CFrame.new(0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)


-- Humanoid Stuff
--[[ -- old code from first version of sutart aaa
hum.Died:Connect(function()
stopanim = true
end)

-- Animation 

while true do
game:GetService("RunService").Heartbeat:Wait()
if stopanim == false then
neck.C0 = neck.C0:Lerp(CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
torso.C0 = torso.C0:Lerp(CFrame.new(0,-1.15,0)*CFrame.Angles(math.rad(-35),math.rad(0),math.rad(0)),0.3)
rs.C0 = rs.C0:Lerp(CFrame.new(1.5,0.75,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5)),0.3)
ls.C0 = ls.C0:Lerp(CFrame.new(-1.3,0.5,-0.85)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)),0.3)
rh.C0 = rh.C0:Lerp(CFrame.new(0.5,-0.85,0)*CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),0.3)
lh.C0 = lh.C0:Lerp(CFrame.new(-0.5,0.25,-0.25)*CFrame.Angles(math.rad(35),math.rad(0),math.rad(0)),0.3)
elseif stopanim == true then
break
end
end]]
end))
Model115.Name = "BaconHair"
Model115.Parent = Model0
Model115.PrimaryPart = Part120
Part116.Name = "Head"
Part116.Parent = Model115
Part116.CFrame = CFrame.new(114.428589, -350.698456, 50.5963974, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part116.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part116.Position = Vector3.new(114.4285888671875, -350.6984558105469, 50.596397399902344)
Part116.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part116.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part116.Size = Vector3.new(2, 1, 1)
Part116.BrickColor = BrickColor.new("White")
Part116.CanCollide = false
Part116.TopSurface = Enum.SurfaceType.Smooth
Part116.brickColor = BrickColor.new("White")
Part116.FormFactor = Enum.FormFactor.Symmetric
Part116.formFactor = Enum.FormFactor.Symmetric
SpecialMesh117.Parent = Part116
SpecialMesh117.MeshId = "rbxassetid://83001675"
SpecialMesh117.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh117.MeshType = Enum.MeshType.FileMesh
Decal118.Name = "face"
Decal118.Parent = Part116
Decal118.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld119.Name = "HeadWeld"
Weld119.Parent = Part116
Weld119.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld119.C1 = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld119.Part0 = Part116
Weld119.Part1 = Part144
Weld119.part1 = Part144
Part120.Name = "HumanoidRootPart"
Part120.Parent = Model115
Part120.CFrame = CFrame.new(114.428589, -352.198456, 50.5963974, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part120.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part120.Position = Vector3.new(114.4285888671875, -352.1984558105469, 50.596397399902344)
Part120.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part120.Transparency = 1
Part120.Size = Vector3.new(2, 2, 1)
Part120.BottomSurface = Enum.SurfaceType.Smooth
Part120.CanCollide = false
Part120.LeftParamA = 0
Part120.LeftParamB = 0
Part120.RightParamA = 0
Part120.RightParamB = 0
Part120.TopSurface = Enum.SurfaceType.Smooth
Part120.FormFactor = Enum.FormFactor.Symmetric
Part120.formFactor = Enum.FormFactor.Symmetric
Motor6D121.Name = "RootJoint"
Motor6D121.Parent = Part120
Motor6D121.MaxVelocity = 0.10000000149011612
Motor6D121.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D121.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D121.Part0 = Part120
Motor6D121.Part1 = Part127
Motor6D121.part1 = Part127
Weld122.Name = "Root"
Weld122.Parent = Part120
Weld122.Part0 = Part120
Weld122.Part1 = Part127
Weld122.part1 = Part127
Part123.Name = "Left Arm"
Part123.Parent = Model115
Part123.CFrame = CFrame.new(115.311996, -352.198456, 51.80867, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part123.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part123.Position = Vector3.new(115.31199645996094, -352.1984558105469, 51.80867004394531)
Part123.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part123.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part123.Size = Vector3.new(1, 2, 1)
Part123.BrickColor = BrickColor.new("White")
Part123.CanCollide = false
Part123.brickColor = BrickColor.new("White")
Part123.FormFactor = Enum.FormFactor.Symmetric
Part123.formFactor = Enum.FormFactor.Symmetric
Part124.Name = "Left Leg"
Part124.Parent = Model115
Part124.CFrame = CFrame.new(114.723061, -354.198456, 51.0004883, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part124.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part124.Position = Vector3.new(114.72306060791016, -354.1984558105469, 51.00048828125)
Part124.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part124.Color = Color3.new(0.431373, 0.6, 0.792157)
Part124.Size = Vector3.new(1, 2, 1)
Part124.BottomSurface = Enum.SurfaceType.Smooth
Part124.BrickColor = BrickColor.new("Medium blue")
Part124.CanCollide = false
Part124.brickColor = BrickColor.new("Medium blue")
Part124.FormFactor = Enum.FormFactor.Symmetric
Part124.formFactor = Enum.FormFactor.Symmetric
Part125.Name = "Right Arm"
Part125.Parent = Model115
Part125.CFrame = CFrame.new(113.545181, -352.198456, 49.3841248, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part125.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part125.Position = Vector3.new(113.54518127441406, -352.1984558105469, 49.384124755859375)
Part125.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part125.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part125.Size = Vector3.new(1, 2, 1)
Part125.BrickColor = BrickColor.new("White")
Part125.CanCollide = false
Part125.brickColor = BrickColor.new("White")
Part125.FormFactor = Enum.FormFactor.Symmetric
Part125.formFactor = Enum.FormFactor.Symmetric
Part126.Name = "Right Leg"
Part126.Parent = Model115
Part126.CFrame = CFrame.new(114.134117, -354.198456, 50.1923065, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part126.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part126.Position = Vector3.new(114.13411712646484, -354.1984558105469, 50.19230651855469)
Part126.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part126.Color = Color3.new(0.431373, 0.6, 0.792157)
Part126.Size = Vector3.new(1, 2, 1)
Part126.BottomSurface = Enum.SurfaceType.Smooth
Part126.BrickColor = BrickColor.new("Medium blue")
Part126.CanCollide = false
Part126.brickColor = BrickColor.new("Medium blue")
Part126.FormFactor = Enum.FormFactor.Symmetric
Part126.formFactor = Enum.FormFactor.Symmetric
Part127.Name = "Torso"
Part127.Parent = Model115
Part127.CFrame = CFrame.new(114.428589, -352.198456, 50.5963974, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part127.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part127.Position = Vector3.new(114.4285888671875, -352.1984558105469, 50.596397399902344)
Part127.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part127.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part127.Size = Vector3.new(2, 2, 1)
Part127.BrickColor = BrickColor.new("White")
Part127.LeftParamA = 0
Part127.LeftParamB = 0
Part127.LeftSurface = Enum.SurfaceType.Weld
Part127.RightParamA = 0
Part127.RightParamB = 0
Part127.RightSurface = Enum.SurfaceType.Weld
Part127.brickColor = BrickColor.new("White")
Part127.FormFactor = Enum.FormFactor.Symmetric
Part127.formFactor = Enum.FormFactor.Symmetric
Decal128.Name = "roblox"
Decal128.Parent = Part127
Motor6D129.Name = "Right Shoulder"
Motor6D129.Parent = Part127
Motor6D129.MaxVelocity = 0.10000000149011612
Motor6D129.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D129.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D129.Part0 = Part127
Motor6D129.Part1 = Part125
Motor6D129.part1 = Part125
Motor6D130.Name = "Right Hip"
Motor6D130.Parent = Part127
Motor6D130.MaxVelocity = 0.10000000149011612
Motor6D130.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D130.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D130.Part0 = Part127
Motor6D130.Part1 = Part126
Motor6D130.part1 = Part126
Motor6D131.Name = "Neck"
Motor6D131.Parent = Part127
Motor6D131.MaxVelocity = 0.10000000149011612
Motor6D131.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D131.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D131.Part0 = Part127
Motor6D131.Part1 = Part116
Motor6D131.part1 = Part116
Motor6D132.Name = "Left Shoulder"
Motor6D132.Parent = Part127
Motor6D132.MaxVelocity = 0.10000000149011612
Motor6D132.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D132.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D132.Part0 = Part127
Motor6D132.Part1 = Part123
Motor6D132.part1 = Part123
Motor6D133.Name = "Left Hip"
Motor6D133.Parent = Part127
Motor6D133.MaxVelocity = 0.10000000149011612
Motor6D133.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D133.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D133.Part0 = Part127
Motor6D133.Part1 = Part124
Motor6D133.part1 = Part124
Weld134.Name = "LH"
Weld134.Parent = Part127
Weld134.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld134.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld134.Part0 = Part127
Weld134.Part1 = Part124
Weld134.part1 = Part124
Weld135.Name = "LS"
Weld135.Parent = Part127
Weld135.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld135.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld135.Part0 = Part127
Weld135.Part1 = Part123
Weld135.part1 = Part123
Weld136.Name = "Neck"
Weld136.Parent = Part127
Weld136.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld136.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld136.Part0 = Part127
Weld136.Part1 = Part116
Weld136.part1 = Part116
Weld137.Name = "RH"
Weld137.Parent = Part127
Weld137.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld137.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld137.Part0 = Part127
Weld137.Part1 = Part126
Weld137.part1 = Part126
Weld138.Name = "RS"
Weld138.Parent = Part127
Weld138.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld138.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld138.Part0 = Part127
Weld138.Part1 = Part125
Weld138.part1 = Part125
Humanoid139.Parent = Model115
Humanoid139.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid139.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid139.LeftLeg = Part124
Humanoid139.RightLeg = Part126
Humanoid139.Torso = Part120
Pants140.Name = "Pants"
Pants140.Parent = Model115
Pants140.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt141.Name = "Shirt"
Shirt141.Parent = Model115
Shirt141.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors142.Parent = Model115
BodyColors142.HeadColor = BrickColor.new("White")
BodyColors142.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors142.LeftArmColor = BrickColor.new("White")
BodyColors142.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors142.LeftLegColor = BrickColor.new("Medium blue")
BodyColors142.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors142.RightArmColor = BrickColor.new("White")
BodyColors142.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors142.RightLegColor = BrickColor.new("Medium blue")
BodyColors142.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors142.TorsoColor = BrickColor.new("White")
BodyColors142.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
Accessory143.Name = "PalHair"
Accessory143.Parent = Model115
Accessory143.AttachmentPoint = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory143.AttachmentPos = Vector3.new(0, 0.25, 0.25)
Part144.Name = "Handle"
Part144.Parent = Accessory143
Part144.CFrame = CFrame.new(114.226547, -350.448456, 50.7436333, -0.588936388, 0, 0.808181763, 0, 1, 0, -0.808181763, 0, -0.588936388)
Part144.Orientation = Vector3.new(0, 126.08100128173828, 0)
Part144.Position = Vector3.new(114.22654724121094, -350.4484558105469, 50.74363327026367)
Part144.Rotation = Vector3.new(180, 53.91899871826172, 180)
Part144.Size = Vector3.new(1, 1, 2)
Part144.BottomSurface = Enum.SurfaceType.Smooth
Part144.CanCollide = false
Part144.TopSurface = Enum.SurfaceType.Smooth
Part144.FormFactor = Enum.FormFactor.Symmetric
Part144.formFactor = Enum.FormFactor.Symmetric
SpecialMesh145.Parent = Part144
SpecialMesh145.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh145.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh145.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh145.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh145.MeshType = Enum.MeshType.FileMesh
Vector3Value146.Name = "OriginalSize"
Vector3Value146.Parent = Part144
Vector3Value146.Value = Vector3.new(1, 1, 2)
CharacterMesh147.Name = "3.0 Male Left Arm"
CharacterMesh147.Parent = Model115
CharacterMesh147.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh147.MeshId = 82907977
CharacterMesh148.Name = "3.0 Male Left Leg"
CharacterMesh148.Parent = Model115
CharacterMesh148.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh148.MeshId = 81487640
CharacterMesh149.Name = "3.0 Male Right Arm"
CharacterMesh149.Parent = Model115
CharacterMesh149.BodyPart = Enum.BodyPart.RightArm
CharacterMesh149.MeshId = 82908019
CharacterMesh150.Name = "3.0 Male Right Leg"
CharacterMesh150.Parent = Model115
CharacterMesh150.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh150.MeshId = 81487710
CharacterMesh151.Name = "3.0 Male Torso"
CharacterMesh151.Parent = Model115
CharacterMesh151.BodyPart = Enum.BodyPart.Torso
CharacterMesh151.MeshId = 82907945
Script152.Name = "Animate"
Script152.Parent = Model115
table.insert(cors,sandbox(Script152,function()
bacon = script.Parent
hum = bacon.Humanoid
tweenservice = game:GetService("TweenService")
stopanim = false

-- Welds

neck = bacon.Torso.Neck
torso = bacon.HumanoidRootPart.Root
rs = bacon.Torso.RS
ls = bacon.Torso.LS
rh = bacon.Torso.RH
lh = bacon.Torso.LH

-- lol

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

-- Animation

tweenobject(ls,{C0 = CFrame.new(-1, 0.65, -0.38)*CFrame.Angles(math.rad(-153.8), math.rad(-23.2),math.rad(95.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(lh,{C0 = CFrame.new(-0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(neck,{C0 = CFrame.new(0, 1.02, 0.13)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rh,{C0 = CFrame.new(0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)


-- Humanoid Stuff
--[[ -- old code from first version of sutart aaa
hum.Died:Connect(function()
stopanim = true
end)

-- Animation 

while true do
game:GetService("RunService").Heartbeat:Wait()
if stopanim == false then
neck.C0 = neck.C0:Lerp(CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
torso.C0 = torso.C0:Lerp(CFrame.new(0,-1.15,0)*CFrame.Angles(math.rad(-35),math.rad(0),math.rad(0)),0.3)
rs.C0 = rs.C0:Lerp(CFrame.new(1.5,0.75,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5)),0.3)
ls.C0 = ls.C0:Lerp(CFrame.new(-1.3,0.5,-0.85)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)),0.3)
rh.C0 = rh.C0:Lerp(CFrame.new(0.5,-0.85,0)*CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),0.3)
lh.C0 = lh.C0:Lerp(CFrame.new(-0.5,0.25,-0.25)*CFrame.Angles(math.rad(35),math.rad(0),math.rad(0)),0.3)
elseif stopanim == true then
break
end
end]]
end))
Model153.Name = "BaconHair"
Model153.Parent = Model0
Model153.PrimaryPart = Part158
Part154.Name = "Head"
Part154.Parent = Model153
Part154.CFrame = CFrame.new(96.057251, -350.698456, 56.5211716, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part154.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part154.Position = Vector3.new(96.0572509765625, -350.6984558105469, 56.52117156982422)
Part154.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part154.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part154.Size = Vector3.new(2, 1, 1)
Part154.BrickColor = BrickColor.new("White")
Part154.TopSurface = Enum.SurfaceType.Smooth
Part154.brickColor = BrickColor.new("White")
Part154.FormFactor = Enum.FormFactor.Symmetric
Part154.formFactor = Enum.FormFactor.Symmetric
SpecialMesh155.Parent = Part154
SpecialMesh155.MeshId = "rbxassetid://83001675"
SpecialMesh155.Scale = Vector3.new(1.25, 1.25, 1.25)
SpecialMesh155.MeshType = Enum.MeshType.FileMesh
Decal156.Name = "face"
Decal156.Parent = Part154
Decal156.Texture = "http://www.roblox.com/asset/?id=144080495"
Weld157.Name = "HeadWeld"
Weld157.Parent = Part154
Weld157.C0 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld157.C1 = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld157.Part0 = Part154
Weld157.Part1 = Part182
Weld157.part1 = Part182
Part158.Name = "HumanoidRootPart"
Part158.Parent = Model153
Part158.CFrame = CFrame.new(96.057251, -352.198456, 56.5211716, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part158.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part158.Position = Vector3.new(96.0572509765625, -352.1984558105469, 56.52117156982422)
Part158.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part158.Transparency = 1
Part158.Size = Vector3.new(2, 2, 1)
Part158.BottomSurface = Enum.SurfaceType.Smooth
Part158.CanCollide = false
Part158.LeftParamA = 0
Part158.LeftParamB = 0
Part158.RightParamA = 0
Part158.RightParamB = 0
Part158.TopSurface = Enum.SurfaceType.Smooth
Part158.FormFactor = Enum.FormFactor.Symmetric
Part158.formFactor = Enum.FormFactor.Symmetric
Motor6D159.Name = "RootJoint"
Motor6D159.Parent = Part158
Motor6D159.MaxVelocity = 0.10000000149011612
Motor6D159.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D159.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D159.Part0 = Part158
Motor6D159.Part1 = Part165
Motor6D159.part1 = Part165
Weld160.Name = "Root"
Weld160.Parent = Part158
Weld160.Part0 = Part158
Weld160.Part1 = Part165
Weld160.part1 = Part165
Part161.Name = "Left Arm"
Part161.Parent = Model153
Part161.CFrame = CFrame.new(96.492012, -352.198456, 55.085556, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part161.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part161.Position = Vector3.new(96.49201202392578, -352.1984558105469, 55.08555603027344)
Part161.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part161.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part161.Size = Vector3.new(1, 2, 1)
Part161.BrickColor = BrickColor.new("White")
Part161.CanCollide = false
Part161.brickColor = BrickColor.new("White")
Part161.FormFactor = Enum.FormFactor.Symmetric
Part161.formFactor = Enum.FormFactor.Symmetric
Part162.Name = "Left Leg"
Part162.Parent = Model153
Part162.CFrame = CFrame.new(96.2021713, -354.198456, 56.0426331, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part162.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part162.Position = Vector3.new(96.2021713256836, -354.1984558105469, 56.042633056640625)
Part162.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part162.Color = Color3.new(0.431373, 0.6, 0.792157)
Part162.Size = Vector3.new(1, 2, 1)
Part162.BottomSurface = Enum.SurfaceType.Smooth
Part162.BrickColor = BrickColor.new("Medium blue")
Part162.CanCollide = false
Part162.brickColor = BrickColor.new("Medium blue")
Part162.FormFactor = Enum.FormFactor.Symmetric
Part162.formFactor = Enum.FormFactor.Symmetric
Part163.Name = "Right Arm"
Part163.Parent = Model153
Part163.CFrame = CFrame.new(95.6224899, -352.198456, 57.9567871, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part163.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part163.Position = Vector3.new(95.62248992919922, -352.1984558105469, 57.956787109375)
Part163.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part163.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part163.Size = Vector3.new(1, 2, 1)
Part163.BrickColor = BrickColor.new("White")
Part163.CanCollide = false
Part163.brickColor = BrickColor.new("White")
Part163.FormFactor = Enum.FormFactor.Symmetric
Part163.formFactor = Enum.FormFactor.Symmetric
Part164.Name = "Right Leg"
Part164.Parent = Model153
Part164.CFrame = CFrame.new(95.9123306, -354.198456, 56.9997101, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part164.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part164.Position = Vector3.new(95.9123306274414, -354.1984558105469, 56.99971008300781)
Part164.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part164.Color = Color3.new(0.431373, 0.6, 0.792157)
Part164.Size = Vector3.new(1, 2, 1)
Part164.BottomSurface = Enum.SurfaceType.Smooth
Part164.BrickColor = BrickColor.new("Medium blue")
Part164.CanCollide = false
Part164.brickColor = BrickColor.new("Medium blue")
Part164.FormFactor = Enum.FormFactor.Symmetric
Part164.formFactor = Enum.FormFactor.Symmetric
Part165.Name = "Torso"
Part165.Parent = Model153
Part165.CFrame = CFrame.new(96.057251, -352.198456, 56.5211716, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part165.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part165.Position = Vector3.new(96.0572509765625, -352.1984558105469, 56.52117156982422)
Part165.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part165.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part165.Size = Vector3.new(2, 2, 1)
Part165.BrickColor = BrickColor.new("White")
Part165.LeftParamA = 0
Part165.LeftParamB = 0
Part165.LeftSurface = Enum.SurfaceType.Weld
Part165.RightParamA = 0
Part165.RightParamB = 0
Part165.RightSurface = Enum.SurfaceType.Weld
Part165.brickColor = BrickColor.new("White")
Part165.FormFactor = Enum.FormFactor.Symmetric
Part165.formFactor = Enum.FormFactor.Symmetric
Decal166.Name = "roblox"
Decal166.Parent = Part165
Motor6D167.Name = "Right Shoulder"
Motor6D167.Parent = Part165
Motor6D167.MaxVelocity = 0.10000000149011612
Motor6D167.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D167.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D167.Part0 = Part165
Motor6D167.Part1 = Part163
Motor6D167.part1 = Part163
Motor6D168.Name = "Right Hip"
Motor6D168.Parent = Part165
Motor6D168.MaxVelocity = 0.10000000149011612
Motor6D168.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D168.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D168.Part0 = Part165
Motor6D168.Part1 = Part164
Motor6D168.part1 = Part164
Motor6D169.Name = "Neck"
Motor6D169.Parent = Part165
Motor6D169.MaxVelocity = 0.10000000149011612
Motor6D169.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D169.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D169.Part0 = Part165
Motor6D169.Part1 = Part154
Motor6D169.part1 = Part154
Motor6D170.Name = "Left Shoulder"
Motor6D170.Parent = Part165
Motor6D170.MaxVelocity = 0.10000000149011612
Motor6D170.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D170.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D170.Part0 = Part165
Motor6D170.Part1 = Part161
Motor6D170.part1 = Part161
Motor6D171.Name = "Left Hip"
Motor6D171.Parent = Part165
Motor6D171.MaxVelocity = 0.10000000149011612
Motor6D171.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D171.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D171.Part0 = Part165
Motor6D171.Part1 = Part162
Motor6D171.part1 = Part162
Weld172.Name = "LH"
Weld172.Parent = Part165
Weld172.C0 = CFrame.new(-0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld172.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld172.Part0 = Part165
Weld172.Part1 = Part162
Weld172.part1 = Part162
Weld173.Name = "LS"
Weld173.Parent = Part165
Weld173.C0 = CFrame.new(-1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld173.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld173.Part0 = Part165
Weld173.Part1 = Part161
Weld173.part1 = Part161
Weld174.Name = "Neck"
Weld174.Parent = Part165
Weld174.C0 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld174.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld174.Part0 = Part165
Weld174.Part1 = Part154
Weld174.part1 = Part154
Weld175.Name = "RH"
Weld175.Parent = Part165
Weld175.C0 = CFrame.new(0.5, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld175.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld175.Part0 = Part165
Weld175.Part1 = Part164
Weld175.part1 = Part164
Weld176.Name = "RS"
Weld176.Parent = Part165
Weld176.C0 = CFrame.new(1.5, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld176.C1 = CFrame.new(0, 0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld176.Part0 = Part165
Weld176.Part1 = Part163
Weld176.part1 = Part163
Humanoid177.Parent = Model153
Humanoid177.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
Humanoid177.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
Humanoid177.LeftLeg = Part162
Humanoid177.RightLeg = Part164
Humanoid177.Torso = Part158
Pants178.Name = "Pants"
Pants178.Parent = Model153
Pants178.PantsTemplate = "http://www.roblox.com/asset/?id=144076759"
Shirt179.Name = "Shirt"
Shirt179.Parent = Model153
Shirt179.ShirtTemplate = "http://www.roblox.com/asset/?id=144076357"
BodyColors180.Parent = Model153
BodyColors180.HeadColor = BrickColor.new("White")
BodyColors180.HeadColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors180.LeftArmColor = BrickColor.new("White")
BodyColors180.LeftArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors180.LeftLegColor = BrickColor.new("Medium blue")
BodyColors180.LeftLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors180.RightArmColor = BrickColor.new("White")
BodyColors180.RightArmColor3 = Color3.new(0.94902, 0.952941, 0.952941)
BodyColors180.RightLegColor = BrickColor.new("Medium blue")
BodyColors180.RightLegColor3 = Color3.new(0.431373, 0.6, 0.792157)
BodyColors180.TorsoColor = BrickColor.new("White")
BodyColors180.TorsoColor3 = Color3.new(0.94902, 0.952941, 0.952941)
Accessory181.Name = "PalHair"
Accessory181.Parent = Model153
Accessory181.AttachmentPoint = CFrame.new(0, 0.25, 0.25, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory181.AttachmentPos = Vector3.new(0, 0.25, 0.25)
Part182.Name = "Handle"
Part182.Parent = Accessory181
Part182.CFrame = CFrame.new(96.2965164, -350.448456, 56.5936317, -0.289842725, 0, -0.957076192, 0, 1, 0, 0.957076192, 0, -0.289842635)
Part182.Orientation = Vector3.new(0, -106.8479995727539, 0)
Part182.Position = Vector3.new(96.29651641845703, -350.4484558105469, 56.593631744384766)
Part182.Rotation = Vector3.new(180, -73.1520004272461, 180)
Part182.Size = Vector3.new(1, 1, 2)
Part182.BottomSurface = Enum.SurfaceType.Smooth
Part182.CanCollide = false
Part182.TopSurface = Enum.SurfaceType.Smooth
Part182.FormFactor = Enum.FormFactor.Symmetric
Part182.formFactor = Enum.FormFactor.Symmetric
SpecialMesh183.Parent = Part182
SpecialMesh183.MeshId = "http://www.roblox.com/asset/?id=83293901"
SpecialMesh183.Scale = Vector3.new(1, 1.0499999523162842, 1)
SpecialMesh183.VertexColor = Vector3.new(1.2000000476837158, 1.399999976158142, 1.399999976158142)
SpecialMesh183.TextureId = "http://www.roblox.com/asset/?id=83284747"
SpecialMesh183.MeshType = Enum.MeshType.FileMesh
Vector3Value184.Name = "OriginalSize"
Vector3Value184.Parent = Part182
Vector3Value184.Value = Vector3.new(1, 1, 2)
CharacterMesh185.Name = "3.0 Male Left Arm"
CharacterMesh185.Parent = Model153
CharacterMesh185.BodyPart = Enum.BodyPart.LeftArm
CharacterMesh185.MeshId = 82907977
CharacterMesh186.Name = "3.0 Male Left Leg"
CharacterMesh186.Parent = Model153
CharacterMesh186.BodyPart = Enum.BodyPart.LeftLeg
CharacterMesh186.MeshId = 81487640
CharacterMesh187.Name = "3.0 Male Right Arm"
CharacterMesh187.Parent = Model153
CharacterMesh187.BodyPart = Enum.BodyPart.RightArm
CharacterMesh187.MeshId = 82908019
CharacterMesh188.Name = "3.0 Male Right Leg"
CharacterMesh188.Parent = Model153
CharacterMesh188.BodyPart = Enum.BodyPart.RightLeg
CharacterMesh188.MeshId = 81487710
CharacterMesh189.Name = "3.0 Male Torso"
CharacterMesh189.Parent = Model153
CharacterMesh189.BodyPart = Enum.BodyPart.Torso
CharacterMesh189.MeshId = 82907945
Script190.Name = "Animate"
Script190.Parent = Model153
table.insert(cors,sandbox(Script190,function()
bacon = script.Parent
hum = bacon.Humanoid
tweenservice = game:GetService("TweenService")
stopanim = false

-- Welds

neck = bacon.Torso.Neck
torso = bacon.HumanoidRootPart.Root
rs = bacon.Torso.RS
ls = bacon.Torso.LS
rh = bacon.Torso.RH
lh = bacon.Torso.LH

-- lol

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

-- Animation

tweenobject(ls,{C0 = CFrame.new(-1, 0.65, -0.38)*CFrame.Angles(math.rad(-153.8), math.rad(-23.2),math.rad(95.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(lh,{C0 = CFrame.new(-0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(neck,{C0 = CFrame.new(0, 1.02, 0.13)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rh,{C0 = CFrame.new(0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)


-- Humanoid Stuff
--[[ -- old code from first version of sutart aaa
hum.Died:Connect(function()
stopanim = true
end)

-- Animation 

while true do
game:GetService("RunService").Heartbeat:Wait()
if stopanim == false then
neck.C0 = neck.C0:Lerp(CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
torso.C0 = torso.C0:Lerp(CFrame.new(0,-1.15,0)*CFrame.Angles(math.rad(-35),math.rad(0),math.rad(0)),0.3)
rs.C0 = rs.C0:Lerp(CFrame.new(1.5,0.75,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(5)),0.3)
ls.C0 = ls.C0:Lerp(CFrame.new(-1.3,0.5,-0.85)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(90)),0.3)
rh.C0 = rh.C0:Lerp(CFrame.new(0.5,-0.85,0)*CFrame.Angles(math.rad(-25),math.rad(0),math.rad(0)),0.3)
lh.C0 = lh.C0:Lerp(CFrame.new(-0.5,0.25,-0.25)*CFrame.Angles(math.rad(35),math.rad(0),math.rad(0)),0.3)
elseif stopanim == true then
break
end
end]]
end))
Part191.Name = "Soul"
Part191.Parent = Model0
Part191.CFrame = CFrame.new(114.428146, -352.198761, 50.5963669, 1.00000215, 0, -2.98023437e-08, 0, 1, 0, -2.98023437e-08, 0, 1.00000215)
Part191.Position = Vector3.new(114.42814636230469, -352.1987609863281, 50.59636688232422)
Part191.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part191.Transparency = 1
Part191.Size = Vector3.new(2, 2, 2)
Part191.BottomSurface = Enum.SurfaceType.Smooth
Part191.BrickColor = BrickColor.new("White")
Part191.CanCollide = false
Part191.Material = Enum.Material.Neon
Part191.TopSurface = Enum.SurfaceType.Smooth
Part191.brickColor = BrickColor.new("White")
Part191.Shape = Enum.PartType.Ball
ParticleEmitter192.Parent = Part191
ParticleEmitter192.Enabled = false
ParticleEmitter192.LightEmission = 1
ParticleEmitter192.LightInfluence = 0.25
ParticleEmitter192.Texture = "rbxassetid://4753372559"
ParticleEmitter192.Transparency = NumberSequence.new(0,0.949999988079071,0,1)
ParticleEmitter192.Size = NumberSequence.new(1,0)
ParticleEmitter192.Lifetime = NumberRange.new(0.15000000596046448, 1)
ParticleEmitter192.LockedToPart = true
ParticleEmitter192.Rate = 4500
ParticleEmitter192.RotSpeed = NumberRange.new(1500, 1500)
Part193.Name = "Soul"
Part193.Parent = Model0
Part193.CFrame = CFrame.new(103.312134, -352.198761, 46.9853592, 1.00000215, 0, -2.98023437e-08, 0, 1, 0, -2.98023437e-08, 0, 1.00000215)
Part193.Position = Vector3.new(103.3121337890625, -352.1987609863281, 46.98535919189453)
Part193.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part193.Transparency = 1
Part193.Size = Vector3.new(2, 2, 2)
Part193.BottomSurface = Enum.SurfaceType.Smooth
Part193.BrickColor = BrickColor.new("White")
Part193.CanCollide = false
Part193.Material = Enum.Material.Neon
Part193.TopSurface = Enum.SurfaceType.Smooth
Part193.brickColor = BrickColor.new("White")
Part193.Shape = Enum.PartType.Ball
ParticleEmitter194.Parent = Part193
ParticleEmitter194.Enabled = false
ParticleEmitter194.LightEmission = 1
ParticleEmitter194.LightInfluence = 0.25
ParticleEmitter194.Texture = "rbxassetid://4753372559"
ParticleEmitter194.Transparency = NumberSequence.new(0,0.949999988079071,0,1)
ParticleEmitter194.Size = NumberSequence.new(1,0)
ParticleEmitter194.Lifetime = NumberRange.new(0.15000000596046448, 1)
ParticleEmitter194.LockedToPart = true
ParticleEmitter194.Rate = 4500
ParticleEmitter194.RotSpeed = NumberRange.new(1500, 1500)
Part195.Name = "Soul"
Part195.Parent = Model0
Part195.CFrame = CFrame.new(96.057106, -352.198761, 56.5213776, 1.00000215, 0, -2.98023437e-08, 0, 1, 0, -2.98023437e-08, 0, 1.00000215)
Part195.Position = Vector3.new(96.0571060180664, -352.1987609863281, 56.52137756347656)
Part195.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part195.Transparency = 1
Part195.Size = Vector3.new(2, 2, 2)
Part195.BottomSurface = Enum.SurfaceType.Smooth
Part195.BrickColor = BrickColor.new("White")
Part195.CanCollide = false
Part195.Material = Enum.Material.Neon
Part195.TopSurface = Enum.SurfaceType.Smooth
Part195.brickColor = BrickColor.new("White")
Part195.Shape = Enum.PartType.Ball
ParticleEmitter196.Parent = Part195
ParticleEmitter196.Enabled = false
ParticleEmitter196.LightEmission = 1
ParticleEmitter196.LightInfluence = 0.25
ParticleEmitter196.Texture = "rbxassetid://4753372559"
ParticleEmitter196.Transparency = NumberSequence.new(0,0.949999988079071,0,1)
ParticleEmitter196.Size = NumberSequence.new(1,0)
ParticleEmitter196.Lifetime = NumberRange.new(0.15000000596046448, 1)
ParticleEmitter196.LockedToPart = true
ParticleEmitter196.Rate = 4500
ParticleEmitter196.RotSpeed = NumberRange.new(1500, 1500)
Part197.Name = "Soul"
Part197.Parent = Model0
Part197.CFrame = CFrame.new(114.416153, -352.198761, 62.5363922, 1.00000215, 0, -2.98023437e-08, 0, 1, 0, -2.98023437e-08, 0, 1.00000215)
Part197.Position = Vector3.new(114.41615295410156, -352.1987609863281, 62.53639221191406)
Part197.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part197.Transparency = 1
Part197.Size = Vector3.new(2, 2, 2)
Part197.BottomSurface = Enum.SurfaceType.Smooth
Part197.BrickColor = BrickColor.new("White")
Part197.CanCollide = false
Part197.Material = Enum.Material.Neon
Part197.TopSurface = Enum.SurfaceType.Smooth
Part197.brickColor = BrickColor.new("White")
Part197.Shape = Enum.PartType.Ball
ParticleEmitter198.Parent = Part197
ParticleEmitter198.Enabled = false
ParticleEmitter198.LightEmission = 1
ParticleEmitter198.LightInfluence = 0.25
ParticleEmitter198.Texture = "rbxassetid://4753372559"
ParticleEmitter198.Transparency = NumberSequence.new(0,0.949999988079071,0,1)
ParticleEmitter198.Size = NumberSequence.new(1,0)
ParticleEmitter198.Lifetime = NumberRange.new(0.15000000596046448, 1)
ParticleEmitter198.LockedToPart = true
ParticleEmitter198.Rate = 4500
ParticleEmitter198.RotSpeed = NumberRange.new(1500, 1500)
Part199.Name = "Soul"
Part199.Parent = Model0
Part199.CFrame = CFrame.new(103.354126, -352.198761, 65.5233994, 1.00000215, 0, -2.98023437e-08, 0, 1, 0, -2.98023437e-08, 0, 1.00000215)
Part199.Position = Vector3.new(103.3541259765625, -352.1987609863281, 65.52339935302734)
Part199.Color = Color3.new(0.94902, 0.952941, 0.952941)
Part199.Transparency = 1
Part199.Size = Vector3.new(2, 2, 2)
Part199.BottomSurface = Enum.SurfaceType.Smooth
Part199.BrickColor = BrickColor.new("White")
Part199.CanCollide = false
Part199.Material = Enum.Material.Neon
Part199.TopSurface = Enum.SurfaceType.Smooth
Part199.brickColor = BrickColor.new("White")
Part199.Shape = Enum.PartType.Ball
ParticleEmitter200.Parent = Part199
ParticleEmitter200.Enabled = false
ParticleEmitter200.LightEmission = 1
ParticleEmitter200.LightInfluence = 0.25
ParticleEmitter200.Texture = "rbxassetid://4753372559"
ParticleEmitter200.Transparency = NumberSequence.new(0,0.949999988079071,0,1)
ParticleEmitter200.Size = NumberSequence.new(1,0)
ParticleEmitter200.Lifetime = NumberRange.new(0.15000000596046448, 1)
ParticleEmitter200.LockedToPart = true
ParticleEmitter200.Rate = 4500
ParticleEmitter200.RotSpeed = NumberRange.new(1500, 1500)
Part201.Name = "HandlePartlol"
Part201.Parent = Model0
Part201.CFrame = CFrame.new(106.165604, -352.541748, 56.7705154, 1.00000143, 0, -2.98023224e-08, 0, 1, 0, -2.98023224e-08, 0, 1.00000143)
Part201.Position = Vector3.new(106.16560363769531, -352.541748046875, 56.77051544189453)
Part201.Transparency = 1
Part201.Size = Vector3.new(2, 2, 1)
Part201.Anchored = true
Part201.BottomSurface = Enum.SurfaceType.Smooth
Part201.CanCollide = false
Part201.LeftParamA = 0
Part201.LeftParamB = 0
Part201.RightParamA = 0
Part201.RightParamB = 0
Part201.TopSurface = Enum.SurfaceType.Smooth
Part201.FormFactor = Enum.FormFactor.Symmetric
Part201.formFactor = Enum.FormFactor.Symmetric
Weld202.Parent = Part201
Weld202.C0 = CFrame.new(-2.85380554, 0.343286991, -9.78545761, -0.954212248, 0, -0.299131066, 0, 1, 0, 0.299131066, 0, -0.954212248)
Weld202.Part0 = Part201
Weld202.Part1 = Part44
Weld202.part1 = Part44
Weld203.Parent = Part201
Weld203.C0 = CFrame.new(8.2503891, 0.343286991, 5.76623917, 0.652467251, 0, 0.757817268, 0, 1, 0, -0.757817268, 0, 0.652467251)
Weld203.Part0 = Part201
Weld203.Part1 = Part82
Weld203.part1 = Part82
Weld204.Parent = Part201
Weld204.C0 = CFrame.new(-10.1083374, 0.343286991, -0.249341965, -0.289842278, 0, -0.957074821, 0, 1, 0, 0.957074821, 0, -0.289842248)
Weld204.Part0 = Part201
Weld204.Part1 = Part158
Weld204.part1 = Part158
Weld205.Parent = Part201
Weld205.C0 = CFrame.new(8.26296997, 0.343286991, -6.17410851, -0.588935554, 0, 0.80818063, 0, 1, 0, -0.80818063, 0, -0.588935554)
Weld205.Part0 = Part201
Weld205.Part1 = Part120
Weld205.part1 = Part120
Weld206.Parent = Part201
Weld206.C0 = CFrame.new(-2.81116486, 0.343286991, 8.75247574, 0.957465053, 0, -0.288551301, 0, 1, 0, 0.288551301, 0, 0.957465053)
Weld206.Part0 = Part201
Weld206.Part1 = Part6
Weld206.part1 = Part6
Weld207.Name = "Soul"
Weld207.Parent = Part201
Weld207.C0 = CFrame.new(8.25053406, 0.342998981, 5.76586723, 1.00000072, 0, 0, 0, 1, 0, 0, 0, 1.00000072)
Weld207.Part0 = Part201
Weld207.Part1 = Part197
Weld207.part1 = Part197
Weld208.Name = "Soul"
Weld208.Parent = Part201
Weld208.C0 = CFrame.new(-2.81147003, 0.342998981, 8.75286865, 1.00000072, 0, 0, 0, 1, 0, 0, 0, 1.00000072)
Weld208.Part0 = Part201
Weld208.Part1 = Part199
Weld208.part1 = Part199
Weld209.Name = "Soul"
Weld209.Parent = Part201
Weld209.C0 = CFrame.new(8.2625351, 0.342998981, -6.17413902, 1.00000072, 0, 0, 0, 1, 0, 0, 0, 1.00000072)
Weld209.Part0 = Part201
Weld209.Part1 = Part191
Weld209.part1 = Part191
Weld210.Name = "Soul"
Weld210.Parent = Part201
Weld210.C0 = CFrame.new(-2.85346985, 0.342998981, -9.7851429, 1.00000072, 0, 0, 0, 1, 0, 0, 0, 1.00000072)
Weld210.Part0 = Part201
Weld210.Part1 = Part193
Weld210.part1 = Part193
Weld211.Name = "Soul"
Weld211.Parent = Part201
Weld211.C0 = CFrame.new(-10.1084824, 0.342998981, -0.249135971, 1.00000072, 0, 0, 0, 1, 0, 0, 0, 1.00000072)
Weld211.Part0 = Part201
Weld211.Part1 = Part195
Weld211.part1 = Part195
ParticleEmitter212.Name = "Orb"
ParticleEmitter212.Parent = Part201
ParticleEmitter212.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter212.Rotation = NumberRange.new(200, 200)
ParticleEmitter212.Enabled = false
ParticleEmitter212.LightEmission = 1
ParticleEmitter212.LightInfluence = 1
ParticleEmitter212.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter212.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter212.ZOffset = 1
ParticleEmitter212.Shape = Enum.ParticleEmitterShape.Disc
ParticleEmitter212.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter212.LockedToPart = true
ParticleEmitter212.Rate = 500
ParticleEmitter212.RotSpeed = NumberRange.new(20, 20)
Weld213.Name = "Beam"
Weld213.Parent = Part201
Weld213.C0 = CFrame.new(4.23352814, 0.342987061, -3.13806152, 0.798638344, 0, 0.601817131, 0, 1, 0, -0.601817131, 0, 0.798638344)
Weld213.Part0 = Part201
Weld213.Part1 = Part218
Weld213.part1 = Part218
Weld214.Name = "Beam2"
Weld214.Parent = Part201
Weld214.C0 = CFrame.new(-1.47046661, 0.342987061, -4.962677, -0.258819342, 0, 0.965927303, 0, 1, 0, -0.965927303, 0, -0.258819401)
Weld214.Part0 = Part201
Weld214.Part1 = Part220
Weld214.part1 = Part220
Weld215.Name = "Beam3"
Weld215.Parent = Part201
Weld215.C0 = CFrame.new(-4.88490677, 0.342987061, -0.0615730286, -0.99939239, 0, 0.0348995663, 0, 1, 0, -0.0348995067, 0, -0.99939239)
Weld215.Part0 = Part201
Weld215.Part1 = Part222
Weld215.part1 = Part222
Weld216.Name = "Beam4"
Weld216.Parent = Part201
Weld216.C0 = CFrame.new(-1.48072433, 0.342987061, 4.30992126, -0.292372197, 0, -0.956306159, 0, 1, 0, 0.956306159, 0, -0.292372137)
Weld216.Part0 = Part201
Weld216.Part1 = Part224
Weld216.part1 = Part224
Weld217.Name = "Beam5"
Weld217.Parent = Part201
Weld217.C0 = CFrame.new(4.59552383, 0.342987061, 3.0410614, 0.819153309, 0, -0.573577285, 0, 1, 0, 0.573577285, 0, 0.819153309)
Weld217.Part0 = Part201
Weld217.Part1 = Part226
Weld217.part1 = Part226
Part218.Name = "Beam"
Part218.Parent = Model0
Part218.CFrame = CFrame.new(110.399139, -352.198761, 53.6324501, 0.798639476, 0, 0.601817966, 0, 1, 0, -0.601817966, 0, 0.798639476)
Part218.Orientation = Vector3.new(0, 37, 0)
Part218.Position = Vector3.new(110.39913940429688, -352.1987609863281, 53.632450103759766)
Part218.Rotation = Vector3.new(0, 37, 0)
Part218.Color = Color3.new(0, 0, 0)
Part218.Transparency = 1
Part218.Size = Vector3.new(10.608702659606934, 0.4635119140148163, 0.5542929172515869)
Part218.BottomSurface = Enum.SurfaceType.Smooth
Part218.BrickColor = BrickColor.new("Really black")
Part218.CanCollide = false
Part218.Material = Enum.Material.Metal
Part218.TopSurface = Enum.SurfaceType.Smooth
Part218.brickColor = BrickColor.new("Really black")
Part218.Shape = Enum.PartType.Cylinder
ParticleEmitter219.Parent = Part218
ParticleEmitter219.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter219.Rotation = NumberRange.new(200, 200)
ParticleEmitter219.Enabled = false
ParticleEmitter219.LightEmission = 1
ParticleEmitter219.LightInfluence = 1
ParticleEmitter219.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter219.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter219.Size = NumberSequence.new(0.5,0.9999996423721313)
ParticleEmitter219.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter219.LockedToPart = true
ParticleEmitter219.Rate = 500
ParticleEmitter219.RotSpeed = NumberRange.new(20, 20)
Part220.Name = "Beam2"
Part220.Parent = Model0
Part220.CFrame = CFrame.new(104.695137, -352.198761, 51.8078308, -0.258819669, 0, 0.965928674, 0, 1, 0, -0.965928674, 0, -0.258819789)
Part220.Orientation = Vector3.new(0, 105, 0)
Part220.Position = Vector3.new(104.69513702392578, -352.1987609863281, 51.807830810546875)
Part220.Rotation = Vector3.new(180, 75.0009994506836, 180)
Part220.Color = Color3.new(0, 0, 0)
Part220.Transparency = 1
Part220.Size = Vector3.new(10.608702659606934, 0.4635119140148163, 0.5542929172515869)
Part220.BottomSurface = Enum.SurfaceType.Smooth
Part220.BrickColor = BrickColor.new("Really black")
Part220.CanCollide = false
Part220.Material = Enum.Material.Metal
Part220.TopSurface = Enum.SurfaceType.Smooth
Part220.brickColor = BrickColor.new("Really black")
Part220.Shape = Enum.PartType.Cylinder
ParticleEmitter221.Parent = Part220
ParticleEmitter221.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter221.Rotation = NumberRange.new(200, 200)
ParticleEmitter221.Enabled = false
ParticleEmitter221.LightEmission = 1
ParticleEmitter221.LightInfluence = 1
ParticleEmitter221.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter221.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter221.Size = NumberSequence.new(0.5,0.9999996423721313)
ParticleEmitter221.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter221.LockedToPart = true
ParticleEmitter221.Rate = 500
ParticleEmitter221.RotSpeed = NumberRange.new(20, 20)
Part222.Name = "Beam3"
Part222.Parent = Model0
Part222.CFrame = CFrame.new(101.280693, -352.198761, 56.7089424, -0.999393821, 0, 0.0348996446, 0, 1, 0, -0.0348995253, 0, -0.999393821)
Part222.Orientation = Vector3.new(0, 178, 0)
Part222.Position = Vector3.new(101.28069305419922, -352.1987609863281, 56.70894241333008)
Part222.Rotation = Vector3.new(180, 2, 180)
Part222.Color = Color3.new(0, 0, 0)
Part222.Transparency = 1
Part222.Size = Vector3.new(10.608702659606934, 0.4635119140148163, 0.5542929172515869)
Part222.BottomSurface = Enum.SurfaceType.Smooth
Part222.BrickColor = BrickColor.new("Really black")
Part222.CanCollide = false
Part222.Material = Enum.Material.Metal
Part222.TopSurface = Enum.SurfaceType.Smooth
Part222.brickColor = BrickColor.new("Really black")
Part222.Shape = Enum.PartType.Cylinder
ParticleEmitter223.Parent = Part222
ParticleEmitter223.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter223.Rotation = NumberRange.new(200, 200)
ParticleEmitter223.Enabled = false
ParticleEmitter223.LightEmission = 1
ParticleEmitter223.LightInfluence = 1
ParticleEmitter223.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter223.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter223.Size = NumberSequence.new(0.5,0.9999996423721313)
ParticleEmitter223.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter223.LockedToPart = true
ParticleEmitter223.Rate = 500
ParticleEmitter223.RotSpeed = NumberRange.new(20, 20)
Part224.Name = "Beam4"
Part224.Parent = Model0
Part224.CFrame = CFrame.new(104.684875, -352.198761, 61.0804443, -0.292372644, 0, -0.95630753, 0, 1, 0, 0.95630753, 0, -0.292372525)
Part224.Orientation = Vector3.new(0, -107, 0)
Part224.Position = Vector3.new(104.68487548828125, -352.1987609863281, 61.0804443359375)
Part224.Rotation = Vector3.new(180, -73.0009994506836, 180)
Part224.Color = Color3.new(0, 0, 0)
Part224.Transparency = 1
Part224.Size = Vector3.new(9.949999809265137, 0.4635119140148163, 0.5542929172515869)
Part224.BottomSurface = Enum.SurfaceType.Smooth
Part224.BrickColor = BrickColor.new("Really black")
Part224.CanCollide = false
Part224.Material = Enum.Material.Metal
Part224.TopSurface = Enum.SurfaceType.Smooth
Part224.brickColor = BrickColor.new("Really black")
Part224.Shape = Enum.PartType.Cylinder
ParticleEmitter225.Parent = Part224
ParticleEmitter225.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter225.Rotation = NumberRange.new(200, 200)
ParticleEmitter225.Enabled = false
ParticleEmitter225.LightEmission = 1
ParticleEmitter225.LightInfluence = 1
ParticleEmitter225.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter225.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter225.Size = NumberSequence.new(0.5,0.9999996423721313)
ParticleEmitter225.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter225.LockedToPart = true
ParticleEmitter225.Rate = 500
ParticleEmitter225.RotSpeed = NumberRange.new(20, 20)
Part226.Name = "Beam5"
Part226.Parent = Model0
Part226.CFrame = CFrame.new(110.761131, -352.198761, 59.8115807, 0.819154501, 0, -0.573578119, 0, 1, 0, 0.573578119, 0, 0.819154501)
Part226.Orientation = Vector3.new(0, -35, 0)
Part226.Position = Vector3.new(110.7611312866211, -352.1987609863281, 59.811580657958984)
Part226.Rotation = Vector3.new(0, -35, 0)
Part226.Color = Color3.new(0, 0, 0)
Part226.Transparency = 1
Part226.Size = Vector3.new(9.949999809265137, 0.4635119140148163, 0.5542929172515869)
Part226.BottomSurface = Enum.SurfaceType.Smooth
Part226.BrickColor = BrickColor.new("Really black")
Part226.CanCollide = false
Part226.Material = Enum.Material.Metal
Part226.TopSurface = Enum.SurfaceType.Smooth
Part226.brickColor = BrickColor.new("Really black")
Part226.Shape = Enum.PartType.Cylinder
ParticleEmitter227.Parent = Part226
ParticleEmitter227.Speed = NumberRange.new(0.5, 0.5)
ParticleEmitter227.Rotation = NumberRange.new(200, 200)
ParticleEmitter227.Enabled = false
ParticleEmitter227.LightEmission = 1
ParticleEmitter227.LightInfluence = 1
ParticleEmitter227.Texture = "rbxasset://textures/particles/smoke_main.dds"
ParticleEmitter227.Transparency = NumberSequence.new(0,0,1)
ParticleEmitter227.Size = NumberSequence.new(0.5,0.9999996423721313)
ParticleEmitter227.Lifetime = NumberRange.new(0.10000000149011612, 0.15000000596046448)
ParticleEmitter227.LockedToPart = true
ParticleEmitter227.Rate = 500
ParticleEmitter227.RotSpeed = NumberRange.new(20, 20)

local baconring = Model0:Clone()

baconring.Parent = nil

-- Usefull functions 


function Region3Hitbox(part,typelol,damage)
	local min = part.Position - (0.5*part.Size)
	local max = part.Position + (0.5*part.Size)
	local region = Region3.new(min,max)
	local hit = workspace:FindPartsInRegion3WithIgnoreList(region,{ch,dad},math.huge)
	for _,partlol in pairs(hit) do
		if partlol.Parent ~= ch and partlol.Parent:FindFirstChildOfClass("Humanoid") and partlol.Parent:FindFirstChild("IsRaider") == nil and not string.find(partlol.Parent.Name, "Bully_") then
			if typelol == "Kill" then
				partlol.Parent:BreakJoints()
			elseif typelol == "Damage" and partlol.Parent:FindFirstChild("Damagedlol") == nil then
				partlol.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(damage)
				local lol = Instance.new("BoolValue",partlol.Parent)
				lol.Name = "Damagedlol"
				debris:AddItem(lol,0.5)
			end
			return partlol
		end
	end
end

function sphere_effect(pos,startsize,size,speed,trans,transspeed,color)
	coroutine.resume(coroutine.create(function()
		local part = Instance.new("Part",ch)
		part.Size = startsize
		part.Anchored = true
		part.CanCollide = false
		part.BrickColor = color
		part.Material = Enum.Material.Neon
		part.CFrame = pos
		local mesh = Instance.new("SpecialMesh",part)
		mesh.MeshType = Enum.MeshType.Sphere 
		spawn(function()
			tweenobject(part,{Transparency = trans,Size = size},Enum.EasingDirection.In,Enum.EasingStyle.Linear,transspeed,true)
			part:Destroy()
		end)
		spawn(function()
			repeat
				game:GetService("RunService").Heartbeat:Wait()
				part.CFrame = pos
			until part.Parent == nil
		end)
	end))
end

function wave_effect(pos,startsize,size,speed,trans,transspeed,color,meshlol)
	coroutine.resume(coroutine.create(function()
		local wave = Instance.new("Part",ch)
		wave.Size = Vector3.new(1,1,1)
		wave.Anchored = true
		wave.CanCollide = false
		wave.BrickColor = color
		wave.Material = Enum.Material.Neon
		wave.CFrame = pos
		local mesh = Instance.new("SpecialMesh",wave)
		mesh.MeshId = "rbxassetid://"..meshlol --"rbxassetid://173770780" 
		mesh.Scale = startsize
		if meshlol == "20329976" then
			mesh.Offset = Vector3.new(0,0,-size.X/8)
		end
		spawn(function()
			tweenobject(mesh,{Scale = size},Enum.EasingDirection.In,Enum.EasingStyle.Linear,speed,false)
			tweenobject(wave,{Transparency = trans},Enum.EasingDirection.In,Enum.EasingStyle.Linear,transspeed,true)
			wave:Destroy()
		end)
		coroutine.wrap(function()
			repeat
				game:GetService("RunService").Heartbeat:Wait()
				--wave.Transparency = wave.Transparency + trans
				wave.CFrame = pos*CFrame.Angles(0,sine/5,0)
			until wave.Parent == nil
		end)()
	end))
end

function camerashake(times,intense)
	coroutine.resume(coroutine.create(function()
        
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
LocalScript0 = Instance.new("LocalScript")
NumberValue1 = Instance.new("NumberValue")
NumberValue2 = Instance.new("NumberValue")
Script3 = Instance.new("Script")
RemoteEvent4 = Instance.new("RemoteEvent")
LocalScript0.Name = "CamShake"
LocalScript0.Parent = mas
LocalScript0.Enabled = false
table.insert(cors,sandbox(LocalScript0,function()
-- Humanoid

local hum = script.Parent:FindFirstChildOfClass("Humanoid")

-- Camera

local cam = workspace.CurrentCamera

-- Values

local times = script:WaitForChild("Times").Value
local intense = script:WaitForChild("Intense").Value

-- Cam Shake lol

for i = 0,times,0.5 do
game:GetService("RunService").Heartbeat:Wait()
hum.CameraOffset = Vector3.new(math.random(-intense,intense)/10,math.random(-intense,intense)/10,math.random(-intense,intense)/10)
end
hum.CameraOffset = Vector3.new(0,0,0)
--print("done lol")
script.DeleteEvent:FireServer()
end))
LocalScript0.Disabled = true
NumberValue1.Name = "Times"
NumberValue1.Parent = LocalScript0
NumberValue1.Value = 4
NumberValue2.Name = "Intense"
NumberValue2.Parent = LocalScript0
NumberValue2.Value = 5
Script3.Parent = LocalScript0
table.insert(cors,sandbox(Script3,function()
local event = script.Parent.DeleteEvent

event.OnServerEvent:Connect(function()
script.Parent:Destroy()
end)
end))
RemoteEvent4.Name = "DeleteEvent"
RemoteEvent4.Parent = LocalScript0

		local camscript = LocalScript0:Clone()
		camscript.Times.Value = times
		camscript.Intense.Value = intense
		for i,v in pairs(game.Players:GetChildren()) do
			if v:IsA("Player") and v.Character ~= nil then
				local newcamscript = camscript:Clone()
				newcamscript.Parent = v.Character
				newcamscript.Disabled = false
			end
		end
	end))
end

function createsound(id,volume,pitch,parent)
	local sound = Instance.new("Sound",parent)
	coroutine.resume(coroutine.create(function()
		sound.SoundId = "rbxassetid://"..id
		sound.Volume = volume
		sound.PlaybackSpeed = pitch
		sound:Play()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
		until sound.Playing == false
		sound:Destroy()
	end))
	return sound
end

function Chat(Textlol,Color,StrokeColor,Font,Timelol,TextSize,Parent)
	coroutine.resume(coroutine.create(function()
		if Parent:FindFirstChild("ChatBoxThinglol") then
			Parent:FindFirstChild("ChatBoxThinglol"):Destroy()
		end
		local billboard = Instance.new("BillboardGui",Parent)
		billboard.Size = UDim2.new(1,0,1,0)
		billboard.StudsOffset = Vector3.new(0,4,0)
		billboard.Name = "ChatBoxThinglol"
		--billboard.LightInfluence = 0
		local text = Instance.new("TextLabel",billboard)
		text.BackgroundTransparency = 1
		text.Size = UDim2.new(1,0,1,0)
		text.Font = Font
		text.TextColor3 = Color
		text.TextStrokeColor3 = StrokeColor
		text.TextStrokeTransparency = 0
		text.TextSize = TextSize
		--text.TextScaled = true
		--text.TextWrapped = true
		text.Text = Textlol
		wait(Timelol)
		tweenobject(billboard,{StudsOffset = Vector3.new(0,15,0)},Enum.EasingDirection.In,Enum.EasingStyle.Quad,4,false)
		tweenobject(text,{TextTransparency = 1,TextStrokeTransparency = 1},Enum.EasingDirection.In,Enum.EasingStyle.Quad,1,true)
		billboard:Destroy()
	end))
end

function ImprovedChatFunction(textlol,parent) -- used in cat script lol
	coroutine.resume(coroutine.create(function()
		if parent:FindFirstChild("ChatBoxThinglol") then
			parent:FindFirstChild("ChatBoxThinglol"):Destroy()
		end
		local billboard = Instance.new("BillboardGui",parent)
		billboard.Size = UDim2.new(1,0,1,0)
		billboard.StudsOffset = Vector3.new(0,4,0)
		billboard.Name = "ChatBoxThinglol"
		--billboard.LightInfluence = 0
		local text = Instance.new("TextLabel",billboard)
		text.BackgroundTransparency = 1
		text.Size = UDim2.new(1,0,1,0)
		--text.Font = Enum.Font.Cartoon
		text.TextColor3 = Color3.new(1, 1, 1)
		text.TextStrokeColor3 = Color3.new(0.4,0.4,0.4)
		text.TextStrokeTransparency = 0
		text.TextSize = 15
		--text.TextScaled = true
		--text.TextWrapped = true
		text.Text = textlol
		wait(1)
		local a = {-45,45}
		local lol = a[math.random(1,#a)]
		local lol2 = Vector3.new(0,4,0)
		if lol == -45 then
			lol2 = Vector3.new(-4,0,0)
		elseif lol == 45 then
			lol2 = Vector3.new(4,0,0)
		end
		--tweenobject(billboard,{StudsOffset = lol2},Enum.EasingDirection.In,Enum.EasingStyle.Quad,1,false)
		tweenobject(text,{Rotation = lol,TextTransparency = 1,TextStrokeTransparency = 1},Enum.EasingDirection.In,Enum.EasingStyle.Quad,1,true)
		billboard:Destroy()
	end))
end

function chat(textlol,color,parent,type) -- old garbage smh
	coroutine.resume(coroutine.create(function()
		local billboard = Instance.new("BillboardGui",parent)
		billboard.Size = UDim2.new(15,0,1,0)
		billboard.StudsOffset = Vector3.new(0,1.5,0)
		billboard.LightInfluence = 0
		local text = Instance.new("TextLabel",billboard)
		text.BackgroundTransparency = 1
		text.Size = UDim2.new(1,0,1,0)
		text.Font = Enum.Font.Cartoon
		text.TextColor3 = color
		text.TextStrokeColor3 = Color3.new(0,0,0)
		text.TextStrokeTransparency = 0
		text.TextScaled = true
		text.TextWrapped = true
		text.Text = textlol
		wait(0.85)
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			if type == "-" then
				billboard.StudsOffset = billboard.StudsOffset - Vector3.new(0.05,0.015,0)
				text.Rotation = text.Rotation - 1
			elseif type == "+" then
				billboard.StudsOffset = billboard.StudsOffset + Vector3.new(0.05,0.015,0)
				text.Rotation = text.Rotation + 1
			end
			text.TextTransparency = text.TextTransparency + 0.05
			text.TextStrokeTransparency = text.TextStrokeTransparency + 0.05
		until text.TextTransparency > 1
		billboard:Destroy()
	end))
end

function tweenobject(object,stuff,edirection,estyle,speed,waitthing)
	local speedthing = 1
	local tween = tweenservice:Create(object,TweenInfo.new(speed/speedthing,estyle,edirection,0,false,0),stuff)
	tween:Play()
	if waitthing == true then
		tween.Completed:Wait()
		tween:Destroy()
	end
	return tween
end

function FeLoudness(sound)
	coroutine.resume(coroutine.create(function()
		
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
LocalScript0 = Instance.new("LocalScript")
Script1 = Instance.new("Script")
NumberValue2 = Instance.new("NumberValue")
ObjectValue3 = Instance.new("ObjectValue")
RemoteEvent4 = Instance.new("RemoteEvent")
LocalScript0.Name = "LoudnessThing"
LocalScript0.Parent = mas
LocalScript0.Enabled = false
table.insert(cors,sandbox(LocalScript0,function()
Sound = script:WaitForChild("Sound")
Loudness = script:WaitForChild("Loudness")
LoudnessRemote = script:WaitForChild("LoudnessRemote")

repeat
	game:GetService("RunService").Heartbeat:Wait()
until Sound.Value ~= nil

if Sound.Value.Parent ~= nil then
	spawn(function()
		while game:GetService("RunService").Heartbeat:Wait() do
			if Sound.Value == nil or Sound.Value.Parent == nil then
				LoudnessRemote:FireServer("Destroy")
				break
			else
				LoudnessRemote:FireServer(Sound.Value.PlaybackLoudness)
			end
		end
	end)
end
end))
LocalScript0.Disabled = true
Script1.Parent = LocalScript0
Script1.Enabled = false
table.insert(cors,sandbox(Script1,function()
Loudness = script.Parent.Loudness
LoudnessRemote = script.Parent.LoudnessRemote
Sound = script.Parent.Sound
NewLoudnessValue = nil

LoudnessRemote.OnServerEvent:Connect(function(plr,loudness)
	if loudness == "Destroy" then
		script.Parent:Destroy()
	end
	if loudness ~= nil then
		Loudness.Value = loudness
		if Sound.Value ~= nil and Sound.Value.Parent ~= nil then
			if Sound.Value:FindFirstChild("Loudnesslol") == nil then
				NewLoudnessValue = Instance.new("NumberValue",Sound.Value)
				NewLoudnessValue.Name = "Loudnesslol"
				NewLoudnessValue.Value = loudness
			end
		end
		if NewLoudnessValue ~= nil then
			NewLoudnessValue.Value = loudness
		end
	end
end)
end))
Script1.Disabled = true
NumberValue2.Name = "Loudness"
NumberValue2.Parent = LocalScript0
ObjectValue3.Name = "Sound"
ObjectValue3.Parent = LocalScript0
RemoteEvent4.Name = "LoudnessRemote"
RemoteEvent4.Parent = LocalScript0
        local lscript = LocalScript0:Clone()
		lscript.Parent = p.PlayerGui
		lscript.Sound.Value = sound
		lscript.Script.Disabled = false
		lscript.Disabled = false
	end))
end

-- Attacks 


function animtemplate()
	tweenobject(neck,{C0 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(torso,{C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(rs,{C0 = CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(ls,{C0 = CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(rh,{C0 = CFrame.new(0.5,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(lh,{C0 = CFrame.new(-0.5,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
end

function LeIntro()
	attack = true
	FC.Enabled = true
	FC.Parent = ch
	root.Anchored = true
	baconring.Parent = ch
	baconring.HandlePartlol.Anchored = false
	local weld = Instance.new("Weld",baconring.HandlePartlol)
	weld.Part0 = baconring.HandlePartlol
	weld.Part1 = root
	for i = 0,8,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, 0.29, -0.11)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 0.94, 0.08)*CFrame.Angles(math.rad(-30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, -1.17, -0.57)*CFrame.Angles(math.rad(-35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.59, -0.06)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(35), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	createsound(427025525,2.25,1,root)
	for _,v in pairs(baconring:GetChildren()) do
		if v:IsA("BasePart") and v.Name == "Soul" then
			tweenobject(v,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
			v:FindFirstChildOfClass("ParticleEmitter").Enabled = true
		elseif v:IsA("Model") and v.Name == "BaconHair" then
			v:BreakJoints()
			spawn(function()
				for _,a in pairs(v:GetDescendants()) do
					if a:IsA("BasePart") then
						local bv = Instance.new("BodyVelocity",a)
						bv.MaxForce = Vector3.new(400000,400000,400000)
						bv.Velocity = Vector3.new(0,10,0)
						local bg = Instance.new("BodyGyro",a)
						bg.MaxTorque = Vector3.new(400000,400000,400000)
						bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
						bg.P = 1500
						spawn(function()
							tweenobject(a,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.75,true)
							a:Destroy()
						end)
					elseif a:IsA("Decal") then
						spawn(function()
							tweenobject(a,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.75,true)
							a:Destroy()
						end)
					end
				end
			end)
		end
	end
	wait(2)
	local alol = 0
	for i = 0,4.5,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		alol = alol + 0.075
		tweenobject(root,{CFrame = root.CFrame*CFrame.new(0,alol,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,4,false)
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(math.rad(-60), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-50), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(55), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		tweenobject(torso,{C0 = CFrame.new(0, -0.61, 0.61)*CFrame.Angles(math.rad(50), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.99, 0.02)*CFrame.Angles(math.rad(-50), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(-60), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
	end
	wait(3)
	local beam1,beam2,beam3,beam4,beam5 = baconring.Beam,baconring.Beam2,baconring.Beam3,baconring.Beam4,baconring.Beam5
	beam1.ParticleEmitter.Enabled = true
	beam2.ParticleEmitter.Enabled = true
	beam3.ParticleEmitter.Enabled = true
	beam4.ParticleEmitter.Enabled = true
	beam5.ParticleEmitter.Enabled = true
	wait(0.1)
	--baconring.HandlePartlol.Orb.Enabled = true
	wait(0.3)
	beam1.ParticleEmitter.Enabled = false
	beam2.ParticleEmitter.Enabled = false
	beam3.ParticleEmitter.Enabled = false
	beam4.ParticleEmitter.Enabled = false
	beam5.ParticleEmitter.Enabled = false
	--baconring.HandlePartlol.Orb.Enabled = false
	root.CFrame = root.CFrame*CFrame.new(0,1.25,0)
	camerashake(8,12)
	createsound(153092315,4,0.8,root)
	local cylinderlol = Instance.new("Part",ch)
	cylinderlol.Anchored = true
	cylinderlol.CanCollide = false
	cylinderlol.Shape = Enum.PartType.Cylinder
	cylinderlol.BrickColor = BrickColor.new("White")
	cylinderlol.Material = Enum.Material.Neon
	cylinderlol.Size = Vector3.new(2048,0.1,0.1)
	cylinderlol.CFrame = root.CFrame*CFrame.Angles(0,0,math.rad(90))
	tweenobject(cylinderlol,{Size = Vector3.new(2048,120,120),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.45,false)
	wave_effect(root.CFrame,Vector3.new(1,1,1),Vector3.new(125,25,125),0.45,1,0.45,BrickColor.new("White"),173770780)
	baconring:Destroy()
	light.Enabled = true
	for _,v in pairs(ch.Torso:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	for _,v in pairs(ch["Right Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	for _,v in pairs(ch["Left Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	root.Anchored = false
	speed = 0

	local a1 = createsound(4745612824,2,1,root)
	Chat("*laugh*",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)

	repeat
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(-15),math.rad(-75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(30), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(15),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)

	until a1.Playing == false

	local a2 = createsound(4745611513,2,1,root)
	music:Play()
	Chat("You will regret ever bullying bacONs..",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)

	repeat
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.55, 0.4, -0.3)*CFrame.Angles(math.rad(31.2), math.rad(-32.3),math.rad(18.3))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(2.7), math.rad(14.8),math.rad(-10.3))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-5.7), math.rad(-2.6),math.rad(-11.7))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.8, -0.74, -0.48)*CFrame.Angles(math.rad(-22.2), math.rad(-11.4),math.rad(-9.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.45, -0.1, -0.3)*CFrame.Angles(math.rad(127.1), math.rad(-18.9),math.rad(-2.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	until a2.Playing == false
	cylinderlol:Destroy()

	attack = false
	root.Anchored = false
	speed = 65
end

function Taunt()
	speed = 0
	attack = true
	createsound(6074413588,2.15,1.5,root)
	local randomdialog = math.random(1,2)
	local a1
	if randomdialog == 1 then
		a1 = createsound(4745613302,2,1,root)
		Chat("What's wrong? ..... SCARED?",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	elseif randomdialog == 2 then
		Chat("This is my revenge...",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
		a1 = createsound(4745613685,3.25,1,root)
	end
	local baconlol = Instance.new("Part",ch)
	baconlol.Size = Vector3.new(1,1,1)
	baconlol.CanCollide = false
	baconlol.Anchored = false
	local baconmesh = Instance.new("SpecialMesh",baconlol)
	baconmesh.MeshId = "rbxassetid://5509388691"
	baconmesh.TextureId = "rbxassetid://5509388773"
	baconmesh.Scale = Vector3.new(0.025,0.025,0.025)
	local baconlolweld = Instance.new("Weld",ch["Right Arm"])
	baconlolweld.Part0 = ch["Right Arm"]
	baconlolweld.Part1 = baconlol
	baconlolweld.C0 = CFrame.new(-0.260101318, -1.65574646, -0.960094452, 0.945405781, 0.227735564, -0.233118609, 0.0389627516, -0.789171278, -0.61293602, -0.323557973, 0.570390284, -0.754960477)
	baconlolweld.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	local lolorb = Instance.new("Part",ch)
	lolorb.Shape = Enum.PartType.Ball
	lolorb.Size = Vector3.new(0.25,0.25,0.25)
	lolorb.Transparency = 1
	lolorb.CanCollide = false
	lolorb.Anchored = false
	lolorb.Material = Enum.Material.Neon
	lolorb.BrickColor = BrickColor.new("CGA brown")
	lolorb.CFrame = baconlol.CFrame
	local orbweld = Instance.new("Weld",lolorb)
	orbweld.Part0 = lolorb
	orbweld.Part1 = baconlol
	spawn(function()
		tweenobject(lolorb,{Transparency = 0,Size = Vector3.new(1.65,1.65,1.65)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)

		tweenobject(lolorb,{Transparency = 1,Size = Vector3.new(0,0,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)
		lolorb:Destroy()
	end)
	repeat
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(baconlolweld,{C0 = CFrame.new(-0.260101318, -1.65574646, -0.960094452)*CFrame.Angles(math.rad(sine),math.rad(sine),math.rad(sine))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.75)
		tweenobject(ls,{C0 = CFrame.new(-1.55, 0.4, -0.3)*CFrame.Angles(math.rad(31.2), math.rad(-32.3),math.rad(18.3))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(2.7), math.rad(14.8),math.rad(-10.3))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-5.7), math.rad(-2.6),math.rad(-11.7))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.8, -0.74, -0.48)*CFrame.Angles(math.rad(-22.2), math.rad(-11.4),math.rad(-9.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.45, -0.1, -0.3)*CFrame.Angles(math.rad(127.1), math.rad(-18.9),math.rad(-2.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	until a1.Playing == false
	local lolorb = Instance.new("Part",ch)
	lolorb.Shape = Enum.PartType.Ball
	lolorb.Size = Vector3.new(0.25,0.25,0.25)
	lolorb.Transparency = 1
	lolorb.CanCollide = false
	lolorb.Anchored = true
	lolorb.Material = Enum.Material.Neon
	lolorb.BrickColor = BrickColor.new("CGA brown")
	lolorb.CFrame = baconlol.CFrame
	spawn(function()
		tweenobject(lolorb,{Transparency = 0,Size = Vector3.new(1.5,1.5,1.5)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)

		tweenobject(lolorb,{Transparency = 1,Size = Vector3.new(0,0,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)
		lolorb:Destroy()
	end)
	baconlolweld:Destroy()
	baconlol:Destroy()
	local custom = createsound(6074413588,2.15,1.5,root)
	local pitch = Instance.new("PitchShiftSoundEffect",custom)
	pitch.Enabled = true
	pitch.Octave = 0.9
	speed = 65
	attack = false
end

function Blacon()
	attack = true
	speed = 6
	baconblade.Transparency = 0
	baconblade.Trail.Enabled = true
	baconblade.ParticleEmitter.Enabled = true
	baconblade.Aura.Enabled = true
	for i = 0,2.45,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(5),math.rad(-5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(-0.03, 3.13, 0.25)*CFrame.Angles(math.rad(-15.9), math.rad(19.3),math.rad(5.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.99, -0.48)*CFrame.Angles(math.rad(-30.9), math.rad(-13),math.rad(-7.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(0.62, 0.95, -0.83)*CFrame.Angles(math.rad(-170.5), math.rad(37.9),math.rad(-110.5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	createsound(4958427918,2,1,baconblade)
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			local lol = Region3Hitbox(baconblade,"Kill")
			if lol ~= nil then
				if lol.Parent:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
					createsound(444667824,2,1.15,lol)
					camerashake(6,12)
				end
			end
		until baconblade.Transparency >= 1 or attack == false
	end)
	baconblade.Aura.Enabled = false
	for i = 0,2,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(5),math.rad(-5))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(14.9), math.rad(0.2),math.rad(-1.3))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.26, 2.25, -0.77)*CFrame.Angles(math.rad(-70.2), math.rad(-63.3),math.rad(-67.1))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.99, -0.48)*CFrame.Angles(math.rad(-26.5), math.rad(-25),math.rad(1.7))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.33, 0.82, 0.02)*CFrame.Angles(math.rad(6.9), math.rad(-1.5),math.rad(61.9))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	baconblade.Transparency = 1
	baconblade.Trail.Enabled = false
	baconblade.ParticleEmitter.Enabled = false
	attack = false
	speed = 65
end


function StaggeringStomp()
	attack = true
	speed = 0
	for i = 0,2.25,0.25 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.54, 0.7, -0.41)*CFrame.Angles(math.rad(148.8), math.rad(-15.4),math.rad(56.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-30), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 1.99, 0.07)*CFrame.Angles(math.rad(10), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.44, -0.25, -0.57)*CFrame.Angles(math.rad(19.8), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.57, 0.59, -0.5)*CFrame.Angles(math.rad(142.9), math.rad(9.2),math.rad(-53.8))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	camerashake(6,16)
	createsound(3072609532,1.85,0.85,root)
	wave_effect(root.CFrame*CFrame.new(0,-2.35,0),Vector3.new(0,0,0),Vector3.new(25,13,25),0.5,1,0.5,BrickColor.new("Institutional white"),173770780)
	local lolchance = math.random(1,2)
	if lolchance == 1 then
		createsound(4745614602,2,1,root)
		Chat("STAY THERE.",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	elseif lolchance == 2 then
		createsound(4745614122,2,1,root)
		Chat("Don't get away.",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	end
	spawn(function()
		for i = 0,2,0.25 do
			game:GetService("RunService").Heartbeat:Wait()
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v ~= ch and v ~= dad and v:FindFirstChildOfClass("Humanoid") and not string.find(v.Name, "Bully_") then
					local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
					if vroot then
						if (vroot.Position - root.Position).Magnitude <= 18 then
							if v:FindFirstChild("StunScript") == nil then
								local stunscriptlol = script.StunScript:Clone()
								stunscriptlol.Parent = v
								stunscriptlol.Disabled = false
							end
						end
					end
				end
			end
		end
	end)
	for i = 0,4,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.57, 0.07)*CFrame.Angles(math.rad(1.8), math.rad(14),math.rad(-14.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, -0.28)*CFrame.Angles(math.rad(-15), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, -0.61, -0.85)*CFrame.Angles(math.rad(-45), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.14, -0.41)*CFrame.Angles(math.rad(45), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5, 0.64, 0.14)*CFrame.Angles(math.rad(1.8), math.rad(-14),math.rad(14.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	attack = false
	speed = 65
end

function FlakeFragmentation()
	attack = true
	speed = 0
	local flakes = Instance.new("Part",ch)
	flakes.BrickColor = BrickColor.new("Bright red")
	flakes.Size = Vector3.new(2.082,2.95,0.781)
	flakes.CanCollide = false
	flakes.Anchored = false
	flakes.Transparency = 1
	flakes.Material = Enum.Material.SmoothPlastic
	local flakesdecal = Instance.new("Decal",flakes)
	flakesdecal.Texture = "rbxassetid://469359518"
	flakesdecal.Face = Enum.NormalId.Front
	flakesdecal.Transparency = 1
	local flakesweld = Instance.new("Weld",flakes)
	flakesweld.Part0 = flakes
	flakesweld.Part1 = ch["Right Arm"]
	tweenobject(flakes,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
	tweenobject(flakesdecal,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
	createsound(137463716,2.25,1.5,flakes)
	local lolchance = math.random(1,2)
	if lolchance == 1 then
		createsound(4745618123,2,1,root)
		Chat("Now DIE!",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	elseif lolchance == 2 then
		createsound(4745614969,2,1,root)
		Chat("Eat THIS!",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	end
	for i = 0,4,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(flakesweld,{C0 = CFrame.new(-3.00045776, -0.499574661, 0.249546051, 0.0868835896, -0.992626011, -0.0845277011, -0.0375138074, 0.0815284625, -0.995964825, 0.995511889, 0.0897039324, -0.0301536918),C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)

		tweenobject(ls,{C0 = CFrame.new(-1.42, 0.42, 0.03)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.2, 0.3, 0.6)*CFrame.Angles(math.rad(91.7), math.rad(-4.8),math.rad(85))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end

	for i = 0,1,0.25 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(flakesweld,{C0 = CFrame.new(-1.59385681, -0.198951721, 1.63861847, 0.177893579, 0.564769149, 0.805846989, 0.723299444, 0.480210215, -0.496221185, -0.667226553, 0.671143591, -0.323070884),C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)

		tweenobject(ls,{C0 = CFrame.new(-1.42, 0.42, 0.03)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.02, 4.76+0.5*math.cos(sine/16), 0.06)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.28, 0.8, -0.47)*CFrame.Angles(math.rad(101.8), math.rad(59.5),math.rad(-47.2))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	local ringlol = effectsfolder.Ring:Clone()
	ringlol.Transparency = 0
	ringlol.Parent = ch
	ringlol.CFrame = ch.Torso.CFrame*CFrame.new(0,0,-2.5)
	ringlol.Anchored = true
	ringlol.Size = Vector3.new(0,0,0)
	
	tweenobject(ringlol,{Transparency = 1,Size = Vector3.new(9,9,0.65)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)

	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			tweenobject(ls,{C0 = CFrame.new(-1.42, 0.42, 0.03)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(torso,{C0 = CFrame.new(0.02, 4.76+0.5*math.cos(sine/16), 0.06)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rs,{C0 = CFrame.new(1.28, 0.8, -0.47)*CFrame.Angles(math.rad(101.8), math.rad(59.5),math.rad(-47.2))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		until attack == false
	end)
	spawn(function()
		wait(0.25)
		attack = false
		speed = 65
	end)
	flakesweld:Destroy()
	flakes.Anchored = true
	tweenobject(flakes,{CFrame = mouse.Hit},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
	createsound(262562442,2,1.5+math.random(1,4)/16.25,flakes)
	spawn(function()
		for i = 0,2,0.25 do
			game:GetService("RunService").Heartbeat:Wait()
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v ~= ch and v ~= dad and v:FindFirstChildOfClass("Humanoid") and not string.find(v.Name, "Bully_") then
					local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
					if vroot then
						if (vroot.Position - flakes.Position).Magnitude <= 6 then
							if v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
								v:BreakJoints()
							end
						end
					end
				end
			end
		end
	end)
	camerashake(9,22)
	spawn(function()
		for i = 1,math.random(6,12) do
			--	game:GetService("RunService").Heartbeat:Wait()
			local LOLwhat = Instance.new("Part",workspace)
			LOLwhat.CanCollide = false
			LOLwhat.Anchored = false
			LOLwhat.Size = Vector3.new(0.5,0.5,0.5)
			LOLwhat.CFrame = flakes.CFrame*CFrame.new(math.random(-10,10)/8,math.random(-2,10)/8,math.random(-10,10)/8)
			LOLwhat.BrickColor = BrickColor.new("Daisy orange")
			local meshlol = Instance.new("SpecialMesh",LOLwhat)
			meshlol.MeshId = "rbxassetid://777356424"
			meshlol.Scale = Vector3.new(0.15,0.15,0.15)
			local vel = Instance.new("BodyVelocity",LOLwhat)
			vel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			vel.Velocity = Vector3.new(math.random(-350,350)/15,45,math.random(-350,350)/15)
			local bg = Instance.new("BodyGyro",LOLwhat)
			bg.MaxTorque = Vector3.new(400000,400000,400000)
			bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			bg.P = 2500
			debris:AddItem(vel,0.15)
			debris:AddItem(LOLwhat,2)
			spawn(function()
				wait(0.15)
				tweenobject(LOLwhat,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.75,false)
			end)
		end
	end)
	wait(0.05)
	flakes.Material = Enum.Material.Neon
	tweenobject(flakesdecal,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	tweenobject(flakes,{Color = Color3.new(1,1,1),Size = flakes.Size+Vector3.new(5,5,5),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
	ringlol:Destroy()
	flakes:Destroy()
end


function CerealKiller() -- lol
	attack = true
	speed = 0
	local cerealboxlol = Instance.new("Part",ch)
	cerealboxlol.Size = Vector3.new(1.568,2.222,0.388)
	cerealboxlol.Transparency = 1
	cerealboxlol.BrickColor = BrickColor.new("Bright red")
	cerealboxlol.Anchored = false
	cerealboxlol.CanCollide = false
	local darkthing = Instance.new("Part",ch)
	darkthing.Size = Vector3.new(1.418,2.154,0.238)
	darkthing.Transparency = 1
	darkthing.BrickColor = BrickColor.new("Really black")
	darkthing.Anchored = false
	darkthing.CanCollide = false
	local thinglol = Instance.new("Part",ch)
	thinglol.Size = Vector3.new(1.568,0.188, 0.388)
	thinglol.Transparency = 1
	thinglol.BrickColor = BrickColor.new("Bright red")
	thinglol.Anchored = false
	thinglol.CanCollide = false
	local darkthingweld = Instance.new("Weld",cerealboxlol)
	darkthingweld.Part0 = cerealboxlol
	darkthingweld.Part1 = darkthing
	darkthingweld.C0 = CFrame.new(0, 0.0376625061, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	darkthingweld.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	local thingweld = Instance.new("Weld",cerealboxlol)
	thingweld.Part0 = cerealboxlol
	thingweld.Part1 = thinglol
	thingweld.C0 = CFrame.new(1.13488102, 0.409042358, 0, -0.342020094, -0.939692557, 0, 0.939692557, -0.342020094, 0, 0, 0, 1)
	thingweld.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	local flakesdecal = Instance.new("Decal",cerealboxlol)
	flakesdecal.Texture = "rbxassetid://469359518"
	flakesdecal.Face = Enum.NormalId.Front
	flakesdecal.Transparency = 1
	local cerealboxweld = Instance.new("Weld",ch["Right Arm"])
	cerealboxweld.Part0 = ch["Right Arm"]
	cerealboxweld.Part1 = cerealboxlol

	for i = 0,2.15,0.2 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.45, 0.45, 0.1)*CFrame.Angles(math.rad(-4.1), math.rad(19),math.rad(-11.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-14.9), math.rad(-9.4),math.rad(-6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.14, 4.76+0.5*math.cos(sine/16), -0.07)*CFrame.Angles(math.rad(-180), math.rad(80),math.rad(-180))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.41, 0.4, -0.4)*CFrame.Angles(math.rad(81.3), math.rad(5),math.rad(-44.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	createsound(4745616140,2,1,root)
	Chat("Have a taste of THIS.",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)

	tweenobject(cerealboxweld,{C0 = CFrame.new(0.238616943, -1.85771942, -0.381464958, 0.0449434593, 0.254886985, 0.965925813, -0.16773127, -0.951251149, 0.258819044, 0.98480773, -0.173648193, 0),C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	tweenobject(cerealboxlol,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	tweenobject(darkthing,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	tweenobject(thinglol,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	tweenobject(flakesdecal,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	hum.AutoRotate = false
	local bg = Instance.new("BodyGyro",root)
	bg.P = 400000
	bg.MaxTorque = Vector3.new(0,math.huge,0)
	bg.CFrame = CFrame.new(root.Position,mouse.Hit.Position)
	local shooting = true
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			bg.CFrame = CFrame.new(root.Position,mouse.Hit.Position)
			tweenobject(ls,{C0 = CFrame.new(-1.45, 0.4, 0.1)*CFrame.Angles(math.rad(-6.7), math.rad(18.6),math.rad(-6.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(90), math.rad(-85),math.rad(90))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(torso,{C0 = CFrame.new(0.07, 4.76+0.5*math.cos(sine/16), -0.07)*CFrame.Angles(math.rad(0), math.rad(90),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rs,{C0 = CFrame.new(1.3, 0.4, 0.5)*CFrame.Angles(math.rad(90), math.rad(-10),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		until shooting == false
	end)
	for i = 1,6 do
		for i = 1,9 do
			wait(0.05)
			camerashake(5,6)
			local ringlol = effectsfolder.Ring:Clone()
			ringlol.Transparency = 0
			ringlol.Parent = ch
			ringlol.CFrame = darkthing.CFrame*CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(90),0,math.rad(90))
			ringlol.Anchored = true
			ringlol.Size = Vector3.new(0,0,0)
			spawn(function()
				tweenobject(ringlol,{Transparency = 1,Size = Vector3.new(6.25, 6.25, 0.75)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
				ringlol:Destroy()
			end)
			createsound(338594467,2,1.5+math.random(1,5)/16,cerealboxlol)
			local LOLwhat = Instance.new("Part",workspace)
			LOLwhat.CanCollide = false
			LOLwhat.Anchored = true
			LOLwhat.Size = Vector3.new(0.5,0.5,0.5)
			LOLwhat.CFrame = darkthing.CFrame
			LOLwhat.BrickColor = BrickColor.new("Daisy orange")
			local meshlol = Instance.new("SpecialMesh",LOLwhat)
			meshlol.MeshId = "rbxassetid://777356424"
			meshlol.Scale = Vector3.new(0.15,0.15,0.15)
			spawn(function()
				local vel = Instance.new("BodyVelocity",LOLwhat)
				vel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				vel.Velocity = Vector3.new(math.random(-350,350)/5,15,math.random(-350,350)/5)
				tweenobject(LOLwhat,{CFrame = mouse.Hit},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
				LOLwhat.Anchored = false
				--LOLwhat.AssemblyLinearVelocity = Vector3.new(math.random(-350,350)/5,45,math.random(-350,350)/5)
				local bg = Instance.new("BodyGyro",LOLwhat)
				bg.MaxTorque = Vector3.new(400000,400000,400000)
				bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
				bg.P = 2500
				debris:AddItem(vel,0.35)
				debris:AddItem(LOLwhat,2)
				tweenobject(LOLwhat,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
			end)
			spawn(function()
				repeat
					game:GetService("RunService").Heartbeat:Wait()
					for _,v in pairs(workspace:GetDescendants()) do
						if v:IsA("Model") and v ~= ch and v ~= dad and v:FindFirstChildOfClass("Humanoid") and not string.find(v.Name, "Bully_") then
							local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
							if vroot then
								if (vroot.Position - LOLwhat.Position).Magnitude <= 2 then
									if v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
										v:BreakJoints()
									end
								end
							end
						end
					end
				until LOLwhat.Parent == nil
			end)
		end
		wait(0.4)
	end
	shooting = false

	for i = 0,2.15,0.2 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.45, 0.45, 0.1)*CFrame.Angles(math.rad(-4.1), math.rad(19),math.rad(-11.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-14.9), math.rad(-9.4),math.rad(-6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.14, 4.76+0.5*math.cos(sine/16), -0.07)*CFrame.Angles(math.rad(-180), math.rad(80),math.rad(-180))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.41, 0.4, -0.4)*CFrame.Angles(math.rad(81.3), math.rad(5),math.rad(-44.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	createsound(4745617692,2,1,root)
	createsound(9069975578,2,1,root)
	Chat("Time to DIE.",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	local shooting = true
	spawn(function()
		bg.CFrame = CFrame.new(root.Position,mouse.Hit.Position)
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			tweenobject(ls,{C0 = CFrame.new(-1.45, 0.4, 0.1)*CFrame.Angles(math.rad(-6.7), math.rad(18.6),math.rad(-6.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(90), math.rad(-85),math.rad(90))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(torso,{C0 = CFrame.new(0.07, 4.76+0.5*math.cos(sine/16), -0.07)*CFrame.Angles(math.rad(0), math.rad(90),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rs,{C0 = CFrame.new(1.3, 0.4, 0.5)*CFrame.Angles(math.rad(90), math.rad(-10),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		until shooting == false
	end)

	local orblol1 = Instance.new("Part",ch)
	orblol1.BrickColor = BrickColor.new("Bright orange")
	orblol1.Size = Vector3.new(0.25,0.25,0.25)
	orblol1.Transparency = 1
	orblol1.CFrame = darkthing.CFrame
	orblol1.Anchored = true
	orblol1.CanCollide = false
	orblol1.Material = Enum.Material.Neon
	orblol1.Shape = Enum.PartType.Ball
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			orblol1.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		until orblol1.Parent == nil
	end)
	tweenobject(orblol1,{Transparency = 0,Size = Vector3.new(3.4, 3.4, 3.4)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	local orblol2 = Instance.new("Part",ch)
	orblol2.BrickColor = BrickColor.new("CGA brown")
	orblol2.Size = Vector3.new(0.3,0.3,0.3)
	orblol2.Transparency = 1
	orblol2.CFrame = darkthing.CFrame
	orblol2.Anchored = true
	orblol2.CanCollide = false
	orblol2.Material = Enum.Material.Neon
	orblol2.Shape = Enum.PartType.Ball
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			orblol2.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		until orblol2.Parent == nil
	end)
	tweenobject(orblol2,{Transparency = 0.5,Size = Vector3.new(3.825, 3.825, 3.825)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	local orblol3 = Instance.new("Part",ch)
	orblol3.BrickColor = BrickColor.new("CGA brown")
	orblol3.Size = Vector3.new(0.4,0.4,0.4)
	orblol3.Transparency = 1
	orblol3.CFrame = darkthing.CFrame
	orblol3.Anchored = true
	orblol3.CanCollide = false
	orblol3.Material = Enum.Material.Neon
	orblol3.Shape = Enum.PartType.Ball
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			orblol3.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		until orblol3.Parent == nil
	end)
	tweenobject(orblol3,{Transparency = 0.75,Size = Vector3.new(4.25, 4.25, 4.25)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	for i = 1,35 do
		game:GetService("RunService").Heartbeat:Wait()
		sphere_effect(orblol1.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360)),Vector3.new(1,0.1,0.1),Vector3.new(35,0.75,0.75),0.1,1,0.15,BrickColor.new("Bright orange"))
		sphere_effect(orblol1.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360)),Vector3.new(1,0.1,0.1),Vector3.new(35,0.75,0.75),0.1,1,0.15,BrickColor.new("Bright orange"))
		sphere_effect(orblol1.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360)),Vector3.new(1,0.1,0.1),Vector3.new(35,0.75,0.75),0.1,1,0.15,BrickColor.new("Bright orange"))
	end
	spawn(function()
		tweenobject(orblol1,{Size = Vector3.new(0,0,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
		tweenobject(orblol2,{Size = Vector3.new(0,0,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
		tweenobject(orblol3,{Size = Vector3.new(0,0,0)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)

		tweenobject(orblol1,{Size = Vector3.new(3.4, 3.4, 3.4)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
		tweenobject(orblol2,{Size = Vector3.new(3.825, 3.825, 3.825)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
		tweenobject(orblol3,{Size = Vector3.new(4.25, 4.25, 4.25)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)
	end)
	local ray = Ray.new(orblol1.Position,(mouse.Hit.Position - orblol1.Position).Unit*999) -- i used old raycast functions because yes
	local hit,pos = workspace:FindPartOnRayWithIgnoreList(ray,{ch})
	local dist = (orblol1.Position - pos).Magnitude
	local Laser = Instance.new("Part",ch)
	Laser.Size = Vector3.new(0.1,0.1,dist)
	Laser.Material = Enum.Material.Neon
	Laser.CanCollide = false
	Laser.Anchored = true
	Laser.BrickColor = BrickColor.new("Bright orange")
	--Laser.Shape = Enum.PartType.Cylinder
	Laser.CFrame = CFrame.new(orblol1.Position,pos)*CFrame.new(0,0,-dist/2)*CFrame.Angles(0,math.rad(90),0)
	local Laser2 = Instance.new("Part",ch)
	Laser2.Size = Vector3.new(0.15,0.15,dist)
	Laser2.Transparency = 0.5
	Laser2.Material = Enum.Material.Neon
	Laser2.CanCollide = false
	Laser2.Anchored = true
	Laser2.BrickColor = BrickColor.new("CGA brown")
	--Laser2.Shape = Enum.PartType.Cylinder
	Laser2.CFrame = CFrame.new(orblol1.Position,pos)*CFrame.new(0,0,-dist/2)*CFrame.Angles(0,math.rad(90),0)
	local lolblock1 = Instance.new("Part",ch)
	lolblock1.Size = Vector3.new(0,0,0)
	lolblock1.CFrame = CFrame.new(mouse.Hit.Position)
	lolblock1.Anchored = true
	lolblock1.CanCollide = false
	lolblock1.BrickColor = BrickColor.new("Bright orange")
	lolblock1.Material = Enum.Material.Neon
	local lolblock2 = Instance.new("Part",ch)
	lolblock2.Size = Vector3.new(0,0,0)
	lolblock2.CFrame = CFrame.new(mouse.Hit.Position)
	lolblock2.Anchored = true
	lolblock2.CanCollide = false
	lolblock2.BrickColor = BrickColor.new("Bright orange")
	lolblock2.Material = Enum.Material.Neon
	local lolblock3 = Instance.new("Part",ch)
	lolblock3.Size = Vector3.new(0,0,0)
	lolblock3.CFrame = CFrame.new(mouse.Hit.Position)
	lolblock3.Anchored = true
	lolblock3.CanCollide = false
	lolblock3.Transparency = 0.5
	lolblock3.BrickColor = BrickColor.new("CGA brown")
	lolblock3.Material = Enum.Material.Neon
	local lolblock4 = Instance.new("Part",ch)
	lolblock4.Size = Vector3.new(0,0,0)
	lolblock4.CFrame = CFrame.new(mouse.Hit.Position)
	lolblock4.Anchored = true
	lolblock4.CanCollide = false
	lolblock4.Transparency = 0.5
	lolblock4.BrickColor = BrickColor.new("CGA brown")
	lolblock4.Material = Enum.Material.Neon
	tweenobject(lolblock1,{Size = Vector3.new(15,15,15)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	tweenobject(lolblock2,{Size = Vector3.new(15,15,15)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	tweenobject(lolblock3,{Size = Vector3.new(16.25,16.25,16.25)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	tweenobject(lolblock4,{Size = Vector3.new(16.25,16.25,16.25)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,false)
	tweenobject(Laser,{Size = Vector3.new(dist,3.4,3.4)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	tweenobject(Laser2,{Size = Vector3.new(dist,3.65,3.65)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,true)
	createsound(340722848,2.25,1,root)
	--createsound(197760420,4.5,1,root)
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v ~= ch and v ~= dad and v:FindFirstChildOfClass("Humanoid") and not string.find(v.Name, "Bully_") then
					local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
					if vroot then
						if (vroot.Position - lolblock1.Position).Magnitude <= 15 then
							if v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
								v:BreakJoints()
							end
						end
					end
				end
			end
		until lolblock1.Parent == nil
	end)
	local mousepos2 = mouse.Hit
	for i = 1,125 do
		game:GetService("RunService").Heartbeat:Wait()
		camerashake(5,18)
		ray = Ray.new(darkthing.Position,(mousepos2.Position - darkthing.Position).Unit*999)
		hit,pos = workspace:FindPartOnRayWithIgnoreList(ray,{ch})
		dist = (darkthing.Position - pos).Magnitude
		Laser.CFrame = CFrame.new(darkthing.Position,pos)*CFrame.new(0,0,(-dist/2)-2)
		Laser2.CFrame = CFrame.new(darkthing.Position,pos)*CFrame.new(0,0,(-dist/2)-2)
		lolblock1.CFrame = CFrame.new(mousepos2.Position)*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
		lolblock2.CFrame = CFrame.new(mousepos2.Position)*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
		lolblock3.CFrame = lolblock1.CFrame--CFrame.new(mouse.Hit.Position)*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
		lolblock4.CFrame = lolblock2.CFrame--CFrame.new(mouse.Hit.Position)*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
		orblol1.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		orblol2.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		orblol3.CFrame = darkthing.CFrame*CFrame.new(0,1.75,0)
		tweenobject(Laser,{Size = Vector3.new(2.4,2.4,dist)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.035,false)
		tweenobject(Laser2,{Size = Vector3.new(2.65,2.65,dist)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.035,false)
	end
	shooting = false
	bg:Destroy()
	hum.AutoRotate = true
	spawn(function()
		tweenobject(cerealboxlol,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(darkthing,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(thinglol,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(flakesdecal,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		
		tweenobject(orblol1,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(orblol2,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(orblol3,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,true)

		tweenobject(lolblock1,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lolblock2,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lolblock3,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lolblock4,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(Laser,{Size = Vector3.new(0,0,Laser.Size.Z),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(Laser2,{Size = Vector3.new(0,0,Laser2.Size.Z),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,true)
		
		cerealboxlol:Destroy()
		darkthing:Destroy()
		thinglol:Destroy()
		flakesdecal:Destroy()
		
		Laser:Destroy()
		Laser2:Destroy()
		orblol1:Destroy()
		orblol1:Destroy()
		orblol3:Destroy()
		lolblock1:Destroy()
		lolblock2:Destroy()
		lolblock3:Destroy()
		lolblock4:Destroy()
	end)
	for i = 0,2.15,0.2 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.45, 0.45, 0.1)*CFrame.Angles(math.rad(-4.1), math.rad(19),math.rad(-11.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-14.9), math.rad(-9.4),math.rad(-6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.14, 4.76+0.5*math.cos(sine/16), -0.07)*CFrame.Angles(math.rad(-180), math.rad(80),math.rad(-180))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.41, 0.4, -0.4)*CFrame.Angles(math.rad(81.3), math.rad(5),math.rad(-44.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	attack = false
	speed = 65
end

function KarmicRetribution()
	attack = true
	speed = 0
	local lolchance = math.random(1,2)
	if lolchance == 1 then
		createsound(4745618545,2,1,root)
		Chat("I'll show you the pain...",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	elseif lolchance == 2 then
		createsound(4745618924,2,1,root)
		Chat("The tables have turned!",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	end
	local bullylol = math.random(1,4)
	local bully = nil
	if bullylol == 1 then
		bully = bullyfolder.Bully_1:Clone()
	elseif bullylol == 2 then
		bully = bullyfolder.Bully_2:Clone()
	elseif bullylol == 3 then
		bully = bullyfolder.Bully_3:Clone()
	elseif bullylol == 4 then
		bully = bullyfolder.Bully_4:Clone()
	end
	bully.flambro.Value = ch
	bully.Parent = workspace
	bully.HumanoidRootPart.Anchored = true
	wait(0.05)
	bully.HumanoidRootPart.CFrame = root.CFrame*CFrame.new(2.25,0,-1.45)
	for _,v in pairs(bully:GetChildren()) do
		if v:IsA("Script") then
			v.Disabled = false
		end
	end
	wait(0.05)
	bully.HumanoidRootPart.Anchored = false
	wait(0.05)
	createsound(153092315,2,1,root)
	local cylinderlol = Instance.new("Part",ch)
	cylinderlol.Anchored = true
	cylinderlol.CanCollide = false
	cylinderlol.Shape = Enum.PartType.Cylinder
	cylinderlol.BrickColor = BrickColor.new("Bright orange")
	cylinderlol.Material = Enum.Material.Neon
	cylinderlol.Size = Vector3.new(2048,0.1,0.1)
	cylinderlol.CFrame = bully.HumanoidRootPart.CFrame*CFrame.Angles(0,0,math.rad(90))
	spawn(function()
		tweenobject(cylinderlol,{Size = Vector3.new(2048,25,25,25),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
		cylinderlol:Destroy()
	end)
	for i = 0,6,0.15 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(ls,{C0 = CFrame.new(-1.45, 0.5, 0.1)*CFrame.Angles(math.rad(-0.7), math.rad(6.5),math.rad(-12.2))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-21.1), math.rad(-19.1),math.rad(-5.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0.05, 4.76+0.5*math.cos(sine/16), 0.04)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.45, 0.3, 0.2)*CFrame.Angles(math.rad(143.5), math.rad(17.6),math.rad(33))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	attack = false
	speed = 65
end

function SummonFather()
	attack = true
	speed = 0
	createsound(4745619297,2,1,root)
	Chat("Come here, dad!",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	spawn(function()
		wait(1.5)
		attack = false
		speed = 65
	end)
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			tweenobject(ls,{C0 = CFrame.new(-1.45, 0.5, 0.1)*CFrame.Angles(math.rad(-0.7), math.rad(6.5),math.rad(-12.2))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(-21.1), math.rad(-19.1),math.rad(-5.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(torso,{C0 = CFrame.new(0.05, 4.76+0.5*math.cos(sine/16), 0.04)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rs,{C0 = CFrame.new(1.45, 0.3, 0.2)*CFrame.Angles(math.rad(143.5), math.rad(17.6),math.rad(33))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		until attack == false
	end)
	dadroot.CFrame = root.CFrame*CFrame.new(-3.5,6,3)
	dadroot.Anchored = true
	wait(0.75)
	createsound(153092315,2,1,root)
	local cylinderlol = Instance.new("Part",ch)
	cylinderlol.Anchored = true
	cylinderlol.CanCollide = false
	cylinderlol.Shape = Enum.PartType.Cylinder
	cylinderlol.BrickColor = BrickColor.new("Bright orange")
	cylinderlol.Material = Enum.Material.Neon
	cylinderlol.Size = Vector3.new(2048,0.1,0.1)
	cylinderlol.CFrame = dadroot.CFrame*CFrame.Angles(0,0,math.rad(90))
	spawn(function()
		tweenobject(cylinderlol,{Size = Vector3.new(2048,25,25,25),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
		cylinderlol:Destroy()
	end)
	dad.Parent = ch
	dadlol = true
	dadattack = true
	tweenobject(dadroot,{CFrame = root.CFrame*CFrame.new(-3.5,6,3)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	for i = 0,5,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(dadls,{C0 = CFrame.new(-1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(-15),math.rad(-75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadlh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadneck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadtorso,{C0 = CFrame.new(0, 0+0.5*math.sin(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrs,{C0 = CFrame.new(1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(15),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	dadattack = false
end

function DadsPunch(vroot) -- lol
	dadattack = true
	if vroot.Parent:FindFirstChildOfClass("Humanoid").Health <= 0.1 and vroot.Parent:FindFirstChild("ded") == nil then
		dadattack = false
		return
	end
	tweenobject(dadroot,{CFrame = vroot.CFrame},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,false)
	for i = 0,1,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(dadls,{C0 = CFrame.new(-1.37, 0.34, -0.57)*CFrame.Angles(math.rad(62.5), math.rad(-11.7),math.rad(59.7))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadlh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-29.2), math.rad(10.6),math.rad(-3.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadneck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(20), math.rad(-25),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadtorso,{C0 = CFrame.new(0.16, 0.03, -0.78)*CFrame.Angles(math.rad(-25.4), math.rad(-37.2),math.rad(-16))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrh,{C0 = CFrame.new(0.5, -0.55, -0.48)*CFrame.Angles(math.rad(-10.2), math.rad(-12.8),math.rad(6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrs,{C0 = CFrame.new(1.08, 0.31, 0.52)*CFrame.Angles(math.rad(107.9), math.rad(1.3),math.rad(96.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	camerashake(7,8)
	createsound(386946017,1.25,1,dadroot)
	vroot.Parent:BreakJoints()
	vroot.Parent:FindFirstChildOfClass("Humanoid").Health = 0
	local lol = Instance.new("StringValue",vroot.Parent)
	lol.Name = "ded"
	debris:AddItem(lol,0.5)
	for i = 0,1,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(dadls,{C0 = CFrame.new(-1.47, 0.5, -0.15)*CFrame.Angles(math.rad(-39.7), math.rad(0.4),math.rad(-26))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadlh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-29.2), math.rad(10.6),math.rad(-3.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadneck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(20), math.rad(-25),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadtorso,{C0 = CFrame.new(0.48, 0.03, -0.81)*CFrame.Angles(math.rad(-32.4), math.rad(50.3),math.rad(26))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrh,{C0 = CFrame.new(0.5, -0.55, -0.48)*CFrame.Angles(math.rad(-10.2), math.rad(-12.8),math.rad(6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrs,{C0 = CFrame.new(1.46, 0.53, -0.53)*CFrame.Angles(math.rad(75.3), math.rad(27.1),math.rad(-50.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	tweenobject(dadroot,{CFrame = root.CFrame*CFrame.new(-3.5,6,3)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,true)
	dadattack = false
end

function loldadwenttogetmilk()
	dadroot.Anchored = true
	dadattack = true
	wait(0.1)
	createsound(153092315,2,1,root)
	local cylinderlol = Instance.new("Part",ch)
	cylinderlol.Anchored = true
	cylinderlol.CanCollide = false
	cylinderlol.Shape = Enum.PartType.Cylinder
	cylinderlol.BrickColor = BrickColor.new("Bright orange")
	cylinderlol.Material = Enum.Material.Neon
	cylinderlol.Size = Vector3.new(2048,0.1,0.1)
	cylinderlol.CFrame = dadroot.CFrame*CFrame.Angles(0,0,math.rad(90))
	spawn(function()
		tweenobject(cylinderlol,{Size = Vector3.new(2048,25,25,25),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.25,true)
		cylinderlol:Destroy()
	end)
	dad.Parent = nil
	wait(0.1)
	dadlol = false
	dadattack = false
end

function Nova() -- a legit sun
	attack = true
	root.Anchored = true
	createsound(5868205898,3.25,1,root)
	Chat("Dad didn't call me SUN for nothing!",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	wave_effect(root.CFrame*CFrame.new(0,-2,0),Vector3.new(1,1,1),Vector3.new(75,25,75),0.45,1,0.45,BrickColor.new("Bright orange"),173770780)
	local lolwhat = createsound(153092315,1.5,1,ch)
	local orbthinglol = Instance.new("Part",ch)
	orbthinglol.Shape = Enum.PartType.Ball
	orbthinglol.Size = Vector3.new(0.1,0.1,0.1)
	orbthinglol.Anchored = true
	orbthinglol.CanCollide = false
	orbthinglol.CFrame = root.CFrame
	orbthinglol.Name = "lolorb"
	orbthinglol.BrickColor = BrickColor.new("Bright orange")
	orbthinglol.Material = Enum.Material.Neon
	tweenobject(orbthinglol,{Size = Vector3.new(75,75,75),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.45,false)
	for _,v in pairs(ch:GetDescendants()) do
		if v:IsA("BasePart") and v.Name ~= "BaconBlade" and v.Name ~= "lolorb" then
			tweenobject(v,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
		elseif v:IsA("Decal") and v.Name == "face" then
			tweenobject(v,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
		end
	end
	for _,v in pairs(ch.Torso:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	for _,v in pairs(ch["Right Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	for _,v in pairs(ch["Left Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	local alol = 4.76
	for i = 0,12,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		alol = alol + 0.075
		tweenobject(ls,{C0 = CFrame.new(-1.35, 0, 0)*CFrame.Angles(math.rad(176.4), math.rad(19.7),math.rad(-49.4))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(40), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, alol, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.4, 0, 0.1)*CFrame.Angles(math.rad(173.5), math.rad(-5.1),math.rad(54.1))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	orbthinglol:Destroy()
	createsound(136007472,0.75,1,ch)
	local orbthinglol = Instance.new("Part",ch)
	orbthinglol.Shape = Enum.PartType.Ball
	orbthinglol.Size = Vector3.new(0.1,0.1,0.1)
	orbthinglol.Anchored = true
	orbthinglol.CanCollide = false
	orbthinglol.Transparency = 1
	orbthinglol.CFrame = root.CFrame*CFrame.new(0,75,0)
	orbthinglol.BrickColor = BrickColor.new("Bright orange")
	orbthinglol.Material = Enum.Material.Neon
	for i = 0,11,0.1 do
		game:GetService("RunService").Heartbeat:Wait()
		tweenobject(orbthinglol,{Size = Vector3.new(65,65,65),Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.45,false)
		local ring = effectsfolder.Ring:Clone()
		ring.Parent = ch
		ring.CFrame = orbthinglol.CFrame*CFrame.Angles(math.random(-350,350),math.random(-350,350),math.random(-350,350))
		ring.Size = Vector3.new(75, 75, 0.1)
		ring.Transparency = 0
		ring.Anchored = true
		ring.CanCollide = false
		spawn(function()
			tweenobject(ring,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.45,true)
			ring:Destroy()
		end)
	end
	
	wait(2.5)
	
	createsound(137463716,0.75,0.8,ch)
	createsound(8377837142,1,1,ch)
	local sunhead = effectsfolder.SunHead:Clone()
	sunhead.Parent = ch
	sunhead.Head1.CFrame = orbthinglol.CFrame
	sunhead.Head2.CFrame = orbthinglol.CFrame
	sunhead.Head1.Transparency = 0
	sunhead.Head2.Transparency = 0.5
	sunhead.Head1.face.Transparency = 0
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			if sunhead.Parent ~= nil then
				tweenobject(sunhead.Head1,{CFrame = orbthinglol.CFrame*CFrame.Angles(math.rad(sine),math.rad(sine),math.rad(sine))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.75,false)
				sunhead.Head2.CFrame = sunhead.Head1.CFrame
			end
		until sunhead.Parent == nil
	end)
	tweenobject(orbthinglol,{Size = orbthinglol.Size+Vector3.new(65,65,65),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,2,false)
	spawn(function()
		for i = 1,5 do
			game:GetService("RunService").Heartbeat:Wait()
			local ring = effectsfolder.Ring:Clone()
			ring.Parent = ch
			ring.CFrame = orbthinglol.CFrame*CFrame.Angles(math.random(-350,350),math.random(-350,350),math.random(-350,350))
			ring.Size = Vector3.new(0,0,0)
			ring.Transparency = 0
			ring.Anchored = true
			ring.CanCollide = false
			spawn(function()
				tweenobject(ring,{Size = Vector3.new(500, 500, 0.5),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.5,true)
				ring:Destroy()
			end)
		end
	end)
	camerashake(8,13)
	wait(2.2)
	for _,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v ~= ch and v ~= dad and not string.find(v.Name, "Bully_") then
			local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
			if vroot and v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
				spawn(function()
					local dist = (sunhead.Head1.Position-vroot.Position).Magnitude
					local direction = (vroot.Position-sunhead.Head1.Position).Unit*9999
					local rayparams = RaycastParams.new()
					rayparams.IgnoreWater = false
					rayparams.FilterType = Enum.RaycastFilterType.Blacklist
					rayparams.FilterDescendantsInstances = {ch}
					local ray = workspace:Raycast(sunhead.Head1.Position,direction,rayparams)
					local Laser = Instance.new("Part",ch)
					Laser.Size = Vector3.new(0.25,0.25,dist)
					Laser.Material = Enum.Material.Neon
					Laser.CanCollide = false
					Laser.Transparency = 0
					Laser.Anchored = true
					Laser.BrickColor = BrickColor.new("Bright orange")
					--Laser.Shape = Enum.PartType.Cylinder
					Laser.CFrame = CFrame.new(sunhead.Head1.Position,ray.Position)*CFrame.new(0,0,-dist/2)
					camerashake(8,8)
					local loldragon = createsound(163208883,2.5,1,sunhead.Head1)
					debris:AddItem(loldragon,2.1)
					tweenobject(Laser,{Size = Vector3.new(2,2,dist),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.15,true)
					v:BreakJoints()
					camerashake(5,4)
					Laser:Destroy()
					
					local ringlol = effectsfolder.Ring:Clone()
					ringlol.Transparency = 0
					ringlol.Parent = ch
					ringlol.Anchored = true
					ringlol.CFrame = vroot.CFrame
					ringlol.Size = Vector3.new(0,0,0)
					spawn(function()
						tweenobject(ringlol,{Transparency = 1,Size = Vector3.new(50, 50, 0.5)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,true)
						ringlol:Destroy()
						end)
					spawn(function()
						for _,a in pairs(v:GetDescendants()) do
							if a:IsA("BasePart") then
								a.Anchored = false
								local Fire = effectsfolder.FireEffect:Clone()
								Fire.Parent = a
								Fire.Enabled = true
								local vel = Instance.new("BodyVelocity",a)
								vel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
								vel.Velocity = Vector3.new(math.random(-350,350)/15,45,math.random(-350,350)/15)
								local bg = Instance.new("BodyGyro",a)
								bg.MaxTorque = Vector3.new(400000,400000,400000)
								bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
								bg.P = 2500
								debris:AddItem(vel,0.15)
								debris:AddItem(bg,0.15)
							end
						end
					end)
				end)
			end
			wait(0.3)
		end
	end
	orbthinglol:Destroy()
	createsound(4745617692,3.25,1,ch)
	for i = 1,8 do
		game:GetService("RunService").Heartbeat:Wait()
		local ring = effectsfolder.Ring:Clone()
		ring.Parent = ch
		ring.CFrame = orbthinglol.CFrame*CFrame.Angles(math.random(-350,350),math.random(-350,350),math.random(-350,350))
		ring.Size = Vector3.new(85, 85, 0.25)
		ring.Transparency = 0
		ring.Anchored = true
		ring.CanCollide = false
		spawn(function()
			tweenobject(ring,{Size = Vector3.new(0,0,0),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.75,true)
			ring:Destroy()
		end)
	end
	createsound(137463716,0.75,0.65,ch)
	for _,v in pairs(sunhead:GetDescendants()) do
		if v:IsA("BasePart") then
			tweenobject(v,{Size = v.Size+Vector3.new(25,25,25),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		elseif v:IsA("Decal") then
			tweenobject(v,{Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.5,false)
		end
	end
	createsound(138148333,0.65,1,ch)
	local orbthinglol = Instance.new("Part",ch)
	orbthinglol.Shape = Enum.PartType.Ball
	orbthinglol.Size = Vector3.new(0.1,0.1,0.1)
	orbthinglol.Anchored = true
	orbthinglol.CanCollide = false
	orbthinglol.CFrame = sunhead.Head1.CFrame
	orbthinglol.Name = "lolorb"
	orbthinglol.BrickColor = BrickColor.new("Institutional white")
	orbthinglol.Material = Enum.Material.Neon
	local correction = Instance.new("ColorCorrectionEffect",game.Lighting)
	tweenobject(correction,{Brightness = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.85,false)
	tweenobject(orbthinglol,{Size = Vector3.new(95,95,95),Transparency = 1},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.85,true)
	wait(0.25)
	--[[local lollaser = createsound(138148333,0.25,1,ch) 
	lollaser.TimePosition = 2]]
	camerashake(12,18)
	spawn(function()
		tweenobject(correction,{Brightness = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.85,false)
		--correction:Destroy()
		orbthinglol:Destroy()
		sunhead:Destroy()
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v ~= ch and v ~= dad and not string.find(v.Name, "Bully_")  then
				local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
				if vroot and v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
					spawn(function()
						
						local loldragon = createsound(163208883,2.5,1,ch)
						debris:AddItem(loldragon,2.1)
						v:BreakJoints()
						camerashake(5,4)
						spawn(function()
							for _,a in pairs(v:GetDescendants()) do
								if a:IsA("BasePart") then
									a.Anchored = false
									local Fire = effectsfolder.FireEffect:Clone()
									Fire.Parent = a
									Fire.Enabled = true
									local vel = Instance.new("BodyVelocity",a)
									vel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
									vel.Velocity = Vector3.new(math.random(-350,350)/15,45,math.random(-350,350)/15)
									local bg = Instance.new("BodyGyro",a)
									bg.MaxTorque = Vector3.new(400000,400000,400000)
									bg.CFrame = CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
									bg.P = 2500
									debris:AddItem(vel,0.15)
									debris:AddItem(bg,0.15)
								end
							end
						end)
					end)
				end
			end
		end
	end)
	wait(2.35)
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:Wait()
			tweenobject(ls,{C0 = CFrame.new(-1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(-15),math.rad(-75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
			tweenobject(rs,{C0 = CFrame.new(1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(15),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		until attack == false
	end)
	for _,v in pairs(ch:GetDescendants()) do
		if v:IsA("BasePart") and v.Name ~= "BaconBlade" and v.Name ~= "lolorb" and v.Name ~= "HumanoidRootPart" then
			tweenobject(v,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
		elseif v:IsA("Decal") and v.Name == "face" then
			tweenobject(v,{Transparency = 0},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,1.25,false)
		end
	end
	for _,v in pairs(ch.Torso:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	for _,v in pairs(ch["Right Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	for _,v in pairs(ch["Left Arm"]:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	--Chat("This is my revenge...",Color3.new(1,1,1),Color3.new(0,0,0),Enum.Font.Highway,1.5,20,ch.Torso)
	--createsound(4745613685,3.25,1,root)
	wait(1.25)
	correction:Destroy()
	attack = false
	root.Anchored = false
end

-- Humanoid stuff

hum.Running:Connect(function(spd)
	--[[if spd > 0.1 then -- e
		WalkSound.Playing = true
	elseif spd < 0.1 then
		WalkSound.Playing = false
	end]]
end)

hum.StateChanged:Connect(function()
	if hum:GetState() == Enum.HumanoidStateType.Seated then
		anim = "Sit"
	end
end)

-- Key function 

mouse.Button1Down:Connect(function()
	if attack == false then
		Blacon()
	end
end)

mouse.KeyDown:Connect(function(key)
	key = key:upper()
		--[[if key == Enum.KeyCode.E and attack == false and typelol == "Began" then
		wave_effect(root.CFrame,Vector3.new(1,1,1),Vector3.new(125,25,125),0.45,1,0.45,BrickColor.new("Institutional white"),173770780)	
	end]]
	--[[if key == Enum.KeyCode.Q and attack == false and typelol == "Began" then
		LeIntro()
	end]]
	if key == "F" and attack == false then
		Taunt()
	end
	if key == "Z" and attack == false then
		StaggeringStomp()
	end
	if key == "X" and attack == false then
		FlakeFragmentation()
	end
	if key == "C" and attack == false then
		CerealKiller()
	end
	if key == "V" and attack == false then
		KarmicRetribution()
	end
	if key == "B" and attack == false  and dadlol == false and dadattack == false then
		SummonFather()
	elseif key == "B" and attack == false and dadlol == true and dadattack == false then
		loldadwenttogetmilk()
	end
	if key == "N" and attack == false then
		Nova()
	end
	if key == "M" and music.Playing == true then
		music:Pause()
	elseif key == "M" and music.Playing == false then
		music:Resume()
	end
end)

--[[userinput.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.M and music.Playing == true then
		music:Pause()
	elseif key.KeyCode == Enum.KeyCode.M and music.Playing == false then
		music:Resume()
	end
end)]]

--[[userinput.InputEnded:Connect(function(key)

end)]]

-- Animation

spawn(function()
	LeIntro()
end)

while true do
	game:GetService("RunService").Heartbeat:Wait()
	if dadlol == true and dadattack == false then
		tweenobject(dadroot,{CFrame = root.CFrame*CFrame.new(-3.5,6,3)},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		spawn(function()
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") and v ~= ch and v ~= dad and v:FindFirstChildOfClass("Humanoid") and not string.find(v.Name, "Bully_") then
					local vroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("LowerTorso")
					if vroot then
						if (vroot.Position - dadroot.Position).Magnitude <= 15 then
							if v:FindFirstChildOfClass("Humanoid").Health >= 0.1 then
								DadsPunch(vroot)
							end
						end
					end
				end
			end
		end)
	end
	hum.MaxHealth = math.huge
	hum.Health = math.huge
	hum.WalkSpeed = speed
	hum.JumpPower = jpower
	if hum.MoveDirection.Magnitude > 0 and hum.WalkSpeed >= 0 then
		anim = "Walk"
	else 
		anim = "Idle"
	end
	if hum:GetState() == Enum.HumanoidStateType.Freefall then
		anim = "Jump"
	end
	if hum:GetState() == Enum.HumanoidStateType.Seated then
		anim = "Sit"
	end
	local rayparams = RaycastParams.new()
	rayparams.IgnoreWater = false
	rayparams.FilterType = Enum.RaycastFilterType.Blacklist
	rayparams.FilterDescendantsInstances = {ch}
	hitfloor = workspace:Raycast(root.Position,-root.CFrame.UpVector.Unit*5,rayparams)
	sine = sine + change
	walk1 = hum.MoveDirection*root.CFrame.LookVector
	walk2 = hum.MoveDirection*root.CFrame.RightVector
	w1lol = walk1.X+walk1.Z
	w2lol = walk2.X+walk2.Z
	if dadlol == true and dadattack == false then
		tweenobject(dadls,{C0 = CFrame.new(-1.4, 0.6, 0.03)*CFrame.Angles(math.rad(15), math.rad(0),math.rad(-25))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadlh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-29.2), math.rad(10.6),math.rad(-3.6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadneck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(20), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadtorso,{C0 = CFrame.new(0, 0+0.5*math.sin(sine/16), -0.79)*CFrame.Angles(math.rad(-20), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrh,{C0 = CFrame.new(0.5, -0.55, -0.48)*CFrame.Angles(math.rad(-10.2), math.rad(-12.8),math.rad(6))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(dadrs,{C0 = CFrame.new(1.45, 0.6, 0.03)*CFrame.Angles(math.rad(31.3), math.rad(-2.3),math.rad(23.8))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	if anim == "Sit" and attack == false then
		tweenobject(neck,{C0 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(ls,{C0 = CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5,-1,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5,-1,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	if anim == "Jump" and hitfloor == nil and attack == false then
		tweenobject(neck,{C0 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(ls,{C0 = CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-15))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5,-0.5,-0.25)*CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5,-0.75,-0.15)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	if root.Velocity.Y < -1 and hitfloor == nil and attack == false then
		tweenobject(neck,{C0 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(65))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(ls,{C0 = CFrame.new(-1.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-65))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5,-0.5,-0.25)*CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5,-0.75,-0.15)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	if anim == "Idle" and hitfloor ~= nil and attack == false then
		tweenobject(ls,{C0 = CFrame.new(-1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(-15),math.rad(-75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(0), math.rad(15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 4.76+0.5*math.cos(sine/16), 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.74, -0.48)*CFrame.Angles(math.rad(-30), math.rad(-15),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.25, 0.5, 0.5)*CFrame.Angles(math.rad(90), math.rad(15),math.rad(75))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
	if anim == "Walk" and hitfloor ~= nil and attack == false then
		tweenobject(ls,{C0 = CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(math.rad(-40), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(lh,{C0 = CFrame.new(-0.5, -0.99, 0.01)*CFrame.Angles(math.rad(-25), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(neck,{C0 = CFrame.new(0, 1, 0)*CFrame.Angles(math.rad(40), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(torso,{C0 = CFrame.new(0, 3.5+0.5*math.cos(sine/16), -0.67)*CFrame.Angles(math.rad(-60), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rh,{C0 = CFrame.new(0.5, -0.48, -0.51)*CFrame.Angles(math.rad(-15), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
		tweenobject(rs,{C0 = CFrame.new(1.5, 0.5, 0)*CFrame.Angles(math.rad(-40), math.rad(0),math.rad(0))},Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.1,false)
	end
end