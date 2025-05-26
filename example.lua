local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Speed Modules - Example", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local speed = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidi50-lol/Speed/refs/heads/main/speed.lua"))()

local Tab = Window:MakeTab({
	Name = "Speed",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Speed:","This is the example usage of this speed modules")

Tab:AddToggle({
	Name = "Active Speed",
	Default = false,
	Callback = function(Value)
		getgenv().speed.enabled = Value
	end    
})

Tab:AddSlider({
	Name = "Speed Amount",
	Min = 16,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 5,
	ValueName = "WS",
	Callback = function(Value)
		getgenv().speed.speed = Value
	end    
})

Tab:AddBind({
	Name = "Speed Bind (Libray Not Supported)",
	Default = Enum.KeyCode.KeypadDivide,
	Hold = false,
	Callback = function(keybind)
		getgenv().speed.keybind = keybind
	end    
})
