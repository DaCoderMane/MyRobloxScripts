-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ManeFrameUIC = Instance.new("UICorner")
local HipHeightLabel = Instance.new("TextLabel")
local SetHH = Instance.new("TextButton")
local SetHHUIC = Instance.new("UICorner")
local HHNUM = Instance.new("TextBox")
local HHNUMUIC = Instance.new("UICorner")
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")

--Properties:

ScreenGui.Name = "SG"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.307420492, 0, 0.484962404, 0)
MainFrame.Size = UDim2.new(0, 90, 0, 97)
MainFrame.Active = true
MainFrame.Draggable = true

ManeFrameUIC.Name = "ManeFrameUIC"
ManeFrameUIC.Parent = MainFrame

HipHeightLabel.Name = "HipHeightLabel"
HipHeightLabel.Parent = ScreenGui
HipHeightLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HipHeightLabel.BackgroundTransparency = 1.000
HipHeightLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HipHeightLabel.BorderSizePixel = 0
HipHeightLabel.Position = UDim2.new(0.323674917, -6, 0.488721728, 0)
HipHeightLabel.Size = UDim2.new(0, 45, 0, 17)
HipHeightLabel.Font = Enum.Font.SourceSans
HipHeightLabel.Text = "Hip Height"
HipHeightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HipHeightLabel.TextSize = 14.000

SetHH.Name = "SetHH"
SetHH.Parent = ScreenGui
SetHH.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
SetHH.BorderColor3 = Color3.fromRGB(0, 0, 0)
SetHH.BorderSizePixel = 0
SetHH.Position = UDim2.new(0.322261482, -6, 0.561403513, -7)
SetHH.Size = UDim2.new(0, 47, 0, 27)
SetHH.Font = Enum.Font.SourceSans
SetHH.Text = "Set HH"
SetHH.TextColor3 = Color3.fromRGB(0, 0, 0)
SetHH.TextSize = 14.000

SetHHUIC.Name = "SetHHUIC"
SetHHUIC.Parent = SetHH

HHNUM.Name = "HHNUM"
HHNUM.Parent = ScreenGui
HHNUM.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
HHNUM.BorderColor3 = Color3.fromRGB(0, 0, 0)
HHNUM.BorderSizePixel = 0
HHNUM.Position = UDim2.new(0.311660767, 0, 0.52506268, 0)
HHNUM.Size = UDim2.new(0, 78, 0, 21)
HHNUM.Font = Enum.Font.SourceSans
HHNUM.PlaceholderText = "0"
HHNUM.Text = ""
HHNUM.TextColor3 = Color3.fromRGB(255, 255, 255)
HHNUM.TextSize = 14.000

HHNUMUIC.Name = "HHNUMUIC"
HHNUMUIC.Parent = HHNUM

SetHH.MouseButton1Click:Connect(function()
    local HipHeightNUM = tonumber(HHNUM.Text)
    if humanoid then
        humanoid.HipHeight = HipHeightNUM or 0
    end
end)
