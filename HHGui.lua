-- By me

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ManeFrameUIC = Instance.new("UICorner")
local HipHeightLabel = Instance.new("TextLabel")
local SetHH = Instance.new("TextButton")
local SetHHUIC = Instance.new("UICorner")
local HHNUM = Instance.new("TextBox")
local HHNUMUIC = Instance.new("UICorner")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.307420492, 0, 0.484962404, 0)
MainFrame.Size = UDim2.new(0, 90, 0, 97)

ManeFrameUIC.Name = "ManeFrameUIC"
ManeFrameUIC.Parent = MainFrame

SetHH.Name = "SetHH"
SetHH.Parent = MainFrame
SetHH.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
SetHH.BorderColor3 = Color3.fromRGB(0, 0, 0)
SetHH.BorderSizePixel = 0
SetHH.Position = UDim2.new(0.222261563, 0, 0.633568525, 0)
SetHH.Size = UDim2.new(0, 47, 0, 27)
SetHH.Font = Enum.Font.SourceSans
SetHH.Text = "Set HH"
SetHH.TextColor3 = Color3.fromRGB(0, 0, 0)
SetHH.TextSize = 14.000

SetHHUIC.Name = "SetHHUIC"
SetHHUIC.Parent = SetHH

HHNUM.Name = "HHNUM"
HHNUM.Parent = MainFrame
HHNUM.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
HHNUM.BorderColor3 = Color3.fromRGB(0, 0, 0)
HHNUM.BorderSizePixel = 0
HHNUM.Position = UDim2.new(0.0783274323, 0, 0.277640104, 0)
HHNUM.Size = UDim2.new(0, 75, 0, 21)
HHNUM.Font = Enum.Font.SourceSans
HHNUM.PlaceholderText = "0"
HHNUM.Text = ""
HHNUM.TextColor3 = Color3.fromRGB(255, 255, 255)
HHNUM.TextSize = 14.000

HHNUMUIC.Name = "HHNUMUIC"
HHNUMUIC.Parent = HHNUM

HipHeightLabel.Name = "HipHeightLabel"
HipHeightLabel.Parent = MainFrame
HipHeightLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HipHeightLabel.BackgroundTransparency = 1.000
HipHeightLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HipHeightLabel.BorderSizePixel = 0
HipHeightLabel.Position = UDim2.new(0.245897084, 0, 0.0351134613, 0)
HipHeightLabel.Size = UDim2.new(0, 45, 0, 17)
HipHeightLabel.Font = Enum.Font.SourceSans
HipHeightLabel.Text = "Hip Height"
HipHeightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HipHeightLabel.TextSize = 14.000

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local function setHipHeight()
    local num = tonumber(HHNUM.Text)
    if num then
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = num
        HHNUM.Text = ""
    else
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
    end
end

SetHH.MouseButton1Click:Connect(setHipHeight)
