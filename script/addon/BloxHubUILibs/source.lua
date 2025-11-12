--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║           🧩 BloxHub GUI Framework v2.0                   ║
    ║           Universal Roblox GUI System                     ║
    ║           Author: BloxHub                                 ║
    ║           Date: 2025-11-12                                ║
    ╚═══════════════════════════════════════════════════════════╝
]]

local BloxHub = {
    Core = {},
    UI = {},
    Elements = {},
    Settings = {
        Theme = {
            Primary = Color3.fromRGB(45, 45, 55),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(88, 101, 242),
            AccentHover = Color3.fromRGB(108, 121, 255),
            Success = Color3.fromRGB(67, 181, 129),
            Warning = Color3.fromRGB(250, 166, 26),
            Danger = Color3.fromRGB(237, 66, 69),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 180, 190),
            Border = Color3.fromRGB(60, 60, 75)
        },
        Font = {
            Regular = Enum.Font.Gotham,
            Bold = Enum.Font.GothamBold,
            Semibold = Enum.Font.GothamSemibold
        },
        DefaultHotkey = Enum.KeyCode.LeftAlt,
        IconEnabled = true,
        Resizable = false
    },
    State = {
        Windows = {},
        ActiveWindow = nil,
        GUIVisible = true,
        ListeningHotkey = nil,
        IconPosition = UDim2.new(0.5, -55, 0.1, 0)
    }
}

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════════
-- CORE UTILITIES
-- ═══════════════════════════════════════════════════════════

function BloxHub.Core.Tween(instance, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(
        duration or 0.25,
        style or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

function BloxHub.Core.MakeDraggable(frame, dragHandle)
    local dragging, dragInput, mousePos, framePos = false, nil, nil, nil
    dragHandle = dragHandle or frame
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            BloxHub.Core.Tween(frame, {
                Position = UDim2.new(
                    framePos.X.Scale, framePos.X.Offset + delta.X,
                    framePos.Y.Scale, framePos.Y.Offset + delta.Y
                )
            }, 0.1)
        end
    end)
end

function BloxHub.Core.CreateRipple(parent, clickPosition)
    local Ripple = Instance.new("Frame")
    Ripple.Size = UDim2.new(0, 0, 0, 0)
    Ripple.Position = clickPosition or UDim2.new(0.5, 0, 0.5, 0)
    Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    Ripple.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    Ripple.BackgroundTransparency = 0.5
    Ripple.BorderSizePixel = 0
    Ripple.ZIndex = 10
    Ripple.Parent = parent
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Ripple
    
    BloxHub.Core.Tween(Ripple, {
        Size = UDim2.new(2.5, 0, 2.5, 0),
        BackgroundTransparency = 1
    }, 0.6)
    
    task.delay(0.6, function()
        Ripple:Destroy()
    end)
end

function BloxHub.Core.Notify(title, message, duration, notifType)
    duration = duration or 3
    notifType = notifType or "info"
    
    local ScreenGui = BloxHub.UI.ScreenGui
    if not ScreenGui then return end
    
    local NotifContainer = ScreenGui:FindFirstChild("NotificationContainer")
    if not NotifContainer then
        NotifContainer = Instance.new("Frame")
        NotifContainer.Name = "NotificationContainer"
        NotifContainer.Size = UDim2.new(0, 320, 1, -20)
        NotifContainer.Position = UDim2.new(1, -330, 0, 10)
        NotifContainer.BackgroundTransparency = 1
        NotifContainer.ZIndex = 100
        NotifContainer.Parent = ScreenGui
        
        local ListLayout = Instance.new("UIListLayout")
        ListLayout.Padding = UDim.new(0, 10)
        ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        ListLayout.Parent = NotifContainer
    end
    
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(1, 0, 0, 0)
    Notif.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Notif.BorderSizePixel = 0
    Notif.ClipsDescendants = true
    Notif.Parent = NotifContainer
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Notif
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.7
    UIStroke.Parent = Notif
    
    local ColorBar = Instance.new("Frame")
    ColorBar.Size = UDim2.new(0, 4, 1, 0)
    ColorBar.BorderSizePixel = 0
    ColorBar.Parent = Notif
    
    local colors = {
        info = BloxHub.Settings.Theme.Accent,
        success = BloxHub.Settings.Theme.Success,
        warning = BloxHub.Settings.Theme.Warning,
        error = BloxHub.Settings.Theme.Danger
    }
    ColorBar.BackgroundColor3 = colors[notifType] or colors.info
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = ColorBar
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -55, 0, 22)
    Title.Position = UDim2.new(0, 18, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = BloxHub.Settings.Theme.Text
    Title.TextSize = 14
    Title.Font = BloxHub.Settings.Font.Bold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextTruncate = Enum.TextTruncate.AtEnd
    Title.Parent = Notif
    
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.new(1, -55, 0, 38)
    Message.Position = UDim2.new(0, 18, 0, 32)
    Message.BackgroundTransparency = 1
    Message.Text = message
    Message.TextColor3 = BloxHub.Settings.Theme.TextDim
    Message.TextSize = 12
    Message.Font = BloxHub.Settings.Font.Regular
    Message.TextXAlignment = Enum.TextXAlignment.Left
    Message.TextYAlignment = Enum.TextYAlignment.Top
    Message.TextWrapped = true
    Message.Parent = Notif
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Position = UDim2.new(1, -32, 0, 10)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = BloxHub.Settings.Theme.TextDim
    CloseBtn.TextSize = 16
    CloseBtn.Font = BloxHub.Settings.Font.Bold
    CloseBtn.Parent = Notif
    
    BloxHub.Core.Tween(Notif, {Size = UDim2.new(1, 0, 0, 75)}, 0.3, Enum.EasingStyle.Back)
    
    local function closeNotif()
        BloxHub.Core.Tween(Notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
        task.wait(0.2)
        Notif:Destroy()
    end
    
    CloseBtn.MouseButton1Click:Connect(closeNotif)
    CloseBtn.MouseEnter:Connect(function()
        CloseBtn.TextColor3 = BloxHub.Settings.Theme.Danger
    end)
    CloseBtn.MouseLeave:Connect(function()
        CloseBtn.TextColor3 = BloxHub.Settings.Theme.TextDim
    end)
    
    task.delay(duration, function()
        if Notif and Notif.Parent then
            closeNotif()
        end
    end)
end

-- ═══════════════════════════════════════════════════════════
-- PERSISTENCE SYSTEM
-- ═══════════════════════════════════════════════════════════

function BloxHub.Core.SaveConfig(windowName, config)
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(config)
    end)
    
    if success and writefile then
        writefile("BloxHub_" .. windowName .. ".json", encoded)
        return true
    end
    return false
end

function BloxHub.Core.LoadConfig(windowName)
    if readfile and isfile and isfile("BloxHub_" .. windowName .. ".json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("BloxHub_" .. windowName .. ".json"))
        end)
        
        if success and data then
            return data
        end
    end
    return nil
end

-- ═══════════════════════════════════════════════════════════
-- UI ELEMENTS FACTORY
-- ═══════════════════════════════════════════════════════════

function BloxHub.Elements.CreateButton(parent, text, callback, options)
    options = options or {}
    
    local Button = Instance.new("TextButton")
    Button.Size = options.Size or UDim2.new(1, 0, 0, 38)
    Button.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Button.BackgroundColor3 = options.Color or BloxHub.Settings.Theme.Secondary
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.ClipsDescendants = true
    Button.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Button
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Button
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 14
    Label.Font = BloxHub.Settings.Font.Semibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Button
    
    if options.Icon then
        Label.Position = UDim2.new(0, 35, 0, 0)
        
        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 24, 0, 24)
        Icon.Position = UDim2.new(0, 8, 0.5, -12)
        Icon.BackgroundTransparency = 1
        Icon.Text = options.Icon
        Icon.TextSize = 18
        Icon.Font = BloxHub.Settings.Font.Regular
        Icon.Parent = Button
    end
    
    Button.MouseButton1Click:Connect(function()
        BloxHub.Core.CreateRipple(Button)
        if callback then
            callback()
        end
    end)
    
    Button.MouseEnter:Connect(function()
        BloxHub.Core.Tween(Button, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.3}, 0.2)
    end)
    
    Button.MouseLeave:Connect(function()
        BloxHub.Core.Tween(Button, {BackgroundColor3 = options.Color or BloxHub.Settings.Theme.Secondary}, 0.2)
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.6}, 0.2)
    end)
    
    return Button
