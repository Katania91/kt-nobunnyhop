local NumberJump = Config.NumberJump  -- Gets the maximum jump count setting from the config
local DebugMode = Config.DebugMode  -- Gets the debug mode setting from the config
local Jump = 0  -- Jump counter
local wasJumping = false  -- Tracks the jumping state
local jumpTimer = 0  -- Timer to count the jumps
local jumpTimeout = 10000  -- 10-second limit (in milliseconds)
local checkInterval = 50  -- Interval to check the player's state (in milliseconds)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(checkInterval) 
        
        local ped = PlayerPedId()
        local isJumping = IsPedJumping(ped)  -- Checks if the player is currently jumping

        -- Proceed only if the player is on foot, not swimming, not climbing, and not ragdolling
        if IsPedOnFoot(ped) and not IsPedSwimming(ped) and 
           not IsPedClimbing(ped) and not IsPedRagdoll(ped) then

            if isJumping and not wasJumping then  -- Detects the start of a jump
                if Jump == 0 then
                    jumpTimer = GetGameTimer()  -- Starts the timer when the first jump is detected
                end

                Jump = Jump + 1  -- Increments the jump counter
                if DebugMode then
                    print("Jump count: " .. Jump)  -- Debug: Shows the jump count
                end

                if Jump >= NumberJump then
                    SetPedToRagdoll(ped, 5000, 1400, 2)  -- Applies the ragdoll effect
                    if DebugMode then
                        print("Ragdoll effect applied after " .. Jump .. " jumps in 10 seconds.")  -- Debug: Indicates the application of the ragdoll effect
                    end
                    Jump = 0  -- Resets the jump counter
                    Citizen.Wait(1000)  -- Wait briefly after applying the ragdoll effect to reduce CPU load
                end
            end
            
            -- Resets the jump counter if 10 seconds have passed since the first jump
            if Jump > 0 and GetGameTimer() - jumpTimer > jumpTimeout then
                if DebugMode then
                    print("Timer expired")  -- Debug: Shows the expiration of the timer
                end
                Jump = 0
            end
            
            wasJumping = isJumping  -- Records the current jump state
        else
            -- If the player doesn't meet the conditions, wait 500ms and reset the jump counter
            Citizen.Wait(500)
            Jump = 0
            wasJumping = false  -- Resets the jump state
        end
    end
end)
