if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = workspace

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
	local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
	FakeMouse.keyUp = FakeMouse.KeyUp
	FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)

	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game

	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
					and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
		},"RunService")
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end

--made by kiprovka26
warn("originally made by Dion(@Dionnooo) edited and fixed by kiprovka26. An edited version of Laptop Boss + FULL Edition.")
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
cors2 = {}
cors3 = {}
cors4 = {}
cors5 = {}
cors6 = {}
local base = workspace:FindFirstChild("Baseplate") or workspace:FindFirstChild("Base")
local originColor,originSize,originMaterial,originBottomSurface,originTopSurface,originPos = base.Color, base.Size, base.Material, base.BottomSurface, base.TopSurface, base.Position
local tween = game.TweenService:Create(base, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Color = Color3.new(0.388235, 0.372549, 0.384314), Size = Vector3.new(512,20,512), Position = Vector3.new(0,-10,0)})
tween:Play()
base.TopSurface = "Studs"
base.BottomSurface = "Inlet"
base.Material = "Plastic"
tween.Completed:Wait()
mas = Instance.new("Model",game:GetService("Lighting"))
Model0 = Instance.new("Model")
Model1 = Instance.new("Model")
Part1 = Instance.new("Part")
Wedge = Instance.new("WedgePart")
Wedge2 = Instance.new("WedgePart")
Wedge3 = Instance.new("WedgePart")
Wedge4 = Instance.new("WedgePart")
Wedge5 = Instance.new("WedgePart")
Wedge6 = Instance.new("WedgePart")
Wedge7 = Instance.new("WedgePart")
Wedge8 = Instance.new("WedgePart")
Wedge9 = Instance.new("WedgePart")
Wedge10 = Instance.new("WedgePart")
Wedge11 = Instance.new("WedgePart")
Wedge12 = Instance.new("WedgePart")
Wedge13 = Instance.new("WedgePart")
Wedge14 = Instance.new("WedgePart")
Wedge15 = Instance.new("WedgePart")
Wedge16 = Instance.new("WedgePart")
Wedge17 = Instance.new("WedgePart")
Wedge18 = Instance.new("WedgePart")
Wedge19 = Instance.new("WedgePart")
Decal2 = Instance.new("Decal")
Decal3 = Instance.new("Decal")
Decal4 = Instance.new("Decal")
Decal5 = Instance.new("Decal")
Part6 = Instance.new("Part")
Decal7 = Instance.new("Decal")
Decal8 = Instance.new("Decal")
Decal9 = Instance.new("Decal")
Decal10 = Instance.new("Decal")
Decal11 = Instance.new("Decal")
Decal12 = Instance.new("Decal")
Part8 = Instance.new("Part")
Script9 = Instance.new("Script")
Script10 = Instance.new("Script")
Script11 = Instance.new("Script")
Script12 = Instance.new("Script")
Script13 = Instance.new("Script")
Script14 = Instance.new("Script")
Sound10 = Instance.new("Sound")
Sound11 = Instance.new("Sound")
Sound12 = Instance.new("Sound")
Sound13 = Instance.new("Sound")
Sound14 = Instance.new("Sound")
Sound15 = Instance.new("Sound")
Sound16 = Instance.new("Sound")
Sound17 = Instance.new("Sound")
Sound18 = Instance.new("Sound")
Sound19 = Instance.new("Sound")
Sound20 = Instance.new("Sound")
Sound21 = Instance.new("Sound")
Sound22 = Instance.new("Sound")
Sound23 = Instance.new("Sound")
Sound24 = Instance.new("Sound")
Sound25 = Instance.new("Sound")
Sound26 = Instance.new("Sound") --explosion
Sound27 = Instance.new("Sound") --fite2
Sound28 = Instance.new("Sound") --fite3
Sound29 = Instance.new("Sound") --victory
Sound30 = Instance.new("Sound") --cripilauf
Sound31 = Instance.new("Sound") --introFight
Sound32 = Instance.new("Sound") --fite4
Sound33 = Instance.new("Sound") --fite5
Sound34 = Instance.new("Sound") --fite6
Sound35 = Instance.new("Sound") --talk
Model0.Name = "leppie"
Model0.Parent = mas
Model0.PrimaryPart = Part6
Model1.Name = "WEDDGIE"
Model1.Parent = mas
Wedge.Name = "Wedge"
Wedge.Parent = Model1
Wedge.Anchored = true
Wedge.Transparency = 1
Wedge.Size = Vector3.new(513.21, 357.93, 134.95)
Wedge.Position = Vector3.new(-3.035, 178.965, 320.167)
Wedge2.Name = "Wedge"
Wedge2.Parent = Model1
Wedge2.Anchored = true
Wedge2.Transparency = 1
Wedge2.Size = Vector3.new(354.721, 370.74, 94.071)
Wedge2.Position = Vector3.new(440.522, 132.746, 377.024)
Wedge2.Orientation = Vector3.new(0, -45.718, 164.895)
Wedge3.Name = "Wedge"
Wedge3.Parent = Model1
Wedge3.Anchored = true
Wedge3.Transparency = 1
Wedge3.Size = Vector3.new(359.58, 369.838, 97.698)
Wedge3.Position = Vector3.new(440.929, 133.709, -383)
Wedge3.Orientation = Vector3.new(-0, -133.618, -165.421)
Wedge4.Name = "Wedge"
Wedge4.Parent = Model1
Wedge4.Anchored = true
Wedge4.Transparency = 1
Wedge4.Size = Vector3.new(134.95, 5.958, 2.246)
Wedge4.Position = Vector3.new(320.9, -0.033, -253.933)
Wedge4.Orientation = Vector3.new(-69.342, -180, -179.921)
Wedge5.Name = "Wedge"
Wedge5.Parent = Model1
Wedge5.Anchored = true
Wedge5.Transparency = 1
Wedge5.Size = Vector3.new(378.205, 8.307, 380.514)
Wedge5.Position = Vector3.new(-460.034, 127.829, -375.295)
Wedge5.Orientation = Vector3.new(69.342, 90, 129.959)
Wedge6.Name = "Wedge"
Wedge6.Parent = Model1
Wedge6.Anchored = true
Wedge6.Transparency = 1
Wedge6.Size = Vector3.new(351.491, 370.495, 87.137)
Wedge6.Position = Vector3.new(-444.151, 133.584, -374.212)
Wedge6.Orientation = Vector3.new(0, 134.852, 165.035)
Wedge7.Name = "Wedge"
Wedge7.Parent = Model1
Wedge7.Anchored = true
Wedge7.Transparency = 1
Wedge7.Size = Vector3.new(513.21, 357.93, 134.95)
Wedge7.Position = Vector3.new(-321.555, 178.965, -0.425)
Wedge7.Orientation = Vector3.new(0, -90, 0)
Wedge8.Name = "Wedge"
Wedge8.Parent = Model1
Wedge8.Anchored = true
Wedge8.Transparency = 1
Wedge8.Size = Vector3.new(354.721, 370.74, 94.22)
Wedge8.Position = Vector3.new(373.122, 132.746, 442.755)
Wedge8.Orientation = Vector3.new(0, 134.282, -164.895)
Wedge9.Name = "Wedge"
Wedge9.Parent = Model1
Wedge9.Anchored = true
Wedge9.Transparency = 1
Wedge9.Size = Vector3.new(134.95, 5.958, 380.279)
Wedge9.Position = Vector3.new(320.9, 178.932, -321.408)
Wedge9.Orientation = Vector3.new(69.342, 0, 179.921)
Wedge10.Name = "Wedge"
Wedge10.Parent = Model1
Wedge10.Anchored = true
Wedge10.Transparency = 1
Wedge10.Size = Vector3.new(351.491, 370.495, 95.177)
Wedge10.Position = Vector3.new(-379.527, 133.584, -438.504)
Wedge10.Orientation = Vector3.new(0, -45.148, -165.035)
Wedge11.Name = "Wedge"
Wedge11.Parent = Model1
Wedge11.Anchored = true
Wedge11.Transparency = 1
Wedge11.Size = Vector3.new(353.235, 370.627, 89.793)
Wedge11.Position = Vector3.new(-378.423, 133.132, 441.558)
Wedge11.Orientation = Vector3.new(0, -135.455, 164.959)
Wedge12.Name = "Wedge"
Wedge12.Parent = Model1
Wedge12.Anchored = true
Wedge12.Transparency = 1
Wedge12.Size = Vector3.new(353.235, 370.627, 94.663)
Wedge12.Position = Vector3.new(-443.118, 133.132, 375.827)
Wedge12.Orientation = Vector3.new(-0, 44.545, -164.959)
Wedge13.Name = "Wedge"
Wedge13.Parent = Model1
Wedge13.Anchored = true
Wedge13.Transparency = 1
Wedge13.Size = Vector3.new(454.728, 6.448, 1.231)
Wedge13.Position = Vector3.new(-371.953, -69.175, 437.91)
Wedge13.Orientation = Vector3.new(-69.342, 0, -120.411)
Wedge14.Name = "Wedge"
Wedge14.Parent = Model1
Wedge14.Anchored = true
Wedge14.Transparency = 1
Wedge14.Size = Vector3.new(359.58, 369.838, 88.696)
Wedge14.Position = Vector3.new(373.458, 133.709, -447.291)
Wedge14.Orientation = Vector3.new(0, 46.382, 165.421)
Wedge15.Name = "Wedge"
Wedge15.Parent = Model1
Wedge15.Anchored = true
Wedge15.Transparency = 1
Wedge15.Size = Vector3.new(513.21, 357.93, 134.95)
Wedge15.Position = Vector3.new(-3.176, 178.965, -318.138)
Wedge15.Orientation = Vector3.new(0, 180, 0)
Wedge16.Name = "Wedge"
Wedge16.Parent = Model1
Wedge16.Anchored = true
Wedge16.Transparency = 1
Wedge16.Size = Vector3.new(513.21, 357.93, 134.95)
Wedge16.Position = Vector3.new(320.896, 178.965, -0.425)
Wedge16.Orientation = Vector3.new(0, 90, 0)
Wedge17.Name = "Wedge"
Wedge17.Parent = Model1
Wedge17.Anchored = true
Wedge17.Transparency = 1
Wedge17.Size = Vector3.new(378.205, 8.307, 2.011)
Wedge17.Position = Vector3.new(-392.559, -51.136, -375.295)
Wedge17.Orientation = Vector3.new(-69.342, -90, -129.959)
Wedge18.Name = "Wedge"
Wedge18.Parent = Model1
Wedge18.Anchored = true
Wedge18.Transparency = 1
Wedge18.Size = Vector3.new(600.601, 3.491, 382.509)
Wedge18.Position = Vector3.new(601.663, 73.107, 268.194)
Wedge18.Orientation = Vector3.new(69.357, -91.482, -89.094)
Wedge19.Name = "Wedge"
Wedge19.Parent = Model1
Wedge19.Anchored = true
Wedge19.Transparency = 1
Wedge19.Size = Vector3.new(454.728, 6.448, 381.294)
Wedge19.Position = Vector3.new(-371.953, 109.79, 505.385)
Wedge19.Orientation = Vector3.new(69.342, 180, 120.411)
Part1.Name = "Screen"
Part1.Parent = Model0
Part1.BrickColor = BrickColor.new("Maroon")
Part1.Rotation = Vector3.new(-180, 0, -180)
Part1.Anchored = true
Part1.Size = Vector3.new(75.8799591, 55.930027, 1.35998762)
Part1.CFrame = CFrame.new(13.20014, -31.7921829, -39.5804062, -1, 0, 0, 0, 1, 0, 0, 0, -1)
Part1.BottomSurface = Enum.SurfaceType.Smooth
Part1.TopSurface = Enum.SurfaceType.Smooth
Part1.Color = Color3.new(0.458824, 0, 0)
Part1.Position = Vector3.new(13.20014, -31.7921829, -39.5804062)
Part1.Orientation = Vector3.new(0, 180, 0)
Part1.Color = Color3.new(0.458824, 0, 0)
Decal2.Name = "face"
Decal2.Parent = Part1
Decal2.Texture = "rbxassetid://90662479"
Decal3.Name = "eyes"
Decal3.Parent = Part1
Decal3.Texture = "rbxassetid://90662469"
Decal4.Name = "mouth"
Decal4.Parent = Part1
Decal5.Name = "breek"
Decal5.Parent = Part1
Decal5.Transparency = 1
Decal5.Texture = "rbxassetid://1186442668"
Decal8.Name = "breek2"
Decal8.Parent = Part1
Decal8.Texture = "rbxassetid://247628574"
Decal8.Transparency = 1
Decal9.Name = "breek3"
Decal9.Texture = "rbxassetid://58159420"
Decal9.Parent = Part1
Decal9.Transparency = 1
Decal10.Name = "breek4"
Decal10.Texture = "http://www.roblox.com/asset/?id=8695090010"
Decal10.Parent = Part1
Decal10.Transparency = 1
Decal11.Name = "breek5"
Decal11.Texture = "http://www.roblox.com/asset/?id=11195964473"
Decal11.Parent = Part1
Decal11.Transparency = 1
Decal12.Name = "breek6"
Decal12.Texture = "http://www.roblox.com/asset/?id=11195963868"
Decal12.Parent = Part1
Decal12.Transparency = 1
Part6.Name = "Keyboard"
Part6.Parent = Model0
Part6.BrickColor = BrickColor.new("Really black")
Part6.Rotation = Vector3.new(-180, 0, -180)
Part6.Anchored = true
Part6.Size = Vector3.new(79.1299744, 1, 69.2299881)
Part6.CFrame = CFrame.new(13.20014, -62.288559, -4.82504272, -1, 0, 0, 0, 1, 0, 0, 0, -1)
Part6.BottomSurface = Enum.SurfaceType.Smooth
Part6.TopSurface = Enum.SurfaceType.Smooth
Part6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part6.Position = Vector3.new(13.20014, -62.288559, -4.82504272)
Part6.Orientation = Vector3.new(0, 180, 0)
Part6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Decal7.Parent = Part6
Decal7.Texture = "http://www.roblox.com/asset/?id=244679164"
Decal7.Face = Enum.NormalId.Top
Part8.Name = "Toppart"
Part8.Parent = Model0
Part8.BrickColor = BrickColor.new("Really black")
Part8.Rotation = Vector3.new(-180, 0, 0)
Part8.Anchored = true
Part8.Size = Vector3.new(79.1299744, 60.3200264, 1.35998762)
Part8.CFrame = CFrame.new(13.20014, -31.7921829, -39.7079086, 1, 0, 0, 0, -1, 0, 0, 0, -1)
Part8.BottomSurface = Enum.SurfaceType.Smooth
Part8.TopSurface = Enum.SurfaceType.Smooth
Part8.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Part8.Position = Vector3.new(13.20014, -31.7921829, -39.7079086)
Part8.Orientation = Vector3.new(0, 180, 180)
Part8.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
Script9.Parent = Model0
Script10.Parent = Model0
Script10.Enabled = false
Script10.Name = "Phase2"
Script11.Parent = Model0
Script11.Enabled = false
Script11.Name = "Phase3"
Script12.Parent = Model0
Script12.Enabled = false
Script12.Name = "Phase4"
Script13.Parent = Model0
Script13.Enabled = false
Script13.Name = "Phase5"
Script14.Parent = Model0
Script14.Enabled = false
Script14.Name = "Phase6"
table.insert(cors,sandbox(Script9,function()
	leppie = script.Parent
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false
	leppie:SetPrimaryPartCFrame(CFrame.new(0, -61.865, 0.475))
	wait(0.5)
	leppie:SetPrimaryPartCFrame(leppie:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(180),0))
	

	local puddle = Instance.new("Part", workspace)
	puddle.Transparency = 1
	puddle.Anchored = true
	puddle.CanCollide = false
	puddle.Locked = true
	puddle.Position = Vector3.new(0, 0.5, 0.475)
	puddle.BrickColor = BrickColor.new("Really red")
	puddle.Shape = "Cylinder"
	puddle.Size = Vector3.new(0.6, 129.53, 132.12)
	puddle.Orientation = Vector3.new(0,0,90)
	puddle.Material = "Neon"

	wait(1)
	script.Parent.Screen.face.Transparency = 0
	script.Parent.portal:Play()
	game.TweenService:Create(puddle, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()
	wait(3)
	script.Parent.quake:Play()
	wait(1)
	script.Parent.intro:Play()

	for i = 1,500 do
		leppie:SetPrimaryPartCFrame(leppie:GetPrimaryPartCFrame() * CFrame.new(0,0.125,0))
		wait()
	end
	script.Parent.quake:Stop()
	wait(3)
	script.Parent.intro:Stop()
	local waitTween = game.TweenService:Create(puddle, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
	waitTween:Play()
	waitTween.Completed:Wait()
	puddle:Destroy()
	wait(1)
	leppie.Screen.face.Transparency = 1
	leppie.Screen.eyes.Transparency = 0
	leppie.Screen.mouth.Transparency = 0
	leppie.taunt:Play()
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.3)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434524"
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(1)
	mouth.Transparency = 1
	eyes.Transparency = 1
	face.Texture = "http://www.roblox.com/asset/?id=90662479"
	face.Transparency = 0
	wait(2)
	eyes.Texture = "http://www.roblox.com/asset/?id=1136339833"
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	face.Transparency = 1
	eyes.Transparency = 0
	mouth.Transparency = 0
	script.Parent.laugh:Play()
	wait()
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.8)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	leppie.laugh:Stop()
	mouth.Transparency = 1
	eyes.Transparency = 1
	face.Transparency = 0
	leppie.static:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	leppie.static:Stop()
	wait()
	leppie.milkncereal:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1452644310"
	wait(0.5)
	face.Texture = "http://www.roblox.com/asset/?id=1454229375"
	wait(0.5)
	face.Texture = "http://www.roblox.com/asset/?id=1452644930"
	wait(0.75)
	face.Texture = "http://www.roblox.com/asset/?id=1452644310"
	wait(0.4)
	face.Texture = "http://www.roblox.com/asset/?id=1454229375"
	wait(0.4)
	face.Texture = "http://www.roblox.com/asset/?id=1452644930"
	wait(0.60)
	face.Texture = "http://www.roblox.com/asset/?id=1452644310"
	wait(0.4)
	face.Texture = "http://www.roblox.com/asset/?id=1454229375"
	wait(0.4)
	face.Texture = "http://www.roblox.com/asset/?id=1452644930"
	wait(0.60)
	face.Texture = "http://www.roblox.com/asset/?id=1452644930"
	wait(0.2)
	face.Texture = "http://www.roblox.com/asset/?id=1454229375"
	wait(0.2)
	face.Texture = "http://www.roblox.com/asset/?id=1452644310"
	wait(0.2)
	leppie.milkncereal:Stop()
	leppie.static:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	leppie.static:Stop()
	leppie.reee:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1342394240"
	wait(1)
	face.Texture = "http://www.roblox.com/asset/?id=48129430"
	wait(3)
	leppie.static:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	leppie.static:Stop()
	wait()
	face.Texture = "http://www.roblox.com/asset/?id=873240105"
	wait(0.3)
	leppie.static:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	leppie.static:Stop()
	wait(0.05)
	leppie.static:Play()
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=161123846"
	wait(0.1)
	face.Texture = "http://www.roblox.com/asset/?id=1437986267"
	leppie.static:Stop()
	face.Transparency = 1
	eyes.Texture = "http://www.roblox.com/asset/?id=238113668"
	eyes.Transparency = 0
	mouth.Texture = "http://www.roblox.com/asset/?id=377495903"
	mouth.Transparency = 0
	leppie.tooterals:Play()
	wait(3.2)
	eyes.Texture = "http://www.roblox.com/asset/?id=1136341716"
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=591848611"
	eyes.Transparency = 1
	wait(2)
	eyes.Transparency = 0
	eyes.Texture = "http://www.roblox.com/asset/?id=1136341716"
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
	wait(2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
	wait(2.5)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.1)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.3)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.04)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.04)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.04)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.04)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.3)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.05)
	mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
	wait(0.03)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.03)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.03)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.2)
	mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
	wait(0.03)
	mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
	wait(0.3)
	leppie.tooterals:Stop()
	face.Texture = "http://www.roblox.com/asset/?id=141181138"
	face.Transparency = 0
	eyes.Transparency = 1
	mouth.Transparency = 1
	leppie.fite1:Play()

	for kek = 1,10 do
		local etecc = Instance.new("Part", leppie)
		etecc.BrickColor = BrickColor.Random()
		etecc.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc.Anchored = false
		etecc.CanCollide = true
		etecc.Shape = "Ball"
		etecc.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait(3)
		local boom = Instance.new("Explosion", etecc)
		boom.Position = etecc.Position
		boom.BlastRadius = 30
		wait(0.5)
		etecc:Destroy()
	end

	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Really red")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	Sound22:Play()
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch()
		if db then return end
		db = true
		print("weakspot has been attacked!")
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite1:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(2)
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		screen.face.Transparency = 1
		screen.BrickColor = BrickColor.new("Black")
		leppie.alldead:Play()
		wait(9.7)
		screen.face.Transparency = 0
		leppie.static:Play()
		leppie.alldead:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		screen.BrickColor = BrickColor.new("Maroon")
		leppie.static:Stop()
		screen.face.Texture = "http://www.roblox.com/asset/?id=465571202"
		leppie.demawn:Play()
		wait(2.7)
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		screen.face.Texture = "http://www.roblox.com/asset/?id=596786919"
		leppie.Script.Disabled = true
		script.Parent.Phase2.Disabled = false
		db = false
		if script.Parent.Phase2.Enabled == true then
			for i,v in pairs(cors2) do
				spawn(function()
					pcall(v)
				end)
			end
		end
	end

	weakspot.Touched:connect(onTouch)