end

function BloxHub.Elements.CreateToggle(parent, text, default, callback, options)
    options = options or {}
    
    local Container = Instance.new("Frame")
    Container.Size = options.Size or UDim2.new(1, 0, 0, 38)
    Container.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -80, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 13
    Label.Font = BloxHub.Settings.Font.Regular
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 50, 0, 26)
    Switch.Position = UDim2.new(1, -58, 0.5, -13)
    Switch.BackgroundColor3 = default and BloxHub.Settings.Theme.Success or Color3.fromRGB(60, 60, 70)
    Switch.Text = ""
    Switch.AutoButtonColor = false
    Switch.Parent = Container
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 20, 0, 20)
    Knob.Position = default and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = Switch
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local toggleValue = default
    
    Switch.MouseButton1Click:Connect(function()
        toggleValue = not toggleValue
        
        BloxHub.Core.Tween(Switch, {
            BackgroundColor3 = toggleValue and BloxHub.Settings.Theme.Success or Color3.fromRGB(60, 60, 70)
        }, 0.2)
        
        BloxHub.Core.Tween(Knob, {
            Position = toggleValue and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        }, 0.2, Enum.EasingStyle.Quad)
        
        if callback then
            callback(toggleValue)
        end
    end)
    
    Container.MouseEnter:Connect(function()
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.3}, 0.2)
    end)
    
    Container.MouseLeave:Connect(function()
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.6}, 0.2)
    end)
    
    Container.GetValue = function() return toggleValue end
    Container.SetValue = function(value)
        toggleValue = value
        Switch.BackgroundColor3 = value and BloxHub.Settings.Theme.Success or Color3.fromRGB(60, 60, 70)
        Knob.Position = value and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
    end
    
    return Container
end

function BloxHub.Elements.CreateSlider(parent, text, min, max, default, callback, options)
    options = options or {}
    
    local Container = Instance.new("Frame")
    Container.Size = options.Size or UDim2.new(1, 0, 0, 50)
    Container.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 22)
    Label.Position = UDim2.new(0, 12, 0, 8)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 13
    Label.Font = BloxHub.Settings.Font.Semibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.4, -12, 0, 22)
    ValueLabel.Position = UDim2.new(0.6, 0, 0, 8)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = BloxHub.Settings.Theme.Accent
    ValueLabel.TextSize = 13
    ValueLabel.Font = BloxHub.Settings.Font.Bold
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Container
    
    local SliderBack = Instance.new("Frame")
    SliderBack.Size = UDim2.new(1, -24, 0, 6)
    SliderBack.Position = UDim2.new(0, 12, 1, -14)
    SliderBack.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    SliderBack.BorderSizePixel = 0
    SliderBack.Parent = Container
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(1, 0)
    SliderCorner.Parent = SliderBack
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBack
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 16, 0, 16)
    Knob.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.ZIndex = 2
    Knob.Parent = SliderBack
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local KnobStroke = Instance.new("UIStroke")
    KnobStroke.Color = BloxHub.Settings.Theme.Accent
    KnobStroke.Thickness = 2
    KnobStroke.Parent = Knob
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, 0, 1, 20)
    SliderButton.Position = UDim2.new(0, 0, 0, -10)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    SliderButton.Parent = SliderBack
    
    local dragging = false
    local currentValue = default
    
    local function updateSlider(input)
        local relativeX = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * relativeX)
        
        if value ~= currentValue then
            currentValue = value
            ValueLabel.Text = tostring(value)
            
            BloxHub.Core.Tween(SliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.1)
            BloxHub.Core.Tween(Knob, {Position = UDim2.new(relativeX, -8, 0.5, -8)}, 0.1)
            
            if callback then
                callback(value)
            end
        end
    end
    
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            BloxHub.Core.Tween(Knob, {Size = UDim2.new(0, 18, 0, 18)}, 0.15, Enum.EasingStyle.Back)
            updateSlider(input)
        end
    end)
    
    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            BloxHub.Core.Tween(Knob, {Size = UDim2.new(0, 16, 0, 16)}, 0.15)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    Container.MouseEnter:Connect(function()
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.3}, 0.2)
    end)
    
    Container.MouseLeave:Connect(function()
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.6}, 0.2)
    end)
    
    Container.GetValue = function() return currentValue end
    Container.SetValue = function(value)
        local clampedValue = math.clamp(value, min, max)
        local relativeX = (clampedValue - min) / (max - min)
        currentValue = clampedValue
        ValueLabel.Text = tostring(clampedValue)
        SliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
        Knob.Position = UDim2.new(relativeX, -8, 0.5, -8)
    end
    
    return Container
