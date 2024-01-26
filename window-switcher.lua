local switcher = require("hs.window.switcher")
local hotkey = require("hs.hotkey")
local instance = nil

local function getInstance()
	if instance == nil then
		local windowFilter = nil
		local uiPrefs = {
			onlyActiveApplication = false,
			showTitles = true,
			thumbnailSize = 64,
			selectedThumbnailSize = 128,
		}
		instance = switcher.new(windowFilter, uiPrefs)
	end

	return instance
end


hotkey.bind({'ctrl'}, 'tab', nil , function ()
	getInstance().nextWindow()
end)


hotkey.bind({'ctrl', 'shift'}, 'tab', nil, function ()
	getInstance().previousWindow()
end)
