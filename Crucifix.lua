-- Original crucifix was made by Zepsyy
        -- Rewritten by Spongus

		local Configuration = {
            -- IF YOU MODIFY ANY OF THESE VALUES YOU ARE NOT ALLOWED TO PUBLISH/RELEASE THE MODIFIED SCRIPT WITHOUT PERMISSION OF ZEPSYY OR SPONGUS
            -- UNLESS COMPLETE CREDITS ARE GIVEN TO ZEPSYY FOR THE SCRIPTING

            -- Tables are used to switch between versions of the crucifix
			CurrentCrucifix = 1;
			CrucifixName = {
				"Crucifix"
			};
			CrucifixDescription = {
				"The devil's nightmare"
			};
			CrucifixTool = {
				"rbxassetid://11822556646"
			}; -- The tool of the crucifix
CrucifixImage = {"rbxassetid://11414232888"}; -- The Crucifix Tool and shop image
			CrucifixChains = {"rbxassetid://11584227521"}; -- The model of the chains
			CrucifixCracks = {
				Color3.fromRGB(110, 153, 202),
				"Neon"
			}; -- If your crucifix has cracks, set their color and material here
			Uses = 1;
			Trapping = {
				CustomEntities = {
					Enabled = true;
					UseChains = true;
					FreezeEntity = true;
					TimeToRise = 6; -- The entity will instantly be deleted after this time runs out
                    RiseHeight=50;
					OnCrucifixUsed = function(monster, crucifix, config) -- Fires before the entity is cloned
					end;
                    OnCrucifixEnd=function(monster, crucifix, config) -- Fires before the entity is destroyed
                    end;
				},
				Eyes = {
					Enabled = true;
				},
				Halt = {
					Enabled = true;
				}
			}
		}
		local function IsVisible(part)
			local vec, found = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
			local cfg = RaycastParams.new()
			cfg.FilterType = Enum.RaycastFilterType.Blacklist
			cfg.FilterDescendantsInstances = {
				part
			}
			local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg)
			if (found and vec.Z > 0) and cast and cast.Instance.Parent == game.Players.LocalPlayer.Character then
				return true
			end
		end
		local Equipped = false
		local Plr = game:GetService"Players".LocalPlayer
		local Char = Plr.Character or Plr.CharacterAdded:Wait()
		local Hum = Char:WaitForChild("Humanoid")
		local RightArm = Char:WaitForChild("RightUpperArm")
		local LeftArm = Char:WaitForChild("LeftUpperArm")
		local RightC1 = RightArm.RightShoulder.C1
		local LeftC1 = LeftArm.LeftShoulder.C1
		local SelfModules = {
			Functions = loadstring(
            game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua")
        )(),
			CustomShop = loadstring(
            game:HttpGet(
                "https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"
            )
        )(),
		}
		local ModuleScripts = {
			MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),
			SeekIntro = require(Plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.SeekIntro),
		}
		local CrucifixTool = game:GetObjects(Configuration["CrucifixTool"][Configuration["CurrentCrucifix"]])[1]
		CrucifixTool.Name = Configuration["CrucifixName"][Configuration["CurrentCrucifix"]]
