-- made by Fluxy Hub DO NOT STEAL
function BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 
-- made by Fluxy Hub
-- made by Fluxy Hub
local Players = game:GetService(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8400,11340,10185,12705,10605,11970,12075}))
local UserInputService = game:GetService(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8925,12075,10605,11970,7665,11550,11760,12285,12180,8715,10605,11970,12390,11025,10395,10605}))
local RunService = game:GetService(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8610,12285,11550,8715,10605,11970,12390,11025,10395,10605}))

local LocalPlayer = Players.LocalPlayer

-- made by Fluxy Hub

local guiEnabled = true -- when executed, automatically enables (unnecessary stuff)
local maxDistance = 800 -- you can set the distance here
local guis = {}

local function getRGBColor(t)
    local r = math.sin(t * 2 + 0) * 127 + 128 -- made by fluxy hub
    local g = math.sin(t * 2 + 2) * 127 + 128
    local b = math.sin(t * 2 + 4) * 127 + 128
    return Color3.fromRGB(r, g, b)
end
-- made by Fluxy Hub
local function createHighlightAndLabel(character, player)
    local oldHighlight = character:FindFirstChildOfClass(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,11025,10815,10920,11340,11025,10815,10920,12180}))
    if oldHighlight then oldHighlight:Destroy() end -- made 
    local oldBillboard = character:FindFirstChild(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,11655,11655,11340,7980,10185,10290,10605,11340}))
    if oldBillboard then oldBillboard:Destroy() end
-- by
    local highlight = Instance.new(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,11025,10815,10920,11340,11025,10815,10920,12180}))
    highlight.Adornee = character
    highlight.FillTransparency = 0.8
    highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
    highlight.OutlineTransparency = 0 -- f lu
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = character -- xy hub

    local billboard = Instance.new(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({6930,11025,11340,11340,10290,11655,10185,11970,10500,7455,12285,11025}))
    billboard.Name = BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,11655,11655,11340,7980,10185,10290,10605,11340})
    billboard.Adornee = character:FindFirstChild(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10605,10185,10500})) or character.PrimaryPart
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = guiEnabled

    local textLabel = Instance.new(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.Text = BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10185,11550,10500})
    textLabel.Parent = billboard
-- made by Fluxy Hub
    billboard.Parent = character -- made by Fluxy Hub
-- made by Fluxy Hub
    local time = 0
    local rgbConnection
    rgbConnection = RunService.RenderStepped:Connect(function(dt)
        if not billboard or not billboard.Parent then
            rgbConnection:Disconnect()
            return
        end
        time = time + dt
        textLabel.TextColor3 = getRGBColor(time)
    end)

    local function animateGui(state)
        if state then
            billboard.Enabled = true
            textLabel.TextTransparency = 1
            local tween = game:GetService(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,12495,10605,10605,11550,8715,10605,11970,12390,11025,10395,10605})):Create(
                textLabel,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 0}
            )
            tween:Play()
        else
            local tween = game:GetService(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,12495,10605,10605,11550,8715,10605,11970,12390,11025,10395,10605})):Create(
                textLabel,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {TextTransparency = 1}
            )
            tween.Completed:Connect(function()
                billboard.Enabled = false
            end)
            tween:Play()
        end
    end

    local function updateToolLabel()
        local tool = character:FindFirstChildOfClass(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,11655,11655,11340}))
        textLabel.Text = tool and tool.Name or BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10185,11550,10500})
    end

    local toolConnection
    toolConnection = character.ChildAdded:Connect(function(child)
        if child:IsA(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,11655,11655,11340})) then -- made by Fluxy Hub
            textLabel.Text = child.Name
        end
    end)
    character.ChildRemoved:Connect(function(child)
        if child:IsA(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({8820,11655,11655,11340})) then-- made by Fluxy Hub 
            textLabel.Text = BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10185,11550,10500})
        end
    end)

    updateToolLabel()

    guis[player] = {
        billboard = billboard,
        animateGui = animateGui,
        highlight = highlight,
        toolConnection = toolConnection,
        rgbConnection = rgbConnection -- made by Fluxy Hub
    }

    return highlight, billboard, animateGui
end

local function updatePlayerGUIs()
    if not LocalPlayer.Character or not LocalPlayer.Character.PrimaryPart then return end
    local localPos = LocalPlayer.Character.PrimaryPart.Position

    for player, guiData in pairs(guis) do
        if player.Character and player.Character.PrimaryPart then
            local distance = (player.Character.PrimaryPart.Position - localPos).Magnitude
            local shouldShow = distance <= maxDistance and guiEnabled
            if shouldShow and not guiData.billboard.Enabled then
                guiData.animateGui(true)
            elseif not shouldShow and guiData.billboard.Enabled then
                guiData.animateGui(false)
            end
        end -- made by Fluxy Hub
    end
end

local function highlightAndLabelPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if player.Character:FindFirstChild(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10605,10185,10500})) then -- made by Fluxy Hub
                createHighlightAndLabel(player.Character, player)
            end -- made by Fluxy Hub
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then -- made by Fluxy Hub
        player.CharacterAdded:Connect(function(character) -- made by Fluxy Hub
            if character:WaitForChild(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10605,10185,10500}), 5) then
                createHighlightAndLabel(character, player)
            end
        end)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            if character:WaitForChild(BFRsngxaxydYLKsKaoUUDUJhqEbNSdBXMrfpDpSjYEjxrEqZvDSbekdVwwlT({7560,10605,10185,10500}), 5) then
                createHighlightAndLabel(character, player)
            end
        end) -- made by Fluxy Hub
    end
end

Players.PlayerRemoving:Connect(function(player)
    if guis[player] then -- made by Fluxy Hub
        if guis[player].highlight then guis[player].highlight:Destroy() end
        if guis[player].billboard then guis[player].billboard:Destroy() end
        if guis[player].toolConnection then guis[player].toolConnection:Disconnect() end
        if guis[player].rgbConnection then guis[player].rgbConnection:Disconnect() end
        guis[player] = nil -- made by Fluxy Hub
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.T then -- CHANGE THE KEYBIND HERE
        guiEnabled = not guiEnabled -- made by Fluxy Hub
        updatePlayerGUIs() -- made by Fluxy Hub
    end
end)

RunService.Heartbeat:Connect(function()
    updatePlayerGUIs() -- made by Fluxy Hub
end)

highlightAndLabelPlayers() -- made by Fluxy Hub
    
