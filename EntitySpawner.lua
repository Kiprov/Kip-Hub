-- //

--\\

local v1 = game.Players.LocalPlayer.PlayerGui.MainUI
local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

local Death = {}

local partsWithId = {}
local awaitRef = {}

local SpawnerLibrary = {
	Tween = function(object, input, studspersecond, offset)
		local char = game:GetService("Players").LocalPlayer.Character;
		local input = input or error("input is nil");
		local studspersecond = studspersecond or 1000;
		local offset = offset or CFrame.new(0,0,0);
		local vec3, cframe;

		if typeof(input) == "table" then
			vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
		elseif typeof(input) ~= "Instance" then
			return error("wrong format used");
		end;

		local Time = (object.Value.Position - (vec3 or input.Position)).magnitude/studspersecond;

		local twn = game.TweenService:Create(object, TweenInfo.new(Time,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Value = (cframe or input.CFrame) * offset});
		twn:Play();
		twn.Completed:Wait()
	end,
	Tween2 = function(object, input, studspersecond, offset)
		local char = game:GetService("Players").LocalPlayer.Character;
		local input = input or error("input is nil");
		local studspersecond = studspersecond or 1000;
		local offset = offset or CFrame.new(0,0,0);
		local vec3, cframe;

		if typeof(input) == "table" then
			vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
		elseif typeof(input) ~= "Instance" then
			return error("wrong format used");
		end;

		local Time = (object.Position - (vec3 or input.Position)).magnitude/studspersecond;

		local twn = game.TweenService:Create(object, TweenInfo.new(Time,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = (cframe or input.CFrame) * offset});
		twn:Play();
		twn.Completed:Wait()
	end,
	Calculate = function()
		local t = 0
		local Earliest = 0
		local Latest = game.ReplicatedStorage.GameData.LatestRoom.Value

		for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
			t += 1
			if Room:FindFirstChild("RoomEntrance") and tonumber(Room.Name) == game.ReplicatedStorage.GameData.LatestRoom.Value then
				Earliest = tonumber(Room.Name)
				break;
			end
		end

		return workspace.CurrentRooms[Earliest], workspace.CurrentRooms[Latest]
	end,
	Calculate2 = function()
		local Earliest = 0
		local Latest = game.ReplicatedStorage.GameData.LatestRoom.Value

		for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
			if Room:FindFirstChild("RoomEntrance") then
				Earliest = tonumber(Room.Name)
				break;
			end
		end

		return workspace.CurrentRooms[Earliest], workspace.CurrentRooms[Latest]
	end,
	Raycast = function(Player, Part, Entity, Distance)
		if Player.Character.Humanoid.Health > 0 then
			local Params = RaycastParams.new()
			Params.FilterDescendantsInstances = {
				Part
			}
			local dir = CFrame.lookAt(Part.Position, Player.Character.PrimaryPart.Position).LookVector * Distance
			local Cast = workspace:Raycast(Part.Position, dir)

			if Cast and Cast.Instance then
				local Hit = Cast.Instance

				if Hit:IsDescendantOf(Player.Character) and (Player.Character:GetAttribute("Hiding") == false or Player.Character:GetAttribute("Hiding") == nil) then
					Player.Character.Humanoid.Health = 0
					
					Death[Entity]()
				end
			end
		end
	end,
	Prepare = function(Lines, Cause)
		return coroutine.wrap(function()
			for i,v in pairs(game.ReplicatedStorage.GameStats:GetDescendants()) do
				if v.Name == "DeathCause" then
					v.Value = Cause
				end
			end

			firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, Lines)
		end)()
	end
}

Create = function(item, parent)
	local obj = Instance.new(item.Type)
	if (item.ID) then
		local awaiting = awaitRef[item.ID]
		if (awaiting) then
			awaiting[1][awaiting[2]] = obj
			awaitRef[item.ID] = nil
		else
			partsWithId[item.ID] = obj
		end
	end
	for p,v in pairs(item.Properties) do
		if (type(v) == "string") then
			local id = tonumber(v:match("^_R:(%w+)_$"))
			if (id) then
				if (partsWithId[id]) then
					v = partsWithId[id]
				else
					awaitRef[id] = {obj, p}
					v = nil
				end
			end
		end
		obj[p] = v
	end
	for _,c in pairs(item.Children) do
		Create(c, obj)
	end
	obj.Parent = parent
	return obj
end

Death = {
	Rush = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Play();
			v1.Jumpscare_Rush.Visible = true;
			local v64 = tick();
			local v65 = math.random(5, 30) / 10;
			local v66 = v65 + math.random(10, 60) / 10;
			local v67 = 0.25;
			for v68 = 1, 100000 do
				task.wait();
				if v64 + v65 <= tick() then
					v1.Jumpscare_Rush.ImageLabel.Visible = true;
					v65 = v65 + math.random(7, 44) / 10;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Pitch = 1 + math.random(-100, 100) / 500;
					v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, math.random(0, 10) / 255);
					v1.Jumpscare_Rush.ImageLabel.Position = UDim2.new(0.5, math.random(-2, 2), 0.5, math.random(-2, 2));
					v67 = v67 + 0.05;
					v1.Jumpscare_Rush.ImageLabel.Size = UDim2.new(v67, 0, v67, 0);
				end;
				if v64 + v66 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabel.Visible = true;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Stop();
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2:Play();
			v1.Jumpscare_Rush.ImageLabel.Visible = false;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = true;
			v1.Jumpscare_Rush.ImageLabelBig:TweenSize(UDim2.new(2.5, 0, 2.5, 0), "In", "Sine", 0.3, true);
			local v69 = tick();
			for v70 = 1, 1000 do
				local v71 = math.random(0, 10) / 10;
				v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(v71, v71, math.clamp(math.random(25, 50) / 50, v71, 1));
				v1.Jumpscare_Rush.ImageLabelBig.Position = UDim2.new(0.5 + math.random(-100, 100) / 5000, 0, 0.5 + math.random(-100, 100) / 3000, 0);
				task.wait(0.016666666666666666);
				if v69 + 0.3 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = false;
			v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Rush.Visible = false;
			u2.deathtick = tick();
		end