CrucifixTool.TextureId = Configuration["CrucifixImage"][Configuration["CurrentCrucifix"]]
		CrucifixTool.Equipped:Connect(function()
			Equipped = true
			Char:SetAttribute("Hiding", true)
			for _, v in next, Hum:GetPlayingAnimationTracks() do
				v:Stop()
			end
			RightArm.Name = "R_Arm"
			LeftArm.Name = "L_Arm"
			RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
			LeftArm.LeftShoulder.C1 = LeftC1
            * CFrame.new(-0.2, -0.3, -0.5)
            * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
		end)
		CrucifixTool.Unequipped:Connect(function()
			Equipped = false
			Char:SetAttribute("Hiding", nil)
			RightArm.Name = "RightUpperArm"
			LeftArm.Name = "LeftUpperArm"
			RightArm.RightShoulder.C1 = RightC1
			LeftArm.LeftShoulder.C1 = LeftC1
		end)
		CrucifixTool.Parent = game.Players.LocalPlayer.Backpack
		local Plr = game:GetService("Players").LocalPlayer
		local Char = Plr.Character or Plr.CharacterAdded:Wait()
		local Root = Char:WaitForChild("HumanoidRootPart")
		local function dupeCrucifix(time, entityRoot)
			local Cross = Instance.new("Model")
			for _, thing in pairs(CrucifixTool:GetChildren()) do
				thing:Clone().Parent=Cross
			end
			local weld=Instance.new("ManualWeld", Cross.Handle)
			weld.Part0=Cross.Handle
			if Cross:FindFirstChild"Cracks" then
				weld.Part1=Cross.Cracks
				Cross.Cracks.Color = Configuration.CrucifixCracks[1]
				Cross.Cracks.Material = Configuration.CrucifixCracks[2]
			end
			Cross.Parent = workspace
			Cross.Name = Configuration.CrucifixName[Configuration.CurrentCrucifix] .. "Cracked"
			local fakeCross = Cross.Handle
    
			ModuleScripts.MainGame.camShaker:ShakeOnce(35, 25, 0.15, 0.15)
			fakeCross.CFrame = CFrame.lookAt(CrucifixTool.Handle.Position, entityRoot.Position)
			fakeCross.Anchored = true
			Configuration.Uses -= 1
			if Configuration.Uses == 0 then
				CrucifixTool:Destroy()
			end
			task.wait(time)
			fakeCross.Anchored = false
			Cross.Cracks.Anchored=false
			fakeCross.CanCollide = true
			task.wait(0.5)
			Cross:Remove()
		end
		local function HandleEntity(ins)
			wait(.01) -- Wait for the attribute
			if ins:GetAttribute("IsCustomEntity") == true and ins:GetAttribute("ClonedByCrucifix") ~= true then
                local Chains
                if Configuration.Trapping.CustomEntities.UseChains then
                    Chains = game:GetObjects(Configuration.CrucifixChains[Configuration.CurrentCrucifix])[1]
                    Chains.Parent = workspace
                end
				repeat
					task.wait()
				until Equipped and ins.Parent ~= nil and ins.PrimaryPart and IsVisible(ins.PrimaryPart) and (Root.Position - ins.PrimaryPart.Position).magnitude <= 25
				Configuration.Trapping.CustomEntities.OnCrucifixUsed(ins, CrucifixTool, Configuration)
                local c=ins
                if Configuration.Trapping.CustomEntities.FreezeEntity then
                    c = ins:Clone()
                    c:SetAttribute("ClonedByCrucifix", true)
                    c.PrimaryPart.Anchored = true
                    c.Parent = ins.Parent
                    ins:Destroy()
                end
				task.spawn(dupeCrucifix, Configuration.Trapping.CustomEntities.TimeToRise, c.PrimaryPart)
                if Configuration.Trapping.CustomEntities.UseChains then
                    local EntityRoot = c.PrimaryPart
                    local Fake_FaceAttach = Instance.new("Attachment", EntityRoot)
                    for i, beam in pairs(Chains:GetDescendants()) do
                        if beam:IsA("BasePart") then
                            beam.CanCollide = false
                        end
                        if beam.Name == "Beam" then
                            beam.Attachment1 = Fake_FaceAttach
                        end
                    end
                    Chains:SetPrimaryPartCFrame(EntityRoot.CFrame * CFrame.new(0, -3.5, 0) * CFrame.Angles(math.rad(90), 0, 0))
                    task.wait(1.35)
                    task.spawn(function()
                        while task.wait() do
                            if Chains:FindFirstChild('Base') then
                                Chains.Base.CFrame = Chains.Base.CFrame * CFrame.Angles(0, 0 , math.rad(0.5))
                            end
                        end
                    end)
                    task.spawn(function()
                        while task.wait() do
                            for i, beam in pairs(Chains:GetDescendants()) do
                                if beam.Name == "Beam" then
                                    beam.TextureLength = beam.TextureLength + 0.035
                                end
                            end
                        end
                    end)
                    game.TweenService:Create(EntityRoot, TweenInfo.new(Configuration.Trapping.CustomEntities.TimeToRise), {
                        CFrame = EntityRoot.CFrame * CFrame.new(0, Configuration.Trapping.CustomEntities.RiseHeight, 0)
                    }):Play()
                    task.wait(1.5)
                    game:GetService("Debris"):AddItem(c, 0)
                    game:GetService("Debris"):AddItem(Chains, 0)
                end
                Configuration.Trapping.CustomEntities.OnCrucifixEnd(c,CrucifixTool,Configuration)
			elseif ins.Name == "Lookman" and Configuration["Trapping"].Eyes.Enabled == true then
				local c = ins
				task.spawn(function()
					repeat
						task.wait()
					until Equipped and c.Core.Attachment.Eyes.Enabled == true
					local pos = c.Core.Position
					task.spawn(function()
						c:SetAttribute("Killing", true)
						ModuleScripts.MainGame.camShaker:ShakeOnce(10, 10, 5, 0.15)
						wait(1.2)
						c.Core.Initiate:Stop()
						c.Core.Repent:Play()
						delay(c.Core.Repent.TimeLength, function()
							c.Core.Attachment.Angry.Enabled = false
						end)
						c.Core.Attachment.Angry.Enabled = true
						ModuleScripts.MainGame.camShaker:ShakeOnce(4, 4, c.Core.Repent.TimeLength, 0.15)
						wait(2 + c.Core.Repent.TimeLength + .1)
						ModuleScripts.MainGame.camShaker:ShakeOnce(8, 8, c.Core.Repent.TimeLength * 2, 0.15)
						c.Core.Repent:Play()
						c.Core.Attachment.Angry.Enabled = true
						wait(c.Core.Repent.TimeLength + .1)
						c.Core.Repent:Play()
						task.spawn(dupeCrucifix, 4, c.Core)
						ModuleScripts.MainGame.camShaker:ShakeOnce(10, 10, c.Core.Scream.TimeLength + 2, 0.15);
						wait(2)
						c.Core.Scream:Play();
						game:GetService("TweenService"):Create(c.Core:FindFirstChild"whisper" or c.Core:FindFirstChild"Ambience", TweenInfo.new(c.Core.Scream.TimeLength + 2.2), {
							Volume = 0
						}):Play()
						for _, l in pairs(c:GetDescendants()) do
							if l:IsA("PointLight") then
								game:GetService("TweenService"):Create(l, TweenInfo.new(c.Core.Scream.TimeLength + 2.2), {
									Brightness = 0
								}):Play()
							end
						end
						game:GetService("TweenService"):Create(c.Core, TweenInfo.new(c.Core.Scream.TimeLength, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							CFrame = CFrame.new(c.Core.CFrame.X, c.Core.CFrame.Y - 12, c.Core.CFrame.Z)
						}):Play()
					end)
					local col = game.Players.LocalPlayer.Character.Collision
					local function CFrameToOrientation(cf)
						local x, y, z = cf:ToOrientation()
						return Vector3.new(math.deg(x), math.deg(y), math.deg(z))
					end
					while c.Parent ~= nil and c.Core.Attachment.Eyes.Enabled == true do
                    -- who's the boss now huh?
						col.Orientation = CFrameToOrientation(CFrame.lookAt(col.Position, pos) * CFrame.Angles(0, math.pi, 0))
						task.wait()
					end
				end)
			elseif ins.Name == "Shade" and ins.Parent == workspace.CurrentCamera and ins:GetAttribute("ClonedByCrucifix") == nil and Configuration.Trapping.Halt.Enabled then
				task.spawn(function()
					repeat
						task.wait()
					until IsVisible(ins) and (Root.Position - ins.Position).Magnitude <= 12.5 and Equipped
					local clone = ins:Clone()
					clone:SetAttribute("ClonedByCrucifix", true)
					clone.CFrame = ins.CFrame
					clone.Parent = ins.Parent
					clone.Anchored = true
					ins:Remove()
					task.spawn(dupeCrucifix, 13, ins)
					ModuleScripts.MainGame.camShaker:ShakeOnce(40, 10, 5, 0.15)
					for _, thing in pairs(clone:GetDescendants()) do
						if thing:IsA("SpotLight") then
							game:GetService("TweenService"):Create(thing, TweenInfo.new(5), {
								Brightness = thing.Brightness * 5
							}):Play()
						elseif thing:IsA("Sound") and thing.Name ~= "Burst" then
							game:GetService("TweenService"):Create(thing, TweenInfo.new(5), {
								Volume = 0
							}):Play()
						elseif thing:IsA("TouchTransmitter") then
							thing:Destroy()
						end
					end
					for _, pc in pairs(clone:GetDescendants()) do
						if pc:IsA("ParticleEmitter") then
							pc.Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
								ColorSequenceKeypoint.new(0.48, Color3.fromRGB(182, 0, 3)),
								ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
							}
						end
					end
					local light
					light = game.Lighting["Ambience_Shade"]
					wait(5)
					clone.Burst.PlaybackSpeed = 0.5
					clone.Burst:Stop()
					clone.Burst:Play()
					light.TintColor = Color3.fromRGB(215, 253, 255)
					game:GetService("TweenService"):Create(clone, TweenInfo.new(6), {
						CFrame = CFrame.new(clone.CFrame.X, clone.CFrame.Y - 12, clone.CFrame.Z)
					}):Play()
					wait(8.2)
					game:GetService("Debris"):AddItem(clone, 0)
					game.ReplicatedStorage.Bricks.ShadeResult:FireServer()
				end)
			end
		end
		workspace.ChildAdded:Connect(HandleEntity)
		workspace.CurrentCamera.ChildAdded:Connect(HandleEntity)
		for _, thing in pairs(workspace:GetChildren()) do
			HandleEntity(thing)
		end
		for _, thing in pairs(workspace.CurrentCamera:GetChildren()) do
			HandleEntity(thing)
		end
		if Plr.PlayerGui.MainUI.ItemShop.Visible then
			SelfModules.CustomShop.CreateItem(CrucifixTool, {
				Title = Configuration["CrucifixName"][Configuration["CurrentCrucifix"]],
				Desc = Configuration["CrucifixDescription"][Configuration["CurrentCrucifix"]],
				Image = Configuration["CrucifixImage"][Configuration["CurrentCrucifix"]],
				Price = 300,
				Stack = 1,
			})
		end
