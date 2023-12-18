local main = workspace["crafting station and everything"]
local gears = main["gear givers"]
local orbs = main["orb gear givers"]
local plr = game.Players.LocalPlayer
local char = plr.Character
local function ClaimGear(gearModel)
  local tp = gearModel.TP
  char:PivotTo(tp.CFrame)
  wait(1)
  print("Done.")
end

for orbsi,gearModel in next, orbs:GetChildren() do
  if gearModel:IsA("Model") then
    ClaimGear(gearModel)
  end
end
