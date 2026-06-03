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

print("Tadpole Speed Loaded")

LoopAsync(1000, function()
    
    applyTadpoleSpeed()

    return true
end)