end))
table.insert(cors2, sandbox(Script10, function()
	leppie = script.Parent
	TS = game:GetService("TweenService")
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false

	wait(2)
	leppie.fite2:Play()
	wait(2)
	for kek2 = 1,20 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Crimson")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch2()
		if db then return end
		db = true
		print("weakspot has been attacked!")
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite2:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek2.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(7)
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=301890436"
		wait(2)
		leppie.Phase2.Disabled = true
		leppie.Phase3.Disabled = false
		db = false
		if leppie.Phase3.Enabled == true then
			for i,v in pairs(cors3) do
				spawn(function()
					pcall(v)
				end)
			end
		end
	end

	weakspot.Touched:connect(onTouch2)

end))
table.insert(cors3, sandbox(Script11, function()
	leppie = script.Parent
	TS = game:GetService("TweenService")
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false

	leppie.fite3:Play()

	for oof = 1,50 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end

	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Maroon")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch3()
		if db then return end
		db = true
		local message = Instance.new("Message")
		local sound = script.Parent.talk
		local laughing = false
		print("weakspot has been attacked!")
		local function typewrite(object,text,length)
			if laughing == false then
				--We need to make his mouth open
				local mouthTalking = true
				task.spawn(function()
					while mouthTalking == true do
						screen.face.Transparency = 1
						screen.mouth.Transparency = 0
						screen.eyes.Transparency = 0
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.3)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434524"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					face.Texture = "http://www.roblox.com/asset/?id=90662479"
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				mouthTalking = false
			else
				--We need to make him laugh
				task.spawn(function()
					eyes.Texture = "http://www.roblox.com/asset/?id=1136339833"
					mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					face.Transparency = 1
					eyes.Transparency = 0
					mouth.Transparency = 0
					while laughing == true do
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.8)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					screen.eyes.Texture = "rbxassetid://90662469"
					mouth.Texture = ""
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				laughing = false
			end
		end
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite3:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek3.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(7)
		for explo = 1,5 do
			local explosiontrigger = Instance.new("Part", keyboard)
			explosiontrigger.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger.Anchored = true
			explosiontrigger.Transparency = 1
			explosiontrigger.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger)
			boom.Position = explosiontrigger.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(1)
			explosiontrigger:Destroy()
			wait()
			local explosiontrigger2 = Instance.new("Part", keyboard)
			explosiontrigger2.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger2.Anchored = true
			explosiontrigger2.Transparency = 1
			explosiontrigger2.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger2)
			boom.Position = explosiontrigger2.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(0.5)	
			explosiontrigger2:Destroy()	
			wait()
		end
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=90662479"
		wait(1)
		message.Parent = workspace
		typewrite(message, "Oh wow. You defeated me.",0.1)
		wait(2)
		typewrite(message, "I congratulate you on defeating me bud.",0.1)
		wait(2)
		typewrite(message, "heh. heh. heh.",0.1)
		wait(2)
		typewrite(message, "HEH HEH HEH.", 0.1)
		wait(2)
		laughing = true
		leppie.cripilauf:Play()
		typewrite(message,"HAHAHAHAHA. YOU FOOLS.",0.1)
		wait(2)
		typewrite(message, "YOU THOUGHT YOU COULD DEFEAT ME?",0.1)
		wait(2)
		typewrite(message,"OH... THIS IS JUST THE BEGINNING.",0.2)
		wait(2)
		typewrite(message,"IVE ONLY USED 0.5% OF MY POWER.",0.1)
		wait(2)
		typewrite(message,"NOW ILL SHOW YOU MY TRUE POWER!",0.1)
		wait(2)
		leppie.demawn:Play()
		laughing = true
		typewrite(message,"HAHAHHAHAHAHAHAHAHAHHA",0.1)
		wait(2)
		message.Text = ""
		leppie.introFight:Play()
		wait(leppie.introFight.TimeLength)
		leppie.Phase3.Enabled = false
		leppie.Phase4.Enabled = true
		if leppie.Phase4.Enabled == true then
			for i,v in pairs(cors4) do
				spawn(function()
					pcall(v)
				end)
			end
		end
		db = false
	end

	weakspot.Touched:connect(onTouch3)