end

function BloxHub.Elements.CreateKeybind(parent, text, defaultKey, callback, options)
    options = options or {}
    
    local Container = Instance.new("Frame")
    Container.Size = options.Size or UDim2.new(1, 0, 0, 38)
    Container.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, -10, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 13
    Label.Font = BloxHub.Settings.Font.Regular
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.5, -20, 0, 28)
    Button.Position = UDim2.new(0.5, 10, 0.5, -14)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Button.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
    Button.TextColor3 = BloxHub.Settings.Theme.Text
    Button.TextSize = 12
    Button.Font = BloxHub.Settings.Font.Semibold
    Button.AutoButtonColor = false
    Button.Parent = Container
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = BloxHub.Settings.Theme.Border
    BtnStroke.Thickness = 1
    BtnStroke.Transparency = 0.7
    BtnStroke.Parent = Button
    
    local currentKey = defaultKey
    local listening = false
    
    Button.MouseButton1Click:Connect(function()
        Button.Text = "Press any key..."
        BloxHub.Core.Tween(Button, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
        listening = true
        BloxHub.State.ListeningHotkey = {
            Button = Button,
            Container = Container,
            Callback = function(key)
                currentKey = key
                Button.Text = tostring(key):gsub("Enum.KeyCode.", "")
                BloxHub.Core.Tween(Button, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
                listening = false
                if callback then
                    callback(key)
                end
            end,
            Cancel = function()
                Button.Text = tostring(currentKey):gsub("Enum.KeyCode.", "")
                BloxHub.Core.Tween(Button, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
                listening = false
            end
        }
    end)
    
    Button.MouseEnter:Connect(function()
        if not listening then
            BloxHub.Core.Tween(BtnStroke, {Transparency = 0.3}, 0.2)
        end
    end)
    
    Button.MouseLeave:Connect(function()
        if not listening then
            BloxHub.Core.Tween(BtnStroke, {Transparency = 0.7}, 0.2)
        end
    end)
    
    Container.GetValue = function() return currentKey end
    Container.SetValue = function(key)
        currentKey = key
        Button.Text = tostring(key):gsub("Enum.KeyCode.", "")
    end
    
    return Container
end

function BloxHub.Elements.CreateDropdown(parent, text, options, defaultIndex, callback, opts)
    opts = opts or {}
    
    local Container = Instance.new("Frame")
    Container.Size = opts.Size or UDim2.new(1, 0, 0, 38)
    Container.Position = opts.Position or UDim2.new(0, 0, 0, 0)
    Container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Container.BorderSizePixel = 0
    Container.ClipsDescendants = false
    Container.ZIndex = 5
    Container.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.4, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 13
    Label.Font = BloxHub.Settings.Font.Regular
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.6, -20, 0, 28)
    Button.Position = UDim2.new(0.4, 10, 0.5, -14)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Button.Text = options[defaultIndex] or "Select..."
    Button.TextColor3 = BloxHub.Settings.Theme.Text
    Button.TextSize = 12
    Button.Font = BloxHub.Settings.Font.Semibold
    Button.AutoButtonColor = false
    Button.ClipsDescendants = true
    Button.Parent = Container
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button
    
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 1, 0)
    Arrow.Position = UDim2.new(1, -20, 0, 0)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "▼"
    Arrow.TextColor3 = BloxHub.Settings.Theme.TextDim
    Arrow.TextSize = 10
    Arrow.Font = BloxHub.Settings.Font.Regular
    Arrow.Parent = Button
    
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Size = UDim2.new(1, 0, 0, 0)
    DropdownFrame.Position = UDim2.new(0, 0, 1, 5)
    DropdownFrame.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    DropdownFrame.BorderSizePixel = 0
    DropdownFrame.ClipsDescendants = true
    DropdownFrame.Visible = false
    DropdownFrame.ZIndex = 10
    DropdownFrame.Parent = Container
    
    local DropCorner = Instance.new("UICorner")
    DropCorner.CornerRadius = UDim.new(0, 8)
    DropCorner.Parent = DropdownFrame
    
    local DropStroke = Instance.new("UIStroke")
    DropStroke.Color = BloxHub.Settings.Theme.Border
    DropStroke.Thickness = 1
    DropStroke.Transparency = 0.5
    DropStroke.Parent = DropdownFrame
    
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 2)
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Parent = DropdownFrame
    
    local selectedIndex = defaultIndex
    local isOpen = false
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, -8, 0, 32)
        OptionButton.Position = UDim2.new(0, 4, 0, 0)
        OptionButton.BackgroundColor3 = i == selectedIndex and BloxHub.Settings.Theme.Accent or Color3.fromRGB(45, 45, 55)
        OptionButton.Text = option
        OptionButton.TextColor3 = BloxHub.Settings.Theme.Text
        OptionButton.TextSize = 12
        OptionButton.Font = BloxHub.Settings.Font.Regular
        OptionButton.AutoButtonColor = false
        OptionButton.ZIndex = 11
        OptionButton.Parent = DropdownFrame
        
        local OptCorner = Instance.new("UICorner")
        OptCorner.CornerRadius = UDim.new(0, 6)
        OptCorner.Parent = OptionButton
        
        OptionButton.MouseButton1Click:Connect(function()
            selectedIndex = i
            Button.Text = option
            
            for _, child in ipairs(DropdownFrame:GetChildren()) do
                if child:IsA("TextButton") then
                    BloxHub.Core.Tween(child, {
                        BackgroundColor3 = Color3.fromRGB(45, 45, 55)
                    }, 0.2)
                end
            end
            
            BloxHub.Core.Tween(OptionButton, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
            
            task.wait(0.1)
            isOpen = false
            BloxHub.Core.Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            BloxHub.Core.Tween(Arrow, {Rotation = 0}, 0.2)
            task.wait(0.2)
            DropdownFrame.Visible = false
            
            if callback then
                callback(option, i)
            end
        end)
        
        OptionButton.MouseEnter:Connect(function()
            if i ~= selectedIndex then
                BloxHub.Core.Tween(OptionButton, {BackgroundColor3 = Color3.fromRGB(55, 55, 65)}, 0.2)
            end
        end)
        
        OptionButton.MouseLeave:Connect(function()
            if i ~= selectedIndex then
                BloxHub.Core.Tween(OptionButton, {BackgroundColor3 = Color3.fromRGB(45, 45, 55)}, 0.2)
            end
        end)
    end
    
    Button.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        
        if isOpen then
            DropdownFrame.Visible = true
            local targetHeight = #options * 34 + 8
            BloxHub.Core.Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, targetHeight)}, 0.25, Enum.EasingStyle.Back)
            BloxHub.Core.Tween(Arrow, {Rotation = 180}, 0.2)
        else
            BloxHub.Core.Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            BloxHub.Core.Tween(Arrow, {Rotation = 0}, 0.2)
            task.wait(0.2)
            DropdownFrame.Visible = false
        end
    end)
    
    Container.GetValue = function() return options[selectedIndex], selectedIndex end
    Container.SetValue = function(index)
        if index >= 1 and index <= #options then
            selectedIndex = index
            Button.Text = options[index]
        end
    end
    
    return Container
