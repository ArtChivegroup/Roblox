# 📚 BloxHub GUI Framework - Complete Documentation

## 📋 Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Core Concepts](#core-concepts)
4. [API Reference](#api-reference)
5. [Component Guide](#component-guide)
6. [Customization](#customization)
7. [Advanced Examples](#advanced-examples)
8. [Best Practices](#best-practices)

---

## 🎯 Introduction

**BloxHub GUI Framework** is a universal, single-file Roblox GUI library that provides fully customizable UI components. Unlike rigid templates, BloxHub offers modular building blocks that developers can compose into any layout they need.

### Key Features
- ✅ **Single Lua File** - No external dependencies
- ✅ **Fully Customizable** - Every element can be modified
- ✅ **Cross-Platform** - Works on PC and Mobile
- ✅ **Dynamic Inputs** - Keyboard, mouse, and touch support
- ✅ **Component-Based** - Reusable UI elements
- ✅ **Theme System** - Built-in themes with custom support
- ✅ **Persistence** - Auto-save configurations

---

## 📦 Installation

### Basic Loading
```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
```

### With Error Handling
```lua
local success, BloxHub = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
end)

if not success then
    warn("Failed to load BloxHub:", BloxHub)
    return
end
```

---

## 🧩 Core Concepts

### Architecture Overview

```lua
BloxHub = {
    Core = {},       -- Core utilities (Tween, Drag, Ripple, Notify)
    UI = {},         -- GUI instances
    Elements = {},   -- Component factory functions
    Settings = {},   -- Theme and configuration
    State = {}       -- Runtime state management
}
```

### Component Hierarchy

```
Window
  ├── Header (Title, Controls)
  ├── TabContainer (Sidebar)
  │   └── Tab Buttons
  └── ContentContainer
      └── Tab Content
          └── Elements (Button, Toggle, Slider, etc.)
```

---

## 📖 API Reference

### Window Management

#### `BloxHub:CreateWindow(title, options)`

Creates a new GUI window.

**Parameters:**
- `title` (string): Window title
- `options` (table, optional):
  - `Hotkey` (KeyCode): Toggle key (default: LeftAlt)
  - `Resizable` (boolean): Enable resizing (default: false)

**Returns:** Window object

**Example:**
```lua
local Window = BloxHub:CreateWindow("My GUI", {
    Hotkey = Enum.KeyCode.Insert
})
```

---

### Window Methods

#### `Window:CreateTab(name, options)`

Creates a new tab in the window.

**Parameters:**
- `name` (string): Tab name
- `options` (table, optional):
  - `Icon` (string): Emoji or text icon

**Returns:** Tab object

**Example:**
```lua
local MainTab = Window:CreateTab("Main", {
    Icon = "🏠"
})
```

#### `Window:Toggle()`

Toggles window visibility.

**Example:**
```lua
Window:Toggle() -- Show/hide window
```

#### `Window:GetTab(name)`

Retrieves a tab by name.

**Returns:** Tab object or nil

**Example:**
```lua
local tab = Window:GetTab("Settings")
if tab then
    tab:AddButton("Test", function() end)
end
```

#### `Window:Notify(title, message, duration, type)`

Shows a notification.

**Parameters:**
- `title` (string): Notification title
- `message` (string): Message content
- `duration` (number): Display time in seconds (default: 3)
- `type` (string): "info", "success", "warning", "error"

**Example:**
```lua
Window:Notify("Success", "Configuration saved!", 2, "success")
```

---

## 🎨 Component Guide

### Button

Creates a clickable button.

#### `Tab:AddButton(text, callback, options)`

**Parameters:**
- `text` (string): Button label
- `callback` (function): Click handler
- `options` (table, optional):
  - `Size` (UDim2): Custom size
  - `Position` (UDim2): Custom position
  - `Color` (Color3): Background color
  - `Icon` (string): Icon text/emoji

**Example:**
```lua
MainTab:AddButton("Execute Script", function()
    print("Script executed!")
    Window:Notify("Info", "Script running...", 2, "info")
end, {
    Icon = "▶️",
    Color = Color3.fromRGB(67, 181, 129)
})
```

---

### Toggle

Creates an on/off switch.

#### `Tab:AddToggle(text, default, callback, options)`

**Parameters:**
- `text` (string): Toggle label
- `default` (boolean): Initial state
- `callback` (function): State change handler
- `options` (table, optional):
  - `Size` (UDim2): Custom size

**Methods:**
- `toggle:GetValue()` - Returns current state
- `toggle:SetValue(boolean)` - Sets state programmatically

**Example:**
```lua
local espToggle = MainTab:AddToggle("ESP Enabled", false, function(state)
    if state then
        print("ESP activated")
        -- Enable ESP logic
    else
        print("ESP deactivated")
        -- Disable ESP logic
    end
end)

-- Later in your code
espToggle:SetValue(true) -- Enable ESP
print(espToggle:GetValue()) -- true
```

---

### Slider

Creates a numeric value slider.

#### `Tab:AddSlider(text, min, max, default, callback, options)`

**Parameters:**
- `text` (string): Slider label
- `min` (number): Minimum value
- `max` (number): Maximum value
- `default` (number): Initial value
- `callback` (function): Value change handler
- `options` (table, optional):
  - `Size` (UDim2): Custom size

**Methods:**
- `slider:GetValue()` - Returns current value
- `slider:SetValue(number)` - Sets value programmatically

**Example:**
```lua
local fovSlider = MainTab:AddSlider("Field of View", 60, 120, 90, function(value)
    workspace.CurrentCamera.FieldOfView = value
    print("FOV set to:", value)
end)

-- Programmatically change value
fovSlider:SetValue(100)
```

---

### Keybind

Creates a customizable keybind editor.

#### `Tab:AddKeybind(text, defaultKey, callback, options)`

**Parameters:**
- `text` (string): Keybind label
- `defaultKey` (KeyCode): Initial key
- `callback` (function): Key change handler
- `options` (table, optional):
  - `Size` (UDim2): Custom size

**Supported Inputs:**
- Keyboard keys (Enum.KeyCode.*)
- Mouse buttons (MouseButton1, MouseButton2)
- ESC to cancel binding

**Methods:**
- `keybind:GetValue()` - Returns current KeyCode
- `keybind:SetValue(KeyCode)` - Sets key programmatically

**Example:**
```lua
local aimbotKey = SettingsTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key)
    print("Aimbot key changed to:", tostring(key))
    _G.AimbotKey = key
end)

-- Setup input handler
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == aimbotKey:GetValue() then
        print("Aimbot activated!")
    end
end)
```

---

### Dropdown

Creates a selection dropdown menu.

#### `Tab:AddDropdown(text, options, defaultIndex, callback, opts)`

**Parameters:**
- `text` (string): Dropdown label
- `options` (table): Array of option strings
- `defaultIndex` (number): Initial selection (1-indexed)
- `callback` (function): Selection handler (receives option, index)
- `opts` (table, optional):
  - `Size` (UDim2): Custom size

**Methods:**
- `dropdown:GetValue()` - Returns (currentOption, currentIndex)
- `dropdown:SetValue(index)` - Sets selection programmatically

**Example:**
```lua
local weaponDropdown = MainTab:AddDropdown("Select Weapon", 
    {"Pistol", "Rifle", "Shotgun", "Sniper"}, 
    1, 
    function(option, index)
        print("Selected weapon:", option, "at index:", index)
        _G.CurrentWeapon = option
    end
)

-- Change selection
weaponDropdown:SetValue(3) -- Select "Shotgun"

-- Get current selection
local weapon, index = weaponDropdown:GetValue()
print(weapon) -- "Shotgun"
```

---

### TextBox

Creates a text input field.

#### `Tab:AddTextBox(text, placeholder, callback, options)`

**Parameters:**
- `text` (string): TextBox label
- `placeholder` (string): Placeholder text
- `callback` (function): Submit handler (triggered on Enter)
- `options` (table, optional):
  - `Size` (UDim2): Custom size

**Methods:**
- `textbox:GetValue()` - Returns current text
- `textbox:SetValue(string)` - Sets text programmatically

**Example:**
```lua
local nameBox = SettingsTab:AddTextBox("Player Name", "Enter name...", function(text)
    print("Name submitted:", text)
    game.Players.LocalPlayer.Name = text
end)

-- Set value
nameBox:SetValue("MyUsername")

-- Get value
local currentName = nameBox:GetValue()
```

---

### Label

Creates static text display.

#### `Tab:AddLabel(text, options)`

**Parameters:**
- `text` (string): Label text
- `options` (table, optional):
  - `Size` (UDim2): Custom size
  - `Color` (Color3): Text color
  - `TextSize` (number): Font size
  - `Font` (Enum.Font): Font type
  - `Alignment` (TextXAlignment): Text alignment
  - `Bold` (boolean): Use bold font

**Methods:**
- `label:SetText(string)` - Updates label text

**Example:**
```lua
local statusLabel = InfoTab:AddLabel("Status: Idle", {
    Bold = true,
    Color = BloxHub.Settings.Theme.Accent,
    TextSize = 14
})

-- Update status
task.spawn(function()
    while true do
        statusLabel:SetText("Status: Active - " .. os.date("%X"))
        task.wait(1)
    end
end)
```

---

### Section

Creates a visual separator with title.

#### `Tab:AddSection(text)`

**Parameters:**
- `text` (string): Section title

**Example:**
```lua
MainTab:AddSection("Combat Features")
-- Add combat-related elements here

MainTab:AddSection("Visual Features")
-- Add visual-related elements here
```

---

### Popup

Creates a modal popup dialog.

#### `Tab:AddPopup(title, content, buttons)`

**Parameters:**
- `title` (string): Popup title
- `content` (string): Message content
- `buttons` (table): Array of button definitions
  - Each button: `{Text, Callback, Color?}`

**Example:**
```lua
MainTab:AddButton("Confirm Action", function()
    MainTab:AddPopup("Confirmation", "Are you sure you want to proceed?", {
        {
            Text = "Yes",
            Color = BloxHub.Settings.Theme.Success,
            Callback = function()
                print("Confirmed!")
                -- Execute action
            end
        },
        {
            Text = "No",
            Color = BloxHub.Settings.Theme.Danger,
            Callback = function()
                print("Cancelled")
            end
        }
    })
end)
```

---

## 🎨 Customization

### Theme System

#### Built-in Themes

```lua
-- Apply built-in theme
BloxHub:SetTheme("Dark")    -- Dark mode
BloxHub:SetTheme("Light")   -- Light mode
BloxHub:SetTheme("Default") -- Default theme
```

#### Theme Colors Reference

```lua
BloxHub.Settings.Theme = {
    Primary = Color3.fromRGB(45, 45, 55),      -- Main background
    Secondary = Color3.fromRGB(35, 35, 45),    -- Secondary background
    Accent = Color3.fromRGB(88, 101, 242),     -- Accent color
    AccentHover = Color3.fromRGB(108, 121, 255), -- Hover state
    Success = Color3.fromRGB(67, 181, 129),    -- Success/green
    Warning = Color3.fromRGB(250, 166, 26),    -- Warning/yellow
    Danger = Color3.fromRGB(237, 66, 69),      -- Danger/red
    Text = Color3.fromRGB(255, 255, 255),      -- Primary text
    TextDim = Color3.fromRGB(180, 180, 190),   -- Dimmed text
    Border = Color3.fromRGB(60, 60, 75)        -- Border color
}
```

#### Custom Theme

```lua
-- Modify individual colors
BloxHub.Settings.Theme.Accent = Color3.fromRGB(255, 0, 255) -- Magenta accent
BloxHub.Settings.Theme.Primary = Color3.fromRGB(10, 10, 15) -- Darker background

-- Or create completely custom theme
local customTheme = {
    Primary = Color3.fromHex("#1a1a2e"),
    Secondary = Color3.fromHex("#16213e"),
    Accent = Color3.fromHex("#0f3460"),
    AccentHover = Color3.fromHex("#1a4d8f"),
    Success = Color3.fromHex("#2ecc71"),
    Warning = Color3.fromHex("#f39c12"),
    Danger = Color3.fromHex("#e74c3c"),
    Text = Color3.fromHex("#ecf0f1"),
    TextDim = Color3.fromHex("#95a5a6"),
    Border = Color3.fromHex("#2c3e50")
}

for key, value in pairs(customTheme) do
    BloxHub.Settings.Theme[key] = value
end
```

### Font Customization

```lua
-- Change fonts
BloxHub.Settings.Font.Regular = Enum.Font.Roboto
BloxHub.Settings.Font.Bold = Enum.Font.RobotoBold
BloxHub.Settings.Font.Semibold = Enum.Font.RobotoMono
```

### Layout Helpers

#### Grid Layout

```lua
local Container = MainTab.Content

-- Create grid (2 columns)
local Grid = BloxHub:CreateGrid(
    Container,
    2,                                    -- Columns
    UDim2.new(0, 180, 0, 100),           -- Cell size
    UDim2.new(0, 10, 0, 10)              -- Padding
)

-- Add elements that will auto-arrange in grid
for i = 1, 6 do
    local tile = Instance.new("TextButton")
    tile.Text = "Tile " .. i
    tile.Parent = Container
end
```

#### Vertical Stack

```lua
local Container = MainTab.Content

-- Create vertical list with spacing
local Stack = BloxHub:CreateVerticalStack(Container, 15)

-- Elements will stack vertically with 15px spacing
```

### Custom Component Styling

```lua
-- Custom button with full styling
local customButton = MainTab:AddButton("Custom Style", function()
    print("Clicked!")
end, {
    Size = UDim2.new(1, 0, 0, 50),
    Color = Color3.fromRGB(100, 50, 200),
    Icon = "🌟"
})

-- Modify after creation
customButton.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
customButton:FindFirstChild("TextLabel").TextSize = 16
```

---

## 💡 Advanced Examples

### Example 1: ESP System with Configuration

```lua
local Window = BloxHub:CreateWindow("ESP System")
local ESPTab = Window:CreateTab("ESP", {Icon = "👁️"})

-- Configuration
local ESPConfig = {
    Enabled = false,
    ShowName = true,
    ShowDistance = true,
    ShowHealth = true,
    MaxDistance = 1000,
    Color = Color3.fromRGB(255, 0, 0)
}

-- Enable/Disable
ESPTab:AddToggle("ESP Enabled", false, function(state)
    ESPConfig.Enabled = state
    if state then
        -- Start ESP
        print("ESP Started")
    else
        -- Stop ESP
        print("ESP Stopped")
    end
end)

-- Options
ESPTab:AddSection("Display Options")

ESPTab:AddToggle("Show Names", true, function(state)
    ESPConfig.ShowName = state
end)

ESPTab:AddToggle("Show Distance", true, function(state)
    ESPConfig.ShowDistance = state
end)

ESPTab:AddToggle("Show Health", true, function(state)
    ESPConfig.ShowHealth = state
end)

-- Settings
ESPTab:AddSection("Settings")

ESPTab:AddSlider("Max Distance", 100, 5000, 1000, function(value)
    ESPConfig.MaxDistance = value
end)

-- Color selector using dropdown
ESPTab:AddDropdown("ESP Color", 
    {"Red", "Green", "Blue", "Yellow", "White"}, 
    1, 
    function(option)
        local colors = {
            Red = Color3.fromRGB(255, 0, 0),
            Green = Color3.fromRGB(0, 255, 0),
            Blue = Color3.fromRGB(0, 0, 255),
            Yellow = Color3.fromRGB(255, 255, 0),
            White = Color3.fromRGB(255, 255, 255)
        }
        ESPConfig.Color = colors[option]
    end
)
```

### Example 2: Multi-Tab Hub

```lua
local Window = BloxHub:CreateWindow("Universal Hub", {
    Hotkey = Enum.KeyCode.RightShift
})

-- Player Tab
local PlayerTab = Window:CreateTab("Player", {Icon = "🏃"})
PlayerTab:AddSection("Movement")

PlayerTab:AddSlider("Walk Speed", 16, 500, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

PlayerTab:AddSlider("Jump Power", 50, 500, 50, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

PlayerTab:AddToggle("Infinite Jump", false, function(state)
    _G.InfiniteJump = state
end)

-- Combat Tab
local CombatTab = Window:CreateTab("Combat", {Icon = "⚔️"})
CombatTab:AddSection("Aimbot")

local aimbotEnabled = false
CombatTab:AddToggle("Aimbot", false, function(state)
    aimbotEnabled = state
end)

CombatTab:AddSlider("Aimbot FOV", 50, 500, 200, function(value)
    _G.AimbotFOV = value
end)

CombatTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key)
    _G.AimbotKey = key
end)

CombatTab:AddSection("Weapon Mods")

CombatTab:AddToggle("No Recoil", false, function(state)
    _G.NoRecoil = state
end)

CombatTab:AddToggle("Rapid Fire", false, function(state)
    _G.RapidFire = state
end)

-- Visual Tab
local VisualTab = Window:CreateTab("Visuals", {Icon = "🎨"})
VisualTab:AddSection("Environment")

VisualTab:AddSlider("Brightness", 0, 100, 50, function(value)
    game.Lighting.Brightness = value / 10
end)

VisualTab:AddToggle("Fullbright", false, function(state)
    if state then
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
    end
end)

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", {Icon = "🔧"})
MiscTab:AddSection("Game")

MiscTab:AddButton("Rejoin Server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(
        game.PlaceId,
        game.JobId,
        game.Players.LocalPlayer
    )
end, {Icon = "🔄"})

MiscTab:AddButton("Server Hop", function()
    -- Server hop logic
    Window:Notify("Info", "Finding new server...", 2, "info")
end, {Icon = "🌐"})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings", {Icon = "⚙️"})
SettingsTab:AddSection("GUI Settings")

SettingsTab:AddDropdown("Theme", 
    {"Default", "Dark", "Light"}, 
    1, 
    function(option)
        BloxHub:SetTheme(option)
    end
)

SettingsTab:AddKeybind("Toggle GUI", Enum.KeyCode.RightShift, function(key)
    Window.Hotkey = key
end)

SettingsTab:AddToggle("Icon Mode", true, function(state)
    BloxHub.Settings.IconEnabled = state
end)

SettingsTab:AddSection("Save/Load")

SettingsTab:AddButton("Save Config", function()
    local config = {
        WalkSpeed = PlayerTab.Elements[1]:GetValue(),
        AimbotEnabled = aimbotEnabled,
        -- Add more settings
    }
    
    BloxHub.Core.SaveConfig("UniversalHub", config)
    Window:Notify("Success", "Configuration saved!", 2, "success")
end, {Icon = "💾"})

SettingsTab:AddButton("Load Config", function()
    local config = BloxHub.Core.LoadConfig("UniversalHub")
    if config then
        -- Apply loaded settings
        Window:Notify("Success", "Configuration loaded!", 2, "success")
    else
        Window:Notify("Error", "No saved configuration found", 2, "error")
    end
end, {Icon = "📂"})
```

### Example 3: Dynamic Content

```lua
local Window = BloxHub:CreateWindow("Player Manager")
local PlayersTab = Window:CreateTab("Players", {Icon = "👥"})

-- Function to refresh player list
local function RefreshPlayerList()
    -- Clear existing elements
    for _, element in pairs(PlayersTab.Elements) do
        if element:IsA("Frame") or element:IsA("TextButton") then
            element:Destroy()
        end
    end
    PlayersTab.Elements = {}
    
    -- Add current players
    PlayersTab:AddSection("Online Players (" .. #game.Players:GetPlayers() .. ")")
    
    for _, player in pairs(game.Players:GetPlayers()) do
        PlayersTab:AddButton(player.Name .. " (ID: " .. player.UserId .. ")", function()
            PlayersTab:AddPopup("Player Actions", "Select action for " .. player.Name, {
                {
                    Text = "Teleport To",
                    Callback = function()
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
                            player.Character.HumanoidRootPart.CFrame
                        )
                    end
                },
                {
                    Text = "View Profile",
                    Callback = function()
                        print("Profile:", player.UserId)
                    end
                },
                {
                    Text = "Cancel",
                    Color = BloxHub.Settings.Theme.Danger,
                    Callback = function() end
                }
            })
        end, {
            Icon = "👤"
        })
    end
end

-- Initial load
RefreshPlayerList()

-- Add refresh button
PlayersTab:AddButton("🔄 Refresh List", RefreshPlayerList)

-- Auto-refresh on player join/leave
game.Players.PlayerAdded:Connect(RefreshPlayerList)
game.Players.PlayerRemoving:Connect(RefreshPlayerList)
```

### Example 4: Persistence System

```lua
local Window = BloxHub:CreateWindow("Config Manager")
local ConfigTab = Window:CreateTab("Config", {Icon = "⚙️"})

-- Settings table
local Settings = {
    AutoFarm = false,
    AutoCollect = false,
    FarmSpeed = 50,
    TargetMob = "Zombie"
}

-- Create UI elements and link to settings
ConfigTab:AddSection("Auto Farm")

ConfigTab:AddToggle("Auto Farm", Settings.AutoFarm, function(state)
    Settings.AutoFarm = state
    SaveConfig()
end)

ConfigTab:AddToggle("Auto Collect", Settings.AutoCollect, function(state)
    Settings.AutoCollect = state
    SaveConfig()
end)

ConfigTab:AddSlider("Farm Speed", 1, 100, Settings.FarmSpeed, function(value)
    Settings.FarmSpeed = value
    SaveConfig()
end)

ConfigTab:AddDropdown("Target Mob", 
    {"Zombie", "Skeleton", "Spider", "Creeper"}, 
    1, 
    function(option)
        Settings.TargetMob = option
        SaveConfig()
    end
)

-- Save function
function SaveConfig()
    local success = BloxHub.Core.SaveConfig("MyGameHub", Settings)
    if success then
        Window:Notify("Auto-Save", "Configuration saved", 1, "success")
    end
end

-- Load function
function LoadConfig()
    local config = BloxHub.Core.LoadConfig("MyGameHub")
    if config then
        Settings = config
        
        -- Apply loaded settings to UI
        ConfigTab.Elements[1]:SetValue(Settings.AutoFarm)
        ConfigTab.Elements[2]:SetValue(Settings.AutoCollect)
        ConfigTab.Elements[3]:SetValue(Settings.FarmSpeed)
        
        Window:Notify("Config", "Configuration loaded successfully", 2, "success")
    else
        Window:Notify("Info", "No saved configuration found", 2, "info")
    end
end

-- Manual save/load buttons
ConfigTab:AddSection("Manual Controls")

ConfigTab:AddButton("💾 Save Config", function()
    SaveConfig()
    Window:Notify("Success", "Manually saved!", 2, "success")
end)

ConfigTab:AddButton("📂 Load Config", LoadConfig)

ConfigTab:AddButton("🗑️ Reset Config", function()
    Settings = {
        AutoFarm = false,
        AutoCollect = false,
        FarmSpeed = 50,
        TargetMob = "Zombie"
    }
    SaveConfig()
    Window:Notify("Reset", "Configuration reset to defaults", 2, "info")
end)

-- Auto-load on startup
LoadConfig()
```

---

## 📝 Best Practices

### 1. Organization

```lua
-- Bad: Everything in one place
local Window = BloxHub:CreateWindow("Hub")
local Tab = Window:CreateTab("Main")
Tab:AddButton("A", function() end)
Tab:AddButton("B", function() end)
Tab:AddToggle("C", false, function() end)

-- Good: Organized by functionality
local Window = BloxHub:CreateWindow("Hub")

-- Player features
local PlayerTab = Window:CreateTab("Player", {Icon = "🏃"})
PlayerTab:AddSection("Movement")
-- Add movement-related elements

PlayerTab:AddSection("Stats")
-- Add stat-related elements

-- Combat features
local CombatTab = Window:CreateTab("Combat", {Icon = "⚔️"})
CombatTab:AddSection("Aimbot")
-- Add aimbot elements

CombatTab:AddSection("Weapons")
-- Add weapon elements
```

### 2. State Management

```lua
-- Bad: Global variables everywhere
_G.ESPEnabled = false
_G.AimbotEnabled = false

-- Good: Organized state
local HubState = {
    ESP = {
        Enabled = false,
        MaxDistance = 1000,
        ShowNames = true
    },
    Aimbot = {
        Enabled = false,
        FOV = 200,
        Smoothness = 50
    }
}

-- Access state cleanly
ESPTab:AddToggle("Enable", false, function(state)
    HubState.ESP.Enabled = state
end)
```

### 3. Error Handling

```lua
-- Wrap risky operations
MainTab:AddButton("Teleport", function()
    local success, err = pcall(function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
            CFrame.new(0, 100, 0)
        )
    end)
    
    if success then
        Window:Notify("Success", "Teleported!", 2, "success")
    else
        Window:Notify("Error", "Teleport failed: " .. tostring(err), 3, "error")
    end
end)
```

### 4. Performance

```lua
-- Bad: Creating GUI elements in loops
while true do
    MainTab:AddLabel("FPS: " .. workspace:GetRealPhysicsFPS())
    task.wait(1)
end

-- Good: Update existing elements
local fpsLabel = MainTab:AddLabel("FPS: 0")

task.spawn(function()
    while true do
        fpsLabel:SetText("FPS: " .. math.floor(workspace:GetRealPhysicsFPS()))
        task.wait(1)
    end
end)
```

### 5. User Feedback

```lua
-- Always provide feedback for actions
MainTab:AddButton("Load Script", function()
    Window:Notify("Loading", "Please wait...", 1, "info")
    
    task.wait(2) -- Simulate loading
    
    local success = true -- Your load logic
    
    if success then
        Window:Notify("Success", "Script loaded!", 2, "success")
    else
        Window:Notify("Error", "Failed to load script", 3, "error")
    end
end)
```

### 6. Cleanup

```lua
-- Store connections for cleanup
local Connections = {}

-- Create connection
Connections.HeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
    -- Your logic
end)

-- Cleanup function
function Cleanup()
    for name, connection in pairs(Connections) do
        connection:Disconnect()
        print("Disconnected:", name)
    end
    
    Window:Notify("Cleanup", "All connections cleaned up", 2, "info")
end

-- Add cleanup button
SettingsTab:AddButton("🗑️ Cleanup", Cleanup)
```

---

## 🔧 Troubleshooting

### Common Issues

**Issue: GUI not showing**

```lua
-- Solution 1: Check if executor supports gethui/protect_gui
local ScreenGui = BloxHub.UI.ScreenGui
if ScreenGui then
    print("ScreenGui Parent:", ScreenGui.Parent)
else
    warn("ScreenGui failed to create")
end

-- Solution 2: Force CoreGui parent
local function forceParentToCoreGui()
    if BloxHub.UI.ScreenGui then
        BloxHub.UI.ScreenGui.Parent = game:GetService("CoreGui")
    end
end
task.wait(1)
forceParentToCoreGui()
```

**Issue: Keybinds not working**
```lua
-- Solution: Check if InputBegan listener is active
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    print("Key pressed:", input.KeyCode, "Processed:", gameProcessed)
end)

-- Make sure you're not blocking inputs
local function setupKeybind()
    local keybind = SettingsTab:AddKeybind("Test", Enum.KeyCode.F, function(key)
        print("Keybind changed to:", key)
    end)
    
    -- Listen for the key
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == keybind:GetValue() then
            print("Keybind activated!")
        end
    end)
end
```

**Issue: Elements not updating**
```lua
-- Solution: Store element references
local healthSlider = MainTab:AddSlider("Health", 0, 100, 100, function(value)
    game.Players.LocalPlayer.Character.Humanoid.Health = value
end)

-- Update programmatically
game:GetService("RunService").Heartbeat:Connect(function()
    local currentHealth = game.Players.LocalPlayer.Character.Humanoid.Health
    healthSlider:SetValue(currentHealth)
end)
```

**Issue: Dropdown not closing**
```lua
-- Solution: The dropdown automatically closes on selection
-- If stuck open, try clicking outside or recreating:
local dropdown = MainTab:AddDropdown("Options", {"A", "B", "C"}, 1, function(option)
    print("Selected:", option)
    -- Dropdown will auto-close after selection
end)
```

---

## 🎯 Complete Production Example

Here's a full-featured script hub example:

```lua
--[[
    Game Hub - Full Example
    Shows all features and best practices
]]

-- Load BloxHub
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Local Player
local LocalPlayer = Players.LocalPlayer

-- Hub State
local HubState = {
    -- Player
    Player = {
        WalkSpeed = 16,
        JumpPower = 50,
        NoClip = false,
        InfiniteJump = false
    },
    
    -- Combat
    Combat = {
        Aimbot = {
            Enabled = false,
            FOV = 200,
            Smoothness = 50,
            Key = Enum.KeyCode.E,
            TargetPart = "Head"
        },
        NoRecoil = false,
        RapidFire = false
    },
    
    -- Visuals
    Visuals = {
        ESP = {
            Enabled = false,
            ShowNames = true,
            ShowDistance = true,
            ShowHealth = true,
            MaxDistance = 1000,
            Color = Color3.fromRGB(255, 0, 0)
        },
        Fullbright = false,
        FOV = 70
    },
    
    -- Auto Farm
    AutoFarm = {
        Enabled = false,
        Speed = 50,
        Target = "Nearest",
        AutoCollect = false
    }
}

-- Connections for cleanup
local Connections = {}

-- Create Window
local Window = BloxHub:CreateWindow("Universal Game Hub", {
    Hotkey = Enum.KeyCode.RightControl
})

-- ========================================
-- PLAYER TAB
-- ========================================
local PlayerTab = Window:CreateTab("Player", {Icon = "🏃"})

PlayerTab:AddSection("Movement")

PlayerTab:AddSlider("Walk Speed", 16, 500, 16, function(value)
    HubState.Player.WalkSpeed = value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

PlayerTab:AddSlider("Jump Power", 50, 500, 50, function(value)
    HubState.Player.JumpPower = value
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = value
    end
end)

PlayerTab:AddToggle("No Clip", false, function(state)
    HubState.Player.NoClip = state
    
    if state then
        Connections.NoClip = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if Connections.NoClip then
            Connections.NoClip:Disconnect()
            Connections.NoClip = nil
        end
        
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

PlayerTab:AddToggle("Infinite Jump", false, function(state)
    HubState.Player.InfiniteJump = state
end)

-- Infinite Jump Handler
game:GetService("UserInputService").JumpRequest:Connect(function()
    if HubState.Player.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

PlayerTab:AddSection("Teleports")

PlayerTab:AddButton("Teleport to Spawn", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        Window:Notify("Teleport", "Teleported to spawn", 2, "success")
    end
end, {Icon = "📍"})

PlayerTab:AddButton("Teleport to Random Player", function()
    local players = Players:GetPlayers()
    local randomPlayer = players[math.random(1, #players)]
    
    if randomPlayer ~= LocalPlayer and randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
        Window:Notify("Teleport", "Teleported to " .. randomPlayer.Name, 2, "success")
    end
end, {Icon = "🎲"})

-- ========================================
-- COMBAT TAB
-- ========================================
local CombatTab = Window:CreateTab("Combat", {Icon = "⚔️"})

CombatTab:AddSection("Aimbot")

CombatTab:AddToggle("Enable Aimbot", false, function(state)
    HubState.Combat.Aimbot.Enabled = state
    
    if state then
        Window:Notify("Aimbot", "Aimbot enabled", 2, "success")
        -- Start aimbot logic here
    else
        Window:Notify("Aimbot", "Aimbot disabled", 2, "info")
        -- Stop aimbot logic here
    end
end)

CombatTab:AddSlider("FOV Size", 50, 500, 200, function(value)
    HubState.Combat.Aimbot.FOV = value
end)

CombatTab:AddSlider("Smoothness", 1, 100, 50, function(value)
    HubState.Combat.Aimbot.Smoothness = value
end)

CombatTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key)
    HubState.Combat.Aimbot.Key = key
    Window:Notify("Keybind", "Aimbot key set to " .. tostring(key):gsub("Enum.KeyCode.", ""), 2, "success")
end)

CombatTab:AddDropdown("Target Part", 
    {"Head", "Torso", "HumanoidRootPart"}, 
    1, 
    function(option)
        HubState.Combat.Aimbot.TargetPart = option
    end
)

CombatTab:AddSection("Weapon Mods")

CombatTab:AddToggle("No Recoil", false, function(state)
    HubState.Combat.NoRecoil = state
    -- Implement no recoil logic
end)

CombatTab:AddToggle("Rapid Fire", false, function(state)
    HubState.Combat.RapidFire = state
    -- Implement rapid fire logic
end)

CombatTab:AddButton("Silent Aim Toggle", function()
    CombatTab:AddPopup("Silent Aim", "Silent aim is not implemented yet", {
        {Text = "OK", Callback = function() end}
    })
end, {Icon = "🎯"})

-- ========================================
-- VISUALS TAB
-- ========================================
local VisualsTab = Window:CreateTab("Visuals", {Icon = "👁️"})

VisualsTab:AddSection("ESP")

VisualsTab:AddToggle("Enable ESP", false, function(state)
    HubState.Visuals.ESP.Enabled = state
    
    if state then
        Window:Notify("ESP", "ESP enabled", 2, "success")
        -- Start ESP rendering
    else
        Window:Notify("ESP", "ESP disabled", 2, "info")
        -- Stop ESP rendering
    end
end)

VisualsTab:AddToggle("Show Names", true, function(state)
    HubState.Visuals.ESP.ShowNames = state
end)

VisualsTab:AddToggle("Show Distance", true, function(state)
    HubState.Visuals.ESP.ShowDistance = state
end)

VisualsTab:AddToggle("Show Health", true, function(state)
    HubState.Visuals.ESP.ShowHealth = state
end)

VisualsTab:AddSlider("Max Distance", 100, 5000, 1000, function(value)
    HubState.Visuals.ESP.MaxDistance = value
end)

VisualsTab:AddDropdown("ESP Color", 
    {"Red", "Green", "Blue", "Yellow", "White"}, 
    1, 
    function(option)
        local colors = {
            Red = Color3.fromRGB(255, 0, 0),
            Green = Color3.fromRGB(0, 255, 0),
            Blue = Color3.fromRGB(0, 0, 255),
            Yellow = Color3.fromRGB(255, 255, 0),
            White = Color3.fromRGB(255, 255, 255)
        }
        HubState.Visuals.ESP.Color = colors[option]
    end
)

VisualsTab:AddSection("Environment")

VisualsTab:AddToggle("Fullbright", false, function(state)
    HubState.Visuals.Fullbright = state
    
    if state then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        game.Lighting.Brightness = 1
        game.Lighting.ClockTime = 12
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = true
        game.Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
end)

VisualsTab:AddSlider("Field of View", 70, 120, 70, function(value)
    HubState.Visuals.FOV = value
    workspace.CurrentCamera.FieldOfView = value
end)

VisualsTab:AddButton("Remove Fog", function()
    game.Lighting.FogEnd = 100000
    Window:Notify("Visuals", "Fog removed", 2, "success")
end, {Icon = "🌫️"})

-- ========================================
-- AUTO FARM TAB
-- ========================================
local AutoFarmTab = Window:CreateTab("Auto Farm", {Icon = "🤖"})

AutoFarmTab:AddSection("Settings")

local farmStatusLabel = AutoFarmTab:AddLabel("Status: Idle", {
    Bold = true,
    Color = BloxHub.Settings.Theme.TextDim
})

AutoFarmTab:AddToggle("Enable Auto Farm", false, function(state)
    HubState.AutoFarm.Enabled = state
    
    if state then
        farmStatusLabel:SetText("Status: Farming...")
        Window:Notify("Auto Farm", "Auto farm started", 2, "success")
        
        -- Start farm loop
        Connections.FarmLoop = RunService.Heartbeat:Connect(function()
            if HubState.AutoFarm.Enabled then
                -- Your farming logic here
                -- Example: Find nearest mob, teleport, kill, collect
            end
        end)
    else
        farmStatusLabel:SetText("Status: Idle")
        Window:Notify("Auto Farm", "Auto farm stopped", 2, "info")
        
        if Connections.FarmLoop then
            Connections.FarmLoop:Disconnect()
            Connections.FarmLoop = nil
        end
    end
end)

AutoFarmTab:AddSlider("Farm Speed", 1, 100, 50, function(value)
    HubState.AutoFarm.Speed = value
end)

AutoFarmTab:AddDropdown("Target Type", 
    {"Nearest", "Highest Value", "Lowest Health", "Random"}, 
    1, 
    function(option)
        HubState.AutoFarm.Target = option
    end
)

AutoFarmTab:AddToggle("Auto Collect Items", false, function(state)
    HubState.AutoFarm.AutoCollect = state
end)

AutoFarmTab:AddSection("Statistics")

local farmStatsLabel = AutoFarmTab:AddLabel("Kills: 0 | Items: 0 | Time: 0s", {
    TextSize = 11
})

-- Update stats every second
task.spawn(function()
    local startTime = os.time()
    local kills = 0
    local items = 0
    
    while true do
        if HubState.AutoFarm.Enabled then
            local elapsed = os.time() - startTime
            farmStatsLabel:SetText(string.format("Kills: %d | Items: %d | Time: %ds", kills, items, elapsed))
        end
        task.wait(1)
    end
end)

-- ========================================
-- MISC TAB
-- ========================================
local MiscTab = Window:CreateTab("Misc", {Icon = "🔧"})

MiscTab:AddSection("Server")

MiscTab:AddButton("Rejoin Server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(
        game.PlaceId,
        game.JobId,
        LocalPlayer
    )
end, {Icon = "🔄"})

MiscTab:AddButton("Server Hop", function()
    Window:Notify("Server Hop", "Finding new server...", 2, "info")
    
    local servers = {}
    local req = game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    local body = game:GetService("HttpService"):JSONDecode(req)
    
    for _, server in pairs(body.data) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            table.insert(servers, server.id)
        end
    end
    
    if #servers > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(
            game.PlaceId,
            servers[math.random(1, #servers)],
            LocalPlayer
        )
    end
end, {Icon = "🌐"})

MiscTab:AddSection("Game")

MiscTab:AddTextBox("Game Speed", "Enter value (0.1-10)", function(text)
    local speed = tonumber(text)
    if speed and speed >= 0.1 and speed <= 10 then
        game:GetService("Workspace"):SetAttribute("GameSpeed", speed)
        Window:Notify("Game Speed", "Set to " .. speed .. "x", 2, "success")
    else
        Window:Notify("Error", "Invalid speed value", 2, "error")
    end
end)

MiscTab:AddButton("Reset Character", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end, {Icon = "💀"})

-- ========================================
-- SETTINGS TAB
-- ========================================
local SettingsTab = Window:CreateTab("Settings", {Icon = "⚙️"})

SettingsTab:AddSection("GUI Settings")

SettingsTab:AddDropdown("Theme", 
    {"Default", "Dark", "Light"}, 
    1, 
    function(option)
        BloxHub:SetTheme(option)
        Window:Notify("Theme", "Theme changed to " .. option, 2, "success")
    end
)

SettingsTab:AddKeybind("Toggle GUI", Enum.KeyCode.RightControl, function(key)
    Window.Hotkey = key
    Window:Notify("Hotkey", "GUI hotkey changed", 2, "success")
end)

SettingsTab:AddToggle("Show Icon When Hidden", true, function(state)
    BloxHub.Settings.IconEnabled = state
end)

SettingsTab:AddSection("Configuration")

SettingsTab:AddButton("💾 Save Config", function()
    local success = BloxHub.Core.SaveConfig("UniversalHub", HubState)
    if success then
        Window:Notify("Config", "Configuration saved successfully", 2, "success")
    else
        Window:Notify("Error", "Failed to save configuration", 2, "error")
    end
end)

SettingsTab:AddButton("📂 Load Config", function()
    local config = BloxHub.Core.LoadConfig("UniversalHub")
    if config then
        HubState = config
        Window:Notify("Config", "Configuration loaded successfully", 2, "success")
        
        -- Apply loaded settings to UI
        -- This would require updating all UI elements
    else
        Window:Notify("Info", "No saved configuration found", 2, "info")
    end
end)

SettingsTab:AddButton("🗑️ Reset Config", function()
    SettingsTab:AddPopup("Reset Configuration", "Are you sure you want to reset all settings?", {
        {
            Text = "Yes",
            Color = BloxHub.Settings.Theme.Danger,
            Callback = function()
                -- Reset to defaults
                HubState = {
                    Player = {WalkSpeed = 16, JumpPower = 50, NoClip = false, InfiniteJump = false},
                    Combat = {Aimbot = {Enabled = false, FOV = 200, Smoothness = 50, Key = Enum.KeyCode.E, TargetPart = "Head"}, NoRecoil = false, RapidFire = false},
                    Visuals = {ESP = {Enabled = false, ShowNames = true, ShowDistance = true, ShowHealth = true, MaxDistance = 1000, Color = Color3.fromRGB(255, 0, 0)}, Fullbright = false, FOV = 70},
                    AutoFarm = {Enabled = false, Speed = 50, Target = "Nearest", AutoCollect = false}
                }
                Window:Notify("Reset", "Configuration reset to defaults", 2, "success")
            end
        },
        {
            Text = "Cancel",
            Callback = function() end
        }
    })
end)

SettingsTab:AddSection("Advanced")

SettingsTab:AddButton("🧹 Cleanup Connections", function()
    for name, connection in pairs(Connections) do
        if connection and connection.Disconnect then
            connection:Disconnect()
            print("Disconnected:", name)
        end
    end
    Connections = {}
    Window:Notify("Cleanup", "All connections cleaned up", 2, "success")
end)

SettingsTab:AddButton("❌ Destroy GUI", function()
    SettingsTab:AddPopup("Destroy GUI", "This will completely remove the GUI. Continue?", {
        {
            Text = "Yes",
            Color = BloxHub.Settings.Theme.Danger,
            Callback = function()
                -- Cleanup
                for name, connection in pairs(Connections) do
                    if connection and connection.Disconnect then
                        connection:Disconnect()
                    end
                end
                
                -- Destroy GUI
                if BloxHub.UI.ScreenGui then
                    BloxHub.UI.ScreenGui:Destroy()
                end
                
                print("BloxHub GUI destroyed")
            end
        },
        {
            Text = "Cancel",
            Callback = function() end
        }
    })
end)

-- ========================================
-- INFO TAB
-- ========================================
local InfoTab = Window:CreateTab("Info", {Icon = "ℹ️"})

InfoTab:AddLabel("Universal Game Hub v1.0", {
    Bold = true,
    TextSize = 16,
    Color = BloxHub.Settings.Theme.Accent
})

InfoTab:AddLabel("Powered by BloxHub Framework", {TextSize = 12})
InfoTab:AddLabel("", {Size = UDim2.new(1, 0, 0, 10)})

InfoTab:AddSection("Features")
InfoTab:AddLabel("✓ Player movement customization")
InfoTab:AddLabel("✓ Combat enhancements")
InfoTab:AddLabel("✓ Visual ESP system")
InfoTab:AddLabel("✓ Auto farming capabilities")
InfoTab:AddLabel("✓ Configuration save/load")

InfoTab:AddSection("Credits")
InfoTab:AddLabel("Created by: Your Name", {Color = BloxHub.Settings.Theme.Accent})
InfoTab:AddLabel("Framework: BloxHub v2.0")
InfoTab:AddLabel("Last Updated: " .. os.date("%Y-%m-%d"))

InfoTab:AddSection("Links")
InfoTab:AddButton("📖 Documentation", function()
    setclipboard("https://github.com/your-repo/docs")
    Window:Notify("Copied", "Documentation link copied to clipboard", 2, "success")
end)

InfoTab:AddButton("💬 Discord Server", function()
    setclipboard("https://discord.gg/your-invite")
    Window:Notify("Copied", "Discord invite copied to clipboard", 2, "success")
end)

-- ========================================
-- INITIALIZATION COMPLETE
-- ========================================
Window:Notify("Universal Hub", "Successfully loaded! Press " .. tostring(Window.Hotkey):gsub("Enum.KeyCode.", "") .. " to toggle.", 4, "success")

-- Auto-load saved config
task.spawn(function()
    task.wait(1)
    local config = BloxHub.Core.LoadConfig("UniversalHub")
    if config then
        Window:Notify("Config", "Previous configuration loaded", 2, "info")
    end
end)

print("Universal Game Hub loaded successfully!")
```

---

## 📚 Additional Resources

### Useful Code Snippets

#### Color Picker Alternative
```lua
-- Since there's no built-in color picker, use dropdown for common colors
local function AddColorPicker(tab, label, callback)
    local colors = {
        Red = Color3.fromRGB(255, 0, 0),
        Green = Color3.fromRGB(0, 255, 0),
        Blue = Color3.fromRGB(0, 0, 255),
        Yellow = Color3.fromRGB(255, 255, 0),
        Cyan = Color3.fromRGB(0, 255, 255),
        Magenta = Color3.fromRGB(255, 0, 255),
        White = Color3.fromRGB(255, 255, 255),
        Black = Color3.fromRGB(0, 0, 0)
    }
    
    local colorNames = {}
    for name in pairs(colors) do
        table.insert(colorNames, name)
    end
    
    return tab:AddDropdown(label, colorNames, 1, function(option)
        callback(colors[option])
    end)
end

-- Usage
AddColorPicker(VisualsTab, "ESP Color", function(color)
    _G.ESPColor = color
end)
```

#### Multi-Select List
```lua
-- Create multi-select using toggles
local function AddMultiSelect(tab, label, options, callback)
    tab:AddSection(label)
    
    local selected = {}
    
    for _, option in ipairs(options) do
        tab:AddToggle(option, false, function(state)
            selected[option] = state
            callback(selected)
        end)
    end
    
    return selected
end

-- Usage
AddMultiSelect(CombatTab, "Target Players", {"Enemies", "Teammates", "NPCs"}, function(selection)
    print("Selected:", selection)
end)
```

---

## 🎓 Conclusion

BloxHub GUI Framework provides a powerful, flexible foundation for creating Roblox GUIs. Key takeaways:

1. **Start Simple** - Begin with basic windows and tabs
2. **Organize Well** - Group related features together
3. **Provide Feedback** - Always notify users of actions
4. **Save State** - Use the persistence system
5. **Handle Errors** - Wrap risky operations in pcall
6. **Clean Up** - Disconnect connections when done

For more examples and updates, check the source at:
```
https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua
```

**Happy coding! 🚀**

