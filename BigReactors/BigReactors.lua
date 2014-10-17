local component = require("component")
local gpu = component.gpu -- get primary gpu component
local br = component.br_reactor
local term = require("term")
local w, h = gpu.getResolution()
local wmax, hmax = gpu.maxResolution()

local energyStored = br.getEnergyStored


term.clear()
term.setCursorBlink(false)

--Generating the main frame
gpu.setForeground(0x018D8D)
gpu.setBackground(0x970808)
gpu.setResolution(67, 11)
 
 gpu.set(1,1,"╔════════════════════════════════════════════════════════════════╗")
 gpu.set(1,2,"║       Reactor name                  ║                          ║")
 gpu.set(1,3,"║────────────────────────────────────────────────────────────────║")
 gpu.set(1,4,"║                      | #-#      #+# ║   Power last tick:       ║")
 gpu.set(1,5,"║ Rod 2                | #-# 100% #+# ║        <number> RF       ║")
 gpu.set(1,6,"║ Rod 3                | #-# 100% #+# ║            ║             ║")
 gpu.set(1,7,"║ Rod 4                | #-# 100% #+# ║   Power Stored:          ║")
 gpu.set(1,8,"║ Rod 5                | #-# 100% #+# ║    <number>/<maxrf>      ║")
 gpu.set(1,9,"║─────────────────────────────────────║    ##################    ║")
gpu.set(1,10,"║                                     ║   0%               100%  ║")
gpu.set(1,11,"╚════════════════════════════════════════════════════════════════╝")


--Feetching and displying rod names
--Checking if the reactor is active or even exists
local reactorActive = 0
if br.getConnected == true
	then
	if br.getActive == true then
		gpu.set(40,2,"Reactor Active")
		else gpu.set(40,2,"Reactor DEACTIVATED")
	end
	else gpu.set(40,2,"NO REACTOR")
end







--Checking the number of rods
--Generating the rodlevel output
local rodLevel = br.getControlRodLevel(0)
local rodName = br.getControlRodName(0)
rodAmount = br.getNumberOfControlRods
local rodAmount = 0
local rodlevel0 = na
rodlevel1 = na
rodlevel2 = na
rodlevel3 = na
rodlevel4 = na

if rodAmount == 0
	then
		rodname0 = br.getControlRodName(0)
		rodLevel0 = br.getControlRodLevel(0)
		gpu.set(3,4," "..br.getControlRodName(0).." ")
		gpu.set(30,4," "..br.getControlRodLevel(0).."%")
	else
end


--Getting the stored amount of RF and making the bar

--[[
 gpu.set(1,1,"╔════════════════════════════════════════════════════════════════╗")
 gpu.set(1,2,"║     Reactor name                    ║         ACTIVE           ║")
 gpu.set(1,3,"║────────────────────────────────────────────────────────────────║")
 gpu.set(1,4,"║ Rod 1                | #-# 100% #+# ║   Power last tick:       ║")
 gpu.set(1,5,"║ Rod 2                | #-# 100% #+# ║        <number> RF       ║")
 gpu.set(1,6,"║ Rod 3                | #-# 100% #+# ║            ║             ║")
 gpu.set(1,7,"║ Rod 4                | #-# 100% #+# ║   Power Stored:          ║")
 gpu.set(1,8,"║ Rod 5                | #-# 100% #+# ║    <number>/<maxrf>      ║")
 gpu.set(1,9,"║─────────────────────────────────────║    ##################    ║")
gpu.set(1,10,"║                                     ║   0%               100%  ║")
gpu.set(1,11,"╚════════════════════════════════════════════════════════════════╝")
]]--