end

function BloxHub.Elements.CreateTextBox(parent, text, placeholder, callback, options)
    options = options or {}
    
    local Container = Instance.new("Frame")
    Container.Size = options.Size or UDim2.new(1, 0, 0, 38)
    Container.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Container.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.6
    UIStroke.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.3, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = BloxHub.Settings.Theme.Text
    Label.TextSize = 13
    Label.Font = BloxHub.Settings.Font.Regular
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.7, -20, 0, 28)
    TextBox.Position = UDim2.new(0.3, 10, 0.5, -14)
    TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    TextBox.PlaceholderText = placeholder or ""
    TextBox.PlaceholderColor3 = BloxHub.Settings.Theme.TextDim
    TextBox.Text = ""
    TextBox.TextColor3 = BloxHub.Settings.Theme.Text
    TextBox.TextSize = 12
    TextBox.Font = BloxHub.Settings.Font.Regular
    TextBox.ClearButtonMode = Enum.ClearButtonMode.WhileEditing
    TextBox.Parent = Container
    
    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 6)
    BoxCorner.Parent = TextBox
    
    local BoxPadding = Instance.new("UIPadding")
    BoxPadding.PaddingLeft = UDim.new(0, 10)
    BoxPadding.PaddingRight = UDim.new(0, 10)
    BoxPadding.Parent = TextBox
    
    TextBox.Focused:Connect(function()
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.2, Color = BloxHub.Settings.Theme.Accent}, 0.2)
    end)
    
    TextBox.FocusLost:Connect(function(enterPressed)
        BloxHub.Core.Tween(UIStroke, {Transparency = 0.6, Color = BloxHub.Settings.Theme.Border}, 0.2)
        if enterPressed and callback then
            callback(TextBox.Text)
        end
    end)
    
    Container.GetValue = function() return TextBox.Text end
    Container.SetValue = function(value) TextBox.Text = value end
    
    return Container
end

function BloxHub.Elements.CreateLabel(parent, text, options)
    options = options or {}
    
    local Label = Instance.new("TextLabel")
    Label.Size = options.Size or UDim2.new(1, 0, 0, 28)
    Label.Position = options.Position or UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = options.Color or BloxHub.Settings.Theme.TextDim
    Label.TextSize = options.TextSize or 12
    Label.Font = options.Font or BloxHub.Settings.Font.Regular
    Label.TextXAlignment = options.Alignment or Enum.TextXAlignment.Left
    Label.TextWrapped = true
    Label.Parent = parent
    
    if options.Bold then
        Label.Font = BloxHub.Settings.Font.Bold
    end
    
    Label.SetText = function(newText)
        Label.Text = newText
    end
    
    return Label
end

