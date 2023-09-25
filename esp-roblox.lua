-- Function to create an ESP box and a username label on the head
function createESP(player)
    local character = player.Character
    if not character then
        return
    end

    local head = character:FindFirstChild("Head")
    if not head then
        return
    end
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            local espBox = Instance.new("BoxHandleAdornment")
            espBox.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
            espBox.Adornee = part
            espBox.AlwaysOnTop = true
            espBox.Transparency = 0 -- Set opacity to 1
            espBox.ZIndex = 5
            espBox.Color3 = Color3.new(0, 1, 0) -- Green color
            espBox.Parent = part
        end
    end

    -- Create a BillboardGui for the text label
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.Adornee = head
    billboard.StudsOffset = Vector3.new(0, 3, 0) -- Adjust the offset to position it above the head
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Text = player.Name
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Parent = billboard
end

-- Find and create ESP for all visible players
for _, player in pairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        createESP(player)
    end
end