local Randomizer = math.random(1,3)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"You died to Rush...","Pay attention to any cues that might hint at its arrival."}, "Rush")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to Rush again...","Pay attention to the lights. They are related to its arrival."}, "Rush")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"It seems you are having trouble with Rush...","The lights will always flicker when it is near.","Whenever this happens, find a hiding spot!"}, "Rush")
end
Jumpscare()
	end,
	Ambush = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
			v1.Jumpscare_Ambush.Visible = true;
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(v79, math.clamp(math.random(25, 50) / 50, v79, 1), math.clamp(math.random(25, 50) / 150, v79, 1));
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			u2.deathtick = tick();
			return;
		end
local Randomizer = math.random(1, 4)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"You died to who you call Ambush...","It is a tricky one.","Use what you have learned from Rush!"}, "Ambush")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to Ambush again...","It gets you when you least suspect it!","It has a unique scream. Once you hear it, be prepared!"}, "Ambush")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"You died to Ambush.","You might need to hop in and out of your hiding spot a couple times."}, "Ambush")
elseif Randomizer == 4 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiprov/Kip-Hub/main/AC.lua"))()
end
Jumpscare()
	end,
A60 = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Play();
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.SoundId = "rbxassetid://4903742660";
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Volume = 3
			v1.Jumpscare_Rush.Visible = true;
v1.Jumpscare_Rush.ImageLabel.Image = "rbxassetid://3354536350";
			local v64 = tick();
			local v65 = math.random(5, 30) / 10;
			local v66 = v65 + math.random(10, 60) / 10;
			local v67 = 0.25;
			for v68 = 1, 100000 do
				task.wait();
				if v64 + v65 <= tick() then
					v1.Jumpscare_Rush.ImageLabel.Visible = true;
					v65 = v65 + math.random(7, 44) / 10;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush.Pitch = 1 + math.random(-100, 100) / 500;
					v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, math.random(0, 10) / 255);
					v1.Jumpscare_Rush.ImageLabel.Position = UDim2.new(0.5, math.random(-2, 2), 0.5, math.random(-2, 2));
					v67 = v67 + 0.05;
					v1.Jumpscare_Rush.ImageLabel.Size = UDim2.new(v67, 0, v67, 0);
				end;
				if v64 + v66 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabel.Visible = true;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush:Stop();
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Rush2:Play();
			v1.Jumpscare_Rush.ImageLabel.Visible = false;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = true;
v1.Jumpscare_Rush.ImageLabelBig.Image = "rbxassetid://11287256498"
			v1.Jumpscare_Rush.ImageLabelBig:TweenSize(UDim2.new(2.5, 0, 2.5, 0), "In", "Sine", 0.3, true);
			local v69 = tick();
			for v70 = 1, 1000 do
				local v71 = math.random(0, 10) / 10;
				v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(math.clamp(math.random(25, 50) / 50, v71, 1), v71, v71);
				v1.Jumpscare_Rush.ImageLabelBig.Position = UDim2.new(0.5 + math.random(-100, 100) / 5000, 0, 0.5 + math.random(-100, 100) / 3000, 0);
				task.wait(0.016666666666666666);
				if v69 + 0.3 <= tick() then
					break;
				end;
			end;
			v1.Jumpscare_Rush.ImageLabelBig.Visible = false;
			v1.Jumpscare_Rush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Rush.Visible = false;
			u2.deathtick = tick();
		end
local Randomizer = math.random(1,3)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"You died to A-60...","Pay attention to any cues that might hint at its arrival."}, "Rush")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to A-60 again...","Pay attention to the lights. They are related to its arrival."}, "Rush")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"It seems you are having trouble with A-60...","The lights will always flicker when it is near.","Whenever this happens, find a hiding spot!"}, "Rush")
end
Jumpscare()
	end,
Trollface = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.SoundId = "rbxassetid://8389041427";
			v1.Jumpscare_Ambush.Visible = true;
v1.Jumpscare_Ambush.ImageLabel.Image = "rbxassetid://6732849355";
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2.SoundId = "rbxassetid://9125713501";
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(math.clamp(math.random(100, 250) / 50, v79, 1), math.clamp(math.random(100, 250) / 50, v79, 1), math.clamp(math.random(100, 250) / 50, v79, 1));
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			u2.deathtick = tick();
			return;
		end
local Randomizer = math.random(1, 3)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"Uhh...","What just happened?","Okay... That was strange."}, "TrollFace")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to someone who you call Trollface...","It gets you when you least suspect it!","It has a unique music. Once you hear it, be prepared!"}, "TrollFace")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"You died to Trollface.","You might need to hop in and out of your hiding spot a couple times."}, "TrollFace")
end
Jumpscare()
	end,
Matcher = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.SoundId = "rbxassetid://4860560167";
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
			v1.Jumpscare_Ambush.Visible = true;
v1.Jumpscare_Ambush.ImageLabel.Image = "rbxassetid://10914798333";
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2.SoundId = "rbxassetid://5567523008";
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(math.clamp(math.random(150, 255) / 50, v79, 1), v79, v79);
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			u2.deathtick = tick();
			return;
		end
local Randomizer = math.random(1, 3)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"You died to who you call Matcher...","He comes from another universe called Endless Doors!","Use what you have learned from Rush!"}, "Matcher")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to Matcher again...","Pay attention to the lights. They are related to its arrival!","It has a unique scream. Once you hear it, be prepared!"}, "Matcher")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"It seems you are having trouble with Matcher.","The lights will always flicker and Matcher will scream when hes near.","Whenever this happens, quickly hide!"}, "Matcher")
end
Jumpscare()
	end,