function BloxHub.Elements.CreatePopup(title, content, buttons)
    local Popup = Instance.new("Frame")
    Popup.Size = UDim2.new(0, 0, 0, 0)
    Popup.Position = UDim2.new(0.5, 0, 0.5, 0)
    Popup.AnchorPoint = Vector2.new(0.5, 0.5)
    Popup.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    Popup.BorderSizePixel = 0
    Popup.ZIndex = 100
    Popup.Parent = BloxHub.UI.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Popup
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Accent
    UIStroke.Thickness = 2
    UIStroke.Parent = Popup
    
    local Shadow = Instance.new("ImageLabel")
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.7
    Shadow.ZIndex = 99
    Shadow.Parent = BloxHub.UI.ScreenGui
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 40)
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = BloxHub.Settings.Theme.Text
    Title.TextSize = 16
    Title.Font = BloxHub.Settings.Font.Bold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Popup
    
    local Content = Instance.new("TextLabel")
    Content.Size = UDim2.new(1, -40, 0, 60)
    Content.Position = UDim2.new(0, 20, 0, 55)
    Content.BackgroundTransparency = 1
    Content.Text = content
    Content.TextColor3 = BloxHub.Settings.Theme.TextDim
    Content.TextSize = 13
    Content.Font = BloxHub.Settings.Font.Regular
    Content.TextXAlignment = Enum.TextXAlignment.Left
    Content.TextYAlignment = Enum.TextYAlignment.Top
    Content.TextWrapped = true
    Content.Parent = Popup
    
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Size = UDim2.new(1, -40, 0, 40)
    ButtonContainer.Position = UDim2.new(0, 20, 1, -50)
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = Popup
    
    local ButtonLayout = Instance.new("UIListLayout")
    ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
    ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ButtonLayout.Padding = UDim.new(0, 10)
    ButtonLayout.Parent = ButtonContainer
    
    buttons = buttons or {
        {Text = "OK", Callback = function() end}
    }
    
    for _, buttonData in ipairs(buttons) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 80, 1, 0)
        Button.BackgroundColor3 = buttonData.Color or BloxHub.Settings.Theme.Accent
        Button.Text = buttonData.Text
        Button.TextColor3 = BloxHub.Settings.Theme.Text
        Button.TextSize = 13
        Button.Font = BloxHub.Settings.Font.Semibold
        Button.AutoButtonColor = false
        Button.Parent = ButtonContainer
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Button
        
        Button.MouseButton1Click:Connect(function()
            BloxHub.Core.CreateRipple(Button)
            
            if buttonData.Callback then
                buttonData.Callback()
            end
            
            BloxHub.Core.Tween(Popup, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
            BloxHub.Core.Tween(Shadow, {ImageTransparency = 1}, 0.2)
            task.wait(0.2)
            Popup:Destroy()
            Shadow:Destroy()
        end)
        
        Button.MouseEnter:Connect(function()
            BloxHub.Core.Tween(Button, {BackgroundColor3 = BloxHub.Settings.Theme.AccentHover}, 0.2)
        end)
        
        Button.MouseLeave:Connect(function()
            BloxHub.Core.Tween(Button, {BackgroundColor3 = buttonData.Color or BloxHub.Settings.Theme.Accent}, 0.2)
        end)
    end
    
    BloxHub.Core.Tween(Popup, {Size = UDim2.new(0, 400, 0, 180)}, 0.3, Enum.EasingStyle.Back)
    
    return Popup
end

-- ═══════════════════════════════════════════════════════════
-- WINDOW & TAB SYSTEM
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateWindow(title, options)
    options = options or {}
    
    local Window = {
        Title = title,
        Tabs = {},
        CurrentTab = nil,
        Hotkey = options.Hotkey or BloxHub.Settings.DefaultHotkey,
        Visible = true
    }
    
    -- Create ScreenGui if not exists
    if not BloxHub.UI.ScreenGui then
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "BloxHubGUI_" .. title
        ScreenGui.ResetOnSpawn = false
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        if gethui then
            ScreenGui.Parent = gethui()
        elseif syn and syn.protect_gui then
            syn.protect_gui(ScreenGui)
            ScreenGui.Parent = game:GetService("CoreGui")
        else
            ScreenGui.Parent = game:GetService("CoreGui")
        end
        
        BloxHub.UI.ScreenGui = ScreenGui
    end
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame_" .. title
    MainFrame.Size = UDim2.new(0, 580, 0, 460)
    MainFrame.Position = UDim2.new(0.5, -290, 0.5, -230)
    MainFrame.BackgroundColor3 = BloxHub.Settings.Theme.Primary
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = BloxHub.UI.ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 14)
    UICorner.Parent = MainFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = BloxHub.Settings.Theme.Border
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.5
    UIStroke.Parent = MainFrame
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 14)
    HeaderCorner.Parent = Header
    
    local HeaderBar = Instance.new("Frame")
    HeaderBar.Size = UDim2.new(1, 0, 0, 3)
    HeaderBar.Position = UDim2.new(0, 0, 1, -3)
    HeaderBar.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    HeaderBar.BorderSizePixel = 0
    HeaderBar.Parent = Header
    
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(0, 35, 0, 35)
    Logo.Position = UDim2.new(0, 12, 0.5, -17.5)
    Logo.BackgroundTransparency = 1
    Logo.Text = "🧩"
    Logo.TextSize = 22
    Logo.Font = BloxHub.Settings.Font.Regular
    Logo.Parent = Header
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0, 300, 1, 0)
    TitleLabel.Position = UDim2.new(0, 52, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = BloxHub.Settings.Theme.Text
    TitleLabel.TextSize = 18
    TitleLabel.Font = BloxHub.Settings.Font.Bold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Header
    
    -- Control Buttons
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 35, 0, 35)
    CloseBtn.Position = UDim2.new(1, -42, 0.5, -17.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = BloxHub.Settings.Theme.Text
    CloseBtn.TextSize = 16
    CloseBtn.Font = BloxHub.Settings.Font.Bold
    CloseBtn.AutoButtonColor = false
    CloseBtn.Parent = Header
    
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.CornerRadius = UDim.new(0, 8)
    CloseBtnCorner.Parent = CloseBtn
    
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
    MinimizeBtn.Position = UDim2.new(1, -84, 0.5, -17.5)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    MinimizeBtn.Text = "−"
    MinimizeBtn.TextColor3 = BloxHub.Settings.Theme.Text
    MinimizeBtn.TextSize = 20
    MinimizeBtn.Font = BloxHub.Settings.Font.Bold
    MinimizeBtn.AutoButtonColor = false
    MinimizeBtn.Parent = Header
    
    local MinBtnCorner = Instance.new("UICorner")
    MinBtnCorner.CornerRadius = UDim.new(0, 8)
    MinBtnCorner.Parent = MinimizeBtn
    
    CloseBtn.MouseButton1Click:Connect(function()
        BloxHub.Core.Tween(CloseBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Danger}, 0.15)
        task.wait(0.15)
        BloxHub.Core.Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back)
        task.wait(0.3)
        MainFrame:Destroy()
        BloxHub.Core.Notify("BloxHub", "Window closed", 2, "info")
    end)
    
    MinimizeBtn.MouseButton1Click:Connect(function()
        Window:Toggle()
    end)
    
    CloseBtn.MouseEnter:Connect(function()
        BloxHub.Core.Tween(CloseBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Danger}, 0.2)
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        BloxHub.Core.Tween(CloseBtn, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
    end)
    
    MinimizeBtn.MouseEnter:Connect(function()
        BloxHub.Core.Tween(MinimizeBtn, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
    end)
    
    MinimizeBtn.MouseLeave:Connect(function()
        BloxHub.Core.Tween(MinimizeBtn, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
    end)
    
    BloxHub.Core.MakeDraggable(MainFrame, Header)
    
    -- Tab Container (Sidebar)
    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 160, 1, -70)
    TabContainer.Position = UDim2.new(0, 10, 0, 60)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 4
    TabContainer.ScrollBarImageColor3 = BloxHub.Settings.Theme.Accent
    TabContainer.BorderSizePixel = 0
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.Parent = MainFrame
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Padding = UDim.new(0, 8)
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Parent = TabContainer
    
    TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 10)
    end)
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -190, 1, -70)
    ContentContainer.Position = UDim2.new(0, 180, 0, 60)
    ContentContainer.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 10)
    ContentCorner.Parent = ContentContainer
    
    Window.MainFrame = MainFrame
    Window.TabContainer = TabContainer
    Window.ContentContainer = ContentContainer
    
    -- Icon Toggle
    local Icon = Instance.new("TextButton")
    Icon.Name = "IconToggle"
    Icon.Size = UDim2.new(0, 120, 0, 45)
    Icon.Position = BloxHub.State.IconPosition
    Icon.BackgroundColor3 = BloxHub.Settings.Theme.Accent
    Icon.Text = "🧩 " .. title
    Icon.TextColor3 = BloxHub.Settings.Theme.Text
    Icon.TextSize = 14
    Icon.Font = BloxHub.Settings.Font.Bold
    Icon.Visible = false
    Icon.AutoButtonColor = false
    Icon.Parent = BloxHub.UI.ScreenGui
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = Icon
    
    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = BloxHub.Settings.Theme.AccentHover
    IconStroke.Thickness = 2
    IconStroke.Parent = Icon
    
    Icon.MouseButton1Click:Connect(function()
        Window:Toggle()
    end)
    
    Icon.MouseEnter:Connect(function()
        BloxHub.Core.Tween(Icon, {BackgroundColor3 = BloxHub.Settings.Theme.AccentHover}, 0.2)
        BloxHub.Core.Tween(Icon, {Size = UDim2.new(0, 125, 0, 48)}, 0.2, Enum.EasingStyle.Back)
    end)
    
    Icon.MouseLeave:Connect(function()
        BloxHub.Core.Tween(Icon, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
        BloxHub.Core.Tween(Icon, {Size = UDim2.new(0, 120, 0, 45)}, 0.2, Enum.EasingStyle.Back)
    end)
    
    BloxHub.Core.MakeDraggable(Icon)
    
    Window.Icon = Icon
    
    -- Window Methods
    function Window:Toggle()
        self.Visible = not self.Visible
        
        if self.Visible then
            self.Icon.Visible = false
            self.MainFrame.Visible = true
            BloxHub.Core.Tween(self.MainFrame, {Size = UDim2.new(0, 580, 0, 460)}, 0.35, Enum.EasingStyle.Back)
        else
            BloxHub.Core.Tween(self.MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back)
            task.wait(0.3)
            self.MainFrame.Visible = false
            if BloxHub.Settings.IconEnabled then
                self.Icon.Visible = true
            end
        end
    end
    
    function Window:CreateTab(tabName, options)
        options = options or {}
        
        local Tab = {
            Name = tabName,
            Window = self,
            Elements = {},
            Visible = false
        }
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "Tab_" .. tabName
        TabButton.Size = UDim2.new(1, 0, 0, 42)
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        TabButton.Text = ""
        TabButton.AutoButtonColor = false
        TabButton.Parent = self.TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        local TabStroke = Instance.new("UIStroke")
        TabStroke.Color = BloxHub.Settings.Theme.Border
        TabStroke.Thickness = 1
        TabStroke.Transparency = 0.7
        TabStroke.Parent = TabButton
        
        local TabIcon = Instance.new("TextLabel")
        TabIcon.Size = UDim2.new(0, 24, 0, 24)
        TabIcon.Position = UDim2.new(0, 12, 0.5, -12)
        TabIcon.BackgroundTransparency = 1
        TabIcon.Text = options.Icon or "📋"
        TabIcon.TextSize = 18
        TabIcon.Font = BloxHub.Settings.Font.Regular
        TabIcon.Parent = TabButton
        
        local TabLabel = Instance.new("TextLabel")
        TabLabel.Size = UDim2.new(1, -50, 1, 0)
        TabLabel.Position = UDim2.new(0, 42, 0, 0)
        TabLabel.BackgroundTransparency = 1
        TabLabel.Text = tabName
        TabLabel.TextColor3 = BloxHub.Settings.Theme.TextDim
        TabLabel.TextSize = 14
        TabLabel.Font = BloxHub.Settings.Font.Semibold
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        TabLabel.Parent = TabButton
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = "Content_" .. tabName
        TabContent.Size = UDim2.new(1, -20, 1, -20)
        TabContent.Position = UDim2.new(0, 10, 0, 10)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 5
        TabContent.ScrollBarImageColor3 = BloxHub.Settings.Theme.Accent
        TabContent.BorderSizePixel = 0
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Visible = false
        TabContent.Parent = self.ContentContainer
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Padding = UDim.new(0, 10)
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Parent = TabContent
        
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        
        TabButton.MouseButton1Click:Connect(function()
            for _, otherTab in pairs(self.Tabs) do
                otherTab.Content.Visible = false
                otherTab.Visible = false
                BloxHub.Core.Tween(otherTab.Button, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}, 0.2)
                BloxHub.Core.Tween(otherTab.Button:FindFirstChild("TextLabel"), {TextColor3 = BloxHub.Settings.Theme.TextDim}, 0.2)
                local stroke = otherTab.Button:FindFirstChild("UIStroke")
                if stroke then
                    BloxHub.Core.Tween(stroke, {Transparency = 0.7}, 0.2)
                end
            end
            
            TabContent.Visible = true
            Tab.Visible = true
            self.CurrentTab = Tab
            BloxHub.Core.Tween(TabButton, {BackgroundColor3 = BloxHub.Settings.Theme.Accent}, 0.2)
            BloxHub.Core.Tween(TabLabel, {TextColor3 = BloxHub.Settings.Theme.Text}, 0.2)
            BloxHub.Core.Tween(TabStroke, {Transparency = 0.3}, 0.2)
        end)
        
        TabButton.MouseEnter:Connect(function()
            if not Tab.Visible then
                BloxHub.Core.Tween(TabStroke, {Transparency = 0.4}, 0.2)
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if not Tab.Visible then
                BloxHub.Core.Tween(TabStroke, {Transparency = 0.7}, 0.2)
            end
        end)
        
        -- Tab Element Methods
        function Tab:AddButton(text, callback, options)
            local button = BloxHub.Elements.CreateButton(self.Content, text, callback, options)
            table.insert(self.Elements, button)
            return button
        end
        
        function Tab:AddToggle(text, default, callback, options)
            local toggle = BloxHub.Elements.CreateToggle(self.Content, text, default, callback, options)
            table.insert(self.Elements, toggle)
            return toggle
        end
        
        function Tab:AddSlider(text, min, max, default, callback, options)
            local slider = BloxHub.Elements.CreateSlider(self.Content, text, min, max, default, callback, options)
            table.insert(self.Elements, slider)
            return slider
        end
        
        function Tab:AddKeybind(text, defaultKey, callback, options)
            local keybind = BloxHub.Elements.CreateKeybind(self.Content, text, defaultKey, callback, options)
            table.insert(self.Elements, keybind)
            return keybind
        end
        
        function Tab:AddDropdown(text, options, defaultIndex, callback, opts)
            local dropdown = BloxHub.Elements.CreateDropdown(self.Content, text, options, defaultIndex, callback, opts)
            table.insert(self.Elements, dropdown)
            return dropdown
        end
        
        function Tab:AddTextBox(text, placeholder, callback, options)
            local textbox = BloxHub.Elements.CreateTextBox(self.Content, text, placeholder, callback, options)
            table.insert(self.Elements, textbox)
            return textbox
        end
        
        function Tab:AddLabel(text, options)
            local label = BloxHub.Elements.CreateLabel(self.Content, text, options)
            table.insert(self.Elements, label)
            return label
        end
        
        function Tab:AddSection(text)
            local Section = Instance.new("Frame")
            Section.Size = UDim2.new(1, 0, 0, 35)
            Section.BackgroundTransparency = 1
            Section.Parent = self.Content
            
            local Line = Instance.new("Frame")
            Line.Size = UDim2.new(1, 0, 0, 1)
            Line.Position = UDim2.new(0, 0, 0.5, 0)
            Line.BackgroundColor3 = BloxHub.Settings.Theme.Border
            Line.BorderSizePixel = 0
            Line.Parent = Section
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 0, 1, 0)
            Label.Position = UDim2.new(0, 0, 0, 0)
            Label.BackgroundColor3 = BloxHub.Settings.Theme.Secondary
            Label.Text = " " .. text .. " "
            Label.TextColor3 = BloxHub.Settings.Theme.Text
            Label.TextSize = 13
            Label.Font = BloxHub.Settings.Font.Bold
            Label.AutomaticSize = Enum.AutomaticSize.X
            Label.Parent = Section
            
            table.insert(self.Elements, Section)
            return Section
        end
        
        function Tab:AddPopup(title, content, buttons)
            return BloxHub.Elements.CreatePopup(title, content, buttons)
        end
        
        table.insert(self.Tabs, Tab)
        
        -- Auto-select first tab
        if #self.Tabs == 1 then
            TabButton.MouseButton1Click:Fire()
        end
        
        return Tab
    end
    
    function Window:GetTab(tabName)
        for _, tab in pairs(self.Tabs) do
            if tab.Name == tabName then
                return tab
            end
        end
        return nil
    end
    
    function Window:Notify(title, message, duration, notifType)
        BloxHub.Core.Notify(title, message, duration, notifType)
    end
    
    table.insert(BloxHub.State.Windows, Window)
    BloxHub.State.ActiveWindow = Window
    
    return Window
