Methods = {}

-- Put [ starterItems = require("starterItems") ] somewhere at the top of myMod.lua
-- Find "Players[pid]:EndCharGen()" inside myMod.lua and insert [ starterItems.GiveStarterItems(pid) ] directly underneath it.

-- To add more items just add another bracket set with the info, IE: {"common_shirt_01", 1, -1} separated by commas.
-- data inside being organized by {"Item Ref ID", amount, charge}

local items = { {"gold_001", 100, -1}, {"p_restore_magicka_c", 1, -1} }

Methods.GiveStarterItems = function(pid)
    for i,item in pairs(items) do
        local structuredItem = { refId = item[1], count = item[2], charge = item[3] }
        table.insert(Players[pid].data.inventory, structuredItem)
    end
    Players[pid]:LoadInventory()
    Players[pid]:LoadEquipment()
end

return Methods
