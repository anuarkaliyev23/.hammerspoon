local expose = require("hs.expose")
local hotkey = require("hs.hotkey")

local exposeInstance = expose.new(nil, {showThumbnails=true, includeOtherSpaces=true})

hotkey.bind('alt', 'tab', 'Expose', function ()
	exposeInstance:toggleShow()
end)