end))
table.insert(cors4, sandbox(Script12, function()
	leppie = script.Parent
	TS = game:GetService("TweenService")
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false

	leppie.fite4:Play()
	for kek2 = 1,20 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	for oof = 1,50 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end

	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Maroon")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch4()
		if db then return end
		db = true
		local message = workspace:FindFirstChild("Message")
		local sound = script.Parent.talk
		local laughing = false
		print("weakspot has been attacked!")
		local function typewrite(object,text,length)
			if laughing == false then
				--We need to make his mouth open
				local mouthTalking = true
				task.spawn(function()
					while mouthTalking == true do
						screen.face.Transparency = 1
						screen.mouth.Transparency = 0
						screen.eyes.Transparency = 0
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.3)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434524"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					face.Texture = "http://www.roblox.com/asset/?id=90662479"
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				mouthTalking = false
			else
				--We need to make him laugh
				task.spawn(function()
					eyes.Texture = "http://www.roblox.com/asset/?id=1136339833"
					mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					face.Transparency = 1
					eyes.Transparency = 0
					mouth.Transparency = 0
					while laughing == true do
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.8)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					screen.eyes.Texture = "rbxassetid://90662469"
					mouth.Texture = ""
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				laughing = false
			end
		end
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite4:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek4.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(7)
		for explo = 1,5 do
			local explosiontrigger = Instance.new("Part", keyboard)
			explosiontrigger.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger.Anchored = true
			explosiontrigger.Transparency = 1
			explosiontrigger.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger)
			boom.Position = explosiontrigger.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(1)
			explosiontrigger:Destroy()
			wait()
			local explosiontrigger2 = Instance.new("Part", keyboard)
			explosiontrigger2.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger2.Anchored = true
			explosiontrigger2.Transparency = 1
			explosiontrigger2.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger2)
			boom.Position = explosiontrigger2.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(0.5)	
			explosiontrigger2:Destroy()	
			wait()
		end
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=90662479"
		wait(1)
		message.Parent = workspace
		typewrite(message, "STILL NOT GIVING UP I SEE.",0.1)
		wait(2)
		typewrite(message, "OH OH OH. YOU THINK YOU ARE SO SMART.",0.1)
		wait(2)
		typewrite(message, "BY DEFEATING ME.",0.1)
		wait(2)
		typewrite(message, "YOU KNOW. IM NOT A MORTAL LIKE YOU.", 0.1)
		wait(2)
		typewrite(message, "INSTEAD IM WAY BETTER THAN YOU", 0.1)
		wait(2)
		laughing = true
		leppie.cripilauf:Play()
		typewrite(message,"HAHAHAHAHAHAHAHAHAHAHA",0.1)
		wait(2)
		typewrite(message, "THAT WAS ONLY 1% OF MY POWER",0.1)
		wait(2)
		typewrite(message,"OH... AND DONT THINK YOULL WIN EASILY",0.2)
		wait(2)
		typewrite(message,"THIS TIME. MY ATTACKS ARE WAY STRONGER",0.1)
		wait(2)
		typewrite(message,"NOW ILL SHOW YOU MY FULL POWER!",0.1)
		wait(2)
		leppie.demawn:Play()
		laughing = true
		typewrite(message,"HAHAHHAHAHAHAHAHAHAHHA",0.1)
		wait(2)
		message.Text = ""
		leppie.introFight.Pitch = 0.7
		leppie.introFight:Play()
		wait(leppie.introFight.TimeLength)
		leppie.Phase4.Enabled = false
		leppie.Phase5.Enabled = true
		if leppie.Phase5.Enabled == true then
			for i,v in pairs(cors5) do
				spawn(function()
					pcall(v)
				end)
			end
		end
		db = false
	end

	weakspot.Touched:connect(onTouch4)
