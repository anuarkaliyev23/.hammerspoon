local M = {}

--- @param table table
--- @param element any
--- @return boolean 
function M.tableContains(table, element)
	for i = 1, #table do
		if element == table[i] then
			return true
		end
	end
	return false
end

--- @param table table
--- @param element any
--- @return integer | nil
function M.tableIndexOf(table, element)
	for i = 1, #table do
		if element == table[i] then
			return i
		end
	end
	return nil
end

return M
