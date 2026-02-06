
local lib = {}

-- A set is implemented as a table where the args are keys, and their values are 'true'. Set checking
-- would then be determined by seeing if a key is present.
-- This is not the same as just typing { key_1, key_2 } in lua, as that will make an array of
-- [1] = key_1, [2] = key_2, making them values, not keys.
function lib.Set(...)
    local set_table = {}
    for i, v in ipairs{...} do
        set_table[v] = true
    end
    return set_table
end

-- checks if the given set, which is defined as a table whose keys are items and whose values
-- are simply 'true' if the key exists, contains the given item (in other words, the table key
-- contains an entry matching the check item).
-- this is not limited to only 'Set'. As long as a key is non-nil, then it is considered being
-- 'contained'.
function lib.contains(tableSet, checkItem)
    return tableSet[checkItem] ~= nil
end

return lib