ReboundSG = function()
		local function Jumpscare()
			u2.deathtick = tick() + 10;
			game.SoundService.Main.Volume = 0;
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.SoundId = "rbxassetid://9114573657";
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.TimePosition = 2;
v1.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Volume = 3;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Play();
			v1.Jumpscare_Ambush.Visible = true;
v1.Jumpscare_Ambush.ImageLabel.Image = "rbxassetid://10914800940";
			local v72 = tick();
			local v73 = math.random(5, 30) / 100;
			local v74 = v73 + math.random(10, 60) / 100;
			local v75 = 0.2;
			for v76 = 1, 100000 do
				task.wait(0.016666666666666666);
				v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-15, 15), 0.5, math.random(-15, 15));
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
				if v72 + v73 <= tick() then
					v1.Jumpscare_Ambush.ImageLabel.Visible = true;
					v73 = v73 + math.random(7, 44) / 100;
					game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush.Pitch = math.random(35, 155) / 100;
					v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, math.random(4, 10) / 255, math.random(0, 3) / 255);
					v1.Jumpscare_Ambush.ImageLabel.Position = UDim2.new(0.5, math.random(-25, 25), 0.5, math.random(-25, 25));
					v75 = v75 + 0.05;
					v1.Jumpscare_Ambush.ImageLabel.Size = UDim2.new(v75, 0, v75, 0);
				end;
				if v72 + v74 <= tick() then
					break;
				end;
			end;
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2.SoundId = "rbxassetid://5567523008";
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush2:Play();
			v1.Jumpscare_Ambush.ImageLabel.Visible = true;
			v1.Jumpscare_Ambush.ImageLabel:TweenSize(UDim2.new(9, 0, 9, 0), "In", "Quart", 0.3, true);
			local v77 = tick();
			for v78 = 1, 100 do
				local v79 = math.random(0, 10) / 10;
				v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(v79, math.clamp(math.random(250, 255) / 50, v79, 1), math.clamp(math.random(250, 255) / 150, v79, 1));
				game["Run Service"].RenderStepped:wait();
				if v77 + 0.3 <= tick() then
					break;
				end;
			end;
			game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscare_Ambush:Stop();
			v1.Jumpscare_Ambush.ImageLabel.Visible = false;
			v1.Jumpscare_Ambush.BackgroundColor3 = Color3.new(0, 0, 0);
			v1.Jumpscare_Ambush.Visible = false;
			u2.deathtick = tick();
			return;
		end
local Randomizer = math.random(1, 3)
if Randomizer == 1 then
		SpawnerLibrary.Prepare({"You died to who you call Rebound...","It is a tricky one.","He might stay at the room hes in and go backwards or he might appear in the next room."}, "Rebound")
elseif Randomizer == 2 then
SpawnerLibrary.Prepare({"You died to Rebound again...","It gets you when you least suspect it!","It has a unique scream. Once you hear it, be prepared!"}, "Rebound")
elseif Randomizer == 3 then
SpawnerLibrary.Prepare({"You died to Rebound.","You might need to hop in and out of your hiding spot a couple times.","When Rebound stops screaming that means he disappeared!"}, "Rebound")
end
Jumpscare()
	end,
}

local function Event(Module, ...)
	return firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, Module, unpack({...})) 
end

local Spawner = {}
local Entities = {
	Seek = {
		Func = function(Args)
			local Kill = Args.Kill and Args.Kill or false
			local Rooms = Args.Rooms and tonumber(Args.Rooms) or 15
			
			local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

			workspace.Ambience_Seek.TimePosition = 0
			workspace["Ambience_Seek"]:Play()

			local firgur = game:GetObjects("rbxassetid://12821898703")[1]

			firgur:FindFirstChild("Note from MrFunny (READ!)"):Destroy()

			firgur.Figure.Anchored = true
			firgur.Parent = workspace

			local val = Instance.new("CFrameValue")

			val.Changed:Connect(function()
				firgur.SeekRig:PivotTo(val.Value)
			end)

			local early, latest = SpawnerLibrary.Calculate()

			val.Value = early.PrimaryPart.CFrame + Vector3.new(0,5,0)

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://10954733643"

			firgur.SeekRig.AnimationController:LoadAnimation(anim):Play()

			local orig = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0

			require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Cutscenes.SeekIntro)(u2)
			
			firgur.Figure.Footsteps:Play()
			firgur.Figure.FootstepsFar:Play()

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://10729087054"

			firgur.SeekRig.AnimationController:LoadAnimation(anim):Play()

			local chase = true

			coroutine.wrap(function()
				while task.wait() do
					if chase then
						game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost",5)
						game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoostExtra",5)
						if math.random(1,100) == 95 then
							firgur.Figure.Scream:Play()
						end
					end
				end
			end)()

			if Kill then
				-- Not coded in yet
			end

			for i = 1,15 do
				for i,v in ipairs(workspace.CurrentRooms:GetChildren()) do
					if tonumber(v.Name) < tonumber(early.Name) then continue end
					if v:GetAttribute("lol") then continue end
					if v:FindFirstChild("PathfindNodes") then
						v:SetAttribute("lol", true)
						require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, v, 14, 1665596753, true)
						for i,v in ipairs(v.PathfindNodes:GetChildren()) do
							SpawnerLibrary.Tween(val, v, 25, CFrame.new(0,5,0))
						end
					end
				end
			end

			chase = false
			task.wait()

			firgur:Destroy()

			game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost",0)
			game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoostExtra",0)
			workspace.Ambience_Seek.TimePosition = 92.5

			task.wait(4)
			u2.hideplayers = 0
		end,
	},
	Rush = {
		Func = function(Args)
			local RushSpeed = (Args.Speed and Args.Speed) or 60
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 5
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .75)

			local Rush = Instance.new("Model")
			Rush.Name = "RushMoving"
