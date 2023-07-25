local rush = game:GetObjects("rbxassetid://11218170101")[1]
local target = game.Players:FindFirstChild("helpmeiseekhelp") --change this
local part = rush:FindFirstChild("Rush")
part.PlaySound.SoundId = "rbxassetid://8028069841"
part.PlaySound.Pitch = 0.5
part.Footsteps.SoundId = "rbxassetid://2132024717"
part.Footsteps.Pitch = 0.55
rush.Parent = workspace
rush:PivotTo(target.Character.HumanoidRootPart.CFrame:ToWorldSpace(CFrame.new(0,0,-10)))
target.Character.HumanoidRootPart.Anchored = true
local tween = game.TweenService:Create(part, TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out), {CFrame = target.HumanoidRootPart.CFrame})
wait(3/60)
tween:Play()
tween.Completed:Wait()
wait(2)
target.Character:BreakJoints()
wait(3)
rush:Destroy()
