local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer
local Options = Fluent.Options
local Noclip = false
setfpscap(5000);

local function getVersion()
    local versionURL = "https://pastebin.com/raw/9rEd9JiX"
    local versionRequest = syn and syn.request or http_request or request 
    local response = versionRequest({Url = versionURL, Method = "GET"})
    if response and response.StatusCode == 200 then
        return response.Body
    else
        return "Unknown"
    end
end

local Version = getVersion()

if game.PlaceId == 155615604 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Prison Life) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    PrisonLife = Window:AddTab({ Title = "Prison Life", Icon = "" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 0,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 0
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "0",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 0)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local PolarAdminV1PRISONLIFE = Tabs.PrisonLife:AddButton({
        Title = "Polar Admin ChatCMD",
        Description = "Executes Polar Admin ChatCMD",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/PolarAdminPRISONLIFE.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Polar Admin ChatCMD.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Prison Life)",
    Content = "Polar Admin (Prison Life) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

elseif game.PlaceId == 13772394625 or game.PlaceId == 15234596844 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Blade Ball) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    BladeBall = Window:AddTab({ Title = "Blade Ball", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 0,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 0
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "0",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 0)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local AutoParryFFJ = Tabs.BladeBall:AddButton({
        Title = "AutoParry by FFJ",
        Description = "Executes AutoParry",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Auto Parry by FFJ.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Blade Ball)",
    Content = "Polar Admin (Blade Ball) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

elseif game.PlaceId == 286090429 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Arsenal) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    Arsenal = Window:AddTab({ Title = "Arsenal", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 0,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 0
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "0",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 0)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local AirHub = Tabs.Arsenal:AddButton({
        Title = "Air Hub",
        Description = "Executes Air Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Air Hub.",
            Duration = 8
        })
        end
    })

    local VGHub = Tabs.Arsenal:AddButton({
        Title = "VG Hub",
        Description = "Executes VG Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed VG Hub.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Arsenal)",
    Content = "Polar Admin (Arsenal) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

elseif game.PlaceId == 2753915549 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Blox Fruits) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    BloxFruits = Window:AddTab({ Title = "BloxFruits", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 2.7,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 2.7
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "2.7",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 2.7)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local MatsuneHub = Tabs.BloxFruits:AddButton({
        Title = "Matsune Hub V2",
        Description = "Executes Matsune Hub V2",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Yuri/main/Winterhub_V2.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Matsune Hub V2.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Blox Fruits)",
    Content = "Polar Admin (Blox Fruits) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

elseif game.PlaceId == 2788229376 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Da Hood) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    Dahood = Window:AddTab({ Title = "DaHood", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 2,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 2
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "2",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 2)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local Dimagx = Tabs.Dahood:AddButton({
        Title = "Dimagx",
        Description = "Executes Dimagx",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Dimag16/DimagX_NEW/main/dimagx', true))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Dimagx.",
            Duration = 8
        })
        end
    })

local CapsLock = Tabs.Dahood:AddButton({
        Title = "CapsLock",
        Description = "Executes CapsLock",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/whoiscapslock/capslock/main/main", true))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed CapsLock.",
            Duration = 8
        })
        end
    })

local Polakya = Tabs.Dahood:AddButton({
        Title = "Polakya",
        Description = "Executes Polakya",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Polakya.",
            Duration = 8
        })
        end
    })
    
local CapsLockCamlock = Tabs.Dahood:AddButton({
        Title = "CapsLock Camlock",
        Description = "Executes CapsLock Camlock",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/dahoodaimlock.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed CapsLock Camlock.",
            Duration = 8
        })
        end
    })
local AzureModded = Tabs.Dahood:AddButton({
        Title = "Azure Modded",
        Description = "Executes Azure Modded",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/neMabYbU"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Azure Modded.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Blox Fruits)",
    Content = "Polar Admin (Blox Fruits) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

elseif game.PlaceId == 9332885675 then

local Noclip = false

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Prison Life V3) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    PrisonLifeV3 = Window:AddTab({ Title = "Prison Life V3", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 0,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 0
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "0",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 0)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })

local PolarAdminV3PRISONLIFEV3 = Tabs.PrisonLifeV3:AddButton({
        Title = "Polar Admin ChatCMDS",
        Description = "Executes Polar Admin ChatCMDS",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/PolarAdminPLV3.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Polar Admin ChatCMDS",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Prison Life V3)",
    Content = "Polar Admin (Prison Life V3) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)

SaveManager:LoadAutoloadConfig()

else
    print("Polar Admin:")
    print("The current game is not supported!!.")
    print("Defaulting to Universal.")

local Window = Fluent:CreateWindow({
    Title = "Polar Admin (Universal) " .. Version,
    SubTitle = "by Polar Studios",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Utilities = Window:AddTab({ Title = "Utilities", Icon = "settings" }),
    UniversalScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" })
}

do
    Tabs.Player:AddParagraph({
        Title = "Player Tab",
        Content = "This is a simple Tab letting you edit: \n Walkspeed, \n Jumppower/Jumpheight, \n Hipheight, \n and toggle noclip. \n If your sliding around in your game, mess with the hipheight \n it usually breaks in some games."
    })

    local WalkSpeedSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This will set your walkspeed.",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(WalkSpeed)
            local walkspeedValue = tonumber(WalkSpeed)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeedValue or 16
            end
        end
    })

    local WalkSpeedInput = Tabs.Player:AddInput("Input", {
        Title = "Walkspeed",
        Default = "",
        Placeholder = "16",
        Numeric = true,
        Finished = false,
        Callback = function(WalkSpeedTXT)
            local walkspeedNUM = tonumber(WalkSpeedTXT)
            WalkSpeedSlider:SetValue(walkspeedNUM or 16)
        end
    })

    local JumpPowerSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumppower",
        Description = "This will set your jumppower.",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(JumpPower)
            local jumppowerValue = tonumber(JumpPower)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppowerValue or 50
            end
        end
    })

    local JumpPowerInput = Tabs.Player:AddInput("Input", {
        Title = "Jumppower",
        Default = "",
        Placeholder = "50",
        Numeric = true,
        Finished = false,
        Callback = function(JumpPowerTXT)
            local jumppowerNUM = tonumber(JumpPowerTXT)
            JumpPowerSlider:SetValue(jumppowerNUM or 50)
        end
    })

    local HipHeightSlider = Tabs.Player:AddSlider("Slider", {
        Title = "Hipheight",
        Description = "This will set your hipheight.",
        Default = 0,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                player.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeightNUM or 0
            end
        end
    })

    local HipHeightInput = Tabs.Player:AddInput("Input", {
        Title = "Hipheight",
        Default = "",
        Placeholder = "0",
        Numeric = true,
        Finished = false,
        Callback = function(HipHeightTXT)
            local HipHeightNUM = tonumber(HipHeightTXT)
            HipHeightSlider:SetValue(HipHeightNUM or 0)
        end
    })

    local NoclipToggle = Tabs.Player:AddToggle("Noclip", {
        Title = "Noclip",
        Default = false,
        Callback = function(enabled)
            if enabled then
                Noclip = true
                if player.Character then
                    player.Character.Torso.CanCollide = false;
                    player.Character.Head.CanCollide = false
                end
            else
                Noclip = false
                if player.Character then
                    player.Character.Torso.CanCollide = true;
                    player.Character.Head.CanCollide = true
                end
            end
        end
    })

local RejoinButton = Tabs.Utilities:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the game",
        Callback = function()
            Window:Dialog({
                Title = "Polar Admin",
                Content = "Are you sure you want to rejoin?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoining...",
                            Duration = 8
                        })
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            Fluent:Notify({
                            Title = "Polar Admin",
                            Content = "Rejoin Canceled",
                            Duration = 8
                        })
                        end
                    }
                }
            })
        end
    })

local CopyDiscordNJoinDiscord = Tabs.Info:AddButton({
        Title = "Discord",
        Description = "Copys the discord invite to your clipboard",
        Callback = function()
            setclipboard("https://discord.gg/63pT8eeVkJ")
            local Request = syn and syn.request or request
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "63pT8eeVkJ"
                    },
                    nonce = game.HttpService:GenerateGUID(false)
                }),
            })
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Automatically joined discord, if it didn't work the link has been copied to your clipboard.",
            Duration = 8
        })
        end
    })

local InfiniteYeild = Tabs.UniversalScripts:AddButton({
        Title = "Infinite Yeild",
        Description = "Executes Infinite Yeild",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Infinite Yeild.",
            Duration = 8
        })
        end
    })

local ChatSpy = Tabs.UniversalScripts:AddButton({
        Title = "Chat Spy",
        Description = "Executes Chat Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DaCoderMane/MyRobloxScripts/main/ChatSpy.lua"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Chat Spy.",
            Duration = 8
        })
        end
    })

local ChatBypasser = Tabs.UniversalScripts:AddButton({
        Title = "Vadrifts Chat Bypasser",
        Description = "Executes Vadrifts Chat Bypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
            Fluent:Notify({
            Title = "Polar Admin",
            Content = "Executed Vadrifts Chat Bypasser.",
            Duration = 8
        })
        end
    })
end

Fluent:Notify({
    Title = "Polar Admin (Universal)",
    Content = "Polar Admin (Universal) Loaded!!",
    SubContent = "Join the discord!",
    Duration = 8
})

Fluent:Notify({
    Title = "Polar Admin (Universal)",
    Content = "If your sliding around in your game, mess with the hipheight, it usually breaks in some games!!!",
    Duration = 60
})

SaveManager:LoadAutoloadConfig()
end

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Noclip and player.Character then 
            player.Character.Torso.CanCollide = false;
            player.Character.Head.CanCollide = false
        end
    end)
end)