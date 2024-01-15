local hotkey = require("hs.hotkey")
local logger = require("hs.logger").new('spaces', 'info')
local spaces = require("hs.spaces")
local utils = require("utils")

--- @param ss table
--- @return table 
local function toSpaces(ss)
	local result = {}
	logger.d(ss)
	for _, values in pairs(ss) do
		for i = 1, #values do
			table.insert(result, values[i])
		end
	end

	table.sort(result)
	return result
end


--- @param spaceList table
--- @param spaceId integer
--- @return integer | nil
local function nextSpace(spaceList, spaceId)
	local contains = utils.tableContains(spaceList, spaceId)
	logger.d(contains)
	if not contains then
		return nil
	end

	local currentElement = utils.tableIndexOf(spaceList, spaceId)
	logger.d('currentElement: ' .. currentElement)

	if currentElement + 1 < #spaceList then
		logger.d('returning spaceList[currentElement + 1]')
		logger.d('spaceList[currentElement + 1]: ' .. spaceList[currentElement + 1])
		return spaceList[currentElement + 1]
	end

	logger.d('returning spaceList[1]')
	logger.d('spaceList[1]: ' .. spaceList[1])
	return spaceList[1]
end


local function switchSpace()
	local allSpaces = spaces.allSpaces()
	logger.d(allSpaces)
	local currentSpace = spaces.focusedSpace()
	logger.d('currentSpace: ' .. currentSpace)
	local sortedSpaces = toSpaces(allSpaces)

	for i = 1, #sortedSpaces do
		logger.d(i, sortedSpaces[i])
	end

	local gotoSpace = nextSpace(sortedSpaces, currentSpace)
	logger.d(gotoSpace)

	logger.i(string.format('Changing space via script. CurrentSpace={%d} GotoSpace={%d}', currentSpace, gotoSpace))
	spaces.gotoSpace(gotoSpace)
end

-- Keymaps

hotkey.bind({"alt"}, "tab", switchSpace)

