local speed = 100
local rush = Instance.new("Model", game:GetService("Teams"))
rush.Name = "RushMoving"
game:GetService("ReplicatedStorage").JumpscareModels.RushNew:Clone().Parent = rush
rush.RushNew.CanCollide = false
local tweensv = game:GetService("TweenService")
local currentLoadedRoom
local firstLoadedRoom

local function setRooms()
    local tb = {}
    table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
        if r:FindFirstChild("Base") then
            table.insert(tb, tonumber(r.Name))
        end
    end)
    firstLoadedRoom = workspace.CurrentRooms[tostring(math.min(unpack(tb)))]
    currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
    workspace.CurrentRooms.ChildAdded:Connect(function()
        local tb = {}
        table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
            if r:FindFirstChild("Base") then
                table.insert(tb, tonumber(r.Name))
            end
        end)
        currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
    end)
end
setRooms()

rush.Parent = workspace
rush:MoveTo(firstLoadedRoom.Base.Position + Vector3.new(0, 5.2, 0))
require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), 1)
require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(firstLoadedRoom)

rush.RushNew.Attachment.BlackTrail.Enabled = false
rush.RushNew.Attachment.ParticleEmitter.Texture = "rbxassetid://10110576663"
rush.RushNew.Attachment.ParticleEmitter.Size = NumberSequence.new(8)
rush.RushNew.PlaySound:Play()
rush.RushNew.PlaySound:ClearAllChildren()
local Effect1 = Instance.new("DistortionSoundEffect",rush.RushNew.PlaySound)
local Effect2 = Instance.new("EchoSoundEffect",rush.RushNew.PlaySound)
local Effect3 = Instance.new("EqualizerSoundEffect",rush.RushNew.PlaySound)
local Effect4 = Instance.new("FlangeSoundEffect",rush.RushNew.PlaySound)
local Effect5 = Instance.new("TremoloSoundEffect",rush.RushNew.PlaySound)
Effect1.Level=0.99
Effect2.Delay=0.98
Effect2.Priority=1
Effect2.WetLevel = -2.6
Effect3.HighGain=4.6
Effect3.LowGain = -21.5
Effect3.MidGain = -0.8
Effect4.Depth=1
Effect4.Mix=1
Effect4.Rate=0.2
Effect5.Depth=1
Effect5.Duty=0.94
Effect5.Frequency=20
rush.RushNew.PlaySound.SoundId="rbxassetid://8880765497"
rush.RushNew.PlaySound.Pitch=0.5
rush.RushNew.Footsteps:Play()
rush.RushNew.Footsteps:ClearAllChildren()
local Effect1 = Instance.new("DistortionSoundEffect",rush.RushNew.Footsteps)
local Effect2 = Instance.new("EchoSoundEffect",rush.RushNew.Footsteps)
local Effect3 = Instance.new("EqualizerSoundEffect",rush.RushNew.Footsteps)
local Effect4 = Instance.new("FlangeSoundEffect",rush.RushNew.Footsteps)
local Effect5 = Instance.new("TremoloSoundEffect",rush.RushNew.Footsteps)
Effect1.Level=0.99
Effect2.Delay=0.98
Effect2.Priority=1
Effect2.WetLevel = -2.6
Effect3.HighGain=4.6
Effect3.LowGain = -21.5
Effect3.MidGain = -0.8
Effect4.Depth=1
Effect4.Mix=1
Effect4.Rate=0.2
Effect5.Depth=1
Effect5.Duty=0.94
Effect5.Frequency=20
rush.RushNew.Footsteps.SoundId="rbxassetid://8880765497"
rush.RushNew.Footsteps.Pitch=0.55
wait(5)
for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
    if not room:FindFirstChild("Nodes") then
        continue
    end
    local nodeNum = #room.Nodes:GetChildren()
    for _, node: BasePart in pairs(room.Nodes:GetChildren()) do
        local timeC = (math.abs((node.Position - rush.RushNew.Position).Magnitude)) / speed
        tweensv
            :Create(rush.RushNew, TweenInfo.new(timeC, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                CFrame = CFrame.new(node.CFrame.X, node.CFrame.Y + 5.2, node.CFrame.Z),
            })
            :Play()
        local random = math.random(1, nodeNum)
        if tonumber(node.Name) == random then -- first or last node? just choose please
            require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(room)
        end
        task.wait(timeC)
    end
    if room == currentLoadedRoom then
        task.wait(1)
        lap = Instance.new("NumberValue")
        local e = tweensv:Create(rush.RushNew, TweenInfo.new(1),{CFrame = firstLoadedRoom.Base.CFrame})
e:Play()
e.Completed:Wait()
        repeat
lap.Value = lap.Value + 1
local nodeNum = #room.Nodes:GetChildren()
    for _, node: BasePart in pairs(room.Nodes:GetChildren()) do
        local timeC = (math.abs((node.Position - rush.RushNew.Position).Magnitude)) / speed
        tweensv
            :Create(rush.RushNew, TweenInfo.new(timeC, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                CFrame = CFrame.new(node.CFrame.X, node.CFrame.Y + 5.2, node.CFrame.Z),
            })
            :Play()
        local random = math.random(1, nodeNum)
        if tonumber(node.Name) == random then -- first or last node? just choose please
            require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(room)
        end
        task.wait(timeC)
    end
wait(2)
local w = tweensv:Create(rush.RushNew, TweenInfo.new(1),{CFrame = firstLoadedRoom.Base.CFrame})
w:Play()
w.Completed:Wait()
until lap.Value == 6
lap:Destroy()
rush:Destroy()
    end
end
