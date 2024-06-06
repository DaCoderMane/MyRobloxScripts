--*--*--*--*--*--*--// Configuration \\--*--*--*--*--*--*--
local Keybind = "Q"
local KeybindType = "Keyboard" --// Mouse or Keyboard
local KeybindActivation = "Toggle" --// Hold or Toggle
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local AutoPredCalculate = 0.002755 --// AutoBased on ping
local VisualizePrediction = true
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local BodyPart = "LowerTorso"
local AirBodyPart = "Head"
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local Resolver = true
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local InfoUI = true
local InfoUIKeybind = "H"
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local HealthCheck = true
local WallCheck = true
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
local PredictionBreakerAA = true
local PredictionBreakerAAKeybind = "P"
local PredictionBreakerAANotifications = true
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
--[[
	________   ______    ______  ________  
	\_____  \ /  __  \  /  __  \ \_____  \ 
	 /  ____/ >      <  >      <  /  ____/ 
	/       \/   --   \/   --   \/       \ 
	\_______ \______  /\______  /\_______ \
    	    \/      \/        \/         \/                                                         
                                            
    Shitty blatant camlock for level 3 exploits   
    Scripted for myself and some skidded
    
    It's fully free script, DM @2882 to report bugs and etc ]]










--*--*--*--*--*--*--// Source \\--*--*--*--*--*--*--

--// Loading (skidded as possible) \\--
local predbrkst = false
local fps = 0
local blur = Instance.new("BlurEffect")
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9029412098"
sound.Volume = 0.5
sound.Parent = game:GetService("SoundService")
blur.Size = 0
blur.Parent = workspace.CurrentCamera
wait(0.75)
sound:Play()
for i = 1, 100 do
	if blur.Size ~= 10 then
		blur.Size = blur.Size + 1
	end
	task.wait()
end
wait(0.75)
for i = 1, 85 do
	if blur.Size ~= 0 then
		blur.Size = blur.Size - 1
	end
	task.wait()
end
wait(0.5)
--// HO HO HO VERY SCARY ASCII AAAAAAAAAAAAAAAAAAAAAAAA
print([[

                            ,-.
       ___,---.__          /'|`\          __,---,___
    ,-'    \`    `-.____,-'  |  `-.____,-'    //    `-.
  ,'        |           ~'\     /`~           |        `.
 /      ___//              `. ,'          ,  , \___      \
|    ,-'   `-.__   _         |        ,    __,-'   `-.    |
|   /          /\_  `   .    |    ,      _/\          \   |
\  |           \ \`-.___ \   |   / ___,-'/ /           |  /
 \  \           | `._   `\\  |  //'   _,' |           /  /
  `-.\         /'  _ `---'' , . ``---' _  `\         /,-'
     ``       /     \    ,='/ \`=.    /     \       ''
             |__   /|\_,--.,-.--,--._/|\   __|
             /  `./  \\`\ |  |  | /,//' \,'  \
	        /   /     ||--+--|--+-/-|     \   \
           |   |     /'\_\_\ | /_/_/`\     |   |
            \   \__, \_     `~'     _/ .__/   /
             `-._,-'   `-._______,-'   `-._,-'
             
]])
--// Main \\--
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
ScreenGui.Name = "YbcKJ7nrsm1pbVuX"
TextLabel.Name = "YbcKJ7nrsm1pbVuX"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0152340718, 0, 0.363970578, 0)
TextLabel.Size = UDim2.new(0, 327, 0, 221)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "HexxiumWare LVL3 exploit!"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.300
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.ZIndex = 99
local beam = Instance.new("Beam")
local at0 = Instance.new("Attachment")
local at1 = Instance.new("Attachment")
at0.Parent = workspace.Terrain
at1.Parent = workspace.Terrain
at0.Parent = workspace.Terrain
beam.Width0 = 0.075
beam.Width1 = 0.075
beam.FaceCamera = true
beam.Parent = workspace.Terrain
beam.LightEmission = 1
beam.LightInfluence = 0.5
beam.Attachment0 = at0
beam.Attachment1 = at1
at0.CFrame = CFrame.new(999,999,999)
at1.CFrame = CFrame.new(999,999,999)
local part = Instance.new("Part")
part.Name = "YbcKJ7nrsm1pbVuX"
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Size = Vector3.new(0.1,0.1,0.1)
part.Parent = workspace
local bg = Instance.new("BillboardGui")
bg.Name = "YbcKJ7nrsm1pbVuX"
bg.Size = UDim2.new(0.0, 0, 0.0, 0)
bg.AlwaysOnTop = true
local a = Instance.new("Frame", bg)
a.Size = UDim2.new(1, 0, 1, 0)
a.BackgroundTransparency = 0
a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
local g = Instance.new("UICorner", a)
g.CornerRadius = UDim.new(30, 30)
bg.Parent = part

if InfoUI ~= true then
	ScreenGui:Destroy()
end
function disableUIinfo()
	TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n ——————————————————" .. " \n Ping: ".. tostring(math.floor(game:GetService("Players").LocalPlayer:GetNetworkPing() * 1000)) .. "\n" .. "\n Velocity: " .. " " .. "\n Recalculated velocity: ".. " " .. "\n" .. "\n Prediction: ".. " " .. "\n Prediction factor: " .. " " .. "\n" .. "\n Aiming bodypart: " .. " " .."  \n Target: ".. " " .. "\n" .. "\n Keybind: " .. Keybind .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
end
disableUIinfo()
if VisualizePrediction ~= true then
	beam:Destroy()
	at1:Destroy()
	at0:Destroy()
	bg:Destroy()
end

sound.Ended:Connect(function()
	blur:Destroy()
	sound:Destroy()
end)

local status = false
local UserInputService = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()
function FindClosestUser()
	local closestPlayer
	local ShortestDistance = 300
	for i, v in pairs(game.Players:GetPlayers()) do
		if v.Character and v.Character:FindFirstChild("Humanoid") and v ~= game.Players.LocalPlayer and
			v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
			local pos = game:GetService "Workspace".CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
			local magnitude = (Vector2.new(pos.X, pos.Y) -
				Vector2.new(game.Players.LocalPlayer:GetMouse().X,
					game.Players.LocalPlayer:GetMouse().Y)).magnitude
			if magnitude < ShortestDistance then
				closestPlayer = v
				ShortestDistance = magnitude
			end
		end
	end
	return closestPlayer
end
local function Wall_Check(targett)
	local Casted = Ray.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, targett.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
	local NonObjects = {
		game.Players.LocalPlayer.Character,
		targett.Character.Parent
	}
	local FalseValue, i, d, k = game.Workspace:FindPartOnRayWithIgnoreList(Casted, NonObjects)
	local _, v = workspace.CurrentCamera:WorldToScreenPoint(targett.Character.HumanoidRootPart.Position)
	if v and not FalseValue then
		return true
	else
		return false
	end
end
local function CalculateVelocity(Before, After, deltaTime)
	local Displacement = (After - Before)
	local Velocity = Displacement / deltaTime
	return Velocity
end
local PreviousPosition = Vector3.new(0,0,0)
local target = FindClosestUser()
game:GetService("UserInputService").InputBegan:Connect(function(input,checks)
	if checks then
		return
	end
	local keyb = Keybind
	if input.KeyCode == Enum.KeyCode[InfoUIKeybind] and InfoUI == true then
		if ScreenGui.Enabled == true then
			ScreenGui.Enabled = false
		else
			ScreenGui.Enabled = true
		end
	end
	if input.KeyCode == Enum.KeyCode[PredictionBreakerAAKeybind] then
		if predbrkst == true then
			predbrkst = false
			disableUIinfo()
			if PredictionBreakerAANotifications == true then
				game.StarterGui:SetCore("SendNotification",{
					Title = "Disabled",
					Text = "Prediction disabler AA",
					Icon = "rbxassetid://5607496120",
					Duration = 1
				})
			end
		else
			predbrkst = true
			disableUIinfo()
			if PredictionBreakerAANotifications == true then
				game.StarterGui:SetCore("SendNotification",{
					Title = "Enabled",
					Text = "Prediction disabler AA",
					Icon = "rbxassetid://198205722",
					Duration = 1
				})
			end
		end
	end
	if KeybindType == "Keyboard" then
		if input.KeyCode == Enum.KeyCode[keyb] then
			if KeybindActivation == "Toggle" and status == true then
				if status == false then
					target = FindClosestUser()
					if WallCheck == true then
						if Wall_Check(target) == true then
							status = true
							bg.AlwaysOnTop = true
							beam.Transparency = NumberSequence.new(0)
						else
							status = false
							beam.Transparency = NumberSequence.new(1)
							bg.AlwaysOnTop = false
							disableUIinfo()
						end
					else
						status = true
						bg.AlwaysOnTop = true
						beam.Transparency = NumberSequence.new(0)
					end
				else
					status = false
					beam.Transparency = NumberSequence.new(1)
					bg.AlwaysOnTop = false
					disableUIinfo()
				end
			else
				target = FindClosestUser()
				if WallCheck == true then
					if Wall_Check(target) == true then
						status = true
						bg.AlwaysOnTop = true
						beam.Transparency = NumberSequence.new(0)
					else
						status = false
						bg.AlwaysOnTop = false
						beam.Transparency = NumberSequence.new(1)
						disableUIinfo()
					end
				else
					status = true
				end
			end
		end
	elseif KeybindType == "Mouse" then
		if input.UserInputType == Enum.UserInputType[keyb] then
			if KeybindActivation == "Toggle" and status == true then
				if status == false then
					target = FindClosestUser()
					if WallCheck == true then
						if Wall_Check(target) == true then
							status = true
							bg.AlwaysOnTop = true
							beam.Transparency = NumberSequence.new(0)
						else
							status = false
							bg.AlwaysOnTop = false
							beam.Transparency = NumberSequence.new(1)
							disableUIinfo()
						end
					else
						status = true
						bg.AlwaysOnTop = true
						beam.Transparency = NumberSequence.new(0)
					end
				else
					status = false
					bg.AlwaysOnTop = false
					beam.Transparency = 1
					disableUIinfo()
				end
			else
				target = FindClosestUser()
				if WallCheck == true then
					if Wall_Check(target) == true then
						status = true
						bg.AlwaysOnTop = true
						beam.Transparency = NumberSequence.new(0)
					else
						status = false
						bg.AlwaysOnTop = false
						disableUIinfo()
						beam.Transparency = NumberSequence.new(1)
					end
				else
					status = true
					bg.AlwaysOnTop = true
					beam.Transparency = NumberSequence.new(0)
				end
			end
		end
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input,checks)
	if checks then
		return
	end
	local keyv = PredictionBreakerAAKeybind
	if input == Enum.KeyCode.X then
		print("1111111111111")
		if predbrkst == true then
			predbrkst = false
			game.StarterGui:SetCore("SendNotification",{
				Title = "Disabled",
				Text = "Prediction disabler legit AA",
				Icon = "rbxassetid://11966316141",
				Duration = 1
			})
		else
			predbrkst = true
			game.StarterGui:SetCore("SendNotification",{
				Title = "Enabled",
				Text = "Prediction disabler legit AA",
				Icon = "rbxassetid://11966316141",
				Duration = 1
			})
		end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
	local keyb = Keybind
	if KeybindActivation == "Hold" then
		if KeybindType == "Keyboard" then
			if input.KeyCode == Enum.KeyCode[keyb] then
				status = false
				beam.Transparency = NumberSequence.new(1)
				disableUIinfo()
			end
		elseif KeybindType == "Mouse" then
			if input.UserInputType == Enum.UserInputType[keyb] then
				status = false
				beam.Transparency = NumberSequence.new(1)
				disableUIinfo()
			end
		end
	end
end)
--// Camlocking yuh \\--
game:GetService("RunService").Heartbeat:Connect(function(DeltaTime)
	if status == true and target ~= nil then
		if target.Character:FindFirstChildWhichIsA("Humanoid").Health <= 1 and HealthCheck == true then
			target = nil
			status = false
			beam.Transparency = NumberSequence.new(1)
			bg.AlwaysOnTop = false
		else
			if target.Character:FindFirstChildWhichIsA("Humanoid").FloorMaterial == Enum.Material.Air then
				local pingg = math.floor(game:GetService("Players").LocalPlayer:GetNetworkPing() * 1000)
				local pred = pingg * AutoPredCalculate
				if Resolver == true then
					if target.Character.HumanoidRootPart.Velocity.X <= -45 or target.Character.HumanoidRootPart.Velocity.X >= 45 or target.Character.HumanoidRootPart.Velocity.Y <= -45 or target.Character.HumanoidRootPart.Velocity.Y >= 45 or target.Character.HumanoidRootPart.Velocity.Z <= -45 or target.Character.HumanoidRootPart.Velocity.Z >= 50 then
						local CurrentPosition = target.Character.HumanoidRootPart.Position
						local Velocity = CalculateVelocity(PreviousPosition, CurrentPosition, DeltaTime)
						PreviousPosition = CurrentPosition
						local fully_pred = Velocity * pred

						local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
						workspace.CurrentCamera.CFrame = newCF
						if VisualizePrediction == true then
							at1.CFrame = CFrame.new(target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
							at0.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
							part.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
						end
						if InfoUI == true then
							TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y).. ", " ..math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. tostring(math.floor(Velocity.X) .. ", ".. math.floor(Velocity.Y) .. ", " .. math.floor(Velocity.Z)) .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. AirBodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n" .. "\n Keybind: " .. Keybind .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
						end
					else
						local Velocity = target.Character.HumanoidRootPart.Velocity
						local fully_pred = Velocity * pred

						local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
						workspace.CurrentCamera.CFrame = newCF
						if VisualizePrediction == true then
							at1.CFrame = CFrame.new(target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
							at0.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
							part.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
						end
						if InfoUI == true then
							TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y).. ", " ..math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. tostring(math.floor(Velocity.X) .. ", ".. math.floor(Velocity.Y) .. ", " .. math.floor(Velocity.Z)) .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. AirBodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n" .. "\n Keybind: " .. Keybind .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
						end
					end 
				else
					local Velocity = target.Character.HumanoidRootPart.Velocity
					local fully_pred = Velocity * pred

					local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
					workspace.CurrentCamera.CFrame = newCF
					if VisualizePrediction == true then
						at1.CFrame = CFrame.new(target.Character:WaitForChild(AirBodyPart).Position + (Velocity * pred))
						at0.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
						part.CFrame = target.Character:FindFirstChild(AirBodyPart).CFrame
					end
					if InfoUI == true then
						TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y) .. ", " ..math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. "[RESOLVER DISABLED]" .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. AirBodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n" .. "\n Keybind: " .. Keybind .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
					end
				end
			else
				local pingg = math.floor(game:GetService("Players").LocalPlayer:GetNetworkPing() * 1000)
				local pred = pingg * AutoPredCalculate
				if Resolver == true then
					if target.Character.HumanoidRootPart.Velocity.X <= -45 or target.Character.HumanoidRootPart.Velocity.X >= 45 or target.Character.HumanoidRootPart.Velocity.Y <= -45 or target.Character.HumanoidRootPart.Velocity.Y >= 45 or target.Character.HumanoidRootPart.Velocity.Z <= -45 or target.Character.HumanoidRootPart.Velocity.Z >= 50 then
						local CurrentPosition = target.Character.HumanoidRootPart.Position
						local Velocity = CalculateVelocity(PreviousPosition, CurrentPosition, DeltaTime)
						PreviousPosition = CurrentPosition
						local fully_pred = Velocity * pred

						local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
						workspace.CurrentCamera.CFrame = newCF
						if VisualizePrediction == true then
							at1.CFrame = CFrame.new(target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
							at0.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
							part.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
						end
						if InfoUI == true then
							TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y) .. ", " .. math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. tostring(math.floor(Velocity.X) .. ", ".. math.floor(Velocity.Y) .. ", " .. math.floor(Velocity.Z)) .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. BodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n Keybind: " .. Keybind .. "\n" .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
						end
					else
						local Velocity = target.Character.HumanoidRootPart.Velocity
						local fully_pred = Velocity * pred

						local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
						workspace.CurrentCamera.CFrame = newCF
						if VisualizePrediction == true then
							at1.CFrame = CFrame.new(target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
							at0.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
							part.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
						end
						if InfoUI == true then
							TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y) .. ", " .. math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. tostring(math.floor(Velocity.X) .. ", ".. math.floor(Velocity.Y) .. ", " .. math.floor(Velocity.Z)) .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. BodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n Keybind: " .. Keybind .. "\n" .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
						end
					end 
				else
					local Velocity = target.Character.HumanoidRootPart.Velocity
					local fully_pred = Velocity * pred

					local newCF = CFrame.new(workspace.CurrentCamera.CFrame.Position,target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
					workspace.CurrentCamera.CFrame = newCF
					if VisualizePrediction == true then
						at1.CFrame = CFrame.new(target.Character:WaitForChild(BodyPart).Position + (Velocity * pred))
						at0.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
						part.CFrame = target.Character:FindFirstChild(BodyPart).CFrame
					end
					if InfoUI == true then
						TextLabel.Text = " HexxiumWare LVL3 exploit!" .. "\n" .. "\n" .. "\n  ——————————————————" .. " \n Ping: ".. pingg .. "\n" .. "\n Velocity: ".. tostring(math.floor(target.Character.HumanoidRootPart.Velocity.X) .. ", ".. math.floor(target.Character.HumanoidRootPart.Velocity.Y) .. ", " .. math.floor(target.Character.HumanoidRootPart.Velocity.Z)) .. "\n Recalculated velocity: ".. "[RESOLVER DISABLED]" .. "\n" .. "\n Prediction: ".. tostring(math.floor(fully_pred.X)..", "..math.floor(fully_pred.Y)..", "..math.floor(fully_pred.Z)) .. "\n Prediction factor: " .. tostring(pred) .. "\n" .. "\n Aiming bodypart: " .. BodyPart .." \n Target: ".. target.Character:FindFirstChildWhichIsA("Humanoid").DisplayName .. " (" .. target.Name .. ")" .. "\n Keybind: " .. Keybind .. "\n" .. "\n Keybind Activation: " .. KeybindActivation .. "\n" .. "\n AntiLock: " .. tostring(predbrkst) .. "\n  ——————————————————"
					end
				end
			end
		end
	end
	if PredictionBreakerAA == true and predbrkst == true then
		local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) 
		game:GetService("RunService").RenderStepped:Wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
	end
end)

while true do
	wait(0.5)
	if target == nil or status == false and InfoUI == true then
		disableUIinfo()
	end
end