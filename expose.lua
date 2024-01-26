local expose = require("hs.expose")
local hotkey = require("hs.hotkey")


hotkey.bind('alt', 'tab', 'Expose', function ()
	local exposeInstance = expose.new(nil, {showThumbnails=true, includeOtherSpaces=true})
	exposeInstance:toggleShow()
end)
