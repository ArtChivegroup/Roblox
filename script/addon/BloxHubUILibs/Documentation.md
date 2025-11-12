# 📘 BloxHub GUI Template - Documentation

## 🎯 Overview

**BloxHub GUI Template** adalah template GUI executor yang ringan, modern, dan mudah dikustomisasi untuk Roblox. Template ini dirancang dengan arsitektur single-file, mendukung PC dan Mobile, serta dilengkapi dengan sistem hotkey, notifikasi, dan pengaturan yang lengkap.

---

## 🚀 Quick Start

### Basic Usage

```lua
-- Load BloxHub GUI
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
```

### Alternative Loading Methods

```lua
-- Method 1: Direct assignment
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Method 2: With error handling
local success, BloxHub = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
end)

if success then
    print("BloxHub loaded successfully!")
else
    warn("Failed to load BloxHub:", BloxHub)
end
```

---

## ⌨️ Default Hotkeys

| Hotkey | Function | Description |
|--------|----------|-------------|
| **Left Alt** | Toggle GUI | Show/Hide main GUI |
| **E** | ESP Toggle | Enable/Disable ESP feature |
| **Mouse Button 2** | Aimbot | Right click to toggle aimbot |

*All hotkeys can be customized in Settings*

---

## 🎨 Features

### 1. **Main Grid Menu**
- 6 Pre-built feature tiles:
  - 👁️ **ESP** - Player ESP
  - 🎨 **Chams** - Wall Chams
  - 🎯 **Aimbot** - Auto Aim
  - 🔫 **Recoil** - No Recoil
  - ✨ **Visuals** - Visual Effects
  - ⚙️ **Settings** - Configuration Panel

### 2. **Settings Panel**
- **Hotkey Customization**: Change any hotkey for keyboard or mouse
- **Icon Toggle Mode**: Enable/Disable minimized icon
- **Sliders**: FOV, Smoothness, Distance (customizable)

### 3. **Notification System**
- 4 notification types: `info`, `success`, `warning`, `error`
- Auto-dismiss after set duration
- Manual close button
- Stacked notifications

### 4. **Icon Toggle**
- Draggable minimized icon
- Click to show/hide GUI
- Saves position between sessions

---

## 🛠️ API Reference

### Creating Custom Buttons

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Add custom feature button
BloxHub:CreateButton("Speed Hack", function()
    print("Speed Hack activated!")
    -- Your code here
end)
```

### Creating Custom Sliders

```lua
-- Create a custom slider
local speedSlider = BloxHub:CreateSliderAPI(
    "Walk Speed",  -- Name
    16,            -- Min value
    100,           -- Max value
    16,            -- Default value
    function(value)
        -- Callback when value changes
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        print("Walk Speed set to:", value)
    end
)

-- Get current slider value
local currentSpeed = speedSlider.GetValue()

-- Set slider value programmatically
speedSlider.SetValue(50)
```

### Manual Notifications

```lua
-- Send custom notifications
BloxHub:Notify(
    "Title",                  -- Title
    "Your message here",      -- Message
    3,                        -- Duration (seconds)
    "success"                 -- Type: "info", "success", "warning", "error"
)

-- Examples
BloxHub:Notify("Success", "Feature enabled!", 2, "success")
BloxHub:Notify("Warning", "Low health detected", 3, "warning")
BloxHub:Notify("Error", "Failed to load module", 4, "error")
BloxHub:Notify("Info", "Script updated", 2, "info")
```

### Manual GUI Toggle

```lua
-- Toggle GUI visibility programmatically
BloxHub:ToggleGUI()
```

### Access Feature States

```lua
-- Check if feature is enabled
if BloxHub.Features.ESP then
    print("ESP is currently enabled")
end

-- Enable/Disable features programmatically
BloxHub.Features.Aimbot = true
BloxHub.Features.ESP = false
```

### Save/Load Settings

```lua
-- Manual save (auto-saves on exit)
BloxHub:SaveSettings()

-- Manual load
BloxHub:LoadSettings()
```

---

## 🎨 Customization

### Changing Theme Colors

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Customize theme before initialization
BloxHub.Settings.Theme.Primary = Color3.fromRGB(20, 20, 30)
BloxHub.Settings.Theme.Accent = Color3.fromRGB(255, 50, 100)
BloxHub.Settings.Theme.Text = Color3.fromRGB(255, 255, 255)
```

### Available Theme Properties

