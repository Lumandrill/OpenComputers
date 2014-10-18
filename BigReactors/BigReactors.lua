local component = require("component")
local gpu = component.gpu
local br = component.br_reactor
local term = require("term")
local w, h = gpu.getResolution()
local wmax, hmax = gpu.maxResolution()

term.clear()
term.setCursorBlink(false)

--Generating the main frame
gpu.setForeground(0x018D8D)
gpu.setBackground(0x970808)
gpu.setResolution(67, 11)
 
 gpu.set(1,1,"╔════════════════════════════════════════════════════════════════╗")
 gpu.set(1,2,"║       Reactor name                  ║                          ║")
 gpu.set(1,3,"║────────────────────────────────────────────────────────────────║")
 gpu.set(1,4,"║   Rod 1              | #-#      #+# ║     Power last tick:     ║")
 gpu.set(1,5,"║   Rod 2              | #-#      #+# ║        <number> RF       ║")
 gpu.set(1,6,"║   Rod 3              | #-#      #+# ║                          ║")
 gpu.set(1,7,"║   Rod 4              | #-#      #+# ║      Power Stored:       ║")
 gpu.set(1,8,"║   Rod 5              | #-#      #+# ║                          ║")
 gpu.set(1,9,"║─────────────────────────────────────║    ##################    ║")
gpu.set(1,10,"║ Set All: 10% 30% 50% 70% 90% 100%   ║   0%               100%  ║")
gpu.set(1,11,"╚════════════════════════════════════════════════════════════════╝")


--Feetching and displying rod names
--Checking if the reactor is active or even exists

local reactorActive = br.getActive(0)
local reactorConnected = br.getConnected(0)
if reactorConnected == true
	then
	if reactorActive == true then
		gpu.set(40,2,"Reactor Active")
		else gpu.set(40,2,"Reactor DEACTIVATED")
	end
	else gpu.set(40,2,"NO REACTOR")
end


--Generating the rodlevel output
local rodLevel = br.getControlRodLevel(0)
local rodName = br.getControlRodName(0)
rodAmount = br.getNumberOfControlRods(0)


if rodAmount >= 0
	then
		gpu.set(3,4," "..br.getControlRodName(0).." ")
		if br.getControlRodLevel(0) < 0
			then gpu.set(30,4,"  "..br.getControlRodLevel(0).."%")
			elseif br.getControlRodLevel(0) == 100
			then gpu.set(30,4,""..br.getControlRodLevel(0).."%")
			else gpu.set(30,4," "..br.getControlRodLevel(0).."%")
		end
	else
	gpu.set(30,4,"N/A")
end

if rodAmount >= 1
	then
		gpu.set(3,5," "..br.getControlRodName(1).." ")
		if br.getControlRodLevel(1) < 0
			then gpu.set(30,5,"  "..br.getControlRodLevel(1).."%")
			elseif br.getControlRodLevel(1) == 100
			then gpu.set(30,5,""..br.getControlRodLevel(1).."%")
			else gpu.set(30,5," "..br.getControlRodLevel(1).."%")
		end
	else
	gpu.set(30,4,"N/A")
end

if rodAmount >= 2
	then
		gpu.set(3,6," "..br.getControlRodName(2).." ")
		if br.getControlRodLevel(2) < 0
			then gpu.set(30,6,"  "..br.getControlRodLevel(2).."%")
			elseif br.getControlRodLevel(2) == 100
			then gpu.set(30,6,""..br.getControlRodLevel(2).."%")
			else gpu.set(30,6," "..br.getControlRodLevel(2).."%")
		end
	else
	gpu.set(30,6,"N/A")
end

if rodAmount >= 3
	then
		gpu.set(3,7," "..br.getControlRodName(3).." ")
		if br.getControlRodLevel(3) < 0
			then gpu.set(30,7,"  "..br.getControlRodLevel(3).."%")
			elseif br.getControlRodLevel(0) == 100
			then gpu.set(30,7,""..br.getControlRodLevel(3).."%")
			else gpu.set(30,7," "..br.getControlRodLevel(3).."%")
		end
	else
	gpu.set(30,7,"N/A")
end

if rodAmount >= 4
	then
		gpu.set(3,8," "..br.getControlRodName(4).." ")
		if br.getControlRodLevel(4) < 0
			then gpu.set(30,8,"  "..br.getControlRodLevel(4).."%")
			elseif br.getControlRodLevel(4) == 100
			then gpu.set(30,8,""..br.getControlRodLevel(4).."%")
			else gpu.set(30,8," "..br.getControlRodLevel(4).."%")
		end
	else
	gpu.set(30,8,"N/A")
end




--Getting the stored amount of RF and making the bar
local energyStored = br.getEnergyStored(0)
local energyLastTick = br.getEnergyProducedLastTick(0)
 gpu.set(43,5,energyLastTick.." RF")
 gpu.set(43,8,energyStored.."/10000000")