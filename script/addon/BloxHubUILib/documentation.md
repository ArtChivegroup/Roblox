
# BloxHub GUI Framework

**BloxHub** is a powerful, single-file, and component-based GUI library for Roblox. It is designed to be minimalistic, highly customizable, and easy to integrate into any project. Instead of providing rigid templates, BloxHub gives you a set of composable "building blocks" to create your own unique user interfaces.

The entire framework is contained within a single Lua file, making it incredibly simple to use and distribute.

##  Features

-   **Single-File Library**: No complex file structures. Just load one file and you're ready to go.
-   **Component-Based Design**: Build complex UIs by combining simple components like buttons, toggles, sliders, and more.
-   **Fully Customizable**: Every aspect of the UI, from colors and fonts to positions and sizes, can be customized.
-   **Theming System**: Easily switch between pre-made themes (Dark, Light, Purple, Green) with a single command.
-   **Configuration Persistence**: Save and load user preferences (like window position and theme) automatically.
-   **Built-in Notification System**: Provide feedback to users with clean, modern notifications.
-   **Dynamic Inputs**: Includes a fully functional keybind system that supports keyboard keys and mouse buttons.
-   **Floating Icon Utility**: Create a draggable icon to easily toggle your UI's visibility.

## 🚀 Getting Started

Getting started with BloxHub is simple. Just follow these three steps.

### 1. Load the Library

Load the framework directly from the GitHub URL into your script.

```lua
-- The entire library is returned into the 'BloxHub' variable
local BloxHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArtChivegroup/Roblox/refs/heads/main/script/addon/BloxHubUILib/source.lua"))()
```

### 2. Create Your First Window

A Window is the main container for your UI. All other elements like tabs and components will live inside it.

```lua
local MainWindow = BloxHub:CreateWindow("My First UI")
```

### 3. Add Tabs and Components

Organize your UI with tabs, and then add components to each tab.

```lua
-- Create a new tab named "Main"
local mainTab = MainWindow:CreateTab("Main")

-- Add a button to the tab
mainTab:AddButton("Click Me!", function()
    print("Button was clicked!")
    BloxHub:Notify("Success", "You clicked the button!", 3, "Success")
end)

-- Add a toggle switch
mainTab:AddToggle("Enable Feature", false, function(state)
    print("Feature state is now:", state)
end)
```

## 📚 API Reference

### Core API

#### `BloxHub:CreateWindow(title, [config])`
Creates and returns a new window instance.

-   `title` (string): The text displayed in the window's header.
-   `config` (table, optional): A table for advanced configuration.
    -   `Size` (UDim2): The initial size of the window.
    -   `Position` (UDim2): The initial position of the window.

**Example:**
```lua
local MyWindow = BloxHub:CreateWindow("My Awesome GUI", {
    Size = UDim2.new(0, 600, 0, 450)
})
```

#### `Window:CreateTab(name)`
Creates and returns a new tab inside the window.

-   `name` (string): The name of the tab, which will be displayed on its button.

**Example:**
```lua
local visualsTab = MyWindow:CreateTab("Visuals")
```

#### `Window:RegisterHotkey(name, keyCode, callback, [inputType])`
Registers a hotkey that triggers a callback function.

-   `name` (string): A unique name for the hotkey.
-   `keyCode` (Enum.KeyCode): The keyboard key to listen for.
-   `callback` (function): The function to execute when the hotkey is pressed.
-   `inputType` (Enum.UserInputType, optional): Use for mouse buttons (e.g., `Enum.UserInputType.MouseButton1`).

**Example:**
```lua
-- Toggle the window's visibility when RightShift is pressed
MyWindow:RegisterHotkey("ToggleGUI", Enum.KeyCode.RightShift, function()
    MyWindow:Toggle()
end)
```

### Component API

All components are added to a `Tab` instance.

#### `Tab:AddButton(text, callback)`
Creates a clickable button.

-   `text` (string): The text displayed on the button.
-   `callback` (function): The function to run when the button is clicked.

```lua
mainTab:AddButton("Execute", function() print("Executing!") end)
```

#### `Tab:AddToggle(text, [default], callback)`
Creates an on/off toggle switch.

-   `text` (string): The label for the toggle.
-   `default` (boolean, optional): The initial state of the toggle (default is `false`).
-   `callback` (function): A function that receives the new boolean `state` when changed.

```lua
mainTab:AddToggle("Fly Mode", false, function(isFlyEnabled)
    -- Your fly logic here
end)
```

