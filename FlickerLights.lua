local speed = 60
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
rush:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)

rush.RushNew.Attachment.BlackTrail.Enabled = false
rush.RushNew.PlaySound:Stop()
rush.RushNew.Footsteps:Stop()
require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), 1)
rush:Destroy()