end))
table.insert(cors5, sandbox(Script13, function()
	leppie = script.Parent
	TS = game:GetService("TweenService")
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false

	leppie.fite5:Play()
	for kek = 1,15 do
		local etecc = Instance.new("Part", leppie)
		etecc.BrickColor = BrickColor.Random()
		etecc.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc.Anchored = false
		etecc.CanCollide = true
		etecc.Shape = "Ball"
		etecc.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait(3)
		local boom = Instance.new("Explosion", etecc)
		boom.Position = etecc.Position
		boom.BlastRadius = 30
		wait(0.5)
		etecc:Destroy()
	end
	for kek2 = 1,25 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	for oof = 1,100 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end

	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Maroon")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch5()
		if db then return end
		db = true
		local message = workspace:FindFirstChild("Message")
		local sound = script.Parent.talk
		local laughing = false
		print("weakspot has been attacked!")
		local function typewrite(object,text,length)
			if laughing == false then
				--We need to make his mouth open
				local mouthTalking = true
				task.spawn(function()
					while mouthTalking == true do
						screen.face.Transparency = 1
						screen.mouth.Transparency = 0
						screen.eyes.Transparency = 0
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.3)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434524"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					face.Texture = "http://www.roblox.com/asset/?id=90662479"
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				mouthTalking = false
			else
				--We need to make him laugh
				task.spawn(function()
					eyes.Texture = "http://www.roblox.com/asset/?id=1136339833"
					mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					face.Transparency = 1
					eyes.Transparency = 0
					mouth.Transparency = 0
					while laughing == true do
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.8)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					screen.eyes.Texture = "rbxassetid://90662469"
					mouth.Texture = ""
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				laughing = false
			end
		end
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite5:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek5.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(7)
		for explo = 1,10 do
			local explosiontrigger = Instance.new("Part", keyboard)
			explosiontrigger.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger.Anchored = true
			explosiontrigger.Transparency = 1
			explosiontrigger.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger)
			boom.Position = explosiontrigger.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(1)
			explosiontrigger:Destroy()
			wait()
			local explosiontrigger2 = Instance.new("Part", keyboard)
			explosiontrigger2.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger2.Anchored = true
			explosiontrigger2.Transparency = 1
			explosiontrigger2.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger2)
			boom.Position = explosiontrigger2.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(0.5)	
			explosiontrigger2:Destroy()	
			wait()
		end
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=90662479"
		wait(1)
		message.Parent = workspace
		typewrite(message, "I SEE. YOU STILL SURVIVED.",0.1)
		wait(2)
		typewrite(message, "EVEN AFTER ALL OF MY ATTACKS",0.1)
		wait(2)
		typewrite(message, "OH OH OH. IF ONLY YOU KNEW",0.1)
		wait(2)
		typewrite(message, "THAT IN THIS WORLD", 0.1)
		wait(2)
		typewrite(message, "ITS KILL OR BE KILLED.", 0.1)
		wait(2)
		laughing = true
		leppie.cripilauf:Play()
		typewrite(message,"HAHAHAHAHAHAHAHAHAHAHA",0.1)
		wait(2)
		typewrite(message, "YOU THOUGHT U KILLED ME?",0.1)
		wait(2)
		typewrite(message,"FLOWEY HERE HELPED ME TO SURVIVE.",0.2)
		wait(2)
		typewrite(message,"THIS TIME. YOUR GONNA BE IN DA HECK.",0.1)
		wait(2)
		typewrite(message,"NOW ILL SHOW YOU MY EXTREME POWER!",0.1)
		wait(2)
		leppie.demawn:Play()
		laughing = true
		typewrite(message,"HAHAHHAHAHAHAHAHAHAHHA",0.1)
		wait(2)
		message.Text = ""
		leppie.introFight.Pitch = 0.5
		leppie.introFight:Play()
		wait(leppie.introFight.TimeLength)
		leppie.Phase5.Enabled = false
		leppie.Phase6.Enabled = true
		if leppie.Phase6.Enabled == true then
			for i,v in pairs(cors6) do
				spawn(function()
					pcall(v)
				end)
			end
		end
		db = false
	end

	weakspot.Touched:connect(onTouch5)