end

-- ═══════════════════════════════════════════════════════════
-- INPUT HANDLING
-- ═══════════════════════════════════════════════════════════

function BloxHub:SetupInputHandling()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        -- Keybind listening mode
        if self.State.ListeningHotkey then
            local keyName = input.KeyCode.Name
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                keyName = "MouseButton1"
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                keyName = "MouseButton2"
            elseif input.KeyCode == Enum.KeyCode.Escape then
                self.State.ListeningHotkey.Cancel()
                self.State.ListeningHotkey = nil
                return
            end
            
            self.State.ListeningHotkey.Callback(input.KeyCode)
            self.State.ListeningHotkey = nil
            return
        end
        
        -- Window hotkey detection
        for _, window in pairs(self.State.Windows) do
            if input.KeyCode == window.Hotkey then
                window:Toggle()
                break
            end
        end
    end)
end

-- ═══════════════════════════════════════════════════════════
-- LAYOUT HELPERS
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateGrid(parent, columns, cellSize, padding)
    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.CellSize = cellSize or UDim2.new(0, 150, 0, 105)
    GridLayout.CellPadding = padding or UDim2.new(0, 10, 0, 10)
    GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    GridLayout.Parent = parent
    
    return GridLayout
end

function BloxHub:CreateVerticalStack(parent, spacing)
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, spacing or 10)
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Parent = parent
    
    return ListLayout