Rush:SetAttribute("IsCustomEntity", true)
Rush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = game.ReplicatedStorage.JumpscareModels.RushNew:Clone()
			RushNew.Parent = Rush

			Rush.Parent = workspace
			Rush.PrimaryPart = RushNew
RushNew.PlaySound.SoundId = "rbxassetid://12122196180"
RushNew.Footsteps.SoundId = RushNew.PlaySound.SoundId
			for i,v in pairs(Rush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main

					if v.Name == "Footsteps" or v.Name == "PlaySound" then
						v:Play()
					end
				elseif v:IsA("ParticleEmitter") then
					if v.Name == "ParticleEmitter" or v.Name == "BlackTrail" then
						v.Enabled = true
					end
				end
			end

			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Rush:PivotTo(Earliest.PrimaryPart.CFrame)
Rush.RushNew.PlaySound.DistortionSoundEffect.Enabled = true
Rush.RushNew.PlaySound.DistortionSoundEffect.Priority = 1
			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .2, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Rush", 50)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
				local IsPossible = true
				local Last = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) - 1)
				
				if Last then
					if Last:FindFirstChild("PathfindNodes") then
						if Last:GetAttribute("Done") == true then
							IsPossible = false
						end
					end
				end
				
				if Room:GetAttribute("Possible") == false then
					IsPossible = false
				end
				
				-- Next room operations
				local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

				if Next then
					if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
						if Room:FindFirstChild("Door") and Room:FindFirstChild("PathfindNodes") then
							if Room.Door.Door.Anchored then
								Next:SetAttribute("Possible", false)
							end
						end
					end
				end
				
				if Room:FindFirstChild("PathfindNodes") and IsPossible then
					Event("breakLights", Room, 0.416, 60)
					for i,v in pairs(Room.PathfindNodes:GetChildren()) do
						SpawnerLibrary.Tween2(RushNew, v, RushSpeed, CFrame.new(0,4,0))
					end
					SpawnerLibrary.Tween2(RushNew, Room.RoomExit, RushSpeed)
				end
			end

			CanKill = false
			
			local Current = workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
			
			if Current:FindFirstChild("Door") then
				Current.Door.ClientOpen:FireServer()
			end
			
			Rushing = false

			RushNew.CanCollide = false
			RushNew.Anchored = false
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
task.wait(10)
Rush:Destroy()
		end,
	},
	Ambush = {
		Func = function(Args)
			local AmbushSpeed = (Args.Speed and Args.Speed) or 160
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 3
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .75)
			
			task.wait(math.random(1,3))
			workspace["Ambience_Ambush"]:Play()
			
			local Ambush = Instance.new("Model")
			Ambush.Name = "AmbushMoving"
Ambush:SetAttribute("IsCustomEntity", true)
Ambush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = Create(loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Ambush.lua"))(), nil)
			RushNew.Parent = Ambush

			Ambush.Parent = workspace
			Ambush.PrimaryPart = RushNew

			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Ambush:PivotTo(Earliest.PrimaryPart.CFrame)
			
			for i,v in pairs(Ambush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main
				end
			end

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .5, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Ambush", 150)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for i = 1,math.random(2,4) do
				local Nodes = {}
				for _,Room in pairs(workspace.CurrentRooms:GetChildren()) do
					local IsPossible = true
					
					if Room:GetAttribute("Possible") == false then
						IsPossible = false
					end
					
					-- Next room operations
					local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

					if Next then
						if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
							if Room:FindFirstChild("Door") and Room:FindFirstChild("PathfindNodes") then
								if Room.Door.Door.Anchored then
									Next:SetAttribute("Possible", false)
								end
							end
						end
					end

					if Room:FindFirstChild("PathfindNodes") and IsPossible then
						Event("breakLights", Room, 0.416, 60)
						for i,v in pairs(Room.PathfindNodes:GetChildren()) do
							table.insert(Nodes,v)
							SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
						end
						SpawnerLibrary.Tween2(RushNew, Room.RoomExit, AmbushSpeed)
					end
				end
				
				for i,v in ipairs(Nodes) do
					SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
				end
				
				task.wait(math.random(1,3))
			end

			CanKill = false
			Rushing = false

			Ambush:Destroy()
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
		end,
	},
A60 = {
		Func = function(Args)
			local AmbushSpeed = (Args.Speed and Args.Speed) or 200
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 3
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1.5)
			
			task.wait(math.random(1,3))
workspace.Ambience_Ambush.Pitch = 0.8
			workspace["Ambience_Ambush"]:Play()
			
			local Ambush = Instance.new("Model")
			Ambush.Name = "A60Moving"
Ambush:SetAttribute("IsCustomEntity", true)
Ambush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = Create(loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Ambush.lua"))(), nil)
			RushNew.Parent = Ambush

			Ambush.Parent = workspace
			Ambush.PrimaryPart = RushNew
RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://11287256498"
RushNew.Attachment.ParticleEmitter.Color = ColorSequence.new(Color3.new(255, 0, 0))
RushNew.PlaySound:ClearAllChildren()
RushNew.Footsteps:ClearAllChildren()
RushNew.PlaySound.SoundId = "rbxassetid://4903742660"
RushNew.Footsteps.SoundId = "rbxassetid://4903742660"
RushNew.PlaySound.Pitch = 1
RushNew.PlaySound.Volume=3
RushNew.PlaySound:Play()
RushNew.Footsteps.Pitch = 0
local distort = Instance.new("DistortionSoundEffect", RushNew.PlaySound)
local echo = Instance.new("ReverbSoundEffect", RushNew.PlaySound)
distort.Level = 0.75
echo.DecayTime = 1.5
echo.Density = 1
echo.Diffusion = 1
echo.DryLevel = -80
distort.Enabled=true
echo.Enabled=true
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
local light1 = Instance.new("PointLight",RushNew.Attachment)
light1.Name="Main"
light1.Brightness=12212121
light1.Enabled=true
light1.Color = Color3.new(255, 0, 0)
light1.Range=6
			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Ambush:PivotTo(Earliest.PrimaryPart.CFrame)
			
			for i,v in pairs(Ambush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main
				end
			end

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .5, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "A60", 200)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for i = 1,math.random(4,6) do
				local Nodes = {}
				for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
					local IsPossible = true
					
					if Room:GetAttribute("Possible") == false then
						IsPossible = false
					end
					
					-- Next room operations
					local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

					if Next then
						if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
							if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
								if Room.Door.Door.Anchored then
									Next:SetAttribute("Possible", false)
								end
							end
						end
					end

					if Room:FindFirstChild("Nodes") and IsPossible then
						Event("breakLights", Room, 0.416, 60)
						for i,v in pairs(Room.Nodes:GetChildren()) do
							table.insert(Nodes, 1, v)
							SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
						end
						SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, AmbushSpeed)
					end
				end
				
				for i,v in ipairs(Nodes) do
					SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
				end
	
				task.wait(math.random(1,3))
			end

			CanKill = false
			Rushing = false

			Ambush:Destroy()
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
workspace.Ambience_Ambush.Pitch = 1
		end,
	},
