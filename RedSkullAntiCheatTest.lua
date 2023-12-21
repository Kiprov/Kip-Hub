print("hey ik ur there redskull")
local brightLoop = nil
local Lighting = game.Lighting
local RunService = game:GetService("RunService")
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

--[[workspace.DescendantAdded:Connect(function(part)
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
end)]]--
local espParts = {}
local partEspTrigger = nil
local espTransparency = 0
function partAdded(part)
	if #espParts > 0 then
		if table.find(espParts,part.Name:lower()) then
			game.StarterGui:SetCore("SendNotification", {
                        Title = "Monster Spawned ⚠️",
                        Text = "Hide quick",
                        Duration = 5
                        })
			local a = Instance.new("BoxHandleAdornment")
			a.Name = part.Name:lower().."_PESP"
			a.Parent = part
			a.Adornee = part
			a.AlwaysOnTop = true
			a.ZIndex = 0
			a.Size = part.Size
			a.Transparency = espTransparency
			a.Color = BrickColor.new("Lime green")
		end
	else
		partEspTrigger:Disconnect()
		partEspTrigger = nil
	end
end
local partEspName = "monster"
	if not table.find(espParts,partEspName) then
		table.insert(espParts,partEspName)
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and v.Name:lower() == partEspName then
				local a = Instance.new("BoxHandleAdornment")
				a.Name = partEspName.."_PESP"
				a.Parent = v
				a.Adornee = v
				a.AlwaysOnTop = true
				a.ZIndex = 0
				a.Size = v.Size
				a.Transparency = espTransparency
				a.Color = BrickColor.new("Lime green")
			end
		end
	end
	if partEspTrigger == nil then
		partEspTrigger = workspace.DescendantAdded:Connect(partAdded)
	end
