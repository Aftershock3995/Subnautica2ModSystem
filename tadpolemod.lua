local TSpeed = 2400
local TAccel = 2500
local TRot = .012
local TFric = .9
local TAngularAcell = 3500

local function applyTadpoleSpeed()

    local sets = FindAllOf("UWEMovementSetComponent")

    if sets then 
        for i, set in ipairs(sets) do

            if set:IsValid() and tostring(set:GetFullName()):find("BP_Tadpole_C") then

                set:SetBaseSwimSpeed(TSpeed)
                set:SetRotationSpeedMultiplier(TRot)

            end
        end
    end

    local moves = FindAllOf("UWESubmersibleMovementComponent")

    if moves then
        for i, move in ipairs(moves) do

            if move:IsValid() and tostring(move:GetFullName()):find("BP_Tadpole_C") then

                move.MaxSwimAcceleration = TAccel
                move.MaxAcceleration = TAccel
                move.MaxFlyAcceleration = TAccel

            end
        end
    end

    local tidepods = FindAllOf("BP_Tadpole_C")

    if tidepods then
        for i, tidepod in ipairs(tidepods) do

            if tidepod:IsValid() then

                tidepod.DefaultSwimmingFriction = TFric
                tidepod.AngularAcceleration = TAngularAcell

            end
        end
    end
end

print("Tadpole Upgrades Loaded")

applyTadpoleSpeed()

NotifyOnNewObject("UWEMovementSetComponent", function(set)

    if set:IsValid() and tostring(set:GetFullName()):find("BP_Tadpole_C") then

        set:SetBaseSwimSpeed(TSpeed)
        set:SetRotationSpeedMultiplier(TRot)

    end
end)

NotifyOnNewObject("UWESubmersibleMovementComponent", function(move)

    if move:IsValid() and tostring(move:GetFullName()):find("BP_Tadpole_C") then

        move.MaxSwimAcceleration = TAccel
        move.MaxAcceleration = TAccel
        move.MaxFlyAcceleration = TAccel
        
    end
end)

NotifyOnNewObject("/Game/Core/Creatures/Tadpole/BP_Tadpole.BP_Tadpole_C", function(tidepod)

    if tidepod:IsValid() then

        tidepod.DefaultSwimmingFriction = TFric
        tidepod.AngularAcceleration = TAngularAcell

    end
end)
