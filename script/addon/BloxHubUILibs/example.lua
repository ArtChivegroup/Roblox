--[[
    ═══════════════════════════════════════════════════════════════
    🧩 BloxHub GUI Template - Complete Usage Examples
    ═══════════════════════════════════════════════════════════════
    
    This file demonstrates all features and API usage of BloxHub
    Copy any example below to use in your own scripts!
    
    Source: https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua
]]--

-- ═══════════════════════════════════════════════════════════════
-- 📦 EXAMPLE 1: Basic Load
-- ═══════════════════════════════════════════════════════════════

print("Example 1: Basic Load")
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
print("✅ BloxHub loaded successfully!")
print("Press Left Alt to toggle GUI")

wait(2) -- Wait to see output

-- ═══════════════════════════════════════════════════════════════
-- 📦 EXAMPLE 2: Load with Error Handling
-- ═══════════════════════════════════════════════════════════════

print("\nExample 2: Safe Load with Error Handling")
local success, BloxHub = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
end)

if success then
    print("✅ BloxHub loaded successfully!")
    print("🎯 GUI is ready to use")
else
    warn("❌ Failed to load BloxHub:", BloxHub)
    return
end

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎨 EXAMPLE 3: Custom Theme Colors
-- ═══════════════════════════════════════════════════════════════

print("\nExample 3: Custom Theme")
-- Note: You need to modify before loading, so this is a demo
-- In practice, you'd edit the source or use a modified version

BloxHub:Notify("Theme", "Using custom purple theme!", 3, "info")

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🔔 EXAMPLE 4: Notification System
-- ═══════════════════════════════════════════════════════════════

print("\nExample 4: Notification System")

-- Info notification
BloxHub:Notify("Info", "This is an information message", 3, "info")
wait(1)

-- Success notification
BloxHub:Notify("Success", "Operation completed successfully!", 3, "success")
wait(1)

-- Warning notification
BloxHub:Notify("Warning", "This is a warning message", 3, "warning")
wait(1)

-- Error notification
BloxHub:Notify("Error", "Something went wrong!", 3, "error")

wait(3)

-- ═══════════════════════════════════════════════════════════════
-- 🎯 EXAMPLE 5: Creating Custom Buttons
-- ═══════════════════════════════════════════════════════════════

print("\nExample 5: Custom Feature Buttons")

-- Simple button
BloxHub:CreateButton("Noclip", function()
    print("Noclip button clicked!")
    BloxHub:Notify("Noclip", "Noclip toggled!", 2, "success")
end)

-- Button with state tracking
local infiniteJumpEnabled = false
BloxHub:CreateButton("Infinite Jump", function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    local status = infiniteJumpEnabled and "enabled" or "disabled"
    BloxHub:Notify("Infinite Jump", "Infinite Jump " .. status, 2, 
        infiniteJumpEnabled and "success" or "info")
    print("Infinite Jump:", infiniteJumpEnabled)
end)

-- Button with complex logic
BloxHub:CreateButton("Teleport Lobby", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        BloxHub:Notify("Teleport", "Teleported to lobby!", 2, "success")
    else
        BloxHub:Notify("Error", "Character not found!", 2, "error")
    end
end)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎚️ EXAMPLE 6: Creating Custom Sliders
-- ═══════════════════════════════════════════════════════════════

print("\nExample 6: Custom Sliders")

