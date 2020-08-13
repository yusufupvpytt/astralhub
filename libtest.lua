local library = {
    windowcount = 1;
}
local toggled = true


function library:Createwin(textt)
    local ScreenGui = Instance.new("ScreenGui")
    local Topmain = Instance.new("Frame")
    local Contanier = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local Title = Instance.new("TextLabel")
    local Visible = Instance.new("TextButton")
    self.windowcount = self.windowcount + 1;
    ScreenGui.Parent = game.CoreGui
    Topmain.Name = "Topmain"
    Topmain.Parent = ScreenGui
    Topmain.AnchorPoint = Vector2.new(0.5, 0)
    Topmain.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
    Topmain.BorderSizePixel = 0
    Topmain.Size = UDim2.new(0, 130, 0, 26)
    Topmain.Position = UDim2.new(0, (15 + ((200 * self.windowcount) - 200)), 0, 15)


    local UserInputService = game:GetService("UserInputService")

local gui = Topmain

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

    Contanier.Name = "Contanier"
    Contanier.Parent = Topmain
    Contanier.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    Contanier.BorderSizePixel = 0
    Contanier.ClipsDescendants = true
    Contanier.Position = UDim2.new(0, 0, 1, 0)
    Contanier.Size = UDim2.new(0, 130, 0, 179)

    UIGridLayout.Parent = Contanier
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 129, 0, 25)


    Title.Name = "Title"
    Title.Parent = Topmain
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0, 130, 0, 26)
    Title.Font = Enum.Font.SourceSans
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 14
    Title.Text = textt
    Title.Draggable = true
   
    Visible.Name = "Visible"
    Visible.Parent = Topmain
    Visible.BackgroundColor3 = Color3.new(1, 1, 1)
    Visible.BackgroundTransparency = 1
    Visible.Position = UDim2.new(0.746153891, 0, 0, 0)
    Visible.Rotation = 90
    Visible.Size = UDim2.new(0, 40, 0, 26)
    Visible.Font = Enum.Font.SourceSans
    Visible.Text = ">"
    Visible.TextColor3 = Color3.new(1, 1, 1)
    Visible.TextScaled = true
    Visible.TextSize = 14
    Visible.TextWrapped = true
    Visible.MouseButton1Click:Connect(function()
        if toggled then
            toggled = false
               Contanier:TweenSize(UDim2.new(0, 130,0, 0), "Out", "Quint", 0.1, true)
               Visible.Rotation = 270
            else
            toggled = true
                Contanier:TweenSize(UDim2.new(0, 130,0, 170), "Out", "Quint", 0.1, true)
                Visible.Rotation = 90
            end
        end)


    local epiclib = {}

    function epiclib:Createbutton(buttext, callback)
        local callback = callback or function() end 

        local TextButton = Instance.new("TextButton")
        TextButton.Parent = Contanier
        TextButton.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
        TextButton.BorderColor3 = Color3.new(0.121569, 0.121569, 0.121569)
        TextButton.BorderSizePixel = 2
        TextButton.Size = UDim2.new(0, 100, 0, 94)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.TextColor3 = Color3.new(1, 1, 1)
        TextButton.TextSize = 14
        TextButton.TextWrapped = true
        TextButton.Text = buttext
         TextButton.MouseButton1Down:Connect(function()
            pcall(callback)
         end)
    end

    function epiclib:label(labeltext)
        local label = Instance.new("TextLabel")
        label.Name = "label"
        label.Parent = Contanier
        label.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
        label.BorderColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        label.Size = UDim2.new(0, 200, 0, 50)
        label.Font = Enum.Font.SourceSans
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 14
        label.Text = labeltext
    end

    function epiclib:Toggle(text, callback)
        local actions = {}
        local enabled = false
        text = text  or "New Toggle"
        callback = callback or function() end 


        local Toggle = Instance.new("TextLabel")
        local Back = Instance.new("TextButton")
        local Toggle_2 = Instance.new("TextButton")
        Toggle.Name = "Toggle"
        Toggle.Parent = Contanier
        Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
        Toggle.BackgroundTransparency = 1
        Toggle.Size = UDim2.new(0, 200, 0, 50)
        Toggle.Font = Enum.Font.SourceSans
        Toggle.Text = "Toggle"
        Toggle.TextColor3 = Color3.new(1, 1, 1)
        Toggle.TextSize = 14

        Back.Name = "Back"
        Back.Parent = Toggle
        Back.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
        Back.BorderSizePixel = 0
        Back.Position = UDim2.new(0.751938105, 0, 0.200000003, 0)
        Back.Size = UDim2.new(0, 31, 0, 15)
        Back.AutoButtonColor = false
        Back.Font = Enum.Font.SourceSans
        Back.Text = ""
        Back.TextColor3 = Color3.new(1, 1, 1)
        Back.TextSize = 14

        Toggle_2.Name = "Toggle"
        Toggle_2.Parent = Back
        Toggle_2.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
        Toggle_2.BorderSizePixel = 0
        Toggle_2.Position = UDim2.new(-0.023999989, 0, 0, 0)
        Toggle_2.Size = UDim2.new(0, 16, 0, 15)
        Toggle_2.Font = Enum.Font.SourceSans
        Toggle_2.Text = ""
        Toggle_2.TextColor3 = Color3.new(1, 0.784314, 0)
        Toggle_2.TextSize = 14

        local actions = {}
        local enabled = false
        callback = callback or function() end 

local function Fire()
	enabled = not enabled
	Toggle_2:TweenPosition(enabled and UDim2.new(0.492, 0,0, 0) or UDim2.new(-0.024, 0,0, 0),"InOut", "Linear", 0.1)
	Toggle_2.BackgroundColor3 = enabled and Color3.fromRGB(35, 255, 42) or Color3.fromRGB(255, 0, 0)
	pcall(callback, enabled)
end

Toggle_2.MouseButton1Click:Connect(Fire)

function actions:Set(arg)
	Toggle_2:TweenPosition(enabled and UDim2.new(0.492, 0,0, 0) or UDim2.new(-0.024, 0,0, 0),"InOut", "Linear", 0.1)
	Toggle_2.BackgroundColor3 = enabled and Color3.fromRGB(35, 255, 42) or Color3.fromRGB(255, 0, 0)
	pcall(callback, enabled)
end
      end
  return epiclib
end