#### `Tab:AddSlider(text, min, max, [default], callback)`
Creates a slider to select a numerical value.

-   `text` (string): The label for the slider.
-   `min` (number): The minimum value of the slider.
-   `max` (number): The maximum value of the slider.
-   `default` (number, optional): The initial value (default is `min`).
-   `callback` (function): A function that receives the new `value` as the slider is moved.

```lua
mainTab:AddSlider("FOV", 70, 120, 90, function(fovValue)
    game.workspace.Camera.FieldOfView = fovValue
end)
```

#### `Tab:AddKeybind(text, defaultKey, callback)`
Creates a button that allows the user to set a keybind.

-   `text` (string): The label for the keybind.
-   `defaultKey` (Enum.KeyCode): The initial key assigned.
-   `callback` (function): A function that receives `keyCode`, `inputType`, and `keyName` when a new key is set.

```lua
mainTab:AddKeybind("Aimbot Key", Enum.KeyCode.E, function(key, input, name)
    BloxHub:Notify("Keybind Set", "Aimbot key is now " .. name)
end)
```

#### `Tab:AddDropdown(text, options, callback)`
Creates a dropdown menu for selecting one option from a list.

-   `text` (string): The label for the dropdown.
-   `options` (table): An array of strings representing the choices.
-   `callback` (function): A function that receives the selected `choice` (string).

```lua
local options = {"Head", "Torso", "Legs"}
mainTab:AddDropdown("Target Part", options, function(selectedPart)
    print(selectedPart .. " was selected.")
end)
```

#### `Tab:AddTextBox(text, [placeholder], callback)`
Creates a field for user text input.

-   `text` (string): The label for the text box.
-   `placeholder` (string, optional): The placeholder text shown when the box is empty.
-   `callback` (function): A function that receives the `text` and an `enterPressed` boolean when the user finishes editing.

```lua
mainTab:AddTextBox("Player Name", "Enter a name...", function(inputText, wasEnterPressed)
    if wasEnterPressed then
        print("Teleporting to:", inputText)
    end
end)
```

#### `Tab:AddLabel(text, [config])`
Creates a static text label.

-   `text` (string): The text to display.
-   `config` (table, optional):
    -   `TextSize` (number): The font size.
    -   `Bold` (boolean): Whether to use a bold font.

```lua
mainTab:AddLabel("Player Options", {TextSize = 16, Bold = true})
```

#### `Tab:AddDivider()`
Creates a thin horizontal line to visually separate components.

```lua
mainTab:AddToggle("ESP", true)
mainTab:AddDivider()
mainTab:AddToggle("Chams", false)
```

### Utility Functions

#### `BloxHub:Notify(title, message, [duration], [type])`
Displays a notification pop-up.

-   `title` (string): The title of the notification.
-   `message` (string): The body text of the notification.
-   `duration` (number, optional): How long the notification stays on screen (default is 3 seconds).
-   `type` (string, optional): The style of the notification. Can be `"Info"`, `"Success"`, `"Warning"`, or `"Error"`.

```lua
BloxHub:Notify("Error", "Player not found.", 4, "Error")
```

#### `BloxHub:CreateFloatingIcon(window, [config])`
Creates a draggable floating icon to toggle a window's visibility.

-   `window` (Window): The window instance to control.
-   `config` (table, optional):
    -   `Text` (string): The text on the icon.
    -   `ShowOnMinimize` (boolean): If `true`, the icon appears when the window is hidden.

```lua
BloxHub:CreateFloatingIcon(MainWindow, {Text = "Toggle UI", ShowOnMinimize = true})
```

### Customization & Persistence

#### `BloxHub:SetTheme(themeName)`
Changes the color scheme of all UI elements.

-   `themeName` (string): The name of the theme. Available themes: `"Dark"`, `"Light"`, `"Purple"`, `"Green"`.

```lua
settingsTab:AddDropdown("Theme", {"Dark", "Light", "Purple"}, function(theme)
    BloxHub:SetTheme(theme)
end)
```

#### `BloxHub:SaveConfig()` and `BloxHub:LoadConfig()`
These functions manage the user's settings. `SaveConfig` writes the current window positions and theme to a local file, and `LoadConfig` applies them.

```lua
settingsTab:AddButton("Save Settings", function()
    BloxHub:SaveConfig()
    BloxHub:Notify("Saved!", "Your settings have been saved.")
end)
```


