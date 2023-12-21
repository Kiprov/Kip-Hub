print("hey ik ur there redskull")
local brightLoop = nil
local Lighting = game.Lighting
if brightLoop ~= nil then
		brightLoop:Disconnect()
	end
	local function brightFunc()
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end

	brightLoop = RunService.RenderStepped:Connect(brightFunc)

workspace.DescendantAdded:Connect(function(part)
if part:IsA("BasePart") and part.Name == "monster" then
game.StarterGui:SetCore("SendNotification", {
            Title = "Monster Spawned ⚠️",
            Text = "Hide quick",
            Duration = 5
        })
end
end)
workspace.DescendantRemoved:Connect(function(part)
if part:IsA("BasePart") and part.Name == "monster" then
game.StarterGui:SetCore("SendNotification", {
            Title = "Monster Despawned ✅",
            Text = "ur good",
            Duration = 5
        })
end
end)
