hs.loadSpoon("SpoonInstall")

local M = {}

--- @param spoons table List of all the spoons to be installed
function M.InstallOrInitialize(spoons)
	for i = 1, #spoons do
		spoon.SpoonInstall:andUse(spoons[i])
	end
end

return M