end

-- ═══════════════════════════════════════════════════════════
-- THEME SYSTEM
-- ═══════════════════════════════════════════════════════════

function BloxHub:SetTheme(themeName)
    local themes = {
        Default = {
            Primary = Color3.fromRGB(45, 45, 55),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(88, 101, 242),
            AccentHover = Color3.fromRGB(108, 121, 255),
            Success = Color3.fromRGB(67, 181, 129),
            Warning = Color3.fromRGB(250, 166, 26),
            Danger = Color3.fromRGB(237, 66, 69),
            Text = Color3.fromRGB(255, 255, 255),
            TextDim = Color3.fromRGB(180, 180, 190),
            Border = Color3.fromRGB(60, 60, 75)
        },
        Dark = {
            Primary = Color3.fromRGB(20, 20, 25),
            Secondary = Color3.fromRGB(15, 15, 20),
            Accent = Color3.fromRGB(0, 120, 255),
            AccentHover = Color3.fromRGB(30, 140, 255),
            Success = Color3.fromRGB(40, 160, 100),
            Warning = Color3.fromRGB(230, 150, 20),
            Danger = Color3.fromRGB(220, 50, 50),
            Text = Color3.fromRGB(240, 240, 245),
            TextDim = Color3.fromRGB(150, 150, 160),
            Border = Color3.fromRGB(40, 40, 50)
        },
        Light = {
            Primary = Color3.fromRGB(240, 240, 245),
            Secondary = Color3.fromRGB(250, 250, 255),
            Accent = Color3.fromRGB(0, 100, 255),
            AccentHover = Color3.fromRGB(20, 120, 255),
            Success = Color3.fromRGB(40, 180, 100),
            Warning = Color3.fromRGB(255, 160, 20),
            Danger = Color3.fromRGB(240, 60, 60),
            Text = Color3.fromRGB(20, 20, 30),
            TextDim = Color3.fromRGB(100, 100, 120),
            Border = Color3.fromRGB(200, 200, 210)
        }
    }
    
    local theme = themes[themeName] or themes.Default
    for key, value in pairs(theme) do
        self.Settings.Theme[key] = value
    end
    
    self.Core.Notify("Theme", "Theme changed to " .. themeName, 2, "success")
