getgenv().speed = {
    enabled = false,     
    speed = 16,
    control = false,
    friction = 2.0,
    keybind = Enum.KeyCode.KeypadDivide
}

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function setSpeed(p, s)
    local character = p.Character or p.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = s
    end
end

local function enhanceControl(p, reset)
    local character = p.Character or p.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        if reset then
            rootPart.CustomPhysicalProperties = PhysicalProperties.new()
        else
            rootPart.CustomPhysicalProperties = PhysicalProperties.new(
                0.7,
                getgenv().speed.friction, 
                0.5,
                1.0,
                0.5 
            )
        end
    end
end

local function applySpeedBoost(p)
    if getgenv().speed.enabled then
        setSpeed(p, getgenv().speed.speed)
        if getgenv().speed.control then
            enhanceControl(p, false)
        end
    else
        setSpeed(p, 16)
        if getgenv().speed.control then
            enhanceControl(p, true)
        end
    end
end

local function toggleSpeedBoost()
    getgenv().speed.enabled = not getgenv().speed.enabled
    applySpeedBoost(player)
end

if player.Character then
    applySpeedBoost(player)
end

player.CharacterAdded:Connect(function()
    applySpeedBoost(player)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == getgenv().speed.keybind then
        toggleSpeedBoost()
    end
end)

RunService.RenderStepped:Connect(function()
    if getgenv().speed.enabled then
        setSpeed(player, getgenv().speed.speed)
    end
end)
