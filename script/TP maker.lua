--// Waypoint Maker Tool Client-Side (Clean Version)

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local waypoints = {}

-- GUI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "WaypointMaker"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 350, 0, 260)
frame.Position = UDim2.new(0.5, -175, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Waypoint Maker"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(1, -20, 0, 30)
inputBox.Position = UDim2.new(0, 10, 0, 40)
inputBox.PlaceholderText = "Enter waypoint name..."
inputBox.Font = Enum.Font.SourceSans
inputBox.TextSize = 18
inputBox.Text = ""
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.BorderSizePixel = 0

local addBtn = Instance.new("TextButton", frame)
addBtn.Size = UDim2.new(0, 140, 0, 30)
addBtn.Position = UDim2.new(0, 10, 0, 80)
addBtn.Text = "Add Waypoint"
addBtn.Font = Enum.Font.SourceSansBold
addBtn.TextSize = 16
addBtn.TextColor3 = Color3.new(1,1,1)
addBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 60)

local exportBtn = Instance.new("TextButton", frame)
exportBtn.Size = UDim2.new(0, 140, 0, 30)
exportBtn.Position = UDim2.new(0, 170, 0, 80)
exportBtn.Text = "Export"
exportBtn.Font = Enum.Font.SourceSansBold
exportBtn.TextSize = 16
exportBtn.TextColor3 = Color3.new(1,1,1)
exportBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 100)

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -20, 0, 110)
scroll.Position = UDim2.new(0, 10, 0, 120)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
scroll.BackgroundTransparency = 0.1
scroll.BorderSizePixel = 0

local minimize = Instance.new("TextButton", frame)
minimize.Size = UDim2.new(0, 80, 0, 25)
minimize.Position = UDim2.new(0, 10, 1, -35)
minimize.Text = "Minimize"
minimize.Font = Enum.Font.SourceSansBold
minimize.TextSize = 14
minimize.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimize.TextColor3 = Color3.new(1, 1, 1)

local exit = Instance.new("TextButton", frame)
exit.Size = UDim2.new(0, 80, 0, 25)
exit.Position = UDim2.new(1, -90, 1, -35)
exit.Text = "Exit"
exit.Font = Enum.Font.SourceSansBold
exit.TextSize = 14
exit.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
exit.TextColor3 = Color3.new(1, 1, 1)

-- Minimized icon (TPM)
local tpmButton = Instance.new("TextButton", screenGui)
tpmButton.Size = UDim2.new(0, 60, 0, 30)
tpmButton.Position = UDim2.new(0, 10, 1, -40)
tpmButton.Text = "TPM"
tpmButton.Visible = false
tpmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
tpmButton.TextColor3 = Color3.new(1,1,1)
tpmButton.Font = Enum.Font.SourceSansBold
tpmButton.TextSize = 16

-- Waypoint function
local function updateWaypointList()
	scroll:ClearAllChildren()
	scroll.CanvasSize = UDim2.new(0, 0, 0, #waypoints * 30)
	for i, wp in ipairs(waypoints) do
		local btn = Instance.new("TextButton", scroll)
		btn.Size = UDim2.new(1, -10, 0, 25)
		btn.Position = UDim2.new(0, 5, 0, (i-1)*30)
		btn.Text = wp.name
		btn.Font = Enum.Font.SourceSans
		btn.TextSize = 16
		btn.TextColor3 = Color3.new(1,1,1)
		btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		btn.MouseButton1Click:Connect(function()
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.CFrame = wp.cframe + Vector3.new(0, 3, 0)
			end
		end)
	end
end

-- Add Waypoint
addBtn.MouseButton1Click:Connect(function()
	local name = inputBox.Text
	local target = mouse.Target
	if target and name ~= "" then
		local cf = target.CFrame
		table.insert(waypoints, {name = name, cframe = cf})
		updateWaypointList()
	end
end)

-- Export
exportBtn.MouseButton1Click:Connect(function()
	local exportStr = "-- Waypoints Exported\nlocal waypoints = {}\n"
	for i, wp in ipairs(waypoints) do
		local cf = wp.cframe
		exportStr = exportStr .. ("waypoints[%d] = {name = %q, cframe = CFrame.new(%s)}\n"):format(i, wp.name, tostring(cf))
	end

	setclipboard(exportStr)

	local popup = Instance.new("TextLabel", screenGui)
	popup.Text = "Waypoints copied to clipboard!"
	popup.Size = UDim2.new(0, 300, 0, 40)
	popup.Position = UDim2.new(0.5, -150, 0.5, -100)
	popup.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	popup.TextColor3 = Color3.new(1, 1, 1)
	popup.Font = Enum.Font.SourceSansBold
	popup.TextSize = 18
	popup.BackgroundTransparency = 0.2
	wait(2)
	popup:Destroy()
end)

-- Minimize
local isMin = false
minimize.MouseButton1Click:Connect(function()
	if not isMin then
		frame.Visible = false
		tpmButton.Visible = true
	else
		frame.Visible = true
		tpmButton.Visible = false
	end
	isMin = not isMin
end)

-- TPM Button Restore
tpmButton.MouseButton1Click:Connect(function()
	frame.Visible = true
	tpmButton.Visible = false
	isMin = false
end)

-- Exit
exit.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
