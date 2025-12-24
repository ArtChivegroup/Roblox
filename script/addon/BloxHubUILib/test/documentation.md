
# BloxHub GUI Framework v3.0

**BloxHub** adalah library GUI yang powerful, single-file, dan berbasis komponen untuk Roblox. Didesain minimalis, highly customizable, dan mudah diintegrasikan ke project manapun. Framework v3.0 menggunakan **pure Roblox engine UI components** untuk kompatibilitas lintas perangkat (PC, Mobile, Tablet, Console).

## ✨ Features

-   **Single-File Library**: Tidak ada struktur file kompleks. Load satu file dan siap digunakan.
-   **Cross-Device Compatible**: Otomatis menyesuaikan ukuran dan input untuk PC, Mobile, Tablet, dan Console.
-   **Pure Roblox Engine UI**: Menggunakan UIStroke, UIGradient, dan komponen native Roblox.
-   **Touch Support**: Slider dan komponen lain mendukung input sentuh.
-   **Modern Design**: Gradient backgrounds, accent lines, smooth animations.
-   **Theming System**: Switch tema dengan satu perintah (Dark, Light, Purple, Green).
-   **Configuration Persistence**: Simpan dan load preferensi user secara otomatis.
-   **Built-in Notification System**: Feedback dengan notifikasi modern.
-   **Dynamic Inputs**: Keybind system yang support keyboard dan mouse.

## 🚀 Getting Started

### 1. Load the Library

```lua
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILib/test/source.lua"))()
```

### 2. Create Your First Window

```lua
local MainWindow = BloxHub:CreateWindow("My First UI", {
    Size = UDim2.new(0, 550, 0, 450)  -- Optional, auto-adapts untuk mobile
})
```

### 3. Add Tabs and Components

```lua
local mainTab = MainWindow:CreateTab("Main")

mainTab:AddButton("Click Me!", function()
    BloxHub:Notify("Success", "Button clicked!", 3, "Success")
end)

mainTab:AddToggle("Enable Feature", false, function(state)
    print("Feature:", state)
end)

mainTab:AddSlider("Speed", 1, 100, 50, function(value)
    print("Speed:", value)
end)
```

## 📚 API Reference

### Core API

#### `BloxHub:CreateWindow(title, [config])`
Membuat window baru dengan adaptive sizing untuk mobile.

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | string | Judul window |
| `config.Size` | UDim2 | Ukuran window (auto-adapt untuk mobile) |
| `config.Position` | UDim2 | Posisi window (default: centered) |

#### `Window:CreateTab(name)`
Membuat tab baru. Tab pertama otomatis aktif.

#### `Window:RegisterHotkey(name, keyCode, callback)`
Register hotkey untuk trigger callback.

```lua
MainWindow:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
    MainWindow:Toggle()
end)
```

### Component API

#### `Tab:AddButton(text, callback)`
Tombol dengan click animation.

#### `Tab:AddToggle(text, [default], callback)`
Toggle switch dengan pill design dan bounce animation.

```lua
local toggle = mainTab:AddToggle("ESP", false, function(enabled)
    -- Your code
end)

-- Methods
toggle:GetValue()      -- Returns boolean
toggle:SetValue(true)  -- Set toggle state
```

#### `Tab:AddSlider(text, min, max, [default], callback)`
Slider dengan draggable knob dan touch support.

```lua
local slider = mainTab:AddSlider("FOV", 70, 120, 90, function(value)
    workspace.CurrentCamera.FieldOfView = value
end)

-- Methods
slider:GetValue()     -- Returns number
slider:SetValue(100)  -- Set slider value
```

#### `Tab:AddKeybind(text, defaultKey, callback)`
Keybind picker dengan visual feedback saat listening.

```lua
mainTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key, input, name)
    print("New key:", name)
end)
```

#### `Tab:AddDropdown(text, options, callback)`
Dropdown menu dengan selected indicator.

```lua
mainTab:AddDropdown("Target", {"Head", "Torso", "Random"}, function(choice)
    print("Selected:", choice)
end)
```

#### `Tab:AddTextBox(text, [placeholder], callback)`
Input text dengan focus animation.

```lua
mainTab:AddTextBox("Username", "Enter name...", function(text, enterPressed)
    if enterPressed then
        print("Submitted:", text)
    end
end)
```

#### `Tab:AddLabel(text, [config])`
Label text. Bold labels mendapat accent prefix.

```lua
mainTab:AddLabel("Section Title", { Bold = true, TextSize = 16 })
mainTab:AddLabel("Description text")
```

#### `Tab:AddDivider()`
Pembatas visual dengan proper spacing.

### Utility Functions

#### `BloxHub:Notify(title, message, [duration], [type])`
Tampilkan notifikasi. Type: `"Info"`, `"Success"`, `"Warning"`, `"Error"`

#### `BloxHub:CreateFloatingIcon(window, [config])`
Buat floating icon untuk toggle window.

```lua
BloxHub:CreateFloatingIcon(MainWindow, {
    Text = "Toggle UI",
    ShowOnMinimize = true
})
```

#### `BloxHub:SetTheme(themeName)`
Ganti tema. Available: `"Dark"`, `"Light"`, `"Purple"`, `"Green"`

#### `BloxHub:SaveConfig()` / `BloxHub:LoadConfig()`
Simpan dan load konfigurasi.

## 📱 Device Detection

Framework otomatis mendeteksi device dan menyesuaikan UI:

```lua
BloxHub.Device.IsMobile   -- true jika mobile phone
BloxHub.Device.IsTablet   -- true jika tablet
BloxHub.Device.IsConsole  -- true jika console (Xbox)
BloxHub.Device.IsDesktop  -- true jika PC
BloxHub.Device.TouchEnabled -- true jika touch supported
```

## 🎨 Theme Colors (v3.0)

```lua
BloxHub.Settings.Theme = {
    Background = Color3.fromRGB(12, 12, 16),
    BackgroundGradient = Color3.fromRGB(18, 18, 24),
    Primary = Color3.fromRGB(22, 22, 28),
    PrimaryGradient = Color3.fromRGB(28, 28, 36),
    Secondary = Color3.fromRGB(32, 32, 42),
    Accent = Color3.fromRGB(88, 101, 242),
    AccentGradient = Color3.fromRGB(108, 121, 255),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(148, 155, 164),
    Border = Color3.fromRGB(48, 48, 58),
    -- Status colors
    Success = Color3.fromRGB(87, 242, 135),
    Warning = Color3.fromRGB(254, 231, 92),
    Error = Color3.fromRGB(237, 66, 69)
}
```

## 🔧 UI Settings

Toggle fitur UI modern:

```lua
BloxHub.Settings.UI = {
    StrokeEnabled = true,      -- UIStroke borders
    GradientEnabled = true,    -- Gradient backgrounds
    ShadowEnabled = true,      -- Drop shadows
    ResponsiveScale = true     -- Responsive scaling
}
```
