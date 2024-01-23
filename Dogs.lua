pcall(function()
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
while owner == nil do
	 game:GetService("RunService").Stepped:wait()
end

--|SERVICES|--
local physics = game:GetService("PhysicsService")
local tweening = game:GetService("TweenService")
local insert = game:GetService("InsertService")
--|BASICS|--
local player = owner
local user = owner:GetMouse()
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local gui = player:WaitForChild("PlayerGui")
local mouse = owner:GetMouse()
--|OTHER|--
local status = "PASSIVE"
local side = "RIGHT"
local class = "NORMAL"
local focus = nil
local number = 0
--//SETTING\\--
local zkill = Instance.new("Vector3Value")
zkill.Name = "ZombieKill"
zkill.Parent = gui
--//FUNCTIONS\\--
local function write(text,object)
        if object:IsA("TextLabel") == true then
                local count = object:FindFirstChild("Count")
                if count == nil then
                        count = Instance.new("NumberValue")
                        count.Parent = object
                        count.Name = "Count"
                        count.Value = count.Value + 1
                else
                        count.Value = count.Value + 1
                end
                local startcount = count.Value
                for i = 1,#text do
                        if count.Value == startcount then
                                local letter = string.sub(text,i,i)
                                object.Text = string.sub(text,1,i)
                                local sound = Instance.new("Sound")
                                sound.Parent = gui
                                sound.Name = "Tick"
                                sound.PlaybackSpeed = 1.5
                                sound.SoundId = "rbxassetid://151715959"
                                sound.Playing = true
                                sound.TimePosition = 0
                                game:GetService("Debris"):AddItem(sound,sound.TimeLength)
                                wait(0.01)
                        else
                                break
                        end
                end
        end
end
local function shake()
        if hum then
                delay(0,function()
                        for shake = 1,4,1 do
                                local length = 0.02
                                local propertieschanged = {
                                        CameraOffset = Vector3.new(2,1,-1.2)
                                }
                                local info = TweenInfo.new(length,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                local tween = tweening:Create(hum,info,propertieschanged)
                                tween:Play()
                                wait(length)
                                local length = 0.01
                                local propertieschanged = {
                                        CameraOffset = Vector3.new(-1.6,-0.8,3)
                                }
                                local info = TweenInfo.new(length,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                local tween = tweening:Create(hum,info,propertieschanged)
                                tween:Play()
                                wait(length)
                                local length = 0.03
                                local propertieschanged = {
                                        CameraOffset = Vector3.new(-2.1,1.1,1.4)
                                }
                                local info = TweenInfo.new(length,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                local tween = tweening:Create(hum,info,propertieschanged)
                                tween:Play()
                                wait(length)
                        end
                        local propertieschanged = {
                                CameraOffset = Vector3.new(0,0,0)
                        }
                        local info = TweenInfo.new(0.03,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                        local tween = tweening:Create(hum,info,propertieschanged)
                        tween:Play()
                end)
        end
end
local function create(special)
        local npcmodel = insert:LoadAsset(257489726)
        local doge = npcmodel:GetChildren()[1]:Clone()
        doge.Parent = workspace
        if npcmodel and npcmodel.Parent then
                npcmodel:Destroy()
        end
        local parts = doge:WaitForChild("Head"):GetChildren()
        for i,object in pairs(parts) do
                if object:IsA("BasePart") == true and object.Name ~= "Fire" then
                        object:Destroy()
                end
        end
        number = number + 1
        --[[
        local doge = Instance.new("Part")
        doge.Parent = workspace
        doge.Parent = workspace
        doge.CastShadow = false
        doge.Anchored = false
        doge.CanCollide = true
        doge.Massless = true
        doge.Size = Vector3.new(1,2,4)
        doge.CFrame = root.CFrame + root.CFrame.lookVector * 5 + Vector3.new(0,4,0)
        --]]
        if special == nil then
                doge:WaitForChild("Torso").CFrame = root.CFrame + root.CFrame.lookVector * 5 + Vector3.new(0,4,0)
        else
                doge:WaitForChild("Torso").CFrame = CFrame.new(zkill.Value + Vector3.new(0,6,0))
        end
        local particle = Instance.new("ParticleEmitter")
        particle.Parent = doge:WaitForChild("Torso")
        particle.Enabled = true
        particle.ZOffset = 2
        particle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.2,0),NumberSequenceKeypoint.new(1,1)})
        particle.Speed = NumberRange.new(3)
        particle.LightEmission = 1
        particle.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))),ColorSequenceKeypoint.new(1,Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)))})
        particle.SpreadAngle = Vector2.new(360,360)
        particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2),NumberSequenceKeypoint.new(1,0)})
        particle.Rate = 500
        particle.Rotation = NumberRange.new(-360,360)
        particle.Lifetime = NumberRange.new(1)
        delay(0.2,function()
                particle.Enabled = false
        end)
        game:GetService("Debris"):AddItem(particle,1.2)
        local cast = doge:WaitForChild("Head"):WaitForChild("Wow")
        cast.Volume = 2
        cast.Playing = true
        local targetval = Instance.new("Vector3Value")
        targetval.Name = "Target"
        targetval.Parent = doge
        local targetnum = Instance.new("NumberValue")
        targetnum.Name = "Number"
        targetnum.Value = number
        targetnum.Parent = targetval
        local dogetier = Instance.new("StringValue")
        dogetier.Name = "Type"
        dogetier.Value = class
        dogetier.Parent = doge
        local currentvictim = Instance.new("ObjectValue")
        currentvictim.Name = "Victim"
        currentvictim.Parent = doge
        currentvictim.Value = nil
        local add = 1
        if side == "RIGHT" then
                targetval.Name = "RIGHT"
                add = 1
                local target = root.CFrame + root.CFrame.rightVector * (2 + (targetnum.Value + add))
                targetval.Value = target.p
                side = "LEFT"
        elseif side == "LEFT" then
                targetval.Name = "LEFT"
                add = 0
                local target = root.CFrame - root.CFrame.rightVector * (2 + (targetnum.Value + add))
                targetval.Value = target.p
                side = "RIGHT"
        end
        if dogetier.Value == "FIRE" then
                local parts = doge:GetChildren()
                for i,obj in pairs(parts) do
                        if obj:IsA("BasePart") == true then
                                obj.BrickColor = BrickColor.new("Neon orange")
                                if obj.Transparency ~= 1 then
                                        if obj.Name == "Head" or obj.Name == "Tail" or obj.Name == "Torso" then
                                                local fire = Instance.new("ParticleEmitter")
                                                fire.Parent = obj
                                                if obj.Name == "Head" or obj.Name == "Tail" then
                                                        fire.LockedToPart = true
                                                end
                                                fire.Rate = 500
                                                fire.Rotation = NumberRange.new(-360,360)
                                                fire.RotSpeed = NumberRange.new(-100,100)
                                                fire.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,85,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
                                                fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5),NumberSequenceKeypoint.new(1,0)})
                                                fire.Lifetime = NumberRange.new(0.7,1)
                                                fire.Speed = NumberRange.new(5,6)
                                                fire.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.95),NumberSequenceKeypoint.new(1,0.95)})
                                                fire.ZOffset = 1
                                                fire.Name = "Fire"
                                                fire.LightEmission = 1
                                                fire.LightInfluence = 0
                                                fire.Texture = "http://www.roblox.com/asset/?id=11601142"
                                                fire.Enabled = true
                                        end
                                end
                        end
                end
                local parts = doge:GetDescendants()
                for i,par in pairs(parts) do
                        if par:IsA("SpecialMesh") == true then
                                par.TextureId = ""
                        end
                end
                local burn = Instance.new("Sound")
                burn.Parent = doge:WaitForChild("Head")
                burn.TimePosition = 0
                burn.Looped = true
                burn.Name = "Fire"
                burn.SoundId = "rbxassetid://1250876841"
                burn.Playing = true
        elseif dogetier.Value == "ZOMBIE" then
                local parts = doge:GetDescendants()
                for i,par in pairs(parts) do
                        if par:IsA("SpecialMesh") == true then
                                par.TextureId = ""
                                par.Parent.BrickColor = BrickColor.new("Dark green")
                        end
                end
                local bark = doge:WaitForChild("Head"):WaitForChild("Bark")
                bark.SoundId = "rbxassetid://408341537"
                bark.PlaybackSpeed = 1.5
        elseif dogetier.Value == "KAMIKAZE" then
                local tail = doge:FindFirstChild("Tail")
                if tail then
                        local mesh = tail:FindFirstChild("Mesh")
                        if mesh then
                                tail.Material = Enum.Material.Neon
                                tail.BrickColor = BrickColor.new("Really red")
                                mesh.TextureId = ""
                                mesh.MeshId = ""
                                mesh.MeshType = Enum.MeshType.Sphere
                                mesh.Scale = Vector3.new(1.2,1.2,1.2)
                                mesh.Offset = Vector3.new(0.3,0,0)
                                local beep = Instance.new("Sound")
                                beep.Parent = doge:WaitForChild("Head")
                                beep.PlaybackSpeed = 1
                                beep.TimePosition = 0
                                beep.Looped = true
                                beep.SoundId = "rbxassetid://138081500"
                                beep.Volume = 0.5
                                beep.Playing = true
                                local explo = Instance.new("BoolValue")
                                explo.Parent = doge
                                explo.Value = false
                                explo.Name = "Exploding"
                                delay(0,function()
                                        local between = 0.41
                                        while wait(between) do
                                                if doge:WaitForChild("Humanoid").Health > 0 then
                                                        tail.BrickColor = BrickColor.new("Institutional white")
                                                        local ti = 0.4
                                                        if explo.Value == true then
                                                                between = 0.1
                                                                ti = 0.2
                                                                beep.PlaybackSpeed = 3
                                                        end
                                                        local propertieschanged = {
                                                                Color = Color3.fromRGB(255,0,0),
                                                        }
                                                        local info = TweenInfo.new(ti,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                                        local tween = tweening:Create(tail,info,propertieschanged)
                                                        tween:Play()
                                                end
                                        end
                                end)
                                explo.Changed:connect(function()
                                        if explo.Value == true then
                                                doge:WaitForChild("Humanoid").WalkSpeed = 0
                                                wait(2)
                                                local exp = Instance.new("ParticleEmitter")
                                                exp.Parent = tail
                                                exp.Rate = 500
                                                exp.Rotation = NumberRange.new(-360,360)
                                                exp.RotSpeed = NumberRange.new(-100,100)
                                                exp.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,170,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
                                                exp.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10),NumberSequenceKeypoint.new(0.5,10),NumberSequenceKeypoint.new(1,0)})
                                                exp.Lifetime = NumberRange.new(0.5)
                                                exp.Speed = NumberRange.new(160)
                                                exp.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4,0),NumberSequenceKeypoint.new(1,1)})
                                                exp.ZOffset = 10
                                                exp.Name = "Fire"
                                                exp.LightEmission = 1
                                                exp.LightInfluence = 0
                                                exp.SpreadAngle = Vector2.new(360,360)
                                                exp.Texture = "http://www.roblox.com/asset/?id=11601142"
                                                exp.Enabled = true
                                                game:GetService("Debris"):AddItem(exp,2)
                                                local fire = exp:Clone()
                                                fire.Parent = tail
                                                local smoke = Instance.new("ParticleEmitter")
                                                smoke.Parent = tail
                                                smoke.Rate = 500
                                                smoke.Rotation = NumberRange.new(-360,360)
                                                smoke.RotSpeed = NumberRange.new(-100,100)
                                                smoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))})
                                                smoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10),NumberSequenceKeypoint.new(0.8,10),NumberSequenceKeypoint.new(1,0)})
                                                smoke.Lifetime = NumberRange.new(1.2)
                                                smoke.Speed = NumberRange.new(160)
                                                smoke.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(1,1)})
                                                smoke.ZOffset = 1
                                                smoke.Name = "Smoke"
                                                smoke.LightEmission = 0
                                                smoke.LightInfluence = 0
                                                smoke.SpreadAngle = Vector2.new(360,360)
                                                smoke.Texture = "http://www.roblox.com/asset/?id=249338959"
                                                smoke.Enabled = true
                                                game:GetService("Debris"):AddItem(smoke,2)
                                                local explode = Instance.new("Sound")
                                                explode.Parent = tail
                                                explode.SoundId = "rbxassetid://165969964"
                                                explode.TimePosition = 0
                                                explode.Playing = true
                                                explode.Volume = 1
                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 2)
                                                delay(0.5,function()
                                                        exp.Enabled = false
                                                        fire.Enabled = false
                                                        smoke.Enabled = false
                                                end)
                                                shake()
                                                number = number - 1
                                                local get = workspace:GetDescendants()
                                                for i,check in pairs(get) do
                                                        if check:IsA("Humanoid") == true then
                                                                if check.Parent.Name ~= player.Name and check.Parent.Name ~= "Doge" then
                                                                        local hit = check.Parent:FindFirstChild("HumanoidRootPart")
                                                                        if hit then
                                                                                if (hit.Position - doge:WaitForChild("Torso").Position).magnitude <= 90 then
                                                                                        check:TakeDamage(200)
                                                                                        local explode = Instance.new("Sound")
                                                                                        explode.Parent = hit
                                                                                        explode.SoundId = "rbxassetid://429400881"
                                                                                        explode.TimePosition = 0
                                                                                        explode.Playing = true
                                                                                        game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                                                        local get = check.Parent:GetChildren()
                                                                                        for i,obj in pairs(get) do
                                                                                                if obj:IsA("BasePart") == true then
                                                                                                        local blood = Instance.new("ParticleEmitter")
                                                                                                        blood.Parent = obj
                                                                                                        blood.Texture = "rbxassetid://709137722"
                                                                                                        blood.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
                                                                                                        blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(85,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(85,0,0))})
                                                                                                        blood.Name = "Blood"
                                                                                                        blood.Enabled = true
                                                                                                        blood.Lifetime = NumberRange.new(1)
                                                                                                        blood.Speed = NumberRange.new(10)
                                                                                                        blood.LightEmission = 0.8
                                                                                                        blood.LightInfluence = 0
                                                                                                        blood.Rate = 500
                                                                                                        blood.Rotation = NumberRange.new(-360,360)
                                                                                                        blood.RotSpeed = NumberRange.new(-100,100)
                                                                                                        blood.SpreadAngle = Vector2.new(360,360)
                                                                                                        blood.Acceleration = Vector3.new(0,-10,0)
                                                                                                        blood.Drag = 1
                                                                                                        blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.87),NumberSequenceKeypoint.new(0.104,2.06),NumberSequenceKeypoint.new(1,0)})
                                                                                                        game:GetService("Debris"):AddItem(blood,2)
                                                                                                        delay(0.4,function()
                                                                                                                blood.Enabled = false
                                                                                                        end)
                                                                                                end
                                                                                        end
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                end
                                                doge:BreakJoints()
                                                beep.Playing = false
                                                local get = doge:GetChildren()
                                                for i,get in pairs(get) do
                                                        if get:IsA("BasePart") == true then
                                                                get.Transparency = 1
                                                        end
                                                end
                                                game:GetService("Debris"):AddItem(doge,6)
                                        end
                                end)
                        end
                end
        end
        local dogehum = doge:WaitForChild("Humanoid")
        dogehum.WalkSpeed = 20
        dogehum.MaxHealth = 500
        mouse.Button1Down:connect(function()
                if status == "MOVE TO" then
                        dogehum.Jump = true
                        local check = root:FindFirstChild("Bark")
                        if check == nil then
                                local bark = doge:WaitForChild("Head"):WaitForChild("Bark"):Clone()
                                bark.Parent = root
                                bark.Playing = true
                                bark.TimePosition = 0
                                game:GetService("Debris"):AddItem(bark,bark.TimeLength + 1)
                        end
                end
        end)
        local debounce = Instance.new("BoolValue")
        debounce.Parent = doge
        debounce.Value = false
        debounce.Name = "Debounce"
        dogehum.Touched:connect(function(hit)
                if debounce.Value == false and dogetier.Value ~= "KAMIKAZE" then
                        local check = hit.Parent:FindFirstChildOfClass("Humanoid") or hit.Parent.Parent:FindFirstChildOfClass("Humanoid")
                        if check and hit:IsDescendantOf(char) == false and check.Parent.Name ~= "Doge" and hit.Transparency ~= 1 then
                                debounce.Value = true
                                delay(0.4,function()
                                        debounce.Value = false
                                end)
                                if dogetier.Value == "NORMAL" then
                                        local starting = check.Health
                                        check:TakeDamage(15)
                                        local bark = doge:WaitForChild("Head"):WaitForChild("Bark")
                                        bark.Playing = true
                                        bark.TimePosition = 0
                                        local stab = Instance.new("Sound")
                                        stab.Parent = doge:WaitForChild("Head")
                                        stab.SoundId = "rbxassetid://220833976"
                                        stab.TimePosition = 0
                                        stab.Playing = true
                                        game:GetService("Debris"):AddItem(stab,stab.TimeLength + 1)
                                        if check.Health <= 0 and starting > 0 then
                                                local explode = Instance.new("Sound")
                                                explode.Parent = hit
                                                explode.SoundId = "rbxassetid://429400881"
                                                explode.TimePosition = 0
                                                explode.Playing = true
                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                local get = check.Parent:GetChildren()
                                                for i,obj in pairs(get) do
                                                        if obj:IsA("BasePart") == true then
                                                                local blood = Instance.new("ParticleEmitter")
                                                                blood.Parent = obj
                                                                blood.Texture = "rbxassetid://709137722"
                                                                blood.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
                                                                blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(85,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(85,0,0))})
                                                                blood.Name = "Blood"
                                                                blood.Enabled = true
                                                                blood.Lifetime = NumberRange.new(1)
                                                                blood.Speed = NumberRange.new(10)
                                                                blood.LightEmission = 0.8
                                                                blood.LightInfluence = 0
                                                                blood.Rate = 500
                                                                blood.Rotation = NumberRange.new(-360,360)
                                                                blood.RotSpeed = NumberRange.new(-100,100)
                                                                blood.SpreadAngle = Vector2.new(360,360)
                                                                blood.Acceleration = Vector3.new(0,-10,0)
                                                                blood.Drag = 1
                                                                blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.87),NumberSequenceKeypoint.new(0.104,2.06),NumberSequenceKeypoint.new(1,0)})
                                                                game:GetService("Debris"):AddItem(blood,2)
                                                                delay(0.4,function()
                                                                        blood.Enabled = false
                                                                end)
                                                        end
                                                end
                                        end
                                        if check.Health <= 0 then
                                                if hit.Transparency ~= 1 then
                                                        hit.Size = hit.Size - Vector3.new(0.1,0.1,0.1)
                                                        dogehum.Health = dogehum.Health + 20
                                                        dogehum.WalkSpeed = dogehum.WalkSpeed + 1
                                                        if hit.Size.x < 0.1 or hit.Size.y < 0.1 or hit.Size.z < 0.1 then
                                                                hit.Transparency = 1
                                                                local explode = Instance.new("Sound")
                                                                explode.Parent = hit
                                                                explode.SoundId = "rbxassetid://264486467"
                                                                explode.TimePosition = 0
                                                                explode.Playing = true
                                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                        end
                                                end
                                        end
                                        local blood = Instance.new("ParticleEmitter")
                                        blood.Parent = hit
                                        blood.Texture = "rbxassetid://709137722"
                                        blood.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
                                        blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(85,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(85,0,0))})
                                        blood.Name = "Blood"
                                        blood.Enabled = true
                                        blood.Lifetime = NumberRange.new(1)
                                        blood.Speed = NumberRange.new(10)
                                        blood.LightEmission = 0.8
                                        blood.LightInfluence = 0
                                        blood.Rate = 500
                                        blood.Rotation = NumberRange.new(-360,360)
                                        blood.RotSpeed = NumberRange.new(-100,100)
                                        blood.SpreadAngle = Vector2.new(360,360)
                                        blood.Acceleration = Vector3.new(0,-10,0)
                                        blood.Drag = 1
                                        blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.87),NumberSequenceKeypoint.new(0.104,2.06),NumberSequenceKeypoint.new(1,0)})
                                        game:GetService("Debris"):AddItem(blood,2)
                                        delay(0.2,function()
                                                blood.Enabled = false
                                        end)
                                elseif dogetier.Value == "FIRE" then
                                        local bark = doge:WaitForChild("Head"):WaitForChild("Bark")
                                        bark.Playing = true
                                        bark.TimePosition = 0
                                        local douse = Instance.new("Sound")
                                        douse.Parent = doge:WaitForChild("Head")
                                        douse.SoundId = "rbxassetid://533243953"
                                        douse.TimePosition = 0
                                        douse.Playing = true
                                        game:GetService("Debris"):AddItem(douse,douse.TimeLength + 3)
                                        local starting = check.Health
                                        delay(0,function()
                                                for dmg = 1,10,1 do
                                                        check:TakeDamage(3)
                                                        local make = check.Parent:FindFirstChild("AlreadyBeingBurnt")
                                                        if check.Health <= 0 and starting > 0 and make == nil then
                                                                local body = check.Parent:FindFirstChild("Body Colors")
                                                                if body then
                                                                        body:Destroy()
                                                                end
                                                                local new = Instance.new("BoolValue")
                                                                new.Parent = check.Parent
                                                                new.Name = "AlreadyBeingBurnt"
                                                                new.Value = true
                                                                local explode = Instance.new("Sound")
                                                                explode.Parent = hit
                                                                explode.SoundId = "rbxassetid://1250876841"
                                                                explode.TimePosition = 0
                                                                explode.Playing = true
                                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                                local get = check.Parent:GetChildren()
                                                                for i,obj in pairs(get) do
                                                                        if obj:IsA("BasePart") == true and obj.Transparency ~= 1 then
                                                                                local fire = Instance.new("ParticleEmitter")
                                                                                fire.Parent = obj
                                                                                fire.Acceleration = Vector3.new(0,10,0)
                                                                                fire.Rate = 500
                                                                                fire.Rotation = NumberRange.new(-360,360)
                                                                                fire.RotSpeed = NumberRange.new(-100,100)
                                                                                fire.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,85,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
                                                                                fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5),NumberSequenceKeypoint.new(1,0)})
                                                                                fire.Lifetime = NumberRange.new(0.7,1)
                                                                                fire.Speed = NumberRange.new(1,2)
                                                                                fire.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.95),NumberSequenceKeypoint.new(1,0.95)})
                                                                                fire.ZOffset = 1
                                                                                fire.Name = "Fire"
                                                                                fire.LightEmission = 1
                                                                                fire.LightInfluence = 0
                                                                                fire.Texture = "http://www.roblox.com/asset/?id=11601142"
                                                                                fire.Enabled = true
                                                                                delay(0,function()
                                                                                        local propertieschanged = {
                                                                                                Color = Color3.fromRGB(0,0,0),
                                                                                        }
                                                                                        local info = TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                                                                        local tween = tweening:Create(obj,info,propertieschanged)
                                                                                        tween:Play()
                                                                                        for eat = 1,10,1 do
                                                                                                local propertieschanged = {
                                                                                                        Size = obj.Size - Vector3.new(0.1,0.1,0.1),
                                                                                                }
                                                                                                local info = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                                                                                local tween = tweening:Create(obj,info,propertieschanged)
                                                                                                tween:Play()
                                                                                                if obj.Size.x < 0.1 or obj.Size.y < 0.1 or obj.Size.z < 0.1 then
                                                                                                        game:GetService("Debris"):AddItem(obj,1)
                                                                                                        fire.Enabled = false
                                                                                                        explode.Playing = false
                                                                                                        local propertieschanged = {
                                                                                                                Transparency = 1,
                                                                                                        }
                                                                                                        local info = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                                                                                        local tween = tweening:Create(obj,info,propertieschanged)
                                                                                                        tween:Play()
                                                                                                end
                                                                                                wait(1)
                                                                                        end
                                                                                end)
                                                                        elseif obj:IsA("Accessory") == true then
                                                                                local handle = obj:FindFirstChild("Handle")
                                                                                if handle then
                                                                                        handle:BreakJoints()
                                                                                        local propertieschanged = {
                                                                                                Transparency = 1,
                                                                                        }
                                                                                        local info = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                                                                        local tween = tweening:Create(handle,info,propertieschanged)
                                                                                        tween:Play()
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                        wait(0.3)
                                                end
                                        end)
                                        if check.Health ~= 0 then
                                                local fire = Instance.new("ParticleEmitter")
                                                fire.Parent = hit
                                                fire.Acceleration = Vector3.new(0,3,0)
                                                fire.Rate = 500
                                                fire.Rotation = NumberRange.new(-360,360)
                                                fire.RotSpeed = NumberRange.new(-100,100)
                                                fire.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,85,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
                                                fire.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5),NumberSequenceKeypoint.new(1,0)})
                                                fire.Lifetime = NumberRange.new(0.7,1)
                                                fire.Speed = NumberRange.new(5,6)
                                                fire.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.95),NumberSequenceKeypoint.new(1,0.95)})
                                                fire.ZOffset = 1
                                                fire.Name = "Fire"
                                                fire.LightEmission = 1
                                                fire.LightInfluence = 0
                                                fire.Texture = "http://www.roblox.com/asset/?id=11601142"
                                                fire.Enabled = true
                                                game:GetService("Debris"):AddItem(fire,4)
                                                delay(3,function()
                                                        fire.Enabled = false
                                                end)
                                        end
                                        local exp = Instance.new("ParticleEmitter")
                                        exp.Parent = hit
                                        exp.Rate = 500
                                        exp.Rotation = NumberRange.new(-360,360)
                                        exp.RotSpeed = NumberRange.new(-100,100)
                                        exp.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,85,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
                                        exp.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4),NumberSequenceKeypoint.new(1,0)})
                                        exp.Lifetime = NumberRange.new(0.7,1)
                                        exp.Speed = NumberRange.new(15,20)
                                        exp.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})
                                        exp.ZOffset = 1
                                        exp.Name = "Fire"
                                        exp.LightEmission = 1
                                        exp.LightInfluence = 0
                                        exp.SpreadAngle = Vector2.new(360,360)
                                        exp.Texture = "http://www.roblox.com/asset/?id=11601142"
                                        exp.Enabled = true
                                        game:GetService("Debris"):AddItem(exp,2)
                                        delay(0.2,function()
                                                exp.Enabled = false
                                        end)
                                elseif dogetier.Value == "ZOMBIE" then
                                        local starting = check.Health
                                        check:TakeDamage(30)
                                        local bark = doge:WaitForChild("Head"):WaitForChild("Bark")
                                        bark.Playing = true
                                        bark.TimePosition = 0
                                        local stab = Instance.new("Sound")
                                        stab.Parent = doge:WaitForChild("Head")
                                        stab.SoundId = "rbxassetid://220833976"
                                        stab.TimePosition = 0
                                        stab.Playing = true
                                        game:GetService("Debris"):AddItem(stab,stab.TimeLength + 1)
                                        if check.Health <= 0 and starting > 0 then
                                                zkill.Value = hit.Position
                                                local explode = Instance.new("Sound")
                                                explode.Parent = hit
                                                explode.SoundId = "rbxassetid://429400881"
                                                explode.TimePosition = 0
                                                explode.Playing = true
                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                local get = check.Parent:GetChildren()
                                                for i,obj in pairs(get) do
                                                        if obj:IsA("BasePart") == true then
                                                                local blood = Instance.new("ParticleEmitter")
                                                                blood.Parent = obj
                                                                blood.Texture = "rbxassetid://709137722"
                                                                blood.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
                                                                blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(85,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(85,0,0))})
                                                                blood.Name = "Blood"
                                                                blood.Enabled = true
                                                                blood.Lifetime = NumberRange.new(1)
                                                                blood.Speed = NumberRange.new(10)
                                                                blood.LightEmission = 0.8
                                                                blood.LightInfluence = 0
                                                                blood.Rate = 500
                                                                blood.Rotation = NumberRange.new(-360,360)
                                                                blood.RotSpeed = NumberRange.new(-100,100)
                                                                blood.SpreadAngle = Vector2.new(360,360)
                                                                blood.Acceleration = Vector3.new(0,-10,0)
                                                                blood.Drag = 1
                                                                blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.87),NumberSequenceKeypoint.new(0.104,2.06),NumberSequenceKeypoint.new(1,0)})
                                                                game:GetService("Debris"):AddItem(blood,2)
                                                                delay(0.4,function()
                                                                        blood.Enabled = false
                                                                end)
                                                        end
                                                end
                                        end
                                        if check.Health <= 0 then
                                                if hit.Transparency ~= 1 then
                                                        hit.Size = hit.Size - Vector3.new(0.1,0.1,0.1)
                                                        dogehum.Health = dogehum.Health + 60
                                                        if hit.Size.x < 0.1 or hit.Size.y < 0.1 or hit.Size.z < 0.1 then
                                                                hit.Transparency = 1
                                                                local explode = Instance.new("Sound")
                                                                explode.Parent = hit
                                                                explode.SoundId = "rbxassetid://264486467"
                                                                explode.TimePosition = 0
                                                                explode.Playing = true
                                                                game:GetService("Debris"):AddItem(explode,explode.TimeLength + 1)
                                                        end
                                                end
                                        end
                                        local blood = Instance.new("ParticleEmitter")
                                        blood.Parent = hit
                                        blood.Texture = "rbxassetid://709137722"
                                        blood.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.8,0),NumberSequenceKeypoint.new(1,1)})
                                        blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(85,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(85,0,0))})
                                        blood.Name = "Blood"
                                        blood.Enabled = true
                                        blood.Lifetime = NumberRange.new(1)
                                        blood.Speed = NumberRange.new(10)
                                        blood.LightEmission = 0.8
                                        blood.LightInfluence = 0
                                        blood.Rate = 500
                                        blood.Rotation = NumberRange.new(-360,360)
                                        blood.RotSpeed = NumberRange.new(-100,100)
                                        blood.SpreadAngle = Vector2.new(360,360)
                                        blood.Acceleration = Vector3.new(0,-10,0)
                                        blood.Drag = 1
                                        blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.87),NumberSequenceKeypoint.new(0.104,2.06),NumberSequenceKeypoint.new(1,0)})
                                        game:GetService("Debris"):AddItem(blood,2)
                                        delay(0.2,function()
                                                blood.Enabled = false
                                        end)
                                end
                        end
                end
        end)
        delay(0,function()
                while wait(0.1) do
                        if status == "PASSIVE" then
                                local add = 1
                                if targetval.Name == "RIGHT" then
                                        add = 1
                                        local target = root.CFrame + root.CFrame.rightVector * (2 + (targetnum.Value + add))
                                        targetval.Value = target.p
                                elseif targetval.Name == "LEFT" then
                                        add = 0
                                        local target = root.CFrame - root.CFrame.rightVector * (2 + (targetnum.Value + add))
                                        targetval.Value = target.p
                                end
                                dogehum:MoveTo(targetval.Value)
                                if hum.Jump == true then
                                        dogehum.Jump = true
                                end
                        elseif status == "MOVE TO" then
                                dogehum:MoveTo(mouse.hit.p)
                        elseif status == "STOP" then
                                dogehum:MoveTo(doge:WaitForChild("Torso").Position)
                        elseif status == "FIGHT" then
                                if doge then
                                        local last = 400
                                        local least = nil
                                        local scout = workspace:GetChildren()
                                        for i,work in pairs(scout) do
                                                if work:IsA("Model") then
                                                        local whum = work:FindFirstChildOfClass("Humanoid")
                                                        if whum then
                                                                if work.Name ~= "Doge" and work.Name ~= player.Name then
                                                                        local wtorso = whum.Parent:FindFirstChild("HumanoidRootPart")
                                                                        if wtorso then
                                                                                if whum.Health ~= 0 then
                                                                                        if (wtorso.Position - doge:WaitForChild("Torso").Position).magnitude < last then
                                                                                                least = wtorso
                                                                                                last = (wtorso.Position - doge:WaitForChild("Torso").Position).magnitude
                                                                                        end
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                end
                                        end
                                        if least then
                                                currentvictim.Value = least
                                        end
                                        if currentvictim.Value then
                                                dogehum:MoveTo(currentvictim.Value.Position)
                                                if (currentvictim.Value.Position.y - doge:WaitForChild("Torso").Position.y) >= 2 then
                                                        dogehum.Jump = true
                                                end
                                                if dogetier.Value == "KAMIKAZE" then
                                                        local exp = doge:FindFirstChild("Exploding")
                                                        if exp then
                                                                if (currentvictim.Value.Position - doge:WaitForChild("Torso").Position).magnitude <= 20 then
                                                                        exp.Value = true
                                                                end
                                                        end
                                                end
                                                local thum = currentvictim.Value.Parent:FindFirstChildOfClass("Humanoid")
                                                if thum then
                                                        if thum.Health <= 0 then
                                                                currentvictim.Value = nil
                                                        end
                                                end
                                        end
                                end
                        elseif status == "FOCUS" then
                                if focus then
                                        local base = focus:FindFirstChild("HumanoidRootPart")
                                        if base then
                                                dogehum:MoveTo(base.Position)
                                                if (base.Position.y - doge:WaitForChild("Torso").Position.y) >= 2 then
                                                        dogehum.Jump = true
                                                end
                                                if dogetier.Value == "KAMIKAZE" then
                                                        local exp = doge:FindFirstChild("Exploding")
                                                        if exp then
                                                                if (base.Position - doge:WaitForChild("Torso").Position).magnitude <= 20 then
                                                                        exp.Value = true
                                                                end
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end)
end
--//MODULE\\--
local explode = Instance.new("Sound")
explode.Parent = workspace
explode.SoundId = "rbxassetid://429400881"
local stab = Instance.new("Sound")
stab.Parent = workspace
stab.SoundId = "rbxassetid://220833976"
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.Name = "Tick"
sound.PlaybackSpeed = 1.5
sound.SoundId = "rbxassetid://151715959"
local zomb = stab:Clone()
zomb.SoundId = "rbxassetid://408341537"
zomb.Parent = workspace
local starter = Instance.new("ScreenGui")
starter.Parent = gui
starter.Name = "DogeGui"
starter.ResetOnSpawn = true
starter.Enabled = true
local label = Instance.new("TextLabel")
label.Parent = starter
label.BackgroundTransparency = 1
label.BorderSizePixel = 0
label.Font = Enum.Font.SciFi
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextStrokeColor3 = Color3.fromRGB(0,0,0)
label.TextStrokeTransparency = 1
label.TextWrapped = true
label.TextSize = 16
label.Visible = true
label.Text = ""
label.Size = UDim2.new(0.3,0,0.05,0)
label.Position = UDim2.new(-0.3,0,0.05,0)
label:TweenPosition(UDim2.new(0.35,0,0.05,0),"InOut","Quint",0.5,true,nil)
local tag = Instance.new("TextLabel")
tag.Parent = starter
tag.BackgroundTransparency = 1
tag.BorderSizePixel = 0
tag.Font = Enum.Font.SciFi
tag.TextColor3 = Color3.fromRGB(255,255,255)
tag.TextStrokeColor3 = Color3.fromRGB(0,0,0)
tag.TextStrokeTransparency = 1
tag.TextWrapped = true
tag.TextSize = 15
tag.Visible = true
tag.Text = ""
tag.Size = UDim2.new(0.3,0,0.05,0)
tag.Position = UDim2.new(0.35,0,0.1,0)
local find = Instance.new("TextLabel")
find.Parent = starter
find.BackgroundTransparency = 1
find.BorderSizePixel = 0
find.Font = Enum.Font.SciFi
find.TextColor3 = Color3.fromRGB(255,255,255)
find.TextStrokeColor3 = Color3.fromRGB(0,0,0)
find.TextStrokeTransparency = 1
find.TextWrapped = true
find.TextSize = 15
find.Visible = true
find.Text = ""
find.Size = UDim2.new(0.3,0,0.05,0)
find.Position = UDim2.new(0.35,0,0.15,0)
delay(0,function()
        while wait() do
                for change = 1,255 do
                        label.TextColor3 = Color3.fromHSV(change/255,1,1)
                        tag.TextColor3 = Color3.fromHSV(change/255,1,1)
                        find.TextColor3 = Color3.fromHSV(change/255,1,1)
                        wait()
                end
        end
end)
delay(0.1,function()
        write("PRESS Q TO SUMMON A DOGE || Z TO CYCLE TYPE",label)
        write("CURRENT STATUS || "..status,tag)
        write("CURRENT TYPE || "..class,find)
end)
zkill.Changed:connect(function()
        create("zombie")
end)
user.KeyDown:connect(function(input,process)
        if true then
                local key = input
                if key == 'q' then
                        create(nil)
                        local wow = Instance.new("TextLabel")
                        wow.Parent = starter
                        wow.BackgroundTransparency = 1
                        wow.BorderSizePixel = 0
                        wow.Font = Enum.Font.SciFi
                        wow.TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
                        wow.TextStrokeColor3 = Color3.fromRGB(0,0,0)
                        wow.TextStrokeTransparency = 1
                        wow.TextScaled = true
                        wow.Visible = true
                        wow.Text = "WOW!"
                        wow.Size = UDim2.new(0.2,0,0.05,0)
                        wow.Position = UDim2.new(math.random(-1,10) * 0.1,0,math.random(0,10) * 0.1,0)
                        wow:TweenPosition(wow.Position - UDim2.new(0,0,0.1,0),"Out","Linear",1,true,nil)
                        game:GetService("Debris"):AddItem(wow,1)
                        local propertieschanged = {
                                TextTransparency = 1
                        }
                        local info = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                        local tween = tweening:Create(wow,info,propertieschanged)
                        tween:Play()
                elseif key == 'r' then
                        status = "PASSIVE"
                        write("CURRENT STATUS || "..status,tag)
                elseif key == 't' then
                        status = "MOVE TO"
                        write("CURRENT STATUS || "..status.." || CLICK TO JUMP",tag)
                elseif key == 'y' then
                        status = "STOP"
                        write("CURRENT STATUS || "..status,tag)
                elseif key == 'g' then
                        status = "FIGHT"
                        write("CURRENT STATUS || "..status,tag)
                elseif key == 'z' then
                        if class == "NORMAL" then
                                class = "FIRE"
                                write("CURRENT TYPE || "..class,find)
                        elseif class == "FIRE" then
                                class = "KAMIKAZE"
                                write("CURRENT TYPE || "..class,find)
                        elseif class == "KAMIKAZE" then
                                class = "ZOMBIE"
                                write("CURRENT TYPE || "..class,find)
                        elseif class == "ZOMBIE" then
                                class = "NORMAL"
                                write("CURRENT TYPE || "..class,find)
                        end
                elseif key == 'f' then
                        status = "FOCUS"
                        local check = mouse.Target.Parent:FindFirstChildOfClass("Humanoid") or mouse.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")
                        if check then
                                if check.Parent.Name ~= "Doge" then
                                        focus = check.Parent
                                else
                                        focus = nil
                                end
                        else
                                focus = nil
                        end
                        if focus == nil then
                                write("CURRENT STATUS || "..status.." || TARGET INVALID",tag)
                        else
                                write("CURRENT STATUS || "..status.." || TARGET: "..string.upper(focus.Name),tag)
                        end
                elseif key == 'm' then
                        if mouse.Target.Parent.Name == "Doge" then
                                mouse.Target.Parent:Destroy()
                                number = number - 1
                                local get = workspace:GetChildren()
                                for i,obj in pairs(get) do
                                        if get.Name == "Doge" and get.ClassName == "Model" then
                                                local tar = get:FindFirstChildOfClass("Vector3Value")
                                                if tar then
                                                        local num = tar:FindFirstChild("Number")
                                                        if num then
                                                                num.Value = num.Value - 1
                                                        end
                                                end
                                        end
                                end
                                local wow = Instance.new("TextLabel")
                                wow.Parent = starter
                                wow.BackgroundTransparency = 1
                                wow.BorderSizePixel = 0
                                wow.Font = Enum.Font.SciFi
                                wow.TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
                                wow.TextStrokeColor3 = Color3.fromRGB(0,0,0)
                                wow.TextStrokeTransparency = 1
                                wow.TextScaled = true
                                wow.Visible = true
                                wow.Text = "RIP ;("
                                wow.Size = UDim2.new(0.2,0,0.05,0)
                                wow.Position = UDim2.new(math.random(-1,10) * 0.1,0,math.random(0,10) * 0.1,0)
                                wow:TweenPosition(wow.Position - UDim2.new(0,0,0.1,0),"Out","Linear",1,true,nil)
                                game:GetService("Debris"):AddItem(wow,1)
                                local propertieschanged = {
                                        TextTransparency = 1
                                }
                                local info = TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
                                local tween = tweening:Create(wow,info,propertieschanged)
                                tween:Play()
                        end
                end
        end
end)
hum.Died:connect(function()
        local get = workspace:GetChildren()
        for i,get in pairs(get) do
                if get.Name == "Doge" and get:IsA("Model") == true then
                        get:Destroy()
                end
        end
	end) --69
end)