Trollface = {
		Func = function(Args)
			local AmbushSpeed = (Args.Speed and Args.Speed) or 300
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 3
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 2)
			
			task.wait(math.random(1,3))
workspace.Ambience_Ambush.Pitch=1.3
			workspace["Ambience_Ambush"]:Play()
			
			local Ambush = Instance.new("Model")
			Ambush.Name = "TrollFace"
Ambush:SetAttribute("IsCustomEntity", true)
Ambush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = Create(loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Ambush.lua"))(), nil)
			RushNew.Parent = Ambush

			Ambush.Parent = workspace
			Ambush.PrimaryPart = RushNew
RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://5962561107"
RushNew.Attachment.ParticleEmitter.Color = ColorSequence.new(Color3.new(255, 255, 255))
RushNew.PlaySound.Volume = 1.5
RushNew.Footsteps.Volume = 1.5
RushNew.PlaySound.SoundId = "rbxassetid://8389041427"
RushNew.Footsteps.SoundId = "rbxassetid://8389041427"
RushNew.PlaySound:ClearAllChildren()
RushNew.Footsteps:ClearAllChildren()
RushNew.PlaySound.Pitch = 1
RushNew.Footsteps.Pitch = 1
local Effect1 = Instance.new("EqualizerSoundEffect", RushNew.PlaySound)
local Effect2 = Instance.new("EqualizerSoundEffect", RushNew.PlaySound)
Effect1.HighGain = -80
Effect1.LowGain = 10
Effect1.MidGain = -80
Effect2.HighGain = -80
Effect2.LowGain = 10
Effect2.MidGain = -80
Effect1.Enabled = true
Effect2.Enabled = true
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
local light1 = Instance.new("PointLight",RushNew.Attachment)
light1.Name="Main"
light1.Brightness=12212121
light1.Enabled=true
light1.Color = Color3.new(255, 255, 255)
light1.Range=6
			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Ambush:PivotTo(Earliest.PrimaryPart.CFrame)
			
			for i,v in pairs(Ambush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main
				end
			end

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .5, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Trollface", 200)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for i = 1,math.random(5,10) do
				local Nodes = {}
				for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
					local IsPossible = true
					
					if Room:GetAttribute("Possible") == false then
						IsPossible = false
					end
					
					-- Next room operations
					local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

					if Next then
						if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
							if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
								if Room.Door.Door.Anchored then
									Next:SetAttribute("Possible", false)
								end
							end
						end
					end

					if Room:FindFirstChild("Nodes") and IsPossible then
						Event("breakLights", Room, 0.416, 60)
						for i,v in pairs(Room.Nodes:GetChildren()) do
							table.insert(Nodes, 1, v)
							SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
						end
						SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, AmbushSpeed)
					end
				end
				
				for i,v in ipairs(Nodes) do
					SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
				end
				
				task.wait(math.random(1,3))
			end

			CanKill = false
			Rushing = false

			Ambush:Destroy()
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
workspace.Ambience_Ambush.Pitch = 1
		end,
	},
Matcher = {
		Func = function(Args)
			local RushSpeed = (Args.Speed and Args.Speed) or 100
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 5
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .85)

			local Rush = Instance.new("Model")
			Rush.Name = "Matcher"
Rush:SetAttribute("IsCustomEntity", true)
Rush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = game.ReplicatedStorage.JumpscareModels.RushNew:Clone()
			RushNew.Parent = Rush
