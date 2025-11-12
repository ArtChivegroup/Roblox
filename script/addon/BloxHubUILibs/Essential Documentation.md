

# 📚 BloxHub GUI Framework - Essential Documentation

## 🎯 Introduction

**BloxHub GUI Framework** is a universal, single-file Roblox GUI library that provides fully customizable UI components.

### Key Features
- ✅ **Single Lua File** - No external dependencies
- ✅ **Fully Customizable** - Every element can be modified
- ✅ **Cross-Platform** - Works on PC and Mobile
- ✅ **Component-Based** - Reusable UI elements
- ✅ **Theme System** - Built-in themes with custom support

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

#### `Window:Notify(title, message, duration, type)`
Shows a notification.

**Parameters:**
- `title` (string): Notification title
- `message` (string): Message content
- `duration` (number): Display time in seconds (default: 3)
- `type` (string): "info", "success", "warning", "error"

---

## 🎨 Component Guide

### Button
```lua
MainTab:AddButton("Execute Script", function()
    print("Script executed!")
end, {
    Icon = "▶️",
    Color = Color3.fromRGB(67, 181, 129)
})
```

### Toggle
```lua
local espToggle = MainTab:AddToggle("ESP Enabled", false, function(state)
    if state then
        print("ESP activated")
    else
        print("ESP deactivated")
    end
end)

-- Later in your code
espToggle:SetValue(true) -- Enable ESP
print(espToggle:GetValue()) -- true
```

### Slider
```lua
local fovSlider = MainTab:AddSlider("Field of View", 60, 120, 90, function(value)
    workspace.CurrentCamera.FieldOfView = value
end)

-- Programmatically change value
fovSlider:SetValue(100)
```

### Keybind
```lua
local aimbotKey = SettingsTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key)
    print("Aimbot key changed to:", tostring(key))
end)

-- Setup input handler
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == aimbotKey:GetValue() then
        print("Aimbot activated!")
    end
end)
```

### Dropdown
```lua
local weaponDropdown = MainTab:AddDropdown("Select Weapon", 
    {"Pistol", "Rifle", "Shotgun", "Sniper"}, 
    1, 
    function(option, index)
        print("Selected weapon:", option)
    end
)

-- Change selection
weaponDropdown:SetValue(3) -- Select "Shotgun"
```

### TextBox
```lua
local nameBox = SettingsTab:AddTextBox("Player Name", "Enter name...", function(text)
    print("Name submitted:", text)
end)

-- Set value
nameBox:SetValue("MyUsername")
```

### Label
```lua
local statusLabel = InfoTab:AddLabel("Status: Idle", {
    Bold = true,
    Color = BloxHub.Settings.Theme.Accent
})

-- Update status
statusLabel:SetText("Status: Active")
```

---

## 🎨 Customization

### Theme System
```lua
-- Apply built-in theme
BloxHub:SetTheme("Dark")    -- Dark mode
BloxHub:SetTheme("Light")   -- Light mode
BloxHub:SetTheme("Default") -- Default theme

-- Modify individual colors
BloxHub.Settings.Theme.Accent = Color3.fromRGB(255, 0, 255) -- Magenta accent
```

---

## 💡 Simple Example

```lua
-- Load BloxHub
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Create Window
local Window = BloxHub:CreateWindow("Simple Hub", {
    Hotkey = Enum.KeyCode.RightControl
})

-- Create Tab
local MainTab = Window:CreateTab("Main", {Icon = "🏠"})

-- Add Components
MainTab:AddSection("Player")

MainTab:AddSlider("Walk Speed", 16, 500, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

MainTab:AddToggle("Infinite Jump", false, function(state)
    _G.InfiniteJump = state
end)

MainTab:AddButton("Teleport to Spawn", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
end, {Icon = "📍"})

-- Notification on load
Window:Notify("Simple Hub", "Loaded successfully!", 3, "success")
```

---

## 📝 Best Practices

1. **Organization** - Group related features in tabs and sections
2. **State Management** - Use organized state tables instead of globals
3. **Error Handling** - Wrap risky operations in pcall
4. **User Feedback** - Always provide notifications for actions
5. **Cleanup** - Disconnect connections when done

---

## 🔧 Troubleshooting

**Issue: GUI not showing**
```lua
-- Force CoreGui parent
if BloxHub.UI.ScreenGui then
    BloxHub.UI.ScreenGui.Parent = game:GetService("CoreGui")
end
```

**Issue: Elements not updating**
```lua
-- Store element references
local healthSlider = MainTab:AddSlider("Health", 0, 100, 100, function(value)
    game.Players.LocalPlayer.Character.Humanoid.Health = value
end)

-- Update programmatically
healthSlider:SetValue(50)
```

---

## 🎓 Conclusion

BloxHub GUI Framework provides a powerful foundation for creating Roblox GUIs. Start with basic windows and tabs, organize features well, provide feedback to users, and handle errors properly.

For more examples and updates, check the source at:
```
https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua
```

**Happy coding! 🚀**
