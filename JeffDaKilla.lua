local function GetGitModel(ModelName,ModelUrl)
	local url=ModelUrl
	if not isfile(ModelName..".rbxm") then
		writefile(ModelName..".rbxm",game:HttpGetAsync(url))
	end
	local a = game:GetObjects((getcustomasset or getsynasset)(ModelName..".rbxm"))[1]
	a.Name = ModelName
	return a
end
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
local jeff = GetGitModel("Jeff","https://github.com/Kiprov/Kip-Hub/blob/main/JeffTheKillerModel.rbxm?raw=true")
jeff:SetAttribute("IsCustomEntity",true)
jeff:SetAttribute("ClonedByCrucifix",false)
local latestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local Room = workspace:FindFirstChild("CurrentRooms")[latestRoom.Value]
local ai = Instance.new("Script", jeff)
local died = Instance.new("Script", jeff)
local damage = Instance.new("Script", jeff)
cors = {}
cors2 = {}
cors3 = {}
ai.Enabled = true
ai.Name = "AI"
died.Name = "Died"
died.Enabled = true
damage.Name = "Attack"
damage.Enabled = true
jeff.Parent = workspace
jeff:PivotTo(Room.Door.Door.CFrame * CFrame.new(0,0,-10))
table.insert(cors,sandbox(ai,function()
	--Variables
local Pathfinding = game:GetService("PathfindingService")
local players = game.Players
local RunService = game:GetService("RunService")
local path = Pathfinding:CreatePath({
	AgentHeight = 6;
	AgentRadius = 3;
	AgentCanJump = false;
	Costs = {
		Water = 100;
		DangerZone = math.huge
	}
})
local Character = script.Parent
local humanoid = Character:FindFirstChild("Humanoid")
local waypoints
local nextWaypointIndex
local reachedConnection
local blockedConnection
local function findNearestChild()
	local maxDistance = 500
	local nearestChild
	for i,p in pairs(players:GetChildren()) do
		if p.Character then
			local child = p.Character
			local distance = (p.Character.HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude
			if distance < maxDistance then
				nearestChild = child
				maxDistance = distance
			end
			if distance < 1 then
				nearestChild.Humanoid:TakeDamage(0)
			end
		end
	end
	return nearestChild
end
local function followPath(destination)
	local success, errorMessage = pcall(function()
		path:ComputeAsync(Character.PrimaryPart.Position, destination)
	end)
	if success and path.Status == Enum.PathStatus.Success then
		waypoints = path:GetWaypoints()
		blockedConnection = path.Blocked:Connect(function(blockedWaypointIndex)
			if blockedWaypointIndex >= nextWaypointIndex then
				blockedWaypointIndex:Disconnect()
				followPath(destination)
			end
		end)
		if not reachedConnection then
			reachedConnection = humanoid.MoveToFinished:Connect(function(reached)
				if reached and nextWaypointIndex < #waypoints then
					nextWaypointIndex += 1
					humanoid:MoveTo(waypoints[nextWaypointIndex].Position)
				else
					reachedConnection:Disconnect()
					blockedConnection:Disconnect()
				end
			end)
		end
		nextWaypointIndex = 2
		humanoid:MoveTo(waypoints[nextWaypointIndex].Position)
	else
		--Path is not found
	end
end
while wait(0.1) do
	local child = findNearestChild()
	if child then
		followPath(child.HumanoidRootPart.Position)
	end
end
end))
table.insert(cors2, sandbox(died, function()
	--Variables
local npc = script.Parent --NPC
local hum = npc:FindFirstChild("Humanoid") --Heart of the NPC
--Functions
local function death()
	local Death = Instance.new("Sound", script)
	Death.SoundId = "rbxassetid://6927884261"
	Death.Volume = 1
	Death.Loaded:Wait()
	Death:Play()
	wait(Death.TimeLength)
	Death:Destroy()
end
local function onDeath()
	task.spawn(death)
	wait(2) --Cooldown before deletion
	npc:Destroy()
end
hum.Died:Connect(onDeath)
end))
table.insert(cors3, sandbox(damage, function()
	--Variables
local npc = script.Parent -- The NPC.
local hrp = npc:FindFirstChild("HumanoidRootPart") -- The part that damages you.
local knife = npc:FindFirstChild("Knife") -- The Knife
local handle = knife:FindFirstChild("Handle") -- The Handle
local dmg = 80 -- Number to give damage to player
local db = false -- debounce
--Functions
local function Hit(hit)
	local attack = handle.Attack
	local dealdmg = handle.DeadSound
	local plrdied = handle.DeadPlayer
	if hit.Parent:FindFirstChild("Humanoid") then
		if db then return end
		db = true
		firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You died to someone who you call, Jeff.","To survive him its easy. Just run away from him.","Hiding is pointless."}, "Blue")
		coroutine.wrap(function()
			for i,v in pairs(game.ReplicatedStorage.GameStats:GetDescendants()) do
				if v.Name == "DeathCause" then
					v.Value = npc.Name
				end
			end
	end)()
		hit.Parent:FindFirstChild("Humanoid").Died:Connect(function()
			local death = plrdied:Clone()
			death.Parent = hit.Parent
			death:Play()
		end)
		attack:Play()
		--local str = Instance.new("StringValue")
		--str.Name = "toolanim"
		--str.Value = "Slash"
		--str.Parent = knife
		task.wait(0.5)
		hit.Parent:FindFirstChild("Humanoid"):TakeDamage(dmg)
		dealdmg:Play()
		task.wait(3)
		db = false
	end
end
--Connections
hrp.Touched:Connect(Hit)
end))
for aiindex,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
for diedindex,v in pairs(cors2) do
	spawn(function()
		pcall(v)
	end)
end
for damageindex,v in pairs(cors3) do
	spawn(function()
		pcall(v)
	end)
end
