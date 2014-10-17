local component = require("component")
local colors = require("colors")
local gpu = component.gpu -- get primary gpu component
local w, h = gpu.getResolution()
local term = require("term")
local event = require "event" -- load event table and store the pointer to it in event
 
local char_space = string.byte(" ") -- numerical representation of the space char
local running = true -- state variable so the loop can terminate

gpu.fill(1, 1, w, h, " ") -- clears the screen
gpu.setForeground(0xff8c00)
gpu.setBackground(0x09835e)
gpu.setResolution(100, 32)
term.clear()
term.setCursorBlink(false)


function unknownEvent()
  -- do nothing if the event wasn't relevant
end
 
-- table that holds all event handlers, and in case no match can be found returns the dummy function unknownEvent
local myEventHandlers = setmetatable({}, { __index = function() return unknownEvent end })
 
-- Example key-handler that simply sets running to false if the user hits space
function myEventHandlers.key_up(adress, char, code, playerName)
  if (char == char_space) then
    running = false
  end
end
 
-- The main event handler as function to separate eventID from the remaining arguments
function handleEvent(eventID, ...)
  if (eventID) then -- can be nil if no event was pulled for some time
    myEventHandlers[eventID](...) -- call the appropriate event handler with all remaining arguments
  end
end
 



print("Welcome to Techworld")
print(" ")
print("To gain build rights please apply on our website:")
print("http://minecraft-techworld.com/apply")
print("")
print("Follow the staffs directions")
print("If it is not yours do not touch, Every block, chest, item is tracked")
print("Griefers will be banned on the spot")
print("You can always check the rules on the wiki")
print(" ")
print("Staff:")
print("Admins:")
print("       SuicidalEmbryo   aka Embryo")
print("       xXShadow_sistaXx aka Shadow")
print("       Lumandrill       aka Luman")
print("       Tuglowz aka      Tugz")
print(" ")
print("Mod:")
print("    TM1618")
print(" ")
print(" ")
print(" ")

-- main event loop which processes all events, or sleeps if there is nothing to do
while running do
  handleEvent(event.pull()) -- sleeps until an event is available, then process it
end