end))
table.insert(cors6, sandbox(Script14, function()
	leppie = script.Parent
	TS = game:GetService("TweenService")
	keyboard = script.Parent.Keyboard
	screen = script.Parent.Screen
	top = script.Parent.Toppart
	eyes = leppie.Screen.eyes
	face = leppie.Screen.face
	mouth = leppie.Screen.mouth
	db = false

	leppie.fite6:Play()
	for kek = 1,10 do
		local etecc = Instance.new("Part", leppie)
		etecc.BrickColor = BrickColor.Random()
		etecc.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc.Anchored = false
		etecc.CanCollide = true
		etecc.Shape = "Ball"
		etecc.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait(3)
		local boom = Instance.new("Explosion", etecc)
		boom.Position = etecc.Position
		boom.BlastRadius = 30
		wait(0.5)
		etecc:Destroy()
	end
	for kek2 = 1,20 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	for oof = 1,50 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end
	for kek2 = 1,20 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	for oof = 1,50 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end
	for kek = 1,15 do
		local etecc = Instance.new("Part", leppie)
		etecc.BrickColor = BrickColor.Random()
		etecc.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc.Anchored = false
		etecc.CanCollide = true
		etecc.Shape = "Ball"
		etecc.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait(3)
		local boom = Instance.new("Explosion", etecc)
		boom.Position = etecc.Position
		boom.BlastRadius = 30
		wait(0.5)
		etecc:Destroy()
	end
	for kek2 = 1,25 do
		local etecc2 = Instance.new("Part", leppie)
		etecc2.BrickColor = BrickColor.Random()
		etecc2.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc2.Anchored = false
		etecc2.CanCollide = true
		etecc2.Shape = "Ball"
		etecc2.Position = Vector3.new(math.random(-200,200),200, math.random(-200, 200))
		wait()
		local etecc3 = Instance.new("Part", leppie)
		etecc3.BrickColor = BrickColor.Random()
		etecc3.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc3.Anchored = false
		etecc3.CanCollide = true
		etecc3.Shape = "Ball"
		etecc3.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc4 = Instance.new("Part", leppie)
		etecc4.BrickColor = BrickColor.Random()
		etecc4.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc4.Anchored = false
		etecc4.CanCollide = true
		etecc4.Shape = "Ball"
		etecc4.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc5 = Instance.new("Part", leppie)
		etecc5.BrickColor = BrickColor.Random()
		etecc5.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc5.Anchored = false
		etecc5.CanCollide = true
		etecc5.Shape = "Ball"
		etecc5.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc6 = Instance.new("Part", leppie)
		etecc6.BrickColor = BrickColor.Random()
		etecc6.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc6.Anchored = false
		etecc6.CanCollide = true
		etecc6.Shape = "Ball"
		etecc6.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc7 = Instance.new("Part", leppie)
		etecc7.BrickColor = BrickColor.Random()
		etecc7.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc7.Anchored = false
		etecc7.CanCollide = true
		etecc7.Shape = "Ball"
		etecc7.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc8 = Instance.new("Part", leppie)
		etecc8.BrickColor = BrickColor.Random()
		etecc8.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc8.Anchored = false
		etecc8.CanCollide = true
		etecc8.Shape = "Ball"
		etecc8.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc9 = Instance.new("Part", leppie)
		etecc9.BrickColor = BrickColor.Random()
		etecc9.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc9.Anchored = false
		etecc9.CanCollide = true
		etecc9.Shape = "Ball"
		etecc9.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc10 = Instance.new("Part", leppie)
		etecc10.BrickColor = BrickColor.Random()
		etecc10.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc10.Anchored = false
		etecc10.CanCollide = true
		etecc10.Shape = "Ball"
		etecc10.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc11 = Instance.new("Part", leppie)
		etecc11.BrickColor = BrickColor.Random()
		etecc11.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc11.Anchored = false
		etecc11.CanCollide = true
		etecc11.Shape = "Ball"
		etecc11.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc12 = Instance.new("Part", leppie)
		etecc12.BrickColor = BrickColor.Random()
		etecc12.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc12.Anchored = false
		etecc12.CanCollide = true
		etecc12.Shape = "Ball"
		etecc12.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc13 = Instance.new("Part", leppie)
		etecc13.BrickColor = BrickColor.Random()
		etecc13.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc13.Anchored = false
		etecc13.CanCollide = true
		etecc13.Shape = "Ball"
		etecc13.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc14 = Instance.new("Part", leppie)
		etecc14.BrickColor = BrickColor.Random()
		etecc14.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc14.Anchored = false
		etecc14.CanCollide = true
		etecc14.Shape = "Ball"
		etecc14.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc15 = Instance.new("Part", leppie)
		etecc15.BrickColor = BrickColor.Random()
		etecc15.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc15.Anchored = false
		etecc15.CanCollide = true
		etecc15.Shape = "Ball"
		etecc15.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc16 = Instance.new("Part", leppie)
		etecc16.BrickColor = BrickColor.Random()
		etecc16.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc16.Anchored = false
		etecc16.CanCollide = true
		etecc16.Shape = "Ball"
		etecc16.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc17 = Instance.new("Part", leppie)
		etecc17.BrickColor = BrickColor.Random()
		etecc17.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc17.Anchored = false
		etecc17.CanCollide = true
		etecc17.Shape = "Ball"
		etecc17.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc18 = Instance.new("Part", leppie)
		etecc18.BrickColor = BrickColor.Random()
		etecc18.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc18.Anchored = false
		etecc18.CanCollide = true
		etecc18.Shape = "Ball"
		etecc18.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc19 = Instance.new("Part", leppie)
		etecc19.BrickColor = BrickColor.Random()
		etecc19.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc19.Anchored = false
		etecc19.CanCollide = true
		etecc19.Shape = "Ball"
		etecc19.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		local etecc20 = Instance.new("Part", leppie)
		etecc20.BrickColor = BrickColor.Random()
		etecc20.Size = Vector3.new(5.59, 4.4, 4.71)
		etecc20.Anchored = false
		etecc20.CanCollide = true
		etecc20.Shape = "Ball"
		etecc20.Position = Vector3.new(math.random(-300,300),300, math.random(-300, 300))
		wait()
		wait(3)
		local boom = Instance.new("Explosion", etecc2)
		boom.Position = etecc2.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc3)
		boom.Position = etecc3.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc4)
		boom.Position = etecc4.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc5)
		boom.Position = etecc5.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc6)
		boom.Position = etecc6.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc7)
		boom.Position = etecc7.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc8)
		boom.Position = etecc8.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc9)
		boom.Position = etecc9.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc10)
		boom.Position = etecc10.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc11)
		boom.Position = etecc11.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc12)
		boom.Position = etecc12.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc13)
		boom.Position = etecc13.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc14)
		boom.Position = etecc14.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc15)
		boom.Position = etecc15.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc16)
		boom.Position = etecc16.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc17)
		boom.Position = etecc17.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc18)
		boom.Position = etecc18.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc19)
		boom.Position = etecc19.Position
		boom.BlastRadius = 30
		wait()
		local boom = Instance.new("Explosion", etecc20)
		boom.Position = etecc20.Position
		boom.BlastRadius = 30
		wait()
		etecc2:Destroy()
		etecc3:Destroy()
		etecc4:Destroy()
		etecc5:Destroy()
		etecc6:Destroy()
		etecc7:Destroy()
		etecc8:Destroy()
		etecc9:Destroy()
		etecc10:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc11:Destroy()
		etecc12:Destroy()
		etecc13:Destroy()
		etecc14:Destroy()
		etecc15:Destroy()
		etecc16:Destroy()
		etecc17:Destroy()
		etecc18:Destroy()
		etecc19:Destroy()
		etecc20:Destroy()
		wait(3)
	end
	for oof = 1,100 do
		local mine = Instance.new("Part", leppie)
		mine.Shape = "Cylinder"
		mine.BrickColor = BrickColor.new("Crimson")
		mine.Position = Vector3.new(math.random(-100,100),1, math.random(-100, 100))
		mine.Size = Vector3.new(0.85, 8.96, 3.03)
		mine.Anchored = true
		mine.CanCollide = false
		mine.Orientation = Vector3.new(0,0,90)
		wait(1)
		local boom = Instance.new("Explosion", mine)
		boom.Position = mine.Position
		boom.BlastRadius = 30
	end

	local weakspot = Instance.new("Part", keyboard)
	weakspot.Shape = "Cylinder"
	weakspot.BrickColor = BrickColor.new("Maroon")
	weakspot.Position = keyboard.Position + Vector3.new(0, 1, 0)
	weakspot.Size = Vector3.new(0.85, 8.96, 3.03)
	weakspot.Anchored = true
	weakspot.CanCollide = true
	weakspot.Orientation = Vector3.new(0,0,90)
	weakspot.Transparency = 1
	wait(1)
	game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()

	function onTouch6()
		if db then return end
		db = true
		local message = workspace:FindFirstChild("Message")
		local sound = script.Parent.talk
		local laughing = false
		print("weakspot has been attacked!")
		local function typewrite(object,text,length)
			if laughing == false then
				--We need to make his mouth open
				local mouthTalking = true
				task.spawn(function()
					while mouthTalking == true do
						screen.face.Transparency = 1
						screen.mouth.Transparency = 0
						screen.eyes.Transparency = 0
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.3)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434815"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434524"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434668"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920434949"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920435550"
						wait(0.2)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					face.Texture = "http://www.roblox.com/asset/?id=90662479"
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				mouthTalking = false
			else
				--We need to make him laugh
				task.spawn(function()
					eyes.Texture = "http://www.roblox.com/asset/?id=1136339833"
					mouth.Texture = "http://www.roblox.com/asset/?id=920432772"
					face.Transparency = 1
					eyes.Transparency = 0
					mouth.Transparency = 0
					while laughing == true do
						wait()
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.8)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920434523"
						wait(0.1)
						mouth.Texture = "http://www.roblox.com/asset/?id=920432367"
						wait(0.1)
					end
					mouth.Transparency = 1
					eyes.Transparency = 1
					screen.eyes.Texture = "rbxassetid://90662469"
					mouth.Texture = ""
					face.Transparency = 0
				end)
				for i = 1,#text,1 do
					object.Text = string.sub(text,1,i)
					sound:Play()
					wait(length)
				end
				laughing = false
			end
		end
		task.spawn(function()
			local waitTween = game.TweenService:Create(weakspot, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
			waitTween:Play()
			waitTween.Completed:Wait()
			weakspot:Destroy()
		end)
		leppie.fite6:Stop()
		leppie.pain.Pitch = 0.5
		leppie.pain:Play()
		leppie.crash:Play()
		screen.breek6.Transparency = 0
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		wait(7)
		for explo = 1,20 do
			local explosiontrigger = Instance.new("Part", keyboard)
			explosiontrigger.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger.Anchored = true
			explosiontrigger.Transparency = 1
			explosiontrigger.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger)
			boom.Position = explosiontrigger.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(1)
			explosiontrigger:Destroy()
			wait()
			local explosiontrigger2 = Instance.new("Part", keyboard)
			explosiontrigger2.Position = Vector3.new(math.random(-79.13,79.13),math.random(-1,1), math.random(-69.23, 69.23))
			explosiontrigger2.Anchored = true
			explosiontrigger2.Transparency = 1
			explosiontrigger2.CanCollide = false
			local boom = Instance.new("Explosion", explosiontrigger2)
			boom.Position = explosiontrigger2.Position
			boom.BlastRadius = 10
			leppie.eguspelosiawn:Play()
			wait(0.5)	
			explosiontrigger2:Destroy()	
			wait()
		end
		leppie.static:Play()
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=1437986267"
		wait(0.1)
		face.Texture = "http://www.roblox.com/asset/?id=161123846"
		wait(0.1)
		leppie.static:Stop()
		face.Texture = "http://www.roblox.com/asset/?id=90662479"
		wait(1)
		message.Parent = workspace
		typewrite(message, "DANG IT.",0.1)
		wait(2)
		typewrite(message, "EVEN AFTER ALL OF MY ATTACKS",0.1)
		wait(2)
		typewrite(message, "I STILL GOT A CRITICAL HIT",0.1)
		wait(2)
		typewrite(message, "WAIT. WHATS HAPPENING!?",0.1)
		wait(2)
		typewrite(message, "NOOOOOOOOOOOOO",0.1)
		wait(2)
		message.Text = ""
		screen.face.Texture = "http://www.roblox.com/asset/?id=132894111"
		local puddle = Instance.new("Part", workspace)
		leppie.portal:Play()
		puddle.Transparency = 1
		game.TweenService:Create(puddle, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 0}):Play()
		puddle.Anchored = true
		puddle.CanCollide = false
		puddle.Locked = true
		puddle.Position = Vector3.new(0, 0.5, 0.475)
		puddle.BrickColor = BrickColor.new("Really red")
		puddle.Shape = "Cylinder"
		puddle.Size = Vector3.new(0.6, 129.53, 132.12)
		puddle.Orientation = Vector3.new(0,0,90)
		puddle.Material = "Neon"
		leppie.quake:Play()
		leppie.death:Play()
		for i = 1,500 do
			leppie:SetPrimaryPartCFrame(leppie:GetPrimaryPartCFrame() * CFrame.new(0,-0.125,0))
			wait()
		end
		game.TweenService:Create(puddle, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1}):Play()
		leppie.quake:Stop()
		leppie.death:Stop()
		leppie.willreturnsound:Play()
		puddle:Destroy()
		wait(1)
		if workspace:FindFirstChild("Baseplate") then
			while leppie.willreturnsound.IsPlaying == true do
				game.Workspace.Baseplate.BrickColor = BrickColor.Random()
				wait(0.3)
			end
			local tween = game.TweenService:Create(base, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Color = originColor, Size = originSize, Position = originPos})
			tween:Play()
			base.TopSurface = originTopSurface
			base.BottomSurface = originBottomSurface
			base.Material = originMaterial
			tween.Completed:Wait()
			wait(1)
			leppie.talk.Pitch = 1
			typewrite(message, "Thank you for completing this fight.",0.1)
			wait(2)
			typewrite(message, "Im so amazed you completed this boss fight script",0.1)
			wait(2)
			typewrite(message, "Credits:Dion(@Dionnooo) for creating the original game. Seek for making this laptop boss edit.",0.2)
			wait(2)
			typewrite(message, "Again. Thanks for completing this boss fight.",0.2)
			wait(2)
			message:Destroy()
		elseif workspace:FindFirstChild("Base") then
			while leppie.willreturnsound.IsPlaying == true do
				game.Workspace.Base.BrickColor = BrickColor.Random()
				wait(0.3)
			end
			local tween = game.TweenService:Create(base, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Color = originColor, Size = originSize, Position = originPos})
			tween:Play()
			base.TopSurface = originTopSurface
			base.BottomSurface = originBottomSurface
			base.Material = originMaterial
			tween.Completed:Wait()
			wait(1)
			leppie.talk.Pitch = 1
			typewrite(message, "Thank you for completing this fight.",0.2)
			wait(2)
			typewrite(message, "Im so amazed you completed this boss fight script",0.2)
			wait(2)
			typewrite(message, "Credits:Dion(@Dionnooo) for creating the original game. Seek for making this laptop boss edit.",0.2)
			wait(2)
			typewrite(message, "Again. Thanks for completing this boss fight.",0.2)
			wait(2)
			message:Destroy()
			leppie:Destroy()
			Model1:Destroy()
		else
			--return
		end
	end

	weakspot.Touched:connect(onTouch6)

