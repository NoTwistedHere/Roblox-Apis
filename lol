local library = {}
library.ThisStuff_Library = {}
library.ThisStuff_Library.LastPosition = UDim2.new(0.005, 0, 0.01, 0)
local Blacklisted = {
    "Space",
    "Unknwon",
    "Esc",
    "Tab",
    "Return",
    "Backspace",
    "Clear",
    "Pause",
    "Escape",
    "LeftControl"
}

local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function RandomCharacters(length)
	return length > 0 and RandomCharacters(length - 1) .. charset[Random.new():NextInteger(1, #charset)] or ""
end

function parseHexDigit(x)
    if #x == 1 then
        x = x .. x
    end
    return tonumber(x, 16)
end

function Each(callback, ...)
    local results = {}
    for i, value in ipairs({...}) do
        results[i] = callback(value)
    end
    return unpack(results)
end

function HexColor3(text)
    local R, G, B = text:match("^#?(%x%x?)(%x%x?)(%x%x?)$")
    return Each(parseHexDigit, R, G, B)
end

function ParseRGB(Value)
    if (Value):find("%d+%s*,%s*%d+%s*,%s*%d+") then
        local s, e = (Value):find("%d+%s*,%s*%d+%s*,%s*%d+");
        local sub = (Value):sub(s, e);
        local r, g, b;
        local a, b = (Value):find("%d+%s*,");
        local r1 = (Value):sub(a, b);
        local c, d = (Value):find("%d+%s*,", b);
        local g1 = (Value):sub(c, d);
        local e, f = (Value):find("%s*%d+", d);
        local b1 = (Value):sub(e, f);
        r = tonumber((r1):sub((r1):find("%d+")));
        g = tonumber((g1):sub((g1):find("%d+")));
        b = tonumber((b1):sub((b1):find("%d+")));
        return Color3.fromRGB(r, g, b)
    end
end

function zigzag(X) 
    return math.acos(math.cos(X*math.pi))/math.pi 
end

function library:Blacklist(Key)
    if type(Key) == "string" then
        table.insert(Blacklisted, Key)
    elseif typeof(Key) == "EnumItem" and Key.Name and Enum.KeyCode[Key.Name] then
        table.insert(Blacklisted, Key.Name)
    else
        warn("Blacklist Key || Key not a string or EnumItem.KeyCode")
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = RandomCharacters(Random.new():NextInteger(5,20))
ScreenGui.Parent = game:GetService("CoreGui")


game:GetService("UserInputService").InputBegan:Connect(function(Input, GPE)
    if not GPE and Input.KeyCode == Enum.KeyCode.RightControl then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

function Core(Title, Parent)
    --> Open/Close
    local WindowFrame;
	local WindowButton;
	local Arrow;
	local WindowText;
	local Container;
	local UIListLayout;
	local MainHolder;
    local MWindow_Showing;
    local ContainerSize;
    local GapFill;
    if Parent then
        Container = Parent
    elseif not Parent then
        WindowFrame = Instance.new("Frame")
        WindowButton = Instance.new("ImageButton")
        Arrow = Instance.new("ImageLabel")
        WindowText = Instance.new("TextLabel")
        GapFill = Instance.new("ImageLabel")
        Container = Instance.new("ScrollingFrame")
        UIListLayout = Instance.new("UIListLayout")
        MainHolder = Instance.new("Frame")
        MWindow_Showing = false
        ContainerSize = UDim2.new(0, 0, 0, 0)

        WindowFrame.Size = UDim2.new(0.105, 0, 0.034, 0)
        WindowFrame.BackgroundTransparency = 1
        WindowFrame.BorderSizePixel = 0
        WindowFrame.Position = library.ThisStuff_Library.LastPosition
        WindowFrame.ZIndex = math.huge
        WindowFrame.Parent = ScreenGui
        
        library.ThisStuff_Library.LastPosition = library.ThisStuff_Library.LastPosition + UDim2.new(0, 210, 0, 0)
        
        WindowButton.BackgroundTransparency = 1
        WindowButton.BorderSizePixel = 0
        WindowButton.Size = UDim2.new(1, 0, 1, 0)
        WindowButton.Image = "rbxassetid://5595011428"
        WindowButton.ImageColor3 = Color3.fromRGB(25, 26, 27)
        WindowButton.ScaleType = Enum.ScaleType.Slice
        WindowButton.SliceCenter = Rect.new(100, 100, 100, 100)
        WindowButton.SliceScale = 0.03
        WindowButton.Parent = WindowFrame
        WindowButton.ZIndex = 2
        
        Arrow.BackgroundTransparency = 1
        Arrow.BorderSizePixel = 0
        Arrow.AnchorPoint = Vector2.new(0, 0.5)
        Arrow.Position = UDim2.new(1, -20, 0.5, 0)
        Arrow.Size = UDim2.new(0, 12, 0, 12)
        Arrow.Image = "http://www.roblox.com/asset/?id=5594105048"
        Arrow.ImageColor3 = Color3.fromRGB(255, 255, 255)
        Arrow.ScaleType = Enum.ScaleType.Fit
        Arrow.Parent = WindowButton
        Arrow.ZIndex = 2
        
        WindowText.BackgroundTransparency = 1
        WindowText.BorderSizePixel = 0
        WindowText.AnchorPoint = Vector2.new(0.5, 0.5)
        WindowText.Size = UDim2.new(1, 0, 1, 0)
        WindowText.Position = UDim2.new(0.5, 0, 0.5, 0)
        WindowText.Font = Enum.Font.GothamSemibold
        WindowText.Text = Title
        WindowText.TextColor3 = Color3.fromRGB(255, 255, 255)
        WindowText.TextSize = 18
        WindowText.Parent = WindowButton
        WindowText.ZIndex = 2

        GapFill.BackgroundTransparency = 1
        GapFill.BorderSizePixel = 0
        GapFill.Position = UDim2.new(0, 0, 0.8, 0)
        GapFill.Size = UDim2.new(1, 0, 0.4, 0)
        GapFill.Image = "rbxassetid://3570695787"
        GapFill.ImageColor3 = Color3.fromRGB(41, 42, 43)
        GapFill.ScaleType = Enum.ScaleType.Slice
        GapFill.SliceCenter = Rect.new(100, 100, 100, 100)
        GapFill.SliceScale = 0.02
        GapFill.Parent = WindowFrame
        GapFill.Visible = false
        
        Container.BorderSizePixel = 0
        Container.Position = UDim2.new(0, 0, 1, 0)
        Container.Size = UDim2.new(1, 0, 0, 0)
        Container.BackgroundColor3 = Color3.fromRGB(41, 42, 43)
        Container.Visible = MWindow_Showing
        Container.Parent = WindowFrame
        Container.ClipsDescendants = false
        
        UIListLayout.FillDirection = Enum.FillDirection.Vertical
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        UIListLayout.Parent = Container
        
        MainHolder.BackgroundTransparency = 1
        MainHolder.BorderSizePixel = 0
        MainHolder.Size = UDim2.new(1, 0, 0, 2)
        MainHolder.Parent = Container

        local OTS = game:GetService("TweenService"):Create(Arrow, TweenInfo.new(0.1), {Rotation = -90})
        local CTS = game:GetService("TweenService"):Create(Arrow, TweenInfo.new(0.1), {Rotation = 0})
        
        WindowButton.MouseButton1Click:Connect(function()
            MWindow_Showing = not MWindow_Showing
            OTS:Cancel()
            CTS:Cancel()
            if MWindow_Showing then
                OTS:Play()
                Container:TweenSize(ContainerSize, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.02, true)
            else
                CTS:Play()
                Container:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.02, true)
            end
            Container.Visible = MWindow_Showing
            GapFill.Visible = MWindow_Showing
        end)
    end

    function Resize(ContainerFF)
        local y = 0;
        local C = 0
        for i, v in next, ContainerFF:GetChildren() do
            if not v:IsA('UIListLayout') and v.Visible == true then
                C = C + 0.01
                y = y + v.AbsoluteSize.Y + 0.5;
            end
        end
        return UDim2.new(1, 0, 0, y)
    end
	
    local Window_Data = {}
	function Window_Data:Folder(Text)
        local Folder = {}
        Folder.Showing = false
        Folder.Frame = Instance.new("Frame")
        Folder.ImageButton = Instance.new("ImageButton")
        Folder.Arrow = Instance.new("ImageLabel")
        Folder.TextLabel = Instance.new("TextLabel")
        Folder.Container = Instance.new("Frame")
        Folder.UIListLayout = Instance.new("UIListLayout")

        Folder.Frame.Parent = Container
        Folder.Frame.BackgroundColor3 = Color3.fromRGB(41, 42, 43)
        Folder.Frame.BackgroundTransparency = 1
        Folder.Frame.BorderSizePixel = 0
        Folder.Frame.Size = UDim2.new(0, 200, 0, 32)

        Folder.ImageButton.Parent = Folder.Frame
        Folder.ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        Folder.ImageButton.BackgroundColor3 = Color3.fromRGB(27, 28, 30)
        Folder.ImageButton.BackgroundTransparency = 1
        Folder.ImageButton.BorderSizePixel = 0
        Folder.ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        Folder.ImageButton.Size = UDim2.new(1, -6, 1, -6)
        Folder.ImageButton.Image = "rbxassetid://3570695787"
        Folder.ImageButton.ImageColor3 = Color3.fromRGB(33, 34, 35)
        Folder.ImageButton.ScaleType = Enum.ScaleType.Slice
        Folder.ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
        Folder.ImageButton.SliceScale = 0.020

        Folder.Arrow.Parent = Folder.ImageButton
        Folder.Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
        Folder.Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Folder.Arrow.BackgroundTransparency = 1
        Folder.Arrow.BorderColor3 = Color3.fromRGB(65, 65, 65)
        Folder.Arrow.BorderSizePixel = 4
        Folder.Arrow.Position = UDim2.new(1, -15, 0.5, 0)
        Folder.Arrow.Size = UDim2.new(0, 12, 0, 12)
        Folder.Arrow.Image = "http://www.roblox.com/asset/?id=5594105048"
        Folder.Arrow.ScaleType = Enum.ScaleType.Fit
        Folder.Arrow.SliceScale = 0

        Folder.TextLabel.Parent = Folder.ImageButton
        Folder.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Folder.TextLabel.BackgroundTransparency = 1
        Folder.TextLabel.BorderSizePixel = 0
        Folder.TextLabel.Position = UDim2.new(0, 10, 0, 0)
        Folder.TextLabel.Size = UDim2.new(1, -35, 1, 0)
        Folder.TextLabel.Font = Enum.Font.SourceSansBold
        Folder.TextLabel.Text = Text
        Folder.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Folder.TextLabel.TextSize = 18
        Folder.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        Folder.Container.Parent = Container
        Folder.Container.BackgroundColor3 = Color3.fromRGB(41, 42, 43)
        Folder.Container.BorderSizePixel = 0
        Folder.Container.Visible = false
        Folder.Container.ClipsDescendants = false
        Folder.Container.Size = UDim2.new(0, 200, 0, 0)

        Folder.UIListLayout.Parent = Folder.Container
        Folder.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        Folder.OTS = game:GetService("TweenService"):Create(Folder.Arrow, TweenInfo.new(0.1), {Rotation = -90})
        Folder.CTS = game:GetService("TweenService"):Create(Folder.Arrow, TweenInfo.new(0.1), {Rotation = 0})

        Folder.ImageButton.MouseButton1Click:Connect(function()
            Folder.ContainerSize = Folder.Container.Size
            Folder.Container.Visible = not Folder.Container.Visible
            Folder.Showing = not Folder.Showing
            Folder.OTS:Cancel()
            Folder.CTS:Cancel()
            if Folder.Showing then
                Folder.OTS:Play()
                Folder.Container:TweenSize(Folder.ContainerSize, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.02, true)
            else
                Folder.CTS:Play()
                Folder.Container:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.02, true)
            end
        end)

        wait(0.2)

        spawn(function()
            while wait() do
                if Folder.Container.Visible then
                    Folder.Container.Size = Resize(Folder.Container)
                else
                    Folder.ContainerSize = Resize(Folder.Container)
                end
            end
        end)

        return Core(Text, Folder.Container)
	end
	
	function Window_Data:Button(Text, Callback) --> Not Updated
		if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
		end
        local Button = {}
        Button.Button_Callback = {}
        Button.Frame = Instance.new("Frame")
        Button.ImageButton = Instance.new("ImageButton")
        Button.TextLabel = Instance.new("TextLabel")
        
        Button.Frame.BackgroundTransparency = 1
        Button.Frame.BorderSizePixel = 0
        Button.Frame.Size = UDim2.new(0, 200, 0, 32)
        Button.Frame.Parent = Container

        Button.ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.ImageButton.BackgroundTransparency = 1
        Button.ImageButton.BorderSizePixel = 0
        Button.ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button.ImageButton.Size = UDim2.new(1, -10, 1, -5)
        Button.ImageButton.Image = "http://www.roblox.com/asset/?id=5595011428"
        Button.ImageButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
        Button.ImageButton.ScaleType = Enum.ScaleType.Slice
        Button.ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
        Button.ImageButton.SliceScale = 0.02
        Button.ImageButton.Parent = Button.Frame

        Button.TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.TextLabel.BackgroundTransparency = 1
        Button.TextLabel.BorderSizePixel = 0
        Button.TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button.TextLabel.Size = UDim2.new(1, -20, 1, -10)
        Button.TextLabel.Font = Enum.Font.SourceSansBold
        Button.TextLabel.Text = Text
        Button.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextLabel.TextSize = 18
        Button.TextLabel.TextWrapped = true
        Button.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        Button.TextLabel.Parent = Button.ImageButton

        Button.ImageButton.MouseButton1Click:Connect(function()
            pcall(Callback)
        end)

        Button.ImageButton.MouseEnter:Connect(function()
            Button.ImageButton.ImageColor3 = Color3.fromRGB(60, 60, 60)
        end)

        Button.ImageButton.MouseLeave:Connect(function()
            Button.ImageButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
        end)

        function Button.Button_Callback:Set(...)
            local Arguments = {...}
            if Arguments[1] == "Header" then
                Button.TextLabel.Text = Arguments[2]
            elseif Arguments[1] == "Callback" then
                Callback = Arguments[2]
            else
                pcall(Callback)
            end
        end
        return Button.Button_Callback
    end

    function Window_Data:Slider(Text, Min, Max, Callback)
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
        elseif (not Min or type(Min) ~= "number") or (not Max or type(Max) ~= "number") then
			warn(string.format("Window_Data_%s \n no Min/Max or Max/Min is not a number", Text))
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
		end
        local Slider = {}
        Slider.Slider_Callback = {}
        Slider.Min = Min
        Slider.Max = Max
        Slider.Value = 0

        Slider.Frame = Instance.new("Frame")
        Slider.TextLabel = Instance.new("TextLabel")
        Slider.Frame_2 = Instance.new("Frame")
        Slider.ImageLabel = Instance.new("ImageLabel")
        Slider.TextButton = Instance.new("TextButton")
        Slider.TextLabel_2 = Instance.new("TextLabel")
        Slider.ImageLabel_2 = Instance.new("ImageLabel")

        Slider.Frame.Parent = Container
        Slider.Frame.BackgroundTransparency = 1
        Slider.Frame.BorderSizePixel = 0
        Slider.Frame.Size = UDim2.new(1, 0, 0, 42)

        Slider.TextLabel.Parent = Slider.Frame
        Slider.TextLabel.BackgroundTransparency = 1
        Slider.TextLabel.BorderSizePixel = 0
        Slider.TextLabel.Position = UDim2.new(0.05, 0, 0, 0)
        Slider.TextLabel.Size = UDim2.new(0.95, 0, 0.431, 0)
        Slider.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Slider.TextLabel.ZIndex = 2
        Slider.TextLabel.Font = Enum.Font.Gotham
        Slider.TextLabel.Text = Text
        Slider.TextLabel.TextSize = 16
        Slider.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        Slider.Frame_2.Parent = Slider.Frame
        Slider.Frame_2.BackgroundTransparency = 1
        Slider.Frame_2.BorderSizePixel = 0
        Slider.Frame_2.Position = UDim2.new(0, 0, 0.431, 0)
        Slider.Frame_2.Size = UDim2.new(1, 0, 0.6, 0)

        Slider.ImageLabel.Parent = Slider.Frame_2
        Slider.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider.ImageLabel.BackgroundTransparency = 1
        Slider.ImageLabel.BorderSizePixel = 0
        Slider.ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider.ImageLabel.Size = UDim2.new(0, 190, 1, -6)
        Slider.ImageLabel.Image = "rbxassetid://3570695787"
        Slider.ImageLabel.ImageColor3 = Color3.fromRGB(35, 36, 37)
        Slider.ImageLabel.ScaleType = Enum.ScaleType.Slice
        Slider.ImageLabel.SliceCenter = Rect.new(100, 100, 100, 100)
        Slider.ImageLabel.SliceScale = 0.02

        Slider.TextButton.Parent = Slider.Frame_2
        Slider.TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider.TextButton.BackgroundTransparency = 1
        Slider.TextButton.BorderSizePixel = 0
        Slider.TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        Slider.TextButton.Size = UDim2.new(1, -8, 1, -6)
        Slider.TextButton.Text = ""
        Slider.TextButton.TextTransparency = 1
        Slider.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        Slider.TextButton.TextSize = 1

        Slider.TextLabel_2.Parent = Slider.ImageLabel
        Slider.TextLabel_2.BackgroundTransparency = 1
        Slider.TextLabel_2.BorderSizePixel = 0
        Slider.TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
        Slider.TextLabel_2.ZIndex = 2
        Slider.TextLabel_2.Font = Enum.Font.SourceSansBold
        Slider.TextLabel_2.Text = "0"
        Slider.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        Slider.TextLabel_2.TextSize = 16
        Slider.TextLabel_2.TextStrokeTransparency = 0.5

        Slider.ImageLabel_2.Parent = Slider.TextButton
        Slider.ImageLabel_2.AnchorPoint = Vector2.new(0, 0.5)
        Slider.ImageLabel_2.BackgroundTransparency = 1
        Slider.ImageLabel_2.BorderSizePixel = 0
        Slider.ImageLabel_2.Size = UDim2.new(1, -8, 1, -4)
        Slider.ImageLabel_2.Position = UDim2.new(0, 4, 0.5, 0)
        Slider.ImageLabel_2.Image = "rbxassetid://3570695787"
        Slider.ImageLabel_2.ImageColor3 = Color3.fromRGB(46, 152, 88)
        Slider.ImageLabel_2.ScaleType = Enum.ScaleType.Slice
        Slider.ImageLabel_2.SliceCenter = Rect.new(100, 100, 100, 100)
        Slider.ImageLabel_2.SliceScale = 0.02

        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

        Slider.ImageLabel_2.Size = UDim2.new(0, Slider.ImageLabel_2.Size.X.Scale*Slider.ImageLabel_2.Parent.AbsoluteSize.X + Slider.ImageLabel_2.Size.X.Offset, 0, Slider.ImageLabel_2.Size.Y.Scale*Slider.ImageLabel_2.Parent.AbsoluteSize.Y + Slider.ImageLabel_2.Size.Y.Offset)
        Slider.ImageLabel_2.Position = UDim2.new(0, Slider.ImageLabel_2.Position.X.Scale*Slider.ImageLabel_2.Parent.AbsoluteSize.X + Slider.ImageLabel_2.Position.X.Offset, 0, Slider.ImageLabel_2.Position.Y.Scale*Slider.ImageLabel_2.Parent.AbsoluteSize.Y + Slider.ImageLabel_2.Position.Y.Offset)
        Slider.Original = Slider.ImageLabel_2.Size.X.Offset

        function Slider:ArgumentCallback(Force)
            Slider.Value = math.floor((((tonumber(Max) - tonumber(Min))/Slider.Original) * Slider.ImageLabel_2.AbsoluteSize.X) + tonumber(Min))
            Slider.OldValue = Slider.Value
            pcall(Callback, tonumber(Slider.Value))
            Slider.TextLabel_2.Text = Slider.Value
            Slider.ImageLabel_2.Size = UDim2.new(0, math.clamp(Mouse.X - Slider.ImageLabel_2.AbsolutePosition.X, 0, Slider.Original), 1, -4)
        end

        Slider.TextButton.MouseButton1Down:Connect(function()
            Slider:ArgumentCallback()
            if Slider.Connection_1 then
                Slider.Connection_1:Disconnect()
            end
            if Slider.Connection_2 then
                Slider.Connection_2:Disconnect()
            end
            Slider.Connection_1 = Mouse.Move:Connect(function()
                Slider:ArgumentCallback()
            end)
            Slider.Connection_2 = game:GetService("UserInputService").InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Slider:ArgumentCallback()
                    Slider.Connection_1:Disconnect()
                    Slider.Connection_2:Disconnect()
                end
            end)
        end)

        Slider.TextButton.MouseButton1Up:Connect(function()
            Slider:ArgumentCallback()
            if Slider.Connection_1 then
                Slider.Connection_1:Disconnect()
            end
            if Slider.Connection_2 then
                Slider.Connection_2:Disconnect()
            end
        end)

        Slider.TextButton.MouseButton1Click:Connect(function()
            Slider:ArgumentCallback()
            if Slider.Connection_1 then
                Slider.Connection_1:Disconnect()
            end
            if Slider.Connection_2 then
                Slider.Connection_2:Disconnect()
            end
        end)

        Slider.TextButton.MouseEnter:Connect(function()
            Slider.ImageLabel_2.ImageColor3 = Color3.fromRGB(46, 165, 88)
        end)

        Slider.TextButton.MouseLeave:Connect(function()
            Slider.ImageLabel_2.ImageColor3 = Color3.fromRGB(46, 152, 88)
        end)

        function Slider.Slider_Callback:Set(...)
            local Arguments = {...}
            if (Arguments[1] == "Min" or Arguments[1] == "Max") and type(Arguments[2]) == "number" then
                Slider[Arguments[1]] = Arguments[2]
            else
                warn("Slider_Callback:Set || Invalid Arugments")
            end
        end
        return Slider.Slider_Callback
    end

    function Window_Data:ColorPicker(Text, Default, Callback)
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
        elseif (not Default or typeof(Default) ~= "Color3") then
			warn(string.format("Window_Data_%s \n no Default or Default is not a Color3", Text))
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
        end
        local ColorPicker = {}
        ColorPicker.ColorPicker_Callback = {}
        ColorPicker.Open = false
        ColorPicker.Frame = Instance.new("Frame")
        ColorPicker.TextLabel = Instance.new("TextLabel")
        ColorPicker.ImageButton = Instance.new("ImageButton")
        ColorPicker.ImageLabel = Instance.new("ImageLabel")
        ColorPicker.Frame_2 = Instance.new("Frame")
        ColorPicker.Frame_3 = Instance.new("Frame")
        ColorPicker.ImageButton_2 = Instance.new("ImageButton")
        ColorPicker.ImageLabel_2 = Instance.new("ImageLabel")
        ColorPicker.TextLabel_2 = Instance.new("TextLabel")
        ColorPicker.Frame_4 = Instance.new("Frame")
        ColorPicker.ImageLabel_3 = Instance.new("ImageLabel")
        ColorPicker.TextBox = Instance.new("TextBox")
        ColorPicker.UIListLayout = Instance.new("UIListLayout")
        ColorPicker.Frame_5 = Instance.new("Frame")
        ColorPicker.ImageLabel_4 = Instance.new("ImageLabel")
        ColorPicker.TextBox_2 = Instance.new("TextBox")

        ColorPicker.Frame.Parent = Container
        ColorPicker.Frame.BackgroundTransparency = 1
        ColorPicker.Frame.BorderSizePixel = 0
        ColorPicker.Frame.Size = UDim2.new(1, 0, 0, 28)

        ColorPicker.TextLabel.Parent = ColorPicker.Frame
        ColorPicker.TextLabel.AnchorPoint = Vector2.new(0, 0.5)
        ColorPicker.TextLabel.BackgroundTransparency = 1
        ColorPicker.TextLabel.BorderSizePixel = 0
        ColorPicker.TextLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
        ColorPicker.TextLabel.Size = UDim2.new(0.944, -38, 1, -10)
        ColorPicker.TextLabel.Font = Enum.Font.Gotham
        ColorPicker.TextLabel.Text = Text
        ColorPicker.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorPicker.TextLabel.TextSize = 16
        ColorPicker.TextLabel.TextWrapped = true
        ColorPicker.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        ColorPicker.ImageButton.Parent = ColorPicker.Frame
        ColorPicker.ImageButton.AnchorPoint = Vector2.new(0, 0.5)
        ColorPicker.ImageButton.BackgroundTransparency = 1
        ColorPicker.ImageButton.BorderSizePixel = 0
        ColorPicker.ImageButton.Position = UDim2.new(0.855, 0, 0.5, 0)
        ColorPicker.ImageButton.Size = UDim2.new(0, 24, 0, 24)
        ColorPicker.ImageButton.ImageRectOffset = Vector2.new(0, 436)
        ColorPicker.ImageButton.ImageRectSize = Vector2.new(36, 36)
        ColorPicker.ImageButton.ScaleType = Enum.ScaleType.Slice

        ColorPicker.ImageLabel.Parent = ColorPicker.ImageButton
        ColorPicker.ImageLabel.BackgroundTransparency = 1
        ColorPicker.ImageLabel.Size = UDim2.new(1, 0, 1, 0)
        ColorPicker.ImageLabel.Image = "rbxassetid://3570695787"
        ColorPicker.ImageLabel.ImageColor3 = Default
        ColorPicker.ImageLabel.ScaleType = Enum.ScaleType.Slice
        ColorPicker.ImageLabel.SliceCenter = Rect.new(100, 100, 100, 100)
        ColorPicker.ImageLabel.SliceScale = 0.02

        ColorPicker.Frame_2.Parent = ColorPicker.Frame
        ColorPicker.Frame_2.BackgroundColor3 = Color3.fromRGB(41, 42, 43)
        ColorPicker.Frame_2.BorderSizePixel = 0
        ColorPicker.Frame_2.Visible = false
        ColorPicker.Frame_2.ClipsDescendants = true
        ColorPicker.Frame_2.Position = UDim2.new(1, 0, 0, 0)
        ColorPicker.Frame_2.Size = UDim2.new(0, 200, 0, 70)

        ColorPicker.Frame_3.Parent = ColorPicker.Frame_2
        ColorPicker.Frame_3.BackgroundTransparency = 1
        ColorPicker.Frame_3.BorderSizePixel = 0
        ColorPicker.Frame_3.Size = UDim2.new(0, 200, 0, 32)

        ColorPicker.ImageButton_2.Parent = ColorPicker.Frame_3
        ColorPicker.ImageButton_2.AnchorPoint = Vector2.new(0, 0.5)
        ColorPicker.ImageButton_2.BackgroundTransparency = 1
        ColorPicker.ImageButton_2.BorderSizePixel = 0
        ColorPicker.ImageButton_2.Position = UDim2.new(0.855, 0, 0.5, 0)
        ColorPicker.ImageButton_2.Size = UDim2.new(0, 24, 0, 24)
        ColorPicker.ImageButton_2.ImageRectOffset = Vector2.new(0, 436)
        ColorPicker.ImageButton_2.ImageRectSize = Vector2.new(36, 36)
        ColorPicker.ImageButton_2.ScaleType = Enum.ScaleType.Slice

        ColorPicker.ImageLabel_2.Parent = ColorPicker.ImageButton_2
        ColorPicker.ImageLabel_2.BackgroundTransparency = 1
        ColorPicker.ImageLabel_2.BorderSizePixel = 0
        ColorPicker.ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
        ColorPicker.ImageLabel_2.Image = "rbxassetid://3570695787"
        ColorPicker.ImageLabel_2.ImageColor3 = Color3.fromRGB(35, 36, 37)
        ColorPicker.ImageLabel_2.ScaleType = Enum.ScaleType.Slice
        ColorPicker.ImageLabel_2.SliceCenter = Rect.new(100, 100, 100, 100)
        ColorPicker.ImageLabel_2.SliceScale = 0.02

        ColorPicker.TextLabel_2.Parent = ColorPicker.Frame_3
        ColorPicker.TextLabel_2.AnchorPoint = Vector2.new(0, 0.5)
        ColorPicker.TextLabel_2.BackgroundTransparency = 1
        ColorPicker.TextLabel_2.BorderSizePixel = 0
        ColorPicker.TextLabel_2.Position = UDim2.new(0.05, 0, 0.5, 0)
        ColorPicker.TextLabel_2.Size = UDim2.new(0.944, -38, 1, -10)
        ColorPicker.TextLabel_2.Font = Enum.Font.Gotham
        ColorPicker.TextLabel_2.Text = "Rainbow"
        ColorPicker.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorPicker.TextLabel_2.TextSize = 16
        ColorPicker.TextLabel_2.TextWrapped = true
        ColorPicker.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

        ColorPicker.Frame_4.Parent = ColorPicker.Frame_2
        ColorPicker.Frame_4.BackgroundTransparency = 1
        ColorPicker.Frame_4.BorderSizePixel = 0
        ColorPicker.Frame_4.Size = UDim2.new(0, 200, 0, 32)

        ColorPicker.ImageLabel_3.Parent = ColorPicker.Frame_4
        ColorPicker.ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
        ColorPicker.ImageLabel_3.BackgroundTransparency = 1
        ColorPicker.ImageLabel_3.BorderSizePixel = 0
        ColorPicker.ImageLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
        ColorPicker.ImageLabel_3.Size = UDim2.new(1, -10, 1, -5)
        ColorPicker.ImageLabel_3.Image = "http://www.roblox.com/asset/?id=5595011428"
        ColorPicker.ImageLabel_3.ImageColor3 = Color3.fromRGB(50, 50, 50)
        ColorPicker.ImageLabel_3.ScaleType = Enum.ScaleType.Slice
        ColorPicker.ImageLabel_3.SliceCenter = Rect.new(100, 100, 100, 100)
        ColorPicker.ImageLabel_3.SliceScale = 0.02

        ColorPicker.TextBox.Parent = ColorPicker.ImageLabel_3
        ColorPicker.TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
        ColorPicker.TextBox.BackgroundTransparency = 1
        ColorPicker.TextBox.BorderSizePixel = 0
        ColorPicker.TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
        ColorPicker.TextBox.Size = UDim2.new(1, 0, 1, 0)
        ColorPicker.TextBox.ClearTextOnFocus = true
        ColorPicker.TextBox.Font = Enum.Font.GothamBold
        ColorPicker.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        ColorPicker.TextBox.PlaceholderText = "R, G, B"
        ColorPicker.TextBox.Text = ""
        ColorPicker.TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorPicker.TextBox.TextSize = 14
        ColorPicker.TextBox.TextWrapped = true

        ColorPicker.UIListLayout.Parent = ColorPicker.Frame_2
        ColorPicker.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        ColorPicker.Rainbow = false

        function ColorPicker.ArgumentCallback(Argument)
            if not Argument then
                ColorPicker.Rainbow = not ColorPicker.Rainbow
            end
            wait()
            ColorPicker.ImageLabel_2.ImageColor3 = ColorPicker.Rainbow and Color3.fromRGB(0, 240, 111) or Color3.fromRGB(35, 36, 37)
        end
        
        function ColorPicker.ColorPicker_Callback:Set(Argument)
            if Argument and Argument == true or Argument == false then
                ColorPicker.Rainbow = Argument
                wait()
                pcall(ColorPicker.ArgumentCallback, true)
            else
                warn("Window_Data_ColorPicker_Set \n no Argument or Argument is not a boolean")
                return
            end
        end

        ColorPicker.ImageButton_2.MouseButton1Click:Connect(ColorPicker.ArgumentCallback)

        ColorPicker.Frame_3.MouseEnter:Connect(function()
            ColorPicker.ImageLabel_2.ImageColor3 = ColorPicker.Rainbow and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(30, 30, 30)
        end)

        ColorPicker.Frame_3.MouseLeave:Connect(function()
            ColorPicker.ImageLabel_2.ImageColor3 = ColorPicker.Rainbow and Color3.fromRGB(0, 240, 111) or Color3.fromRGB(35, 36, 37)
        end)

        ColorPicker.TextBox.MouseEnter:Connect(function()
            ColorPicker.ImageLabel_3.ImageColor3 = Color3.fromRGB(60, 60, 60)
        end)

        ColorPicker.TextBox.MouseLeave:Connect(function()
            ColorPicker.ImageLabel_3.ImageColor3 = Color3.fromRGB(50, 50, 50)
        end)

        ColorPicker.TextBox.FocusLost:Connect(function()
            if ColorPicker.TextBox.Text then
                local Cheese = ParseRGB(ColorPicker.TextBox.Text)
                if Cheese then
                    ColorPicker.ImageLabel.ImageColor3 = Cheese
                    Callback(Cheese)
                else
                    warn("ColorPicker || Color3 Invalid")
                end
            end
        end)

        ColorPicker.ImageButton.MouseButton1Click:Connect(function()
            ColorPicker.Open = not ColorPicker.Open
            if ColorPicker.Open then
                ColorPicker.Frame_2:TweenSize(UDim2.new(0, 200, 0, 70), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
            else
                ColorPicker.Frame_2:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
            end
            ColorPicker.Frame_2.Visible = ColorPicker.Open
        end)

        ColorPicker.counter = 0

        game:GetService("RunService").Stepped:connect(function()
            if ColorPicker.Rainbow then
                ColorPicker.ImageLabel.ImageColor3 = Color3.fromHSV(zigzag(ColorPicker.counter),1,1)
                Callback(Color3.fromHSV(zigzag(ColorPicker.counter),1,1))
                ColorPicker.counter = ColorPicker.counter + 0.002
            end
        end)

        return ColorPicker.ColorPicker_Callback
    end

    function Window_Data:Box(Text, Callback) --> Not Updated
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
        end
        local Box = {}
        Box.Box_Callback = {}
        Box.Frame = Instance.new("Frame")
        Box.ImageLabel = Instance.new("ImageLabel")
        Box.TextBox = Instance.new("TextBox")

        Box.Frame.Parent = Container
        Box.Frame.BackgroundTransparency = 1
        Box.Frame.BorderSizePixel = 0
        Box.Frame.Size = UDim2.new(0, 200, 0, 28)

        Box.ImageLabel.Parent = Box.Frame
        Box.ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        Box.ImageLabel.BackgroundTransparency = 1
        Box.ImageLabel.BorderSizePixel = 0
        Box.ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        Box.ImageLabel.Size = UDim2.new(1, -10, 1, -5)
        Box.ImageLabel.Image = "http://www.roblox.com/asset/?id=5595011428"
        Box.ImageLabel.ImageColor3 = Color3.fromRGB(50, 50, 50)
        Box.ImageLabel.ScaleType = Enum.ScaleType.Slice
        Box.ImageLabel.SliceCenter = Rect.new(100, 100, 100, 100)
        Box.ImageLabel.SliceScale = 0.02

        Box.TextBox.Parent = Box.ImageLabel
        Box.TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
        Box.TextBox.BackgroundTransparency = 1
        Box.TextBox.BorderSizePixel = 0
        Box.TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
        Box.TextBox.Size = UDim2.new(1, 0, 1, 0)
        Box.TextBox.Font = Enum.Font.GothamBold
        Box.TextBox.ClearTextOnFocus = true
        Box.TextBox.PlaceholderText = Text
        Box.TextBox.Text = ""
        Box.TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        Box.TextBox.TextSize = 14
        Box.TextBox.TextWrapped = true

        function Box.Box_Callback:Set(...)
            local Arguments = {...}
            if Arguments[1] == "ClearInput" then
                Box.ClearInput = Arguments[1]
            elseif Arguments[1] ~= nil then
                pcall(Callback, Arguments[1])
            end
        end

        Box.TextBox.MouseEnter:Connect(function()
            Box.ImageLabel.ImageColor3 = Color3.fromRGB(60, 60, 60)
        end)

        Box.TextBox.MouseLeave:Connect(function()
            Box.ImageLabel.ImageColor3 = Color3.fromRGB(50, 50, 50)
        end)

        Box.TextBox.FocusLost:Connect(function()
            if #Box.TextBox.Text > 0 then
                pcall(Callback, Box.TextBox.Text)
                wait()
                if Box.ClearInput then
                    Box.TextBox.Text = ""
                end
            end
        end)

        return Box.Box_Callback
    end
    
    function Window_Data:KeyBind(Text, Callback)
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not zia string")
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
		end
        local KeyBind = {}
        KeyBind.Setting = false
        KeyBind.KeyBind_Callback = {}
        KeyBind.LastKeys = {}
        KeyBind.KeyString = ""
        KeyBind.Frame = Instance.new("Frame")
        KeyBind.TextButton = Instance.new("TextButton")

        KeyBind.Frame.Parent = Container
        KeyBind.Frame.BackgroundTransparency = 1
        KeyBind.Frame.BorderSizePixel = 0
        KeyBind.Frame.Size = UDim2.new(1, 0, 0, 32)
        
        KeyBind.TextButton.Parent = KeyBind.Frame
        KeyBind.TextButton.AnchorPoint = Vector2.new(0, 0.5)
        KeyBind.TextButton.BackgroundTransparency = 1
        KeyBind.TextButton.BorderSizePixel = 0
        KeyBind.TextButton.Position = UDim2.new(0.05, 0, 0.5, 0)
        KeyBind.TextButton.Size = UDim2.new(1, -10, 1, -5)
        KeyBind.TextButton.Font = Enum.Font.Gotham
        KeyBind.TextButton.Text = string.format("[...] %s", Text)
        KeyBind.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyBind.TextButton.TextScaled = true
        KeyBind.TextButton.TextSize = 16
        KeyBind.TextButton.TextWrapped = true
        KeyBind.TextButton.TextXAlignment = Enum.TextXAlignment.Left

        -- Thank you aztup for the multiple binder

        function KeyBind:IsCalling()
            if (#KeyBind.LastKeys == 0) then
                return false
            end

            for i,v in next, KeyBind.LastKeys do 
                if not game:GetService("UserInputService"):IsKeyDown(v) then
                    return false
                end
            end
            return true
        end

        KeyBind.TextButton.MouseButton1Click:Connect(function()
            if Window_Data.Setting_KeyBind and KeyBind.Setting then
                Window_Data.Setting_KeyBind = false
                KeyBind.Setting = false
                KeyBind.TextButton.Text = string.format("[%s] %s", tostring(KeyBind.KeyString) == "" and "None" or tostring(KeyBind.KeyString), Text)
                KeyBind.KeyString = ""
                pcall(function()
                    KeyBind.InputConnection:Disconnect()
                end)
                return
            else
                Window_Data.Setting_KeyBind = true
                KeyBind.Setting = true
                KeyBind.LastKeys = {}
                KeyBind.TextButton.Text = string.format("[...] %s", Text)
                KeyBind.InputConnection = nil
            end

            KeyBind.InputConnection = game:GetService("UserInputService").InputBegan:Connect(function(Input, GameProcessed)
                if not GameProcessed then
                    if #KeyBind.LastKeys > 3 and KeyBind.Setting then
                        KeyBind.KeyString = ""
                        KeyBind.LastKeys = {}
                        KeyBind.TextButton.Text = string.format("[%s] %s", "...", Text)
                        return
                    end
                    if Input.UserInputType == Enum.UserInputType.Keyboard and not table.find(Blacklisted, Input.KeyCode.Name) and not table.find(KeyBind.LastKeys, Input.KeyCode) then
                        local Extra = ""
                        table.insert(KeyBind.LastKeys, Input.KeyCode)
                        if #KeyBind.LastKeys == 2 or #KeyBind.LastKeys == 3 then
                            Extra = " + "
                        elseif #KeyBind.LastKeys > 3 then
                            Extra = ""
                            return
                        end
                        KeyBind.KeyString = tostring(KeyBind.KeyString) .. Extra .. tostring(Input.KeyCode.Name)
                        KeyBind.TextButton.Text = string.format("{%s} %s", KeyBind.KeyString, Text)
                        return
                    end
                end
            end)
        end)

        game:GetService("UserInputService").InputBegan:Connect(function(Input, GameProcessed)
            if not GameProcessed and Window_Data.Setting_KeyBind == false and Input.UserInputType == Enum.UserInputType.Keyboard and KeyBind:IsCalling() then
                pcall(Callback)
            end
        end)

        function KeyBind.KeyBind_Callback:Set(Argument)
            if Argument and type(Argument) == "userdata" and typeof(Argument) == "EnumItem" then
                if not table.find(Blacklisted, Argument.Name) then
                    KeyBind.TextButton.Text = string.format("[%s] %s", Argument.Name, Text)
                    KeyBind.KeyString = Argument.Name
                end
            end
        end

        return KeyBind.KeyBind_Callback
    end

    function Window_Data:Label(Text, Color) --> Not Updated (Nothing Changed)
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
        end
        local Label = {}
        Label.Label_Callback = {}
        Label.TextColor3 = Color and Color or Color3.fromRGB(255, 255, 255)
        Label.Frame = Instance.new("Frame")
        Label.TextLabel = Instance.new("TextLabel")

        Label.Frame.Parent = Container
        Label.Frame.BackgroundTransparency = 1
        Label.Frame.BorderSizePixel = 0
        Label.Frame.Size = UDim2.new(0, 200, 0, 32)

        Label.TextLabel.Parent = Label.Frame
        Label.TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        Label.TextLabel.BackgroundTransparency = 1
        Label.TextLabel.BorderSizePixel = 0
        Label.TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        Label.TextLabel.Size = UDim2.new(1, -20, 1, -10)
        Label.TextLabel.Font = Enum.Font.SourceSansBold
        Label.TextLabel.Text = Text
        Label.TextLabel.TextColor3 = Label.TextColor3
        Label.TextLabel.TextScaled = true
        Label.TextLabel.TextSize = 18
        Label.TextLabel.TextWrapped = true

        function Label.Label_Callback:Set(...)
            local Arguments = {...}
            if Arguments[1] == "Text" then
                Label.TextLabel.Text = Arguments[2]
            elseif Arguments[1] == "Color" and typeof(Arguments[2]) == "Color3" then
                Label.TextLabel.TextColor3 = Arguments[2]
            end
        end

        function Label.Label_Callback:Remove()
            Label.Frame:Destroy()
            Label = nil
        end

        return Label.Label_Callback
    end

    function Window_Data:Dropdown(Text, Data, Callback) --> Not Updated
        local Dropdown = {}
        Dropdown.Dropdown_Callback = {}
        Dropdown.Showing = false
        Dropdown.ContainerSize = UDim2.new(1, 0, 0, 0)
        Dropdown.Frame = Instance.new("Frame")
        Dropdown.Container = Instance.new("ImageLabel")
        Dropdown.UIListLayout = Instance.new("UIListLayout")
        Dropdown.ImageButton = Instance.new("ImageButton")
        Dropdown.Arrow = Instance.new("ImageLabel")
        Dropdown.TextLabel = Instance.new("TextLabel")

        Dropdown.Frame.Parent = Container
        Dropdown.Frame.BackgroundTransparency = 1
        Dropdown.Frame.BorderSizePixel = 0
        Dropdown.Frame.Size = UDim2.new(0, 200, 0, 32)

        Dropdown.Container.BackgroundTransparency = 1
        Dropdown.Container.BorderSizePixel = 0
        Dropdown.Container.Position = UDim2.new(1, 0, 0, 2)
        Dropdown.Container.Size = UDim2.new(1, 0, 1, 0)
        Dropdown.Container.Image = "rbxassetid://5595011428"
        Dropdown.Container.Visible = Dropdown.Showing
        Dropdown.Container.ImageColor3 = Color3.fromRGB(41, 42, 43)
        Dropdown.Container.ScaleType = Enum.ScaleType.Slice
        Dropdown.Container.SliceCenter = Rect.new(100, 100, 100, 100)
        Dropdown.Container.SliceScale = 0.02
        Dropdown.Container.Parent = Dropdown.Frame
        Dropdown.Container.ClipsDescendants = true

        Dropdown.UIListLayout.Parent = Dropdown.Container
        Dropdown.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        Dropdown.ImageButton.Parent = Dropdown.Frame
        Dropdown.ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
        Dropdown.ImageButton.BackgroundTransparency = 1
        Dropdown.ImageButton.BorderSizePixel = 0
        Dropdown.ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        Dropdown.ImageButton.Size = UDim2.new(1, -5, 1, -5)
        Dropdown.ImageButton.Image = "rbxassetid://3570695787"
        Dropdown.ImageButton.ImageColor3 = Color3.fromRGB(33, 34, 35)
        Dropdown.ImageButton.ScaleType = Enum.ScaleType.Slice
        Dropdown.ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
        Dropdown.ImageButton.SliceScale = 0.02

        Dropdown.Arrow.Parent = Dropdown.ImageButton
        Dropdown.Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
        Dropdown.Arrow.BackgroundTransparency = 1
        Dropdown.Arrow.BorderColor3 = Color3.fromRGB(65, 65, 65)
        Dropdown.Arrow.BorderSizePixel = 4
        Dropdown.Arrow.Rotation = 90
        Dropdown.Arrow.Position = UDim2.new(1, -15, 0.5, 0)
        Dropdown.Arrow.Size = UDim2.new(0, 12, 0, 12)
        Dropdown.Arrow.Image = "http://www.roblox.com/asset/?id=5594105048"
        Dropdown.Arrow.ScaleType = Enum.ScaleType.Fit

        Dropdown.TextLabel.Parent = Dropdown.ImageButton
        Dropdown.TextLabel.BackgroundTransparency = 1
        Dropdown.TextLabel.BorderSizePixel = 0
        Dropdown.TextLabel.Position = UDim2.new(0, 10, 0, 0)
        Dropdown.TextLabel.Size = UDim2.new(1, -35, 1, 0)
        Dropdown.TextLabel.Font = Enum.Font.SourceSansBold
        Dropdown.TextLabel.Text = Text
        Dropdown.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Dropdown.TextLabel.TextSize = 18
        Dropdown.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        Dropdown.OTS = game:GetService("TweenService"):Create(Dropdown.Arrow, TweenInfo.new(0.1), {Rotation = 180})
        Dropdown.CTS = game:GetService("TweenService"):Create(Dropdown.Arrow, TweenInfo.new(0.1), {Rotation = 90})

        function Dropdown.Func(Argument)
            Dropdown.OTS:Cancel()
            Dropdown.CTS:Cancel()
            if not Argument then
                Dropdown.Showing = not Dropdown.Showing
            else
                Dropdown.Showing = Argument
            end
            if Dropdown.Showing then
                Dropdown.Container:TweenSize(Dropdown.ContainerSize, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                Dropdown.OTS:Play()
            else
                Dropdown.Container:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                Dropdown.CTS:Play()
            end
            if not Argument then
                Dropdown.Container.Visible = Dropdown.Showing
            else
                Dropdown.Container.Visible = Argument
            end
        end

        Dropdown.ImageButton.MouseButton1Click:Connect(Dropdown.Func)

        Dropdown.Button = {}

        function Dropdown:AddButton(Text)
            Dropdown.Button[Text] = {}
            Dropdown.Button[Text].Frame = Instance.new("Frame")
            Dropdown.Button[Text].ImageButton = Instance.new("ImageButton")
            Dropdown.Button[Text].TextLabel = Instance.new("TextLabel")
            
            Dropdown.Button[Text].Frame.BackgroundTransparency = 1
            Dropdown.Button[Text].Frame.BorderSizePixel = 0
            Dropdown.Button[Text].Frame.Size = UDim2.new(0, 200, 0, 28)
            Dropdown.Button[Text].Frame.Parent = Dropdown.Container
    
            Dropdown.Button[Text].ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
            Dropdown.Button[Text].ImageButton.BackgroundTransparency = 1
            Dropdown.Button[Text].ImageButton.BorderSizePixel = 0
            Dropdown.Button[Text].ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
            Dropdown.Button[Text].ImageButton.Size = UDim2.new(1, -10, 1, -5)
            Dropdown.Button[Text].ImageButton.Image = "http://www.roblox.com/asset/?id=5595011428"
            Dropdown.Button[Text].ImageButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
            Dropdown.Button[Text].ImageButton.ScaleType = Enum.ScaleType.Slice
            Dropdown.Button[Text].ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
            Dropdown.Button[Text].ImageButton.SliceScale = 0.02
            Dropdown.Button[Text].ImageButton.Parent = Dropdown.Button[Text].Frame
    
            Dropdown.Button[Text].TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            Dropdown.Button[Text].TextLabel.BackgroundTransparency = 1
            Dropdown.Button[Text].TextLabel.BorderSizePixel = 0
            Dropdown.Button[Text].TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            Dropdown.Button[Text].TextLabel.Size = UDim2.new(1, -20, 1, -10)
            Dropdown.Button[Text].TextLabel.Font = Enum.Font.SourceSansBold
            Dropdown.Button[Text].TextLabel.Text = Text
            Dropdown.Button[Text].TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            Dropdown.Button[Text].TextLabel.TextSize = 18
            Dropdown.Button[Text].TextLabel.TextWrapped = true
            Dropdown.Button[Text].TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            Dropdown.Button[Text].TextLabel.Parent = Dropdown.Button[Text].ImageButton
    
            Dropdown.Button[Text].ImageButton.MouseButton1Click:Connect(function()
                pcall(Callback, Text)
            end)

            Dropdown.Button[Text].ImageButton.MouseEnter:Connect(function()
                Dropdown.Button[Text].ImageButton.ImageColor3 = Color3.fromRGB(60, 60, 60)
            end)
    
            Dropdown.Button[Text].ImageButton.MouseLeave:Connect(function()
                Dropdown.Button[Text].ImageButton.ImageColor3 = Color3.fromRGB(50, 50, 50)
            end)
        end
        for i,v in pairs(Data) do
            if type(v) == "string" then
                Dropdown:AddButton(v)
            end
        end

        function Dropdown.Dropdown_Callback:Set()
        end

        function Dropdown.Dropdown_Callback:Remove()
            Dropdown.Remove = true
            for i,v in pairs(Button:GetChildren()) do
                v.Frame:Destroy()
                v = nil
            end
            Dropdown.Frame:Destroy()
            Dropdown = nil
        end

        spawn(function()
            while wait(1) do
                if Dropdown.Remove then
                    break
                end
                if Dropdown.Showing then
                    Dropdown.Container.Size = Resize(Dropdown.Container)
                else
                    Dropdown.ContainerSize = Resize(Dropdown.Container)
                end
            end
        end)
        return Dropdown.Dropdown_Callback
    end
	
	function Window_Data:Toggle(Text, Callback)
        if not Text or type(Text) ~= "string" then
			warn("Window_Data \n no Text or Text is not a string")
			return
		elseif not Callback or type(Callback) ~= "function" then
			warn(string.format("Window_Data_%s \n no Callback or Callback is not a function", Text))
			return
		end
        local Toggle = {}
        Toggle.Toggle_Callback = {}
		Toggle.Enabled = false
		Toggle.Frame = Instance.new("Frame")
		Toggle.ImageButton = Instance.new("ImageButton")
		Toggle.ImageLabel = Instance.new("ImageLabel")
		Toggle.TextLabel = Instance.new("TextLabel")
        
		Toggle.Frame.BackgroundTransparency = 1
		Toggle.Frame.BorderSizePixel = 0
        Toggle.Frame.Size = UDim2.new(1, 0, 0, 28)
        Toggle.Frame.Parent = Container
		
		Toggle.ImageButton.AnchorPoint = Vector2.new(0, 0.5)
		Toggle.ImageButton.BackgroundTransparency = 1
		Toggle.ImageButton.BorderSizePixel = 0
		Toggle.ImageButton.Position = UDim2.new(0.855, 0, 0.5, 0)
		Toggle.ImageButton.Size = UDim2.new(0, 24, 0, 24)
        Toggle.ImageButton.ScaleType = Enum.ScaleType.Slice
        Toggle.ImageButton.Parent = Toggle.Frame
		
		Toggle.ImageLabel.BackgroundTransparency = 1
		Toggle.ImageLabel.BorderSizePixel = 0
		Toggle.ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		Toggle.ImageLabel.ImageColor3 = Color3.fromRGB(35, 36, 37)
		Toggle.ImageLabel.Image = "rbxassetid://5595011428"
		Toggle.ImageLabel.ScaleType = Enum.ScaleType.Slice
		Toggle.ImageLabel.SliceCenter = Rect.new(100, 100, 100, 100)
        Toggle.ImageLabel.SliceScale = 0.02
        Toggle.ImageLabel.Parent = Toggle.ImageButton
		
		Toggle.TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		Toggle.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.TextLabel.BackgroundTransparency = 1
		Toggle.TextLabel.BorderSizePixel = 0
		Toggle.TextLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
		Toggle.TextLabel.Size = UDim2.new(0.944, -38, 1, -10)
		Toggle.TextLabel.Font = Enum.Font.GothamBold
		Toggle.TextLabel.Text = Text
		Toggle.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.TextLabel.TextSize = 16
		Toggle.TextLabel.TextWrapped = true
        Toggle.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        Toggle.TextLabel.Parent = Toggle.Frame
        
        function Toggle.ArgumentCallback(Argument)
            if not Argument then
                Toggle.Enabled = not Toggle.Enabled
            end
            wait()
            Toggle.ImageLabel.ImageColor3 = Toggle.Enabled and Color3.fromRGB(0, 255, 111) or Color3.fromRGB(35, 36, 37)
            pcall(Callback, Toggle.Enabled)
        end
        
        function Toggle.Toggle_Callback:Set(...)
            local Arguments = {...}
            if Arguments[1] == "Header" then
                Toggle.TextLabel.Text = Arguments[2]
            elseif Arguments[1] == "Callback" then
                Callback = Arguments[2]
            else
                Toggle.Enabled = Arguments[1]
                pcall(Toggle.ArgumentCallback, true)
            end
        end

        Toggle.Frame.MouseEnter:Connect(function()
            Toggle.ImageLabel.ImageColor3 = Toggle.Enabled and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(30, 30, 30)
        end)

        Toggle.Frame.MouseLeave:Connect(function()
            Toggle.ImageLabel.ImageColor3 = Toggle.Enabled and Color3.fromRGB(0, 240, 111) or Color3.fromRGB(35, 36, 37)
        end)

        function Toggle.Toggle_Callback:Remove()
            Toggle.Frame:Destroy()
            Toggle.ArgumentCallback = nil
            Toggle.Toggle_Callback = nil
            Toggle.Toggle_Connection = nil
            Toggle = nil
        end

        Toggle.Toggle_Connection = Toggle.ImageButton.MouseButton1Click:Connect(Toggle.ArgumentCallback)
        return Toggle.Toggle_Callback
    end

    wait(0.2)
    
    spawn(function()
        while wait() do
            if MWindow_Showing then
                Container.Size = Resize(Container)
            else
                ContainerSize = Resize(Container)
            end
        end
    end)

	return Window_Data
end

function library:CreateWindow(Header)
    return Core(Header)
end

return library

--[[
local library = loadstring(game:HttpGet("https://cdn.thisstuff.xyz/Api/Library/Main", true))() --> loadstring(game:HttpGet("https://cdn.thisstuff.xyz/Api/Library/Test", true))()

local Window = library:CreateWindow("Window")

local Toggle = Window:Toggle("Test Toggle", function(arg)
    print(arg)
end)

Window:Button("Set Toggle True", function()
    Toggle:Set(true)
end)

Window:Slider("Slider", 16, 100, function(arg)
    warn(tonumber(arg))
end)

Window:Box("Box - Number", function(arg)
    print((arg):match("%d"))
end)

Window:Box("Box - String", function(arg)
    print(tostring(arg))
end)

Window:KeyBind("Print Hello", function()
    print("Hello World!")
end)

Window:ColorPicker("ColorPicker", Color3.fromRGB(255, 255, 255), function(Color)
    workspace.Baseplate.Color = Color
end)

Window:Dropdown("Gamers", {"Aztup", "3dsboy08", "SirMeme", "Stellar"}, function(arg)
    print(arg.." is a gamer?")
end)

local Folder = Window:Folder("Folder")

Folder:Box("Box - Hey", function(arg)
    warn(arg)
end)
]]
