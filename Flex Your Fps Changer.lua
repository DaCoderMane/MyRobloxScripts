local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Executor = getexecutorname()

local Enabled = false
local RandomFps = false
local Fps = ""

local Window = Rayfield:CreateWindow({
    Name = "Fps Changer | " .. Executor,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Cheezit",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Config"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
       Title = "Fps Changer | Key System",
       Subtitle = "Key System",
       Note = "Get the key yourself bitch ass",
       FileName = "KeyvyWevy",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Key"}
    }
})

local Fps1 = Window:CreateTab("Fps Changer", 4483362458)
local fps2 = Window:CreateTab("Fps Changer | Words", 4483362458)
local fps3 = Window:CreateTab("Fps Changer | Sentances", 4483362458)
local fps4 = Window:CreateTab("Fps Changer | Websites", 4483362458)

-- Toggle
Fps1:CreateToggle({
    Name = "Fps Changer",
    CurrentValue = false,
    Flag = "ChangerToggle",
    Callback = function(bool)
        Enabled = bool
    end,
})

Fps1:CreateToggle({
    Name = "Random high fps",
    CurrentValue = false,
    Flag = "ChangerToggle",
    Callback = function(bool)
        RandomFps = bool
    end,
})

Fps1:CreateInput({
   Name = "Fps Text",
   PlaceholderText = "Text here..",
   RemoveTextAfterFocusLost = false,
   Callback = function(input)
        Fps = input
   end,
})

-- Presets | Words
fps2:CreateButton({
    Name = "KKK",
    Callback = function()
        Fps = "KKK"
    end,
})

fps2:CreateButton({
    Name = "9/11",
    Callback = function()
        Fps = "9/11"
    end,
})

fps2:CreateButton({
    Name = "Nigger",
    Callback = function()
        Fps = "Nigger"
    end,
})

fps2:CreateButton({
    Name = "NiggerBeater",
    Callback = function()
        Fps = "NiggerBeater"
    end,
})

-- Presets | Sentances
fps3:CreateButton({
    Name = "Adolf Hitler",
    Callback = function()
        Fps = "Adolf Hitler"
    end,
})

fps3:CreateButton({
    Name = "Hail hitler",
    Callback = function()
        Fps = "Hail hitler"
    end,
})

fps3:CreateButton({
    Name = "Kill the niggers",
    Callback = function()
        Fps = "Kill the niggers"
    end,
})

fps3:CreateButton({
    Name = "ALLAH AHKBAR",
    Callback = function()
        Fps = "ALLAH AHKBAR"
    end,
})

fps3:CreateButton({
    Name = "Pearl Harbor",
    Callback = function()
        Fps = "Pearl Harbor"
    end,
})

fps3:CreateButton({
    Name = "Kill the jews",
    Callback = function()
        Fps = "Kill the jews"
    end,
})

fps3:CreateButton({
    Name = "Sir, they hit the second tower..",
    Callback = function()
        Fps = "Sir, they hit the second tower.."
    end,
})

fps3:CreateButton({
    Name = "DOWN WITH THE TOWERS",
    Callback = function()
        Fps = "DOWN WITH THE TOWERS"
    end,
})

fps3:CreateButton({
    Name = "Big oily breasts massaging your long cock",
    Callback = function()
        Fps = "Big oily breasts massaging your long cock"
    end,
})

-- Presets | Websites
fps4:CreateButton({
    Name = "pornhub.com",
    Callback = function()
        Fps = "pornhub.com"
    end,
})

fps4:CreateButton({
    Name = "xvideos.com",
    Callback = function()
        Fps = "xvideos.com"
    end,
})

fps4:CreateButton({
    Name = "xhamster.com",
    Callback = function()
        Fps = "xhamster.com"
    end,
})

fps4:CreateButton({
    Name = "onlyfans.com",
    Callback = function()
        Fps = "onlyfans.com"
    end,
})

fps4:CreateButton({
    Name = "hotasianmilfs.com",
    Callback = function()
        Fps = "hotasianmilfs.com"
    end,
})

fps4:CreateButton({
    Name = "hentaihaven.xxx",
    Callback = function()
        Fps = "hentaihaven.xxx"
    end,
})

fps4:CreateButton({
    Name = "hentai.tv",
    Callback = function()
        Fps = "hentai.tv"
    end,
})

fps4:CreateButton({
    Name = "hanime.tv",
    Callback = function()
        Fps = "hanime.tv"
    end,
})

fps4:CreateButton({
    Name = "hentaicity.com",
    Callback = function()
        Fps = "hentaicity.com"
    end,
})

fps4:CreateButton({
    Name = "hentaidude.com",
    Callback = function()
        Fps = "hentaidude.com"
    end,
})

while true do
    if Enabled == true then
        if RandomFps == true then
            MathRandom = math.random(471, 613)
            game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(MathRandom)
            wait(0.26)
        else
            game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(Fps)
            wait(0.01)
        end
    else
        wait(0.1)
    end
end
