-- =============================================
-- BloxHub GUI Framework - Complete Showcase
-- =============================================

-- Load BloxHub dengan error handling lengkap
local success, BloxHub = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
end)

if not success then
    warn("Failed to load BloxHub:", BloxHub)
    return
end

-- Create main window dengan konfigurasi lengkap
local Window = BloxHub:CreateWindow("BloxHub Complete Showcase", {
    Hotkey = Enum.KeyCode.RightControl,
    Resizable = true
})

-- Buat semua tab
local MainTab = Window:CreateTab("Main", {Icon = "🏠"})
local CombatTab = Window:CreateTab("Combat", {Icon = "⚔️"})
local VisualTab = Window:CreateTab("Visual", {Icon = "👁️"})
local PlayerTab = Window:CreateTab("Player", {Icon = "👤"})
local SettingsTab = Window:CreateTab("Settings", {Icon = "⚙️"})
local ScriptsTab = Window:CreateTab("Scripts", {Icon = "📜"})
local TeleportTab = Window:CreateTab("Teleport", {Icon = "📍"})
local InfoTab = Window:CreateTab("Info", {Icon = "ℹ️"})

-- ================================
-- MAIN TAB - Fitur Utama
-- ================================

MainTab:AddSection("Main Controls")

-- Button dengan multiple actions
MainTab:AddButton("Execute All Features", function()
    Window:Notify("System", "Executing all features...", 3, "info")
    wait(0.5)
    Window:Notify("Combat", "Aimbot activated", 2, "success")
    wait(0.5)
    Window:Notify("Visual", "ESP enabled", 2, "success")
    wait(0.5)
    Window:Notify("Player", "God mode enabled", 2, "success")
    wait(0.5)
    Window:Notify("System", "All features activated!", 3, "success")
end, {
    Icon = "🚀",
    Color = Color3.fromRGB(255, 215, 0)
})

-- Toggle untuk auto farm
local autoFarmToggle = MainTab:AddToggle("Auto Farm", false, function(state)
    if state then
        Window:Notify("Auto Farm", "Started farming automatically", 3, "success")
        spawn(function()
            while autoFarmToggle:GetValue() do
                wait(1)
                -- Simulate farming action
                print("Farming...")
            end
        end)
    else
        Window:Notify("Auto Farm", "Stopped farming", 3, "warning")
    end
end)

-- Toggle untuk auto click
local autoClickToggle = MainTab:AddToggle("Auto Click", false, function(state)
    if state then
        Window:Notify("Auto Click", "Auto clicking enabled", 2, "success")
        spawn(function()
            while autoClickToggle:GetValue() do
                wait(0.1)
                -- Simulate clicking
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                wait(0.05)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end
        end)
    else
        Window:Notify("Auto Click", "Auto clicking disabled", 2, "warning")
    end
end)

