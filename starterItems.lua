Methods = {}

-- Put [ items = require("starterItems") ] somewhere at the top of myMod.lua
-- Find "Players[pid]:Registered(data)" inside myMod.lua and insert [ items.GiveStarterItems(pid) ] directly underneath it.

-- To add more items just add another bracket set with the info, IE: {"common_shirt_01", 1, -1} separated by commas.
-- data inside being organized by {"Item Ref ID", amount, charge}

local items = { {"gold_001", 100, -1}, {"p_restore_magicka_c", 1, -1} }

Methods.GiveStarterItems = function(pid)
	for i,item in pairs(items) do
		tes3mp.AddItem(pid, item[1], item[2], item[3])
	end
	tes3mp.SendInventoryChanges(pid)
end

return Methods