```lua
BloxHub.Settings.Theme = {
    Primary = Color3.fromRGB(45, 45, 55),      -- Main background
    Secondary = Color3.fromRGB(35, 35, 45),    -- Secondary background
    Accent = Color3.fromRGB(88, 101, 242),     -- Accent color
    AccentHover = Color3.fromRGB(108, 121, 255), -- Hover state
    Success = Color3.fromRGB(67, 181, 129),    -- Success color
    Warning = Color3.fromRGB(250, 166, 26),    -- Warning color
    Danger = Color3.fromRGB(237, 66, 69),      -- Danger/Error color
    Text = Color3.fromRGB(255, 255, 255),      -- Primary text
    TextDim = Color3.fromRGB(180, 180, 190),   -- Secondary text
    Border = Color3.fromRGB(60, 60, 75)        -- Border color
}
```

---

## 📱 Mobile Support

BloxHub is fully compatible with mobile devices:
- Touch-friendly buttons and sliders
- Draggable GUI and icon
- Optimized touch events
- Responsive layout

---

## 💾 Settings Persistence

Settings are automatically saved using:
1. **writefile/readfile** (if supported by executor)
2. **setclipboard** (fallback method)

Saved settings include:
- Custom hotkeys
- Icon toggle state
- Icon position
- Feature states

---

## 🔧 Advanced Examples

### Example 1: Custom ESP Implementation

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Monitor ESP state changes
game:GetService("RunService").RenderStepped:Connect(function()
    if BloxHub.Features.ESP then
        -- Your ESP code here
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                -- Draw ESP boxes, names, etc.
            end
        end
    end
end)
```

### Example 2: Complete Custom Feature

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Add Fly feature
local flyEnabled = false
local flySpeed = 50

-- Create button
BloxHub:CreateButton("Fly", function()
    flyEnabled = not flyEnabled
    BloxHub:Notify("Fly", "Fly mode " .. (flyEnabled and "enabled" or "disabled"), 2, 
        flyEnabled and "success" or "info")
end)

-- Create speed slider
local flySpeedSlider = BloxHub:CreateSliderAPI("Fly Speed", 10, 200, 50, function(value)
    flySpeed = value
end)

-- Implement fly logic
game:GetService("RunService").Heartbeat:Connect(function()
    if flyEnabled then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            -- Your fly implementation here
        end
    end
end)
```

### Example 3: Integration with Existing Scripts

```lua
-- Load BloxHub
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Load your existing script
local MyScript = loadstring(game:HttpGet("https://example.com/myscript.lua"))()

-- Integrate with BloxHub
BloxHub:CreateButton("My Feature", function()
    MyScript:ToggleFeature()
end)

-- Add slider control
BloxHub:CreateSliderAPI("Intensity", 0, 100, 50, function(value)
    MyScript:SetIntensity(value)
end)
```

---

## 🐛 Troubleshooting

### GUI Not Showing
```lua
-- Check if GUI was created
if BloxHub and BloxHub.UI.ScreenGui then
    print("GUI loaded successfully")
else
    warn("GUI failed to load")
end
```

### Hotkeys Not Working
- Make sure you're not in chat or typing
- Try changing the hotkey in Settings
- Check if another script is blocking input

### Settings Not Saving
- Verify your executor supports `writefile/readfile`
- Use clipboard fallback if needed
- Check console for error messages

---

## 📋 Feature Checklist

- ✅ Single file architecture
- ✅ PC and Mobile support
- ✅ Customizable hotkeys (keyboard + mouse)
- ✅ Icon toggle mode
- ✅ Draggable GUI
- ✅ Modern UI design
- ✅ Notification system
- ✅ Settings persistence
- ✅ Extensible API
- ✅ No external dependencies

---

## 🔒 Security Notes

- GUI uses `gethui()` or `syn.protect_gui()` when available
- Settings stored locally (not shared)
- No external network requests after initial load
- Safe for most executors

---

## 📝 License

This is a template/library. You are free to:
- ✅ Use in your projects
- ✅ Modify and customize
- ✅ Distribute modified versions
- ✅ Use commercially

---

## 🤝 Support

For issues or questions:
1. Check this documentation first
2. Review code comments in source
3. Test with default configuration
4. Check executor compatibility

---

## 🎉 Credits

**BloxHub GUI Template v1.0**  
Created for universal Roblox script integration  
Modern, lightweight, and extensible design

---

**Happy Scripting! 🚀**
