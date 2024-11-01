local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local Enabled = false
local Rand1 = false
local Rand2 = false
local InfFPS = false
local Fps = ""

local Executor = getexecutorname()

local UI = Mercury:Create{
    Name = "Mercury | "..Executor,
    Size = UDim2.fromOffset(600, 350),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/DaCoderMane"
}

local Fps1 = UI:Tab{
	Name = "Fps Changer",
	Icon = "rbxassetid://8569322835"
}
local Fps2 = UI:Tab{
	Name = "Word's",
	Icon = "rbxassetid://8569322835"
}
local Fps3 = UI:Tab{
	Name = "Sentance's",
	Icon = "rbxassetid://8569322835"
}
local Fps4 = UI:Tab{
	Name = "Website's",
	Icon = "rbxassetid://8569322835"
}

-- Main Settings
Fps1:Toggle{
	Name = "Fps Changer",
	StartingState = false,
	Description = "Toggles the Fps Changer",
	Callback = function(bool)
        Enabled = bool
    end
}
Fps1:Toggle{
	Name = "Random High Fps",
	StartingState = false,
	Description = "Changes your Fps to a random number 471 - 613 Fps",
	Callback = function(bool)
        Rand1 = bool
    end
}
Fps1:Toggle{
	Name = "Random High Fps",
	StartingState = false,
	Description = "Changes your Fps to a random number 3712 - 5362 Fps",
	Callback = function(bool)
        Rand2 = bool
    end
}
Fps1:Toggle{
	Name = "Infinite FPS",
	StartingState = false,
	Description = "Changes your Fps to | math.huge",
	Callback = function(bool)
        InfFPS = bool
    end
}
Fps1:Textbox{
	Name = "Fps Text",
    Description = "Changes your Fps to the given input",
	Callback = function(input)
        Fps = input
    end
}

-- Word Presets
Fps2:Button{
	Name = "KKK",
	Description = "Changes your Fps to | KKK",
	Callback = function()
        Fps = "KKK"
    end
}
Fps2:Button{
	Name = "9/11",
	Description = "Changes your Fps to | 9/11",
	Callback = function()
        Fps = "9/11"
    end
}
Fps2:Button{
	Name = "Nigger",
	Description = "Changes your Fps to | Nigger",
	Callback = function()
        Fps = "Nigger"
    end
}
Fps2:Button{
	Name = "NiggerBeater",
	Description = "Changes your Fps to | NiggerBeater",
	Callback = function()
        Fps = "NiggerBeater"
    end
}
Fps2:Button{
	Name = "Bitch",
	Description = "Changes your Fps to | Bitch",
	Callback = function()
        Fps = "Bitch"
    end
}

-- Sentance Presets
Fps3:Button{
	Name = "Adolf Hitler",
	Description = "Changes your Fps to | Adolf Hitler",
	Callback = function()
        Fps = "Adolf Hitler"
    end
}
Fps3:Button{
	Name = "Hail hitler",
	Description = "Changes your Fps to | Hail hitler",
	Callback = function()
        Fps = "Hail hitler"
    end
}
Fps3:Button{
	Name = "Kill the niggers",
	Description = "Changes your Fps to | Kill the niggers",
	Callback = function()
        Fps = "Kill the niggers"
    end
}
Fps3:Button{
	Name = "ALLAH AHKBAR",
	Description = "Changes your Fps to | ALLAH AHKBAR",
	Callback = function()
        Fps = "ALLAH AHKBAR"
    end
}
Fps3:Button{
	Name = "Pearl Harbor",
	Description = "Changes your Fps to | Pearl Harbor",
	Callback = function()
        Fps = "Pearl Harbor"
    end
}
Fps3:Button{
	Name = "Kill the jews",
	Description = "Changes your Fps to | Kill the jews",
	Callback = function()
        Fps = "Kill the jews"
    end
}
Fps3:Button{
	Name = "Sir, they hit the second tower..",
	Description = "Changes your Fps to | Sir, they hit the second tower..",
	Callback = function()
        Fps = "Sir, they hit the second tower.."
    end
}
Fps3:Button{
	Name = "DOWN WITH THE TOWERS",
	Description = "Changes your Fps to | DOWN WITH THE TOWERS",
	Callback = function()
        Fps = "DOWN WITH THE TOWERS"
    end
}
Fps3:Button{
	Name = "Big oily breasts massaging your long cock",
	Description = "Changes your Fps to | Big oily breasts massaging your long cock",
	Callback = function()
        Fps = "Big oily breasts massaging your long cock"
    end
}

-- Website Presets
Fps4:Button{
	Name = "pornhub.com",
	Description = "Changes your Fps to | pornhub.com",
	Callback = function()
        Fps = "pornhub.com"
    end
}
Fps4:Button{
	Name = "xvideos.com",
	Description = "Changes your Fps to | xvideos.com",
	Callback = function()
        Fps = "xvideos.com"
    end
}
Fps4:Button{
	Name = "xhamster.com",
	Description = "Changes your Fps to | xhamster.com",
	Callback = function()
        Fps = "xhamster.com"
    end
}
Fps4:Button{
	Name = "onlyfans.com",
	Description = "Changes your Fps to | onlyfans.com",
	Callback = function()
        Fps = "onlyfans.com"
    end
}
Fps4:Button{
	Name = "hotasianmilfs.com",
	Description = "Changes your Fps to | hotasianmilfs.com",
	Callback = function()
        Fps = "hotasianmilfs.com"
    end
}
Fps4:Button{
	Name = "hentaihaven.xxx",
	Description = "Changes your Fps to | hentaihaven.xxx",
	Callback = function()
        Fps = "hentaihaven.xxx"
    end
}
Fps4:Button{
	Name = "hentai.tv",
	Description = "Changes your Fps to | hentai.tv",
	Callback = function()
        Fps = "hentai.tv"
    end
}
Fps4:Button{
	Name = "hanime.tv",
	Description = "Changes your Fps to | hanime.tv",
	Callback = function()
        Fps = "hanime.tv"
    end
}
Fps4:Button{
	Name = "hentaicity.com",
	Description = "Changes your Fps to | hentaicity.com",
	Callback = function()
        Fps = "hentaicity.com"
    end
}
Fps4:Button{
	Name = "hentaidude.com",
	Description = "Changes your Fps to | hentaidude.com",
	Callback = function()
        Fps = "hentaidude.com"
    end
}

while true do
    if Enabled == true then
        if Rand1 == true then
            MathRandom = math.random(471, 613)
            game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(MathRandom)
            wait(0.26)
        elseif Rand2 == true then
            MathRandom = math.random(3712, 5362)
            game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(MathRandom)
            wait(0.26)
		elseif InfFPS == true then
			game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(math.huge)
            wait(0.01)
        else
            game:GetService("ReplicatedStorage").FPSUpdateEventIKnowYouReCheater:FireServer(Fps)
            wait(0.01)
        end
    else
        wait(0.1)
    end
end
