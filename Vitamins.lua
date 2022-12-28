_G.VitaminsDurability = 100
local Vitamins = LoadCustomInstance("rbxassetid://11685698403")
		local idle = Vitamins.Animations:FindFirstChild("idle")
		local open = Vitamins.Animations:FindFirstChild("open")
		local tweenService = game:GetService("TweenService")
		local sound_open = Vitamins.Handle:FindFirstChild("sound_open")
		local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacteAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		local idleTrack = hum.Animator:LoadAnimation(idle)
		local openTrack = hum.Animator:LoadAnimation(open)
		local Durability = 35
		local InTrans = false
		local Duration = math.random(5, 8)
		local xUsed = tonumber(_G.VitaminsDurability)
		local v1 = {};
		function v1.AddDurability()
			InTrans = true
			hum:SetAttribute("SpeedBoost", 11)
			task.spawn(function()
				repeat
					task.wait(.1)
					hum:SetAttribute("SpeedBoost", hum:GetAttribute"SpeedBoost" - .1)
				until hum:GetAttribute("SpeedBoost") <= 0
			end)
			wait(Duration)
			InTrans = false
		end
function v1.SetupVitamins()
	        Vitamins.Name = "FakeVitamins"
			for slotNum, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if tool.Name == "FakeVitamins" then
					local slot = game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI").MainFrame.Hotbar:FindFirstChild(slotNum)
                    -- while task.wait() do
                    --     slot.DurabilityNumber.Text = "x"..xUsed
                    -- end
                    -- slot.DurabilityNumber.Text = "x"..xUsed
					game:GetService("RunService").RenderStepped:Connect(function()
						slot.DurabilityNumber.Visible = true
						slot.DurabilityNumber.Text = "x" .. xUsed
					end)
					Vitamins.Activated:Connect(function()
						if not InTrans then
							xUsed -= 1
							task.spawn(function()
								slot.DurabilityNumber.Visible = true
								slot.DurabilityNumber.Text = "x" .. xUsed
								openTrack:Play()
								sound_open:Play()
								tweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
									FieldOfView = 100
								}):Play()
								v1.AddDurability()
							end)
							if xUsed == 0 then
								delay(sound_open.TimeLength + .2, function()
									Vitamins:Destroy()
								end)
							end
						end
					end)
				end
			end
			Vitamins.Equipped:Connect(function()
				idleTrack:Play()
			end)
			Vitamins.Unequipped:Connect(function()
				idleTrack:Stop()
			end)
end
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()


-- Create custom shop item
if game.Players.LocalPlayer.PlayerGui.MainUI.ItemShop.Visible then
CustomShop.CreateItem(Vitamins, {
    Title = "Vitamins",
    Desc = "Totally normal vitamins",
    Image = "rbxassetid://10482863785",
    Price = 200,
    Stack = 3,
})
else
v1.SetupVitamins()
Vitamins.Parent = game.Players.LocalPlayer.Backpack
end
		function v1.AddLoop()
			while task.wait() do
				if InTrans then
					wait()
					hum.WalkSpeed = Durability
				else
					hum.WalkSpeed = 16
				end
			end
		end
		while task.wait() do
			v1.AddLoop()
		end
		return v1