end))

Sound10.Name = "portal"
Sound10.Parent = Model0
Sound10.SoundId = "rbxassetid://956585775"
Sound10.Volume = 10
Sound11.Name = "quake"
Sound11.Parent = Model0
Sound11.SoundId = "rbxassetid://1444622148"
Sound11.Volume = 5
Sound12.Name = "intro"
Sound12.Parent = Model0
Sound12.SoundId = "rbxassetid://9041752739"
Sound12.Volume = 10
Sound13.Name = "taunt"
Sound13.Parent = Model0
Sound13.SoundId = "rbxassetid://135017578"
Sound13.Volume = 10
Sound14.Name = "laugh"
Sound14.Parent = Model0
Sound14.SoundId = "rbxassetid://535587826"
Sound14.Volume = 10
Sound15.Name = "static"
Sound15.Parent = Model0
Sound15.SoundId = "rbxassetid://132081621"
Sound15.Volume = 10
Sound16.Name = "milkncereal"
Sound16.Parent = Model0
Sound16.SoundId = "rbxassetid://1519649604"
Sound16.Volume = 10
Sound17.Name = "reee"
Sound17.Parent = Model0
Sound17.SoundId = "rbxassetid://1286168545"
Sound17.Volume = 10
Sound18.Name = "tooterals"
Sound18.Parent = Model0
Sound18.SoundId = "rbxassetid://4389968391"
Sound18.Volume = 10
Sound19.Name = "fite1"
Sound19.Parent = Model0
Sound19.SoundId = "rbxassetid://1842940352"
Sound19.Volume = 10
Sound20.Name = "pain"
Sound20.Parent = Model0
Sound20.SoundId = "rbxassetid://925078311"
Sound20.Volume = 10
Sound21.Name = "crash"
Sound21.Parent = Model0
Sound21.SoundId = "rbxassetid://6629890936"
Sound21.Volume = 10
Sound22.Name = "appearance"
Sound22.Parent = Model0
Sound22.SoundId = "rbxassetid://5405422834"
Sound22.Volume = 10
Sound23.Name = "alldead"
Sound23.Parent = Model0
Sound23.SoundId = "rbxassetid://9042661385"
Sound23.Volume = 10
Sound24.Name = "death"
Sound24.Parent = Model0
Sound24.SoundId = "rbxassetid://9046435309"
Sound24.Volume = 10
Sound25.Name = "demawn"
Sound25.Parent = Model0
Sound25.SoundId = "rbxassetid://222213668"
Sound25.Volume = 10
Sound26.Name = "eguspelosiawn"
Sound26.Parent = Model0
Sound26.SoundId = "rbxassetid://539294959"
Sound26.Volume = 10
Sound27.Name = "fite2"
Sound27.Parent = Model0
Sound27.SoundId = "rbxassetid://1837853076"
Sound27.Volume = 10
Sound28.Name = "fite3"
Sound28.Parent = Model0
Sound28.SoundId = "rbxassetid://1843397149"
Sound28.Volume = 10
Sound28.Looped = true
Sound29.Name = "willreturnsound"
Sound29.Parent = Model0
Sound29.SoundId = "rbxassetid://1846368080"
Sound29.Volume = 10
Sound30.Name = "cripilauf"
Sound30.Parent = Model0
Sound30.SoundId = "rbxassetid://305685800"
Sound30.Volume = 10
Sound31.Name = "introFight"
Sound31.Parent = Model0
Sound31.SoundId = "rbxassetid://6258085236"
Sound31.Volume = 10
Sound31.Pitch = 0.8
Sound32.Name = "fite4"
Sound32.Parent = Model0
Sound32.SoundId = "rbxassetid://1837807891"
Sound32.Volume = 10
Sound32.Looped = true
Sound33.Name = "fite5"
Sound33.Parent = Model0
Sound33.SoundId = "rbxassetid://1848090337"
Sound33.Volume = 10
Sound33.Looped = true
Sound34.Name = "fite6"
Sound34.Parent = Model0
Sound34.SoundId = "rbxassetid://1842639095"
Sound34.Volume = 10
Sound34.Looped = true
Sound35.Name = "talk"
Sound35.Parent = Model0
Sound35.SoundId = "rbxassetid://5417004822"
Sound35.Volume = 10
Sound35.Pitch = 0.39
for i,v in pairs(mas:GetChildren()) do
	v.Parent = workspace
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
