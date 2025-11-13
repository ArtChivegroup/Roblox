# 🧩 BloxHub GUI Framework - Documentation

**Version:** 2.0.0  
**Author:** BloxHub  
**License:** MIT  
**Repository:** [GitHub](https://github.com/ArtChivegroup/Roblox/tree/main/script/addon/BloxHubUILibs)

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [Core Concepts](#core-concepts)
5. [API Reference](#api-reference)
6. [Components](#components)
7. [Theming](#theming)
8. [Input System](#input-system)
9. [Layout System](#layout-system)
10. [Configuration & Persistence](#configuration--persistence)
11. [Advanced Features](#advanced-features)
12. [Examples](#examples)
13. [Best Practices](#best-practices)
14. [Troubleshooting](#troubleshooting)

---

## 🎯 Introduction

**BloxHub GUI Framework** is a universal, single-file Roblox GUI system that provides fully customizable and composable UI components. Unlike rigid templates, BloxHub offers modular building blocks that allow developers to create their own layouts and interactions.

### Key Features

- ✅ **Single File System** - All functionality in one `.lua` file
- ✅ **Fully Customizable** - Every element (size, color, position, callbacks) is configurable
- ✅ **Cross-Platform** - Works on PC and Mobile
- ✅ **Dynamic Input System** - Supports keyboard, mouse (left/right click), and modifier keys
- ✅ **Component-Based** - Modular design for easy composition
- ✅ **Built-in Themes** - Dark, Light, Purple, and Green themes included
- ✅ **Popup & Submenu Support** - Create context menus and modal dialogs
- ✅ **Config Persistence** - Save and load user preferences
- ✅ **Notification System** - Built-in toast notifications

---

## 📦 Installation

### Method 1: Direct Load (Recommended)

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()
```

### Method 2: Local File

1. Download `source.lua` from the repository
2. Load it in your script:

```lua
local BloxHub = loadstring(readfile("BloxHub.lua"))()
```

---

## 🚀 Quick Start

### Creating Your First GUI

```lua
-- Load the framework
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

-- Create a window
local MainWindow = BloxHub:CreateWindow("My First GUI", {
    Size = UDim2.new(0, 520, 0, 420),
    Visible = true
})

-- Create a tab
local Tab = MainWindow:CreateTab("Features")

-- Add components
Tab:AddButton("Click Me", function()
    print("Button clicked!")
end)

Tab:AddToggle("Enable Feature", false, function(state)
    print("Toggle state:", state)
end)

Tab:AddSlider("Value", 0, 100, 50, function(value)
    print("Slider value:", value)
end)
```

---

## 🧠 Core Concepts

### 1. Framework Structure

The framework is organized into several modules:

```lua
BloxHub = {
    Core = {},      -- System initialization and rendering
    Elements = {},  -- UI component factory
    Settings = {},  -- Theme and configuration
    State = {},     -- Runtime state management
    Input = {}      -- Input handling system
}
```

### 2. Component Hierarchy

```
BloxHub (Framework)
  └── Window
       └── Tab
            └── Components (Button, Toggle, Slider, etc.)
```

### 3. Design Philosophy

- **Composition over Configuration** - Build UIs by composing small, reusable components
- **Explicit is Better** - All settings are explicit; no hidden magic
- **Developer Freedom** - Framework provides tools, not restrictions

---

## 📚 API Reference

### Framework Methods

#### `BloxHub:Init()`
Initializes the framework. Called automatically on load.

```lua
BloxHub:Init()
```

#### `BloxHub:CreateWindow(title, config)`
Creates a new window.

**Parameters:**
- `title` (string) - Window title
- `config` (table, optional) - Configuration options

**Config Options:**
```lua
{
    Size = UDim2.new(0, 520, 0, 420),
    Position = UDim2.new(0.5, -260, 0.5, -210),
    Resizable = false,
    Visible = true
}
```

**Returns:** Window object

**Example:**
```lua
local Window = BloxHub:CreateWindow("My GUI", {
    Size = UDim2.new(0, 600, 0, 500),
    Visible = true
})
```

---

### Window Methods

#### `Window:CreateTab(name)`
Creates a new tab in the window.

**Parameters:**
- `name` (string) - Tab name

**Returns:** Tab object

```lua
local Tab = Window:CreateTab("Settings")
```

#### `Window:Toggle()`
Toggles window visibility.

```lua
Window:Toggle()
```

#### `Window:Show()`
Shows the window.

```lua
Window:Show()
```

#### `Window:Hide()`
Hides the window.

```lua
Window:Hide()
```

#### `Window:SetTitle(newTitle)`
Changes the window title.

```lua
Window:SetTitle("New Title")
```

#### `Window:RegisterHotkey(name, keyCode, callback)`
Registers a global hotkey for the window.

**Parameters:**
- `name` (string) - Hotkey identifier
- `keyCode` (Enum.KeyCode) - Key to bind
- `callback` (function) - Function to execute

```lua
Window:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)
```

#### `Window:CreatePopup(title, options)`
Creates a popup modal.

```lua
local Popup = Window:CreatePopup("Settings", {})
```

---

### Tab Methods

#### `Tab:AddButton(text, callback)`
Adds a clickable button.

**Parameters:**
- `text` (string) - Button label
- `callback` (function) - Click handler

**Returns:** Button instance

```lua
Tab:AddButton("Execute", function()
    print("Button pressed!")
end)
```

#### `Tab:AddToggle(text, default, callback)`
Adds an on/off toggle switch.

**Parameters:**
- `text` (string) - Toggle label
- `default` (boolean) - Initial state
- `callback` (function) - State change handler

**Returns:** Toggle object with `GetValue()` and `SetValue(value)` methods

```lua
local Toggle = Tab:AddToggle("Enable ESP", false, function(state)
    print("ESP is now:", state)
end)

-- Get current value
print(Toggle:GetValue()) -- false

-- Set value programmatically
Toggle:SetValue(true)
```

#### `Tab:AddSlider(text, min, max, default, callback)`
Adds a numeric slider.

**Parameters:**
- `text` (string) - Slider label
- `min` (number) - Minimum value
- `max` (number) - Maximum value
- `default` (number) - Initial value
- `callback` (function) - Value change handler

**Returns:** Slider object with `GetValue()` and `SetValue(value)` methods

```lua
local Slider = Tab:AddSlider("FOV", 30, 120, 90, function(value)
    workspace.CurrentCamera.FieldOfView = value
end)

-- Get current value
print(Slider:GetValue())

-- Set value
Slider:SetValue(60)
```

#### `Tab:AddKeybind(text, defaultKey, callback)`
Adds a customizable keybind input.

**Parameters:**
- `text` (string) - Keybind label
- `defaultKey` (Enum.KeyCode) - Default key
- `callback` (function) - Key change handler

**Returns:** Keybind object with `GetKey()` and `SetKey(keyCode, inputType)` methods

```lua
local Keybind = Tab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(keyCode, inputType, keyName)
    print("Key set to:", keyName)
end)

-- Get current key
local key, inputType = Keybind:GetKey()

-- Set key programmatically
Keybind:SetKey(Enum.KeyCode.Q, nil)
```

#### `Tab:AddDropdown(text, options, callback)`
Adds a dropdown selection menu.

**Parameters:**
- `text` (string) - Dropdown label
- `options` (table) - Array of option strings
- `callback` (function) - Selection handler

**Returns:** Dropdown object with `GetValue()` and `SetValue(value)` methods

```lua
local Dropdown = Tab:AddDropdown("ESP Type", {"Box", "Outline", "3D"}, function(selected)
    print("Selected:", selected)
end)

-- Get current selection
print(Dropdown:GetValue())

-- Set selection
Dropdown:SetValue("Outline")
```

#### `Tab:AddTextBox(text, placeholder, callback)`
Adds a text input field.

**Parameters:**
- `text` (string) - TextBox label
- `placeholder` (string) - Placeholder text
- `callback` (function) - Text change handler (receives text and enterPressed boolean)

**Returns:** TextBox object with `GetValue()` and `SetValue(value)` methods

```lua
local TextBox = Tab:AddTextBox("Player Name", "Enter name...", function(text, enterPressed)
    if enterPressed then
        print("Entered:", text)
    end
end)

-- Get text
print(TextBox:GetValue())

-- Set text
TextBox:SetValue("John Doe")
```

#### `Tab:AddLabel(text, config)`
Adds a static text label.

**Parameters:**
- `text` (string) - Label text
- `config` (table, optional) - Label configuration

**Config Options:**
```lua
{
    Height = 25,
    Background = false,
    BackgroundColor = Color3.fromRGB(25, 25, 30),
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 14,
    Bold = false,
    TextXAlignment = Enum.TextXAlignment.Left
}
```

```lua
Tab:AddLabel("Combat Settings", {Bold = true, Height = 30})
```

#### `Tab:AddDivider()`
Adds a horizontal divider line.

```lua
Tab:AddDivider()
```

---

## 🎨 Components

### Button Component

```lua
local Button = Tab:AddButton("Action", function()
    -- Button callback
end)
```

**Features:**
- Hover animation
- Click feedback
- Customizable text

---

### Toggle Component

```lua
local Toggle = Tab:AddToggle("Feature Name", false, function(state)
    if state then
        print("Enabled")
    else
        print("Disabled")
    end
end)

-- Methods
Toggle:GetValue()      -- Returns boolean
Toggle:SetValue(true)  -- Sets state
```

**Features:**
- Smooth animation
- Visual feedback
- Programmable state control

---

### Slider Component

```lua
local Slider = Tab:AddSlider("Speed", 1, 10, 5, function(value)
    print("Value:", value)
end)

-- Methods
Slider:GetValue()     -- Returns number
Slider:SetValue(7)    -- Sets value
```

**Features:**
- Real-time value display
- Draggable handle
- Range constraints

---

### Keybind Component

```lua
local Keybind = Tab:AddKeybind("Hotkey", Enum.KeyCode.E, function(keyCode, inputType, keyName)
    print("New key:", keyName)
end)

-- Methods
local key, inputType = Keybind:GetKey()
Keybind:SetKey(Enum.KeyCode.Q, nil)
```

**Features:**
- Supports keyboard keys
- Supports mouse buttons (Mouse1, Mouse2, Mouse3)
- Listening mode UI
- Displays key name

---

### Dropdown Component

```lua
local Dropdown = Tab:AddDropdown("Mode", {"Option A", "Option B", "Option C"}, function(selected)
    print("Selected:", selected)
end)

-- Methods
Dropdown:GetValue()           -- Returns selected option
Dropdown:SetValue("Option B") -- Sets selection
```

**Features:**
- Expandable list
- Hover effects
- Dynamic sizing

---

### TextBox Component

```lua
local TextBox = Tab:AddTextBox("Input", "Type here...", function(text, enterPressed)
    if enterPressed then
        print("Submitted:", text)
    end
end)

-- Methods
TextBox:GetValue()        -- Returns string
TextBox:SetValue("Text")  -- Sets text
```

**Features:**
- Placeholder text
- Enter key detection
- Text wrapping

---

### Label Component

```lua
Tab:AddLabel("Section Title", {Bold = true, Height = 30})
Tab:AddLabel("Normal text")
Tab:AddLabel("Custom", {
    TextColor = Color3.fromRGB(100, 200, 255),
    TextSize = 16,
    Background = true
})
```

---

### Divider Component

```lua
Tab:AddDivider()
```

Simple horizontal line for visual separation.

---

## 🎨 Theming

### Built-in Themes

BloxHub includes 4 pre-made themes:

```lua
BloxHub:SetTheme("Dark")    -- Default
BloxHub:SetTheme("Light")   -- Light mode
BloxHub:SetTheme("Purple")  -- Purple accent
BloxHub:SetTheme("Green")   -- Green accent
```

### Theme Structure

```lua
Theme = {
    Background = Color3.fromRGB(15, 15, 15),
    Primary = Color3.fromRGB(25, 25, 30),
    Secondary = Color3.fromRGB(35, 35, 45),
    Accent = Color3.fromRGB(0, 120, 255),
    AccentHover = Color3.fromRGB(0, 162, 255),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(180, 180, 190),
    Success = Color3.fromRGB(100, 255, 100),
    Warning = Color3.fromRGB(255, 255, 100),
    Error = Color3.fromRGB(255, 100, 100)
}
```

### Custom Theme

```lua
BloxHub:CustomizeTheme({
    Background = Color3.fromRGB(20, 20, 25),
    Accent = Color3.fromRGB(255, 0, 127),
    Text = Color3.fromRGB(240, 240, 255)
})
```

---

## ⌨️ Input System

### Hotkey Registration

```lua
-- Window-level hotkey
Window:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)
```

### Keybind Component

```lua
-- User-configurable keybind
Tab:AddKeybind("Aimbot Toggle", Enum.KeyCode.E, function(keyCode, inputType, keyName)
    print("Aimbot key changed to:", keyName)
end)
```

### Supported Input Types

- **Keyboard:** All Enum.KeyCode values
- **Mouse Buttons:**
  - `Enum.UserInputType.MouseButton1` (Left click)
  - `Enum.UserInputType.MouseButton2` (Right click)
  - `Enum.UserInputType.MouseButton3` (Middle click)

### Input Flow

1. User clicks keybind button
2. GUI enters "listening mode"
3. Next input (key/mouse) is captured
4. Keybind is updated
5. Callback is triggered

---

## 📐 Layout System

### Grid Layout

```lua
local GridLayout = BloxHub:CreateGrid(
    parent,           -- Parent frame
    3,                -- Columns
    UDim2.new(0, 140, 0, 100),  -- Cell size
    UDim2.new(0, 10, 0, 10)     -- Padding
)
```

### Vertical Stack

```lua
local VStack = BloxHub:CreateVerticalStack(
    parent,  -- Parent frame
    8        -- Padding between items
)
```

### Horizontal Stack

```lua
local HStack = BloxHub:CreateHorizontalStack(
    parent,  -- Parent frame
    8        -- Padding between items
)
```

---

## 💾 Configuration & Persistence

### Saving Configuration

```lua
BloxHub:SaveConfig("myconfig")
```

Saves:
- Current theme
- Window positions and sizes
- Window visibility states
- Registered hotkeys

### Loading Configuration

```lua
BloxHub:LoadConfig("myconfig")
```

### Config File Location

Configs are saved as JSON files:
- `BloxHub_default.json`
- `BloxHub_myconfig.json`

Uses `writefile()` and `readfile()` if available.

---

## 🚀 Advanced Features

### Popup System

```lua
local Popup = Window:CreatePopup("Settings Menu", {})

-- Add content
Popup:AddLabel("Choose an option:")
Popup:AddButton("Option 1", function()
    print("Option 1 selected")
    Popup:Hide()
end)
Popup:AddButton("Option 2", function()
    print("Option 2 selected")
    Popup:Hide()
end)

-- Show popup
Popup:Show()

-- Hide popup
Popup:Hide()
```

### Floating Icon

```lua
local Icon = BloxHub:CreateFloatingIcon(Window, {
    Text = "🧩 MyGUI",
    Size = UDim2.new(0, 100, 0, 40),
    Position = UDim2.new(0.5, -50, 0.05, 0),
    ShowOnMinimize = true
})
```

**Features:**
- Draggable
- Click to toggle window
- Auto-show when window is hidden

### Notification System

```lua
BloxHub:Notify(
    "Title",           -- Title
    "Message text",    -- Message
    3,                 -- Duration (seconds)
    "Success"          -- Type: "Info", "Success", "Warning", "Error"
)
```

**Example:**
```lua
BloxHub:Notify("Feature Enabled", "ESP is now active!", 2, "Success")
BloxHub:Notify("Error", "Failed to load config", 4, "Error")
```

---

## 📖 Examples

### Example 1: Simple ESP GUI

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

local Window = BloxHub:CreateWindow("ESP GUI", {
    Size = UDim2.new(0, 400, 0, 350)
})

local Tab = Window:CreateTab("ESP Settings")

local espEnabled = false
local showNames = true
local showDistance = true
local espColor = Color3.fromRGB(255, 0, 0)

Tab:AddLabel("ESP Configuration", {Bold = true, Height = 30})

Tab:AddToggle("Enable ESP", false, function(state)
    espEnabled = state
    -- Your ESP code here
end)

Tab:AddToggle("Show Names", true, function(state)
    showNames = state
end)

Tab:AddToggle("Show Distance", true, function(state)
    showDistance = state
end)

Tab:AddSlider("Max Distance", 100, 5000, 2000, function(value)
    print("Max ESP distance:", value)
end)

Tab:AddDropdown("ESP Type", {"Box", "Outline", "3D"}, function(selected)
    print("ESP Type:", selected)
end)

-- Toggle hotkey
Window:RegisterHotkey("ToggleESP", Enum.KeyCode.F4, function()
    Window:Toggle()
end)
```

---

### Example 2: Combat Features

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

local Window = BloxHub:CreateWindow("Combat Hub")
local Tab = Window:CreateTab("Combat")

Tab:AddLabel("Aimbot Settings", {Bold = true, Height = 30})

local aimbotEnabled = false
local aimbotFOV = 60
local aimbotKey = Enum.KeyCode.E

Tab:AddToggle("Enable Aimbot", false, function(state)
    aimbotEnabled = state
    if state then
        BloxHub:Notify("Aimbot", "Aimbot enabled!", 2, "Success")
    end
end)

Tab:AddSlider("FOV Circle", 10, 200, 60, function(value)
    aimbotFOV = value
    -- Update FOV circle
end)

Tab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(keyCode, inputType, keyName)
    aimbotKey = keyCode
    print("Aimbot key:", keyName)
end)

Tab:AddDivider()

Tab:AddLabel("Triggerbot", {Bold = true, Height = 30})
Tab:AddToggle("Enable Triggerbot", false, function(state)
    print("Triggerbot:", state)
end)

Tab:AddSlider("Delay (ms)", 0, 500, 50, function(value)
    print("Delay:", value)
end)
```

---

### Example 3: Multi-Tab Configuration

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

local Window = BloxHub:CreateWindow("Multi-Feature Hub", {
    Size = UDim2.new(0, 550, 0, 450)
})

-- Combat Tab
local CombatTab = Window:CreateTab("Combat")
CombatTab:AddToggle("Aimbot", false, function(s) end)
CombatTab:AddSlider("FOV", 30, 120, 60, function(v) end)

-- Visual Tab
local VisualTab = Window:CreateTab("Visuals")
VisualTab:AddToggle("ESP", false, function(s) end)
VisualTab:AddToggle("Chams", false, function(s) end)
VisualTab:AddDropdown("Theme", {"Dark", "Light", "Purple"}, function(t)
    BloxHub:SetTheme(t)
end)

-- Movement Tab
local MovementTab = Window:CreateTab("Movement")
MovementTab:AddToggle("Speed Hack", false, function(s) end)
MovementTab:AddSlider("Speed", 16, 100, 16, function(v) end)
MovementTab:AddToggle("Fly", false, function(s) end)

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")
SettingsTab:AddButton("Save Config", function()
    BloxHub:SaveConfig("default")
    BloxHub:Notify("Success", "Configuration saved!", 2, "Success")
end)
SettingsTab:AddButton("Load Config", function()
    BloxHub:LoadConfig("default")
end)
SettingsTab:AddTextBox("Custom Command", "Enter command...", function(text, enter)
    if enter then
        print("Command:", text)
    end
end)

-- Global hotkey
Window:RegisterHotkey("Toggle", Enum.KeyCode.RightControl, function()
    Window:Toggle()
end)

-- Floating icon
BloxHub:CreateFloatingIcon(Window, {
    Text = "⚡ Hub",
    ShowOnMinimize = true
})
```

---

### Example 4: Popup Menu System

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILibs/source.lua"))()

local Window = BloxHub:CreateWindow("Advanced GUI")
local Tab = Window:CreateTab("Main")

-- Create popup
local SettingsPopup = Window:CreatePopup("Advanced Settings", {})

SettingsPopup:AddLabel("Choose your configuration:")
SettingsPopup:AddButton("Legit Mode", function()
    print("Legit mode activated")
    SettingsPopup:Hide()
end)
SettingsPopup:AddButton("Rage Mode", function()
    print("Rage mode activated")
    SettingsPopup:Hide()
end)
SettingsPopup:AddButton("Custom", function()
    print("Custom mode")
    SettingsPopup:Hide()
end)

-- Button to open popup
Tab:AddButton("Open Settings Menu", function()
    SettingsPopup:Show()
end)

Tab:AddButton("Quick Notification", function()
    BloxHub:Notify("Test", "This is a notification!", 3, "Info")
end)
```

---

## ✅ Best Practices

### 1. Organization

```lua
-- Group related features in tabs
local CombatTab = Window:CreateTab("Combat")
local VisualTab = Window:CreateTab("Visuals")
local SettingsTab = Window:CreateTab("Settings")
```

### 2. State Management

```lua
-- Store component references for later access
local toggles = {}
toggles.ESP = Tab:AddToggle("ESP", false, function(state)
    -- Handle state
end)

-- Access later
if toggles.ESP:GetValue() then
    -- ESP is enabled
end
```

### 3. User Feedback

```lua
Tab:AddButton("Execute", function()
    -- Show feedback
    BloxHub:Notify("Success", "Action completed!", 2, "Success")
end)
```

### 4. Error Handling

```lua
Tab:AddButton("Load Data", function()
    local success, result = pcall(function()
        -- Your code here
    end)
    
    if success then
        BloxHub:Notify("Success", "Data loaded!", 2, "Success")
    else
        BloxHub:Notify("Error", "Failed to load data", 3, "Error")
    end
end)
```

### 5. Configuration Saving

```lua
-- Save on important changes
Tab:AddButton("Apply Settings", function()
    -- Apply settings
    BloxHub:SaveConfig("default")
    BloxHub:Notify("Saved", "Settings saved successfully", 2, "Success")
end)
```

---

## 🔧 Troubleshooting

### Common Issues

#### GUI Not Appearing

**Problem:** GUI doesn't show up after loading.

**Solution:**
```lua
-- Ensure initialization
local BloxHub = loadstring(game:HttpGet("..."))()
BloxHub:Init()  -- Usually automatic

-- Check if window is visible
Window:Show()
```

#### Hotkeys Not Working

**Problem:** Registered hotkeys don't trigger.

**Solution:**
```lua
-- Make sure hotkey is registered AFTER window creation
Window:RegisterHotkey("Toggle", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)

-- Check for conflicts with game input
-- Some games block certain keys
```

#### Config Not Saving

**Problem:** Configuration doesn't persist.

**Solution:**
```lua
-- Verify executor supports file functions
if writefile and readfile then
    BloxHub:SaveConfig("myconfig")
else
    warn("Executor doesn't support file operations")
end
```

#### Components Not Updating

**Problem:** Programmatic value changes don't reflect in UI.

**Solution:**
```lua
-- Use SetValue methods
Toggle:SetValue(true)   -- ✅ Correct
-- Toggle.Value = true  -- ❌ Won't update UI
```

#### Theme Not Applying

**Problem:** Theme change doesn't affect existing windows.

**Solution:**
```lua
-- Set theme BEFORE creating windows
BloxHub:SetTheme("Purple")
local Window = BloxHub:CreateWindow(...)

-- Or recreate windows after theme change
```

---

## 📞 Support & Resources

- **GitHub Issues:** Report bugs and request features
- **Documentation:** This file
- **Source Code:** Fully commented and readable

---

## 📄 License

MIT License - Free to use, modify, and distribute.

---

## 🎓 Credits

**Framework Author:** BloxHub  
**Documentation:** BloxHub Team  
**Version:** 2.0.0  
**Last Updated:** 2025-11-12

---

**Happy Coding! 🚀**