RushNew.Attachment.BlackTrail.Enabled=false
RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://10914798333"
RushNew.Attachment.ParticleEmitter.Color = ColorSequence.new(Color3.new(255, 255, 255))
RushNew.PlaySound:ClearAllChildren()
RushNew.Footsteps:ClearAllChildren()
RushNew.PlaySound.Pitch = 0.96
RushNew.Footsteps.Pitch = 0
RushNew.PlaySound.SoundId = "rbxassetid://4860560167"
RushNew.PlaySound.Volume = 0.5
local Distort = Instance.new("DistortionSoundEffect", RushNew.PlaySound)
Distort.Level = 0.89
local Echo = Instance.new("EchoSoundEffect", RushNew.PlaySound)
Echo.Delay = 1
Echo.Feedback = 0.5
local Equalizer = Instance.new("EqualizerSoundEffect", RushNew.PlaySound)
Equalizer.HighGain = 10
Equalizer.MidGain = 10
Equalizer.LowGain = 10
local Flange = Instance.new("FlangeSoundEffect", RushNew.PlaySound)
Flange.Depth = 0.06
Flange.Mix = 0.85
Flange.Rate = 5
local Reverb = Instance.new("ReverbSoundEffect", RushNew.PlaySound)
Reverb.DecayTime = 1.5
Reverb.Density = 1
Reverb.Diffusion = 1
Reverb.DryLevel = -6
local light1 = Instance.new("PointLight",RushNew.Attachment)
light1.Name="Main"
light1.Brightness=10
light1.Enabled=true
light1.Color = Color3.new(255, 0, 0)
light1.Range=6

			Rush.Parent = workspace
			Rush.PrimaryPart = RushNew

			for i,v in pairs(Rush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main

					if v.Name == "Footsteps" or v.Name == "PlaySound" then
						v:Play()
					end
				elseif v:IsA("ParticleEmitter") then
					if v.Name == "ParticleEmitter" then
						v.Enabled = true
					end
				end
			end

			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Rush:PivotTo(Earliest.PrimaryPart.CFrame)
			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .2, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "Matcher", 100)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()

			for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
				local IsPossible = true
				local Last = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) - 1)
				
				if Last then
					if Last:FindFirstChild("Nodes") then
						if Last:GetAttribute("Done") == true then
							IsPossible = false
						end
					end
				end
				
				if Room:GetAttribute("Possible") == false then
					IsPossible = false
				end
				
				-- Next room operations
				local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

				if Next then
					if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
						if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
							if Room.Door.Door.Anchored then
								Next:SetAttribute("Possible", false)
							end
						end
					end
				end
				
				if Room:FindFirstChild("Nodes") and IsPossible then
					Event("breakLights", Room, 0.416, 60)
					for i,v in pairs(Room.Nodes:GetChildren()) do
						SpawnerLibrary.Tween2(RushNew, v, RushSpeed, CFrame.new(0,4,0))
					end
					SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, RushSpeed)
				end
			end

			CanKill = false
			
			local Current = workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
			
			if Current:FindFirstChild("Door") then
				Current.Door.ClientOpen:FireServer()
			end
			
			Rushing = false

			RushNew.CanCollide = false
			RushNew.Anchored = false
			
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
task.wait(10)
Rush:Destroy()
		end,
	},
Rebound = {
		Func = function(Args)
			local AmbushSpeed = (Args.Speed and Args.Speed) or 250
			local CanKill = (Args.Kill and Args.Kill) or false
			local WaitTime = (Args.Time and Args.Time) or 3
local Cue = Instance.new("Sound", workspace)
local Cue2 = Instance.new("Sound",workspace)
Cue.Name = "Rebound_Cue"
Cue2.Name = "Rebound_Cue2"
Cue.Volume = 3
Cue2.Volume = 0.3
Cue.SoundId = "rbxassetid://9114221327"
Cue2.SoundId = "rbxassetid://9114397505"
local Dis1 = Instance.new("DistortionSoundEffect",Cue2)
local Dis2 = Instance.new("DistortionSoundEffect",Cue2)
local Pitch1 = Instance.new("PitchShiftSoundEffect",Cue2)
local Pitch2 = Instance.new("PitchShiftSoundEffect",Cue2)
local Pitch3 = Instance.new("PitchShiftSoundEffect",Cue2)
Dis1.Level = 1
Dis2.Level = 1
Pitch1.Octave = 0.5
Pitch2.Octave = 0.5
Pitch3.Octave = 0.5
			
			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1.5)
			
			task.wait(math.random(1,3))
			Cue:Play()
Cue2:Play()
			
			local Ambush = Instance.new("Model")
			Ambush.Name = "Rebound"
