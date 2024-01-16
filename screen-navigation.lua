local hotkey = require("hs.hotkey")
local spaces = require("hs.spaces")
local screens = require("hs.screen")
local mouse = require("hs.mouse")


local function switchScreen()
	local currentSpace = spaces.focusedSpace()
	local currentScreenId = spaces.spaceDisplay(currentSpace)
	local currentScreen = screens.find(currentScreenId)
	local nextScreen = currentScreen:next()

	mouse.setRelativePosition(
		{x = 0, y = 0},
		nextScreen
	)
end

hotkey.bind({"alt"}, "tab", switchScreen)