-- Walk Speed Slider
local speedSlider = BloxHub:CreateSliderAPI(
    "Walk Speed",
    16,    -- Min
    200,   -- Max
    16,    -- Default
    function(value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
            print("Walk Speed set to:", value)
        end
    end
)

-- Jump Power Slider
local jumpSlider = BloxHub:CreateSliderAPI(
    "Jump Power",
    50,    -- Min
    300,   -- Max
    50,    -- Default
    function(value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = value
            print("Jump Power set to:", value)
        end
    end
)

-- FOV Slider
local fovSlider = BloxHub:CreateSliderAPI(
    "Field of View",
    70,    -- Min
    120,   -- Max
    70,    -- Default
    function(value)
        workspace.CurrentCamera.FieldOfView = value
        print("FOV set to:", value)
    end
)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎮 EXAMPLE 7: Complete Feature Implementation (ESP)
-- ═══════════════════════════════════════════════════════════════

print("\nExample 7: ESP Implementation")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- ESP Distance Slider
local espDistance = 1000
BloxHub:CreateSliderAPI("ESP Distance", 100, 5000, 1000, function(value)
    espDistance = value
end)

-- Simple ESP Logic (monitoring built-in ESP feature)
local espConnection
espConnection = RunService.RenderStepped:Connect(function()
    if BloxHub.Features.ESP then
        -- Your ESP rendering code here
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character then
                local character = player.Character
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                
                if rootPart then
                    local distance = (Players.LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    
                    if distance <= espDistance then
                        -- ESP is enabled and player is in range
                        -- Add your ESP box/text rendering here
                        -- print("ESP Active for:", player.Name, "Distance:", math.floor(distance))
                    end
                end
            end
        end
    end
end)

print("✅ ESP system initialized")

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🚀 EXAMPLE 8: Fly System with Speed Control
-- ═══════════════════════════════════════════════════════════════

print("\nExample 8: Fly System")

local flyEnabled = false
local flySpeed = 50
local flyConnection

-- Create Fly Button
BloxHub:CreateButton("Fly Mode", function()
    flyEnabled = not flyEnabled
    local status = flyEnabled and "enabled" or "disabled"
    BloxHub:Notify("Fly", "Fly mode " .. status, 2, flyEnabled and "success" or "info")
    
    local player = game.Players.LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            if flyEnabled then
                -- Enable fly
                humanoid.PlatformStand = true
            else
                -- Disable fly
                humanoid.PlatformStand = false
            end
        end
    end
end)

-- Create Fly Speed Slider
local flySpeedSlider = BloxHub:CreateSliderAPI(
    "Fly Speed",
    10,    -- Min
    500,   -- Max
    50,    -- Default
    function(value)
        flySpeed = value
        print("Fly Speed:", value)
    end
)

-- Fly Movement Logic
local UserInputService = game:GetService("UserInputService")
flyConnection = RunService.Heartbeat:Connect(function()
    if flyEnabled then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local camera = workspace.CurrentCamera
            local moveDirection = Vector3.new(0, 0, 0)
            
            -- WASD Movement
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector
            end
            
            -- Space/Shift for up/down
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            -- Apply movement
            if moveDirection.Magnitude > 0 then
                rootPart.Velocity = moveDirection.Unit * flySpeed
            else
                rootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

print("✅ Fly system initialized")

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎯 EXAMPLE 9: Aimbot with FOV Circle
-- ═══════════════════════════════════════════════════════════════

print("\nExample 9: Aimbot System")

local aimbotFOV = 90
local aimbotSmooth = 0.5
local aimbotConnection

-- Aimbot FOV Slider
BloxHub:CreateSliderAPI("Aimbot FOV", 30, 180, 90, function(value)
    aimbotFOV = value
end)

-- Aimbot Smoothness Slider
BloxHub:CreateSliderAPI("Aim Smooth", 0, 100, 50, function(value)
    aimbotSmooth = value / 100
end)

-- Aimbot Logic (simplified)
aimbotConnection = RunService.RenderStepped:Connect(function()
    if BloxHub.Features.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local player = game.Players.LocalPlayer
        local camera = workspace.CurrentCamera
        local closestPlayer = nil
        local shortestDistance = math.huge
        
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                local targetChar = targetPlayer.Character
                local targetHead = targetChar:FindFirstChild("Head")
                
                if targetHead then
                    local screenPos, onScreen = camera:WorldToViewportPoint(targetHead.Position)
                    if onScreen then
                        local mousePos = UserInputService:GetMouseLocation()
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        
                        if distance < shortestDistance and distance < aimbotFOV then
                            closestPlayer = targetHead
                            shortestDistance = distance
                        end
                    end
                end
            end
        end
        
        if closestPlayer then
            -- Smooth aim towards target
            camera.CFrame = camera.CFrame:Lerp(
                CFrame.new(camera.CFrame.Position, closestPlayer.Position),
                aimbotSmooth
            )
        end
    end
end)

print("✅ Aimbot system initialized")

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🛡️ EXAMPLE 10: God Mode Toggle
-- ═══════════════════════════════════════════════════════════════

print("\nExample 10: God Mode")

local godModeEnabled = false
local originalHealth = 100

BloxHub:CreateButton("God Mode", function()
    local player = game.Players.LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            godModeEnabled = not godModeEnabled
            
            if godModeEnabled then
                originalHealth = humanoid.MaxHealth
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
                BloxHub:Notify("God Mode", "God Mode enabled!", 2, "success")
            else
                humanoid.MaxHealth = originalHealth
                humanoid.Health = originalHealth
                BloxHub:Notify("God Mode", "God Mode disabled", 2, "info")
            end
        end
    end
end)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🔧 EXAMPLE 11: Accessing Feature States
-- ═══════════════════════════════════════════════════════════════

print("\nExample 11: Feature State Monitoring")

-- Monitor all feature states
spawn(function()
    while wait(5) do
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print("📊 Current Feature States:")
        for feature, state in pairs(BloxHub.Features) do
            print(string.format("  %s: %s", feature, tostring(state)))
        end
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
end)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 💾 EXAMPLE 12: Manual Save/Load
-- ═══════════════════════════════════════════════════════════════

print("\nExample 12: Settings Management")

-- Create a button to manually save settings
BloxHub:CreateButton("Save Settings", function()
    BloxHub:SaveSettings()
    BloxHub:Notify("Settings", "Settings saved successfully!", 2, "success")
end)

-- Create a button to reload settings
BloxHub:CreateButton("Load Settings", function()
    local loaded = BloxHub:LoadSettings()
    if loaded then
        BloxHub:Notify("Settings", "Settings loaded successfully!", 2, "success")
    else
        BloxHub:Notify("Settings", "No saved settings found", 2, "info")
    end
end)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎮 EXAMPLE 13: Game-Specific Integration
-- ═══════════════════════════════════════════════════════════════

print("\nExample 13: Game-Specific Features")

-- Detect game and add specific features
local gameId = game.PlaceId

if gameId == 142823291 then
    -- Murder Mystery 2
    BloxHub:CreateButton("Collect Coins", function()
        BloxHub:Notify("MM2", "Collecting coins...", 2, "info")
        -- Add coin collection logic here
    end)
    
elseif gameId == 606849621 then
    -- Jailbreak
    BloxHub:CreateButton("Auto Rob", function()
        BloxHub:Notify("Jailbreak", "Auto rob started!", 2, "success")
        -- Add auto rob logic here
    end)
    
else
    -- Universal features
    BloxHub:CreateButton("Game Info", function()
        BloxHub:Notify("Game", "Game ID: " .. tostring(gameId), 3, "info")
    end)
end

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🎨 EXAMPLE 14: Visual Effects
-- ═══════════════════════════════════════════════════════════════

print("\nExample 14: Visual Effects")

local fullbrightEnabled = false

BloxHub:CreateButton("Fullbright", function()
    fullbrightEnabled = not fullbrightEnabled
    local lighting = game:GetService("Lighting")
    
    if fullbrightEnabled then
        lighting.Brightness = 2
        lighting.ClockTime = 14
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        BloxHub:Notify("Fullbright", "Fullbright enabled!", 2, "success")
    else
        lighting.Brightness = 1
        lighting.ClockTime = 12
        lighting.FogEnd = 100000
        lighting.GlobalShadows = true
        lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
        BloxHub:Notify("Fullbright", "Fullbright disabled", 2, "info")
    end
end)

wait(2)

-- ═══════════════════════════════════════════════════════════════
-- 🔄 EXAMPLE 15: Auto-Farm Template
-- ═══════════════════════════════════════════════════════════════

print("\nExample 15: Auto-Farm System")

local autoFarmEnabled = false
local farmConnection

BloxHub:CreateButton("Auto Farm", function()
    autoFarmEnabled = not autoFarmEnabled
    BloxHub:Notify("Auto Farm", "Auto Farm " .. (autoFarmEnabled and "started" or "stopped"), 2,
        autoFarmEnabled and "success" or "info")
end)

-- Farm delay slider
local farmDelay = 1
BloxHub:CreateSliderAPI("Farm Delay", 0.1, 5, 1, function(value)
    farmDelay = value
end)

-- Farm logic
spawn(function()
    while wait(farmDelay) do
        if autoFarmEnabled then
            -- Your farming logic here
            -- Example: Collect nearest item, kill nearest enemy, etc.
            print("Farming... (every " .. farmDelay .. " seconds)")
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- 📊 FINAL MESSAGE
-- ═══════════════════════════════════════════════════════════════

wait(3)

-- Keep script running
BloxHub:Notify("Examples", "All 15 examples loaded! Check console.", 5, "success")