Ambush:SetAttribute("IsCustomEntity", true)
Ambush:SetAttribute("ClonedByCrucifix", false)

			local RushNew = Create(loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Ambush.lua"))(), nil)
			RushNew.Parent = Ambush

			Ambush.Parent = workspace
			Ambush.PrimaryPart = RushNew
RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://10914800940"
RushNew.Attachment.ParticleEmitter.Color = ColorSequence.new(Color3.new(255, 255, 255))
RushNew.PlaySound.Pitch = 0.25
RushNew.Footsteps.Pitch = 0.3
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
RushNew.Attachment.PointLight:Destroy()
task.wait(1)
local light1 = Instance.new("PointLight",RushNew.Attachment)
light1.Name="Main"
light1.Brightness=10
light1.Enabled=true
light1.Color = Color3.new(0, 255, 255)
light1.Range=23
local light2 = Instance.new("PointLight",RushNew.Attachment)
light2.Name="BlueEffect"
light2.Brightness=40
light2.Enabled=true
light2.Color = Color3.new(72, 0, 255)
light2.Range=12


			local Earliest, Latest = SpawnerLibrary.Calculate2()
			Ambush:PivotTo(Earliest.PrimaryPart.CFrame)
			
			for i,v in pairs(Ambush:GetDescendants()) do
				if v:IsA("Sound") then
					v.SoundGroup = game.SoundService.Main
				end
			end

			task.wait(WaitTime)

			local Rushing = true
			local con
			con = workspace.CurrentRooms.ChildAdded:Connect(function()
				for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
					v:SetAttribute("Possible", true)
				end
			end)

			coroutine.wrap(function()
				while Rushing do
					firesignal(game.ReplicatedStorage.Bricks.CamShakeRelative.OnClientEvent, RushNew.Position, 2, 15, 0.1, .5, Vector3.new(0,0,0))
					if CanKill then
						for i,v in pairs(game.Players:GetPlayers()) do
							SpawnerLibrary.Raycast(v, RushNew, "ReboundSG", 180)
						end
					end
					task.wait()
				end
			end)()

			local Earliest, Latest = SpawnerLibrary.Calculate2()
for i = 1,math.random(15,20) do
				local Nodes = {}
				for _,Room in ipairs(workspace.CurrentRooms:GetChildren()) do
					local IsPossible = true
					
					if Room:GetAttribute("Possible") == false then
						IsPossible = false
					end
					
					-- Next room operations
					local Next = workspace.CurrentRooms:FindFirstChild(tonumber(Room.Name) + 1)

					if Next then
						if tonumber(Room.Name) == tonumber(game.ReplicatedStorage.GameData.LatestRoom.Value) then
							if Room:FindFirstChild("Door") and Room:FindFirstChild("Nodes") then
								if Room.Door.Door.Anchored then
									Next:SetAttribute("Possible", false)
								end
							end
						end
					end

					if Room:FindFirstChild("Nodes") and IsPossible then
						Event("breakLights", Room, 0.416, 60)
						for i,v in pairs(Room.Nodes:GetChildren()) do
							table.insert(Nodes, 1, v)
							SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
						end
						SpawnerLibrary.Tween2(RushNew, Room.RoomEnd, AmbushSpeed)
					end
				end
				
				for i,v in ipairs(Nodes) do
					SpawnerLibrary.Tween2(RushNew, v, AmbushSpeed, CFrame.new(0,4,0))
				end

task.wait(math.random(1,3))
			end

			CanKill = false
			Rushing = false
			Ambush:Destroy()
Cue:Destroy()
Cue2:Destroy()
			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				v:SetAttribute("Possible", true)
			end
			
			con:Disconnect()
		end,
	},
	Screech = {
		Func = function()
			require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(u2)
		end,
	},
	Glitch = {
		Func = function()
			require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(u2, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
		end,
	},
	Halt = {
		Func = function()
			require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(u2, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
		end,
	},
	Jack = {
		Func = function()
			local Room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
			
			Event("tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 10) 

			local Jack = Instance.new("Part", workspace)
			Jack.Name = "MobbleHallway"

			Jack.CFrame = Room.RoomStart.CFrame * CFrame.new(Vector3.new(0,0,-5))
			Jack.Orientation = Jack.Orientation + Vector3.new(0,180,0)
			Jack.Anchored = true
			Jack.CanCollide = false
			Jack.Transparency = 1

			Event("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, .6) 

			local Beam = Instance.new("Beam", Jack)
			Beam.Brightness = 1.295
			Beam.LightInfluence = 0
			Beam.Texture = "rbxassetid://8829534246"

			local Attachment1 = Instance.new("Attachment", Jack)
			local Attachment2 = Instance.new("Attachment", Jack)

			Attachment1.Orientation = Vector3.new(0, -180, -90)
			Attachment1.Position = Vector3.new(-0.049, 2.36, 0)

			Attachment2.Orientation = Vector3.new(0, -180, -90)
			Attachment2.Position = Vector3.new(-0.049, -1.211, 0)

			Beam.Attachment0 = Attachment1
			Beam.Attachment1 = Attachment2
			Beam.TextureLength = 1
			Beam.TextureMode = Enum.TextureMode.Stretch
			Beam.Transparency = NumberSequence.new(0)
			Beam.TextureSpeed = 0

			Beam.FaceCamera = true
			Beam.Width0 = 3
			Beam.Width1 = 3

			local Sound = Instance.new("Sound", Jack)
			Sound.SoundId = "rbxassetid://9145204231"

			Sound.PlaybackSpeed = 5
			Sound.Volume = 0.6

			Sound.RollOffMaxDistance = 150
			Sound.RollOffMinDistance = 25

			local Distortion = Instance.new("DistortionSoundEffect", Sound)
			local Echo = Instance.new("EchoSoundEffect", Sound)
			local Equalizer = Instance.new("EqualizerSoundEffect", Sound)

			Distortion.Level = 1
			Echo.Delay = 0.1

			Equalizer.MidGain = 0
			Equalizer.LowGain = -13.4
			Equalizer.HighGain = -1.7

			Sound:Play()
			task.wait(.3)
			Jack:Destroy()
		end,
	},
	Eyes = {
		Func = function(Args)
			local Damage = Args.Damage or 10
			local Room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local EyesModel = Instance.new("Model", workspace)
EyesModel.Name = "Lookman"
			local Eyes = Instance.new("Part", EyesModel)
			Eyes.Transparency = 1
EyesModel.PrimaryPart = Eyes
			local Sound = Instance.new("Sound", Eyes)
Sound.Name = "Initiate"

			local Attachment = Instance.new("Attachment", Eyes)

			local Spark = Instance.new("ParticleEmitter", Attachment)
Spark.Name = "Spark"
			Spark.Texture = "rbxassetid://2581223252"
			Spark.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 11, 39)),
				ColorSequenceKeypoint.new(0.324, Color3.fromRGB(32, 14, 22)),
				ColorSequenceKeypoint.new(0.441, Color3.fromRGB(20, 30, 14)),
				ColorSequenceKeypoint.new(0.527, Color3.fromRGB(14, 18, 27)),
				ColorSequenceKeypoint.new(0.675, Color3.fromRGB(15, 14, 27)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 8, 26))
			}
			Spark.Size = NumberSequence.new(8)
			Spark.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .975),
				NumberSequenceKeypoint.new(0.247, 0),
				NumberSequenceKeypoint.new(0.498, .0125),
				NumberSequenceKeypoint.new(0.786, .0375),
				NumberSequenceKeypoint.new(1, 1),
			}

			Spark.Drag = 15
			Spark.LockedToPart = true
			Spark.VelocityInheritance = 0.5

			Spark.Lifetime = NumberRange.new(0.5, 2)
			Spark.Rate = 25
			Spark.Rotation = NumberRange.new(-50, 50)
			Spark.RotSpeed = NumberRange.new(-5, -5)
			Spark.Speed = NumberRange.new(1, 3)
			Spark.SpreadAngle = Vector2.new(180, 180)

			Spark.Enabled = true

			local EyesParticle = Instance.new("ParticleEmitter", Attachment)
