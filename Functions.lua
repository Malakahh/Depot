------------------------------------------------------------
-- | Depot								    			| --
-- | Stores info about inventory, bank, etc.			| --
-- | Copyright (c) 2014 Malakahh. All Rights Reserved.	| --
------------------------------------------------------------

--Constants
local NUM_EQUIPMENTSLOTS = INVSLOT_LAST_EQUIPPED

local _, ns = ...
local Depot = ns.Depot

-----
---Item functions
-----

function Depot:GenerateItemDataPair(itemLink)
    if itemLink then
        local itemId = self:GetItemId(itemLink)
        local bagCnt,bankCnt,equipCnt = self:GetDetailedItemCount(itemId)
        local dataStr = bagCnt .. ";" .. bankCnt .. ";" .. equipCnt .. ";"
        return itemId, dataStr
    end
end

function Depot:GetItemId(itemLink)
    if itemLink then
        return itemLink:match("item:(%d+)")
    end
end

function Depot:GetDetailedItemCount(itemID)
    if itemID then
        local totalCnt = GetItemCount(itemID, true)
        local inventoryCnt = GetItemCount(itemID)
        local bagCnt = inventoryCnt
        local bankCnt = 0
        local equipCnt = 0

        --bank count
        bankCnt = totalCnt - inventoryCnt

        --equipped count
        local itemLink
        for i = 0, NUM_EQUIPMENTSLOTS do
            itemLink = GetInventoryItemLink("player", i)
            if itemLink and Depot:GetItemId(itemLink) == itemID then
                bagCnt = bagCnt - 1
                equipCnt = equipCnt + 1
            end
        end

        return bagCnt, bankCnt, equipCnt
    end
end

