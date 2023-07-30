-- Discord: The_Plaft

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = game.Players.LocalPlayer

local previousPosition = nil

local function getPlayerPosition()

    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        return character.HumanoidRootPart.Position
    end
    return nil
end

local function teleportPlayerToPosition(position)

    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position)
        print("Teleported", player, "To", position)
    end
end

local function teleportToObbyAndBack()
    local previousPos = getPlayerPosition()

    local door = workspace.Obby:FindFirstChild("BlockedDoor")
    if door then
        print("Waiting BlockedDoor")
    else
        local teleport3 = workspace.Obby:FindFirstChild("Teleport 3")
        if teleport3 then
            local bunkerMesh = teleport3:FindFirstChild("Meshes/obby+bunker_Circle.038")
            if bunkerMesh then

                teleportPlayerToPosition(bunkerMesh.Position)
                wait(1)


                if previousPos then
                    teleportPlayerToPosition(previousPos)
                end
            else
                print("No obby door")
            end
        else
            print("No obby folder")
        end
    end
end

local function main()
    while true do
        teleportToObbyAndBack()
        wait(10)
    end
end

main()