EyesParticle.Name = "Eyes"
			EyesParticle.LightInfluence = 0
			EyesParticle.Brightness = 1.26
			EyesParticle.Size = NumberSequence.new(4)
			EyesParticle.Texture = "rbxassetid://10183704772"
			EyesParticle.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
				ColorSequenceKeypoint.new(0.46, Color3.fromRGB(255,255,255)),
				ColorSequenceKeypoint.new(0.509, Color3.fromRGB(129,97,255)),
				ColorSequenceKeypoint.new(0.612, Color3.fromRGB(17, 0, 255)),
				ColorSequenceKeypoint.new(0.649, Color3.fromRGB(255, 58, 163)),
				ColorSequenceKeypoint.new(0.848, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
			}
			EyesParticle.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .975),
				NumberSequenceKeypoint.new(0.247, 0),
				NumberSequenceKeypoint.new(0.498, .0125),
				NumberSequenceKeypoint.new(0.786, .0375),
				NumberSequenceKeypoint.new(1, 1),
			}

			EyesParticle.Lifetime = NumberRange.new(0.2, .5)
			EyesParticle.Rate = 25
			EyesParticle.Rotation = NumberRange.new(-1, 1)
			EyesParticle.RotSpeed = NumberRange.new(-1, 1)
			EyesParticle.Speed = NumberRange.new(0,0)

			EyesParticle.Drag = 1
			EyesParticle.LockedToPart = true
			EyesParticle.VelocityInheritance = 0.5
			EyesParticle.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, .994),
				NumberSequenceKeypoint.new(0.496, .637),
				NumberSequenceKeypoint.new(1, 1),
			}
local Angry = Spark:Clone()
Angry.Name = "Angry"
Angry.Lifetime = NumberRange.new(0.2, 0.4)
Angry.Speed = NumberRange.new(5, 7)
Angry.Rate = 2332
Angry.Rotation = NumberRange.new(-360, 360)
Angry.Size = NumberSequence.new(0, 7.375)
Angry.Transparency = NumberSequence.new(0.468427, 0.31875)
Angry.Enabled = false
Angry.Parent = Attachment

			Sound.SoundId = "rbxassetid://1168009240"
			Sound.PlaybackSpeed = 0.3
			Sound:Play()

			local flange = Instance.new("FlangeSoundEffect", Sound)
			flange.Depth = 0.475
			flange.Mix = 0.97
			flange.Rate = 2

			local Sound2 = Instance.new("Sound", Eyes)
			Sound2.SoundId = "rbxassetid://1228230799"
Sound2.Name = "Ambience"
			Sound2.PlaybackSpeed = 1
			Sound2.Looped = true
			Sound2:Play()

			local Sound3 = Instance.new("Sound", Eyes)
			Sound3.SoundId = "rbxassetid://9126213993"
Sound3.Name = "Attack"
			Sound3.PlaybackSpeed = 1.05
local Sound4 = Instance.new("Sound", Eyes)
Sound4.Name = "Repent"
Sound4.SoundId = "rbxassetid://6305809364"
Sound4.Pitch=1.1
Sound4.Volume = 0.8
local Sound5 = Instance.new("Sound", Eyes)
Sound5.Name = "Scream"
Sound5.SoundId = "rbxassetid://6305809364"
Sound5.Pitch = 0.27
Sound5.Volume = 0.8
			Eyes.Name = "Core"

			Eyes.Anchored = true
			Eyes.CanCollide = false
			Eyes.Size = Vector3.new(2.5,2.5,2.5)
			Eyes.Position = Room.Base.Position + Vector3.new(0,8,0)


			local Light1 = Instance.new("PointLight", Eyes)

			Light1.Brightness = 2
			Light1.Color = Color3.fromRGB(21,0,107)
			Light1.Enabled = true
			Light1.Range = 60
			Light1.Shadows = true

			local Light2 = Instance.new("PointLight", Eyes)

			Light2.Brightness = 2
			Light2.Color = Color3.fromRGB(51, 0, 255)
			Light2.Enabled = true
			Light2.Range = 25
			Light2.Shadows = false

			coroutine.wrap(function()
				task.wait(1)
				while Spark.Enabled do
					local Camera = workspace.Camera
					local Character = game:GetService('Players').LocalPlayer.Character

					local RunService = game:GetService('RunService')

					local Parameters = RaycastParams.new()
					Parameters.FilterDescendantsInstances = {Character, Eyes}
					Parameters.FilterType = Enum.RaycastFilterType.Blacklist

					local Vector, OnScreen = Camera:WorldToViewportPoint(Eyes.Position)

					if OnScreen then
						if workspace:Raycast(Camera.CFrame.Position, Eyes.Position - Camera.CFrame.Position, Parameters) == nil then
							game.Players.LocalPlayer.Character.Humanoid.Health -= Damage
						end
					end

					task.wait(.175)
				end
			end)()
			game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
			
			Sound2:Stop()
			
			EyesParticle.Enabled = false
			Spark.Enabled = false
			
			Light1:Destroy()
			Light2:Destroy()
			
			task.wait(5)
			Eyes:Destroy()
		end,
	},
}

function Spawner:Spawn(Entity, Args)
	for Name,List in pairs(Entities) do
		print(Name)
		if Name == Entity then
			List["Func"](Args)
		end
	end
end

return Spawner
