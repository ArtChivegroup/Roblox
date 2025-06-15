--// GUI Setup
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "AutoEHoldGUI"

-- Frame Utama
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0.3, 0, 0.2, 0)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

-- Input Box
local timeInput = Instance.new("TextBox", frame)
timeInput.Size = UDim2.new(0.8, 0, 0.3, 0)
timeInput.Position = UDim2.new(0.1, 0, 0.1, 0)
timeInput.PlaceholderText = "Set hold time (seconds)"
timeInput.Text = ""
timeInput.TextScaled = true
timeInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
timeInput.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Status Text
local statusText = Instance.new("TextLabel", frame)
statusText.Size = UDim2.new(0.8, 0, 0.3, 0)
statusText.Position = UDim2.new(0.1, 0, 0.5, 0)
statusText.BackgroundTransparency = 1
statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
statusText.TextScaled = true
statusText.Text = "Waiting for input..."

-- Close Button
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0.2, 0, 0.2, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true

-- Minimize Button
local minimizeButton = Instance.new("TextButton", frame)
minimizeButton.Size = UDim2.new(0.2, 0, 0.2, 0)
minimizeButton.Position = UDim2.new(0.6, 0, 0, 0)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextScaled = true

-- Minimize Icon
local iconButton = Instance.new("TextButton", screenGui)
iconButton.Size = UDim2.new(0, 50, 0, 50)
iconButton.Position = UDim2.new(0, 10, 0, 10)
iconButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
iconButton.TextColor3 = Color3.fromRGB(255, 255, 255)
iconButton.TextScaled = true
iconButton.Text = "E"
iconButton.Visible = false

local dragging = false
local offset = Vector2.new()

-- Dragging Function
iconButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        offset = input.Position - iconButton.Position
    end
end)

iconButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        iconButton.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
    end
end)

-- Minimize Logic
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    iconButton.Visible = true
end)

-- Restore Logic
iconButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    iconButton.Visible = false
end)

-- Close Logic
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

--// Script Logic
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local holding = false
local customTime = 1.5 -- Default

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.E and not gameProcessed and not holding then
        -- Ambil waktu custom dari input
        local inputNumber = tonumber(timeInput.Text)
        if inputNumber and inputNumber > 0 then
            customTime = inputNumber
            holding = true
            statusText.Text = "Holding E for " .. customTime .. " sec"
            
            -- Tekan E
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            
            -- Tunggu sesuai timer
            task.wait(customTime)
            
            -- Lepas E
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            statusText.Text = "Auto Released!"
            
            -- Reset
            task.wait(1)
            statusText.Text = "Waiting for input..."
            holding = false
        else
            statusText.Text = "Please enter a valid number!"
        end
    end
end)