end

-- ═══════════════════════════════════════════════════════════
-- INITIALIZATION
-- ═══════════════════════════════════════════════════════════

function BloxHub:Initialize()
    print("╔═══════════════════════════════════════════════╗")
    print("║     🧩 BloxHub GUI Framework v2.0             ║")
    print("║     Universal Roblox GUI System               ║")
    print("╚═══════════════════════════════════════════════╝")
    
    self:SetupInputHandling()
    
    print("[BloxHub] Framework initialized successfully")
    print("[BloxHub] Use BloxHub:CreateWindow() to start")
    
    return self
end

-- ═══════════════════════════════════════════════════════════
-- EXAMPLE USAGE (DEMO)
-- ═══════════════════════════════════════════════════════════

function BloxHub:CreateDefaultExample()
    local Window = self:CreateWindow("BloxHub Demo", {
        Hotkey = Enum.KeyCode.LeftAlt
    })
    
    -- Main Tab
    local MainTab = Window:CreateTab("Main", {Icon = "🏠"})
    MainTab:AddSection("Features")
    
    MainTab:AddToggle("ESP", false, function(value)
        print("ESP:", value)
        Window:Notify("ESP", "ESP " .. (value and "enabled" or "disabled"), 2, value and "success" or "info")
    end, {Icon = "👁️"})
    
    MainTab:AddToggle("Aimbot", false, function(value)
        print("Aimbot:", value)
    end, {Icon = "🎯"})
    
    MainTab:AddToggle("No Recoil", false, function(value)
        print("No Recoil:", value)
    end, {Icon = "🔫"})
    
    MainTab:AddSection("Configuration")
    
    MainTab:AddSlider("FOV", 60, 120, 90, function(value)
        print("FOV:", value)
    end)
    
    MainTab:AddSlider("Smoothness", 0, 100, 50, function(value)
        print("Smoothness:", value)
    end)
    
    -- Settings Tab
    local SettingsTab = Window:CreateTab("Settings", {Icon = "⚙️"})
    SettingsTab:AddSection("Hotkeys")
    
    SettingsTab:AddKeybind("Toggle GUI", Enum.KeyCode.LeftAlt, function(key)
        Window.Hotkey = key
        print("GUI Hotkey:", key)
    end)
    
    SettingsTab:AddKeybind("ESP Toggle", Enum.KeyCode.E, function(key)
        print("ESP Hotkey:", key)
    end)
    
    SettingsTab:AddSection("Display")
    
    SettingsTab:AddToggle("Icon Mode", true, function(value)
        BloxHub.Settings.IconEnabled = value
    end)
    
    SettingsTab:AddDropdown("Theme", {"Default", "Dark", "Light"}, 1, function(option)
        BloxHub:SetTheme(option)
    end)
    
    -- Info Tab
    local InfoTab = Window:CreateTab("Info", {Icon = "ℹ️"})
    InfoTab:AddLabel("BloxHub GUI Framework v2.0", {Bold = true, TextSize = 16})
    InfoTab:AddLabel("A fully customizable and modular GUI system for Roblox executors.", {TextSize = 12})
    InfoTab:AddLabel("", {Size = UDim2.new(1, 0, 0, 10)})
    
    InfoTab:AddButton("Show Popup", function()
        InfoTab:AddPopup("Example Popup", "This is a popup example with multiple buttons!", {
            {Text = "OK", Callback = function() print("OK clicked") end},
            {Text = "Cancel", Color = BloxHub.Settings.Theme.Danger, Callback = function() print("Cancel clicked") end}
        })
    end, {Icon = "💬"})
    
    InfoTab:AddSection("Credits")
    InfoTab:AddLabel("Created by BloxHub Team", {Color = BloxHub.Settings.Theme.Accent})
    InfoTab:AddLabel("Last Updated: 2025-11-12")
    
    Window:Notify("BloxHub", "Successfully loaded! Press LeftAlt to toggle.", 4, "success")
    
    return Window
end

-- Initialize and return
BloxHub:Initialize()

-- Auto-create example if needed (comment out for library use)
-- BloxHub:CreateDefaultExample()

return BloxHub
