-- Hizmetler
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Yerel oyuncu
local LocalPlayer = Players.LocalPlayer

-- GUI durumu (açık/kapalı)
local guiEnabled = true
local guis = {} -- Oyuncu GUI'lerini saklamak için tablo

-- RGB renk geçişi için yardımcı fonksiyon
local function getRGBColor(t)
    local r = math.sin(t * 2 + 0) * 127 + 128
    local g = math.sin(t * 2 + 2) * 127 + 128
    local b = math.sin(t * 2 + 4) * 127 + 128
    return Color3.fromRGB(r, g, b)
end

-- Highlight ve isim etiketi oluşturma fonksiyonu
local function createHighlightAndLabel(character, player)
    -- Eski highlight ve billboard'u temizle
    local oldHighlight = character:FindFirstChildOfClass("Highlight")
    if oldHighlight then oldHighlight:Destroy() end
    local oldBillboard = character:FindFirstChild("ToolLabel")
    if oldBillboard then oldBillboard:Destroy() end

    -- Highlight ekleme
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillTransparency = 0.8 -- İç dolgu şeffaflığı
    highlight.OutlineColor = Color3.fromRGB(0, 255, 255) -- Modern cyan outline
    highlight.OutlineTransparency = 0 -- Outline tamamen görünür
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Her zaman üstte
    highlight.Parent = character

    -- BillboardGui (isim etiketi) oluşturma
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ToolLabel"
    billboard.Adornee = character:FindFirstChild("Head") or character.PrimaryPart
    billboard.Size = UDim2.new(0, 100, 0, 30) -- Küçük GUI boyutu
    billboard.StudsOffset = Vector3.new(0, 2.5, 0) -- Başın üstünde yakın konum
    billboard.AlwaysOnTop = true
    billboard.Enabled = guiEnabled -- Başlangıç durumu

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Başlangıç rengi
    textLabel.TextStrokeTransparency = 0.5 -- Yazı kenarlığı
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- Siyah kenarlık
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBlack -- Modern font
    textLabel.Text = "Hand"
    textLabel.Parent = billboard

    billboard.Parent = character

    -- RGB animasyonu
    local time = 0
    local connection
    connection = RunService.RenderStepped:Connect(function(dt)
        if not billboard or not billboard.Parent then
            connection:Disconnect()
            return
        end
        time = time + dt
        textLabel.TextColor3 = getRGBColor(time)
    end)

    -- Animasyonlu görünüm/gizlenme
    local function animateGui(state)
        if state then
            billboard.Enabled = true
            textLabel.TextTransparency = 1
            local tween = game:GetService("TweenService"):Create(
                textLabel,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 0}
            )
            tween:Play()
        else
            local tween = game:GetService("TweenService"):Create(
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

    -- Tool değişikliklerini izleme
    local function updateToolLabel()
        local tool = character:FindFirstChildOfClass("Tool")
        textLabel.Text = tool and tool.Name or "Hand"
    end

    -- Tool değişikliklerini dinleme
    local toolConnection
    toolConnection = character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            textLabel.Text = child.Name
        end
    end)
    character.ChildRemoved:Connect(function(child)
        if child:IsA("Tool") then
            textLabel.Text = "Hand"
        end
    end)

    -- İlk durumu kontrol et
    updateToolLabel()

    -- GUI ve highlight saklama
    guis[player] = {billboard = billboard, animateGui = animateGui, highlight = highlight, toolConnection = toolConnection}

    return highlight, billboard, animateGui
end

-- Oyunculara highlight ve etiket ekleme
local function highlightAndLabelPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            createHighlightAndLabel(player.Character, player)
        end
    end
end

-- Yeni oyuncular ve respawn için highlight ve etiket
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            -- Karakter yüklenene kadar bekle
            if character:WaitForChild("Head", 5) then
                createHighlightAndLabel(character, player)
            end
        end)
    end
end)

-- Mevcut oyuncuların respawn durumlarını izleme
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            if character:WaitForChild("Head", 5) then
                createHighlightAndLabel(character, player)
            end
        end)
    end
end

-- Oyuncu ayrıldığında temizleme
Players.PlayerRemoving:Connect(function(player)
    if guis[player] then
        if guis[player].highlight then guis[player].highlight:Destroy() end
        if guis[player].billboard then guis[player].billboard:Destroy() end
        if guis[player].toolConnection then guis[player].toolConnection:Disconnect() end
        guis[player] = nil
    end
end)

-- Y tuşu ile toggle
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.T then
        guiEnabled = not guiEnabled
        for _, guiData in pairs(guis) do
            guiData.animateGui(guiEnabled)
        end
    end
end)

-- İlk çalıştırma
highlightAndLabelPlayers()
