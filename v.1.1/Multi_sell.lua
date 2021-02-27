local PATH_SELL = {
    ["BONTA"] = { 
        ["TP"] = function()
            if map:currentMapId() ~= 162791424 then
                havreSac()

            elseif map:currentMapId() == 162791424 then
                setTP()
                return useZaap(147768)
            end
        end,
        ["GO_HDV"] = function(dest)
            local currentMapId = map:currentMapId()

            if dest == 'ressource' then
                return {{ map = currentMapId, path = "zaapi(146741)" }}
            elseif dest == "consommable" then
                return {{ map = currentMapId, path = "zaapi(146748)" }}
            elseif dest == "equipement" then
                return {{ map = currentMapId, path = "zaapi(145203)" }}
            elseif dest == "rune" then
                return {{ map = currentMapId, path = "zaapi(147767)" }}
            end
        end,
        ["USE_HDV"] = function(mode)
            local currentMapId = map:currentMapId()
            local modeId
            if mode == "sell" then
                modeId = 5
            elseif mode == "buy" then
                modeId = 6
            end

            if currentMapId == 146741 then -- Ressource
                npc:npc(515264, modeId)			
            elseif currentMapId == 146748 then -- Consommable
                npc:npc(515273, modeId)
            elseif currentMapId == 145203 then -- Equipement
                npc:npc(515274, modeId)
            elseif currentMapId == 145203 then -- Rune
                npc:npc(516482, modeId)
            end
        end
    }
}

local ITEM_TO_SELL = {
	{
		name = "Ebonite",
		idItem = 746,
		lot = 3,
		minPrice = 90000,
		weight = 20,
		type = "ressource"
	},
	{
		name = "Magnesite",
		idItem = 748,
		lot = 3,
		minPrice = 110000,
		weight = 30,
		type = "ressource"
	},
	{
		name = "Bakelelite",
		idItem = 749,
		lot = 2,
		minPrice = 80000,
		weight = 40,
		type = "ressource"
	},
	{
		name = "Rutile",
		idItem = 7036,
		lot = 2,
		minPrice = 10000,
		weight = 80,
		type = "ressource"
	},
	{
		name = "Pyrute",
		idItem = 7035,
		lot = 2,
		minPrice = 150000,
		weight = 90,
		type = "ressource"
	},
	{
		name = "Substrat de buisson",
		idItem = 2539,
		lot = 3,
		minPrice = 70000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de bocage",
		idItem = 12745,
		lot = 3,
		minPrice = 80000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de futaie",
		idItem = 2540,
		lot = 3,
		minPrice = 100000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Substrat de fascine",
		idItem = 2543,
		lot = 3,
		minPrice = 300000,
		weight = 0,
		type = "ressource"
	},
	{
		name = "Rose des sables",
		idItem = 15263,
		lot = 3,
		minPrice = 5000,
		weight = 0,
		type = "ressource"
	},	
	{
		name = "Parchemin d'Ivoire",
		idItem = 678,
		lot = 2,
		minPrice = 5000,
		weight = 1,
		type = "consommable"
	},
}

local ITEM_TO_BUY = {
	{
		name = "Goujon",
		idItem = 1782,
		lot = 3,
		minStock = 500,
		maxPrice = 15000,
		weight = 2,
		type = "ressource"
	},	
}


return PATH_SELL, ITEM_TO_SELL, ITEM_TO_BUY