-- Slider untuk speed boost
local speedSlider = MainTab:AddSlider("Speed Boost", 1, 10, 1, function(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 * value
    end
end)

-- Slider untuk jump boost
local jumpSlider = MainTab:AddSlider("Jump Boost", 1, 10, 1, function(value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 * value
    end
end)

MainTab:AddSection("Quick Actions")

-- Button untuk heal
MainTab:AddButton("Full Heal", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
    end
    Window:Notify("Heal", "Fully healed!", 2, "success")
end, {
    Icon = "💚",
    Color = Color3.fromRGB(0, 255, 0)
})

-- Button untuk refill energy
MainTab:AddButton("Refill Energy", function()
    Window:Notify("Energy", "Energy refilled!", 2, "success")
end, {
    Icon = "⚡",
    Color = Color3.fromRGB(255, 255, 0)
})

-- Button untuk clear inventory
MainTab:AddButton("Clear Inventory", function()
    Window:Notify("Inventory", "Inventory cleared!", 2, "info")
end, {
    Icon = "🗑️",
    Color = Color3.fromRGB(255, 0, 0)
})

-- ================================
-- COMBAT TAB - Fitur Pertarungan
-- ================================

CombatTab:AddSection("Aimbot")

-- Toggle untuk aimbot
local aimbotToggle = CombatTab:AddToggle("Aimbot", false, function(state)
    if state then
        Window:Notify("Aimbot", "Aimbot enabled", 2, "success")
        _G.AimbotEnabled = true
    else
        Window:Notify("Aimbot", "Aimbot disabled", 2, "warning")
        _G.AimbotEnabled = false
    end
end)

-- Dropdown untuk aimbot target
local aimbotTargetDropdown = CombatTab:AddDropdown("Aim Target", 
    {"Head", "Chest", "Torso", "Random"}, 
    1, 
    function(option, index)
        _G.AimbotTarget = option
        Window:Notify("Aimbot", "Targeting: " .. option, 2, "info")
    end
)

-- Slider untuk aimbot smoothness
local aimbotSmoothSlider = CombatTab:AddSlider("Aim Smoothness", 1, 100, 50, function(value)
    _G.AimbotSmoothness = value
    print("Aim smoothness set to:", value)
end)

-- Slider untuk aimbot FOV
local aimbotFovSlider = CombatTab:AddSlider("Aimbot FOV", 10, 360, 90, function(value)
    _G.AimbotFOV = value
    print("Aimbot FOV set to:", value)
end)

CombatTab:AddSection("Combat Features")

-- Toggle untuk triggerbot
local triggerbotToggle = CombatTab:AddToggle("Triggerbot", false, function(state)
    if state then
        Window:Notify("Triggerbot", "Triggerbot enabled", 2, "success")
        _G.TriggerbotEnabled = true
    else
        Window:Notify("Triggerbot", "Triggerbot disabled", 2, "warning")
        _G.TriggerbotEnabled = false
    end
end)

-- Toggle untuk wall bang
local wallBangToggle = CombatTab:AddToggle("Wall Bang", false, function(state)
    if state then
        Window:Notify("Wall Bang", "Wall bang enabled", 2, "success")
    else
        Window:Notify("Wall Bang", "Wall bang disabled", 2, "warning")
    end
end)

-- Toggle untuk no recoil
local noRecoilToggle = CombatTab:AddToggle("No Recoil", false, function(state)
    if state then
        Window:Notify("No Recoil", "No recoil enabled", 2, "success")
    else
        Window:Notify("No Recoil", "No recoil disabled", 2, "warning")
    end
end)

-- Toggle untuk instant kill
local instantKillToggle = CombatTab:AddToggle("Instant Kill", false, function(state)
    if state then
        Window:Notify("Instant Kill", "Instant kill enabled", 2, "success")
    else
        Window:Notify("Instant Kill", "Instant kill disabled", 2, "warning")
    end
end)

CombatTab:AddSection("Weapon Settings")

-- Dropdown untuk weapon type
local weaponDropdown = CombatTab:AddDropdown("Weapon Type", 
    {"All", "Pistol", "Rifle", "Sniper", "Shotgun", "SMG"}, 
    1, 
    function(option, index)
        Window:Notify("Weapon", "Weapon type: " .. option, 2, "info")
    end
)

-- Slider untuk fire rate
local fireRateSlider = CombatTab:AddSlider("Fire Rate", 1, 100, 50, function(value)
    print("Fire rate set to:", value)
end)

-- ================================
-- VISUAL TAB - Fitur Visual
-- ================================

VisualTab:AddSection("ESP Settings")

-- Toggle untuk ESP
local espToggle = VisualTab:AddToggle("ESP", false, function(state)
    if state then
        Window:Notify("ESP", "ESP enabled", 2, "success")
        _G.ESPEnabled = true
    else
        Window:Notify("ESP", "ESP disabled", 2, "warning")
        _G.ESPEnabled = false
    end
end)

-- Toggle untuk ESP boxes
local espBoxesToggle = VisualTab:AddToggle("ESP Boxes", false, function(state)
    if state then
        Window:Notify("ESP", "ESP boxes enabled", 2, "success")
    else
        Window:Notify("ESP", "ESP boxes disabled", 2, "warning")
    end
end)

-- Toggle untuk ESP names
local espNamesToggle = VisualTab:AddToggle("ESP Names", false, function(state)
    if state then
        Window:Notify("ESP", "ESP names enabled", 2, "success")
    else
        Window:Notify("ESP", "ESP names disabled", 2, "warning")
    end
end)

-- Toggle untuk ESP distance
local espDistanceToggle = VisualTab:AddToggle("ESP Distance", false, function(state)
    if state then
        Window:Notify("ESP", "ESP distance enabled", 2, "success")
    else
        Window:Notify("ESP", "ESP distance disabled", 2, "warning")
    end
end)

-- Toggle untuk ESP health
local espHealthToggle = VisualTab:AddToggle("ESP Health", false, function(state)
    if state then
        Window:Notify("ESP", "ESP health enabled", 2, "success")
    else
        Window:Notify("ESP", "ESP health disabled", 2, "warning")
    end
end)

-- Slider untuk ESP distance
local espDistanceSlider = VisualTab:AddSlider("ESP Distance", 100, 5000, 1000, function(value)
    _G.ESPDistance = value
    print("ESP distance set to:", value)
end)

VisualTab:AddSection("Chams")

-- Toggle untuk chams
local chamsToggle = VisualTab:AddToggle("Chams", false, function(state)
    if state then
        Window:Notify("Chams", "Chams enabled", 2, "success")
    else
        Window:Notify("Chams", "Chams disabled", 2, "warning")
    end
end)

-- Dropdown untuk chams color
local chamsColorDropdown = VisualTab:AddDropdown("Chams Color", 
    {"Red", "Blue", "Green", "Yellow", "Purple", "Orange", "Pink", "White"}, 
    1, 
    function(option, index)
        Window:Notify("Chams", "Chams color: " .. option, 2, "info")
    end
)

-- Slider untuk chams transparency
local chamsTransparencySlider = VisualTab:AddSlider("Chams Transparency", 0, 100, 50, function(value)
    print("Chams transparency set to:", value)
end)

VisualTab:AddSection("World Visuals")

-- Toggle untuk full bright
local fullBrightToggle = VisualTab:AddToggle("Full Bright", false, function(state)
    if state then
        Window:Notify("World", "Full bright enabled", 2, "success")
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 12
        game.Lighting.FogEnd = 100000
    else
        Window:Notify("World", "Full bright disabled", 2, "warning")
        game.Lighting.Brightness = 1
        game.Lighting.FogEnd = 1000
    end
end)

-- Toggle untuk no fog
local noFogToggle = VisualTab:AddToggle("No Fog", false, function(state)
    if state then
        Window:Notify("World", "No fog enabled", 2, "success")
        game.Lighting.FogEnd = 100000
    else
        Window:Notify("World", "No fog disabled", 2, "warning")
        game.Lighting.FogEnd = 1000
    end
end)

-- Toggle untuk night mode
local nightModeToggle = VisualTab:AddToggle("Night Mode", false, function(state)
    if state then
        Window:Notify("World", "Night mode enabled", 2, "success")
        game.Lighting.ClockTime = 0
    else
        Window:Notify("World", "Night mode disabled", 2, "warning")
        game.Lighting.ClockTime = 12
    end
end)

-- ================================
-- PLAYER TAB - Fitur Pemain
-- ================================

PlayerTab:AddSection("Movement")

-- Toggle untuk fly
local flyToggle = PlayerTab:AddToggle("Fly", false, function(state)
    if state then
        Window:Notify("Movement", "Fly enabled", 2, "success")
        _G.FlyEnabled = true
        -- Simple fly script
        local plr = game.Players.LocalPlayer
        local Humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        local mouse = plr:GetMouse()
        localplayer = plr
        if workspace:FindFirstChild(localplayer.Name) ~= nil then
            local character = workspace[localplayer.Name]
            local mouse = localplayer:GetMouse()
            local speed = 50
            local keys = {
                w = false,
                s = false,
                a = false,
                d = false,
                q = false,
                e = false
            }
            local move = {
                x = 0,
                y = 0,
                z = 0
            }
            
            mouse.KeyDown:Connect(function(key)
                if keys[key] ~= nil then
                    keys[key] = true
                end
            end)
            
            mouse.KeyUp:Connect(function(key)
                if keys[key] ~= nil then
                    keys[key] = false
                end
            end)
            
            game:GetService("RunService").Heartbeat:Connect(function()
                if _G.FlyEnabled then
                    move.x = 0
                    move.y = 0
                    move.z = 0
                    if keys.w then move.z = move.z + 1 end
                    if keys.s then move.z = move.z - 1 end
                    if keys.a then move.x = move.x - 1 end
                    if keys.d then move.x = move.x + 1 end
                    if keys.q then move.y = move.y + 1 end
                    if keys.e then move.y = move.y - 1 end
                    character:TranslateBy(move * speed * 0.1)
                end
            end)
        end
    else
        Window:Notify("Movement", "Fly disabled", 2, "warning")
        _G.FlyEnabled = false
    end
end)

-- Toggle untuk no clip
local noClipToggle = PlayerTab:AddToggle("No Clip", false, function(state)
    if state then
        Window:Notify("Movement", "No clip enabled", 2, "success")
        _G.NoClipEnabled = true
        game:GetService("RunService").Stepped:Connect(function()
            if _G.NoClipEnabled then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        Window:Notify("Movement", "No clip disabled", 2, "warning")
        _G.NoClipEnabled = false
    end
end)

-- Toggle untuk infinite jump
local infiniteJumpToggle = PlayerTab:AddToggle("Infinite Jump", false, function(state)
    if state then
        Window:Notify("Movement", "Infinite jump enabled", 2, "success")
        _G.InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJumpEnabled then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    else
        Window:Notify("Movement", "Infinite jump disabled", 2, "warning")
        _G.InfiniteJumpEnabled = false
    end
end)

-- Toggle untuk high jump
local highJumpToggle = PlayerTab:AddToggle("High Jump", false, function(state)
    if state then
        Window:Notify("Movement", "High jump enabled", 2, "success")
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
        end
    else
        Window:Notify("Movement", "High jump disabled", 2, "warning")
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end
end)

PlayerTab:AddSection("Character")

-- Toggle untuk god mode
local godModeToggle = PlayerTab:AddToggle("God Mode", false, function(state)
    if state then
        Window:Notify("Character", "God mode enabled", 2, "success")
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
        end
    else
        Window:Notify("Character", "God mode disabled", 2, "warning")
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
        end
    end
end)

-- Toggle untuk invisibility
local invisibilityToggle = PlayerTab:AddToggle("Invisibility", false, function(state)
    if state then
        Window:Notify("Character", "Invisibility enabled", 2, "success")
        if game.Players.LocalPlayer.Character then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0.5
                end
            end
        end
    else
        Window:Notify("Character", "Invisibility disabled", 2, "warning")
        if game.Players.LocalPlayer.Character then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 0
                end
            end
        end
    end
end)

-- Slider untuk character size
local sizeSlider = PlayerTab:AddSlider("Character Size", 0.5, 3, 1, function(value)
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:ScaleTo(value)
    end
end)

-- ================================
-- SETTINGS TAB - Pengaturan
-- ================================

SettingsTab:AddSection("UI Settings")

-- Dropdown untuk theme
local themeDropdown = SettingsTab:AddDropdown("UI Theme", 
    {"Default", "Dark", "Light", "Custom"}, 
    1, 
    function(option, index)
        if option == "Dark" then
            BloxHub:SetTheme("Dark")
        elseif option == "Light" then
            BloxHub:SetTheme("Light")
        else
            BloxHub:SetTheme("Default")
        end
        Window:Notify("UI", "Theme changed to: " .. option, 2, "success")
    end
)

-- Toggle untuk notifications
local notificationsToggle = SettingsTab:AddToggle("Show Notifications", true, function(state)
    print("Notifications:", state and "Enabled" or "Disabled")
end)

-- Slider untuk notification duration
local notificationDurationSlider = SettingsTab:AddSlider("Notification Duration", 1, 10, 3, function(value)
    print("Notification duration:", value, "seconds")
end)

SettingsTab:AddSection("Keybinds")

-- Keybind untuk toggle UI
local toggleUIKey = SettingsTab:AddKeybind("Toggle UI", Enum.KeyCode.RightControl, function(key)
    print("Toggle UI key changed to:", tostring(key))
end)

-- Keybind untuk panic mode
local panicKey = SettingsTab:AddKeybind("Panic Mode", Enum.KeyCode.P, function(key)
    print("Panic key changed to:", tostring(key))
end)

-- Setup panic mode
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == panicKey:GetValue() then
        -- Disable all features
        aimbotToggle:SetValue(false)
        espToggle:SetValue(false)
        flyToggle:SetValue(false)
        noClipToggle:SetValue(false)
        godModeToggle:SetValue(false)
        Window:Notify("Panic", "All features disabled!", 2, "warning")
    end
end)

SettingsTab:AddSection("Performance")

-- Toggle untuk performance mode
local performanceModeToggle = SettingsTab:AddToggle("Performance Mode", false, function(state)
    if state then
        Window:Notify("Performance", "Performance mode enabled", 2, "warning")
    else
        Window:Notify("Performance", "Performance mode disabled", 2, "success")
    end
end)

-- Slider untuk render distance
local renderDistanceSlider = SettingsTab:AddSlider("Render Distance", 50, 500, 200, function(value)
    print("Render distance set to:", value)
end)

-- ================================
-- SCRIPTS TAB - Script Executor
-- ================================

ScriptsTab:AddSection("Script Executor")

-- TextBox untuk script input
local scriptTextBox = ScriptsTab:AddTextBox("Script", "-- Enter your script here", function(text)
    _G.ScriptToExecute = text
    print("Script loaded")
end)

-- Button untuk execute script
ScriptsTab:AddButton("Execute Script", function()
    if _G.ScriptToExecute and _G.ScriptToExecute ~= "" then
        local success, result = pcall(function()
            return loadstring(_G.ScriptToExecute)()
        end)
        if success then
            Window:Notify("Executor", "Script executed successfully!", 2, "success")
        else
            Window:Notify("Executor", "Script error: " .. tostring(result), 3, "error")
        end
    else
        Window:Notify("Executor", "No script to execute", 2, "warning")
    end
end, {
    Icon = "▶️",
    Color = Color3.fromRGB(0, 255, 0)
})

-- Button untuk clear script
ScriptsTab:AddButton("Clear Script", function()
    scriptTextBox:SetValue("")
    _G.ScriptToExecute = nil
    Window:Notify("Executor", "Script cleared", 2, "info")
end, {
    Icon = "🗑️",
    Color = Color3.fromRGB(255, 0, 0)
})

ScriptsTab:AddSection("Popular Scripts")

-- Button untuk infinite yield
ScriptsTab:AddButton("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    Window:Notify("Executor", "Infinite Yield loaded", 2, "success")
end, {
    Icon = "♾️",
    Color = Color3.fromRGB(255, 255, 0)
})

-- Button untuk remote spy
ScriptsTab:AddButton("Remote Spy", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/78n/Ammonia/main/RemoteSpy.lua'))()
    Window:Notify("Executor", "Remote Spy loaded", 2, "success")
end, {
    Icon = "👁️",
    Color = Color3.fromRGB(0, 255, 255)
})

-- ================================
-- TELEPORT TAB - Teleportasi
-- ================================

TeleportTab:AddSection("Location Teleport")

-- Dropdown untuk lokasi
local locationDropdown = TeleportTab:AddDropdown("Select Location", 
    {"Spawn", "Shop", "Bank", "Arena", "VIP Area", "Safe Zone", "Boss Area", "Secret Area"}, 
    1, 
    function(option, index)
        print("Selected location:", option)
    end
)

-- Button untuk teleport
TeleportTab:AddButton("Teleport", function()
    local selectedLocation = locationDropdown:GetValue()
    local teleportPositions = {
        ["Spawn"] = CFrame.new(0, 10, 0),
        ["Shop"] = CFrame.new(100, 10, 100),
        ["Bank"] = CFrame.new(-100, 10, 100),
        ["Arena"] = CFrame.new(0, 10, 200),
        ["VIP Area"] = CFrame.new(200, 20, 200),
        ["Safe Zone"] = CFrame.new(-200, 10, -200),
        ["Boss Area"] = CFrame.new(300, 30, 300),
        ["Secret Area"] = CFrame.new(-300, 50, -300)
    }
    
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportPositions[selectedLocation] or CFrame.new(0, 10, 0)
        Window:Notify("Teleport", "Teleported to " .. selectedLocation, 2, "success")
    end
end, {
    Icon = "📍",
    Color = Color3.fromRGB(0, 255, 255)
})

TeleportTab:AddSection("Player Teleport")

-- TextBox untuk player name
local playerTextBox = TeleportTab:AddTextBox("Player Name", "Enter player name...", function(text)
    _G.TargetPlayer = text
end)

-- Button untuk teleport to player
TeleportTab:AddButton("Teleport to Player", function()
    if _G.TargetPlayer then
        local targetPlayer = game.Players:FindFirstChild(_G.TargetPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            Window:Notify("Teleport", "Teleported to " .. _G.TargetPlayer, 2, "success")
        else
            Window:Notify("Teleport", "Player not found", 2, "error")
        end
    else
        Window:Notify("Teleport", "No player specified", 2, "warning")
    end
end, {
    Icon = "👤",
    Color = Color3.fromRGB(255, 0, 255)
})

-- Button untuk bring player
TeleportTab:AddButton("Bring Player", function()
    if _G.TargetPlayer then
        local targetPlayer = game.Players:FindFirstChild(_G.TargetPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            targetPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            Window:Notify("Teleport", "Brought " .. _G.TargetPlayer, 2, "success")
        else
            Window:Notify("Teleport", "Player not found", 2, "error")
        end
    else
        Window:Notify("Teleport", "No player specified", 2, "warning")
    end
end, {
    Icon = "🔄",
    Color = Color3.fromRGB(0, 255, 0)
})

-- ================================
-- INFO TAB - Informasi
-- ================================

InfoTab:AddSection("About")

-- Label untuk informasi
InfoTab:AddLabel("BloxHub GUI Framework")
InfoTab:AddLabel("Version: 1.0.0")
InfoTab:AddLabel("Author: ArtChivegroup")
InfoTab:AddLabel("Status: Active")

InfoTab:AddSection("Game Info")

-- Label untuk game info
InfoTab:AddLabel("Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
InfoTab:AddLabel("Place ID: " .. game.PlaceId)
InfoTab:AddLabel("Players: " .. #game.Players:GetPlayers() .. "/20")
InfoTab:AddLabel("Server Time: " .. os.date("%H:%M:%S"))

InfoTab:AddSection("Statistics")

-- Label untuk statistics
InfoTab:AddLabel("Features Loaded: 50+")
InfoTab:AddLabel("Scripts Executed: 0")
InfoTab:AddLabel("Teleports: 0")
InfoTab:AddLabel("Runtime: " .. math.floor(tick()) .. "s")

InfoTab:AddSection("Help")

-- Button untuk tutorial
InfoTab:AddButton("Show Tutorial", function()
    Window:Notify("Tutorial", "Welcome to BloxHub!\n\n1. Use tabs to navigate\n2. Toggle features on/off\n3. Adjust values with sliders\n4. Execute scripts safely\n5. Press P for panic mode", 5, "info")
end, {
    Icon = "📖",
    Color = Color3.fromRGB(0, 123, 255)
})

-- Button untuk discord
InfoTab:AddButton("Join Discord", function()
    Window:Notify("Discord", "Join our Discord for updates!", 3, "info")
end, {
    Icon = "💬",
    Color = Color3.fromRGB(114, 137, 218)
})

-- Button untuk update
InfoTab:AddButton("Check Updates", function()
    Window:Notify("Update", "You are using the latest version!", 2, "success")
end, {
    Icon = "🔄",
    Color = Color3.fromRGB(0, 255, 0)
})

-- ================================
-- INITIALIZATION
-- ================================

-- Show welcome notification
Window:Notify("Welcome", "BloxHub GUI Framework loaded successfully!", 5, "success")

-- Update server time every second
spawn(function()
    while true do
        wait(1)
        -- Update time label would require storing reference
    end
end)

-- Setup input handlers
game:GetService("UserInputService").InputBegan:Connect(function(input)
    -- Handle custom keybinds here
end)

print("BloxHub GUI Framework - Complete Showcase loaded!")
