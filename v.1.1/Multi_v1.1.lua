-- Chargement des différent fichier de configuration
local func = {}

local currentDirectory = "F:\\DofusBotting\\LuaScript\\SnowScript + IA\\MultiMetier\\v.1.1\\"

local MAPS_BEFORE_HAVENBAG, RETOUR_BANK, PATH_CRAFT, PATH_JOB, PATH_REPLACE = dofile(currentDirectory.."Multi_path.lua")

local CRAFT, ITEM = dofile(currentDirectory.."Multi_IC.lua")

local PATH_SELL, ITEM_TO_SELL, ITEM_TO_BUY = dofile(currentDirectory.."Multi_sell.lua")

-- User option

local PANDALA = true
local SAHARACH = true
local FRIGOST1 = false
local FRIGOST2 = false
local FRIGOST3 = false

local AUTO_CRAFT = true
local AUTO_SELL = true
local AUTO_BUY = true

local ADD_ALL_PATH_OF_JOB = false
local GATHER_ALL_RESOURCES_OF_JOB = true

local TIME_PASS_ZONE = true

local pMin, pMax = 73, 92
local bMin, bMax = 1, 2
local tMin, tMax = 8, 13

local DEPOT_MAISON = false

local WORKTIME_JOB = {
    ["Lundi"] = {
        { startTime = "05:12", finishTime = "10:14", job = "Mineur" },
        { startTime = "10:14", finishTime = "12:04", job = "Alchimiste" },
        { startTime = "12:04", finishTime = "13:12", job = "Pause" },
        { startTime = "13:12", finishTime = "15:22", job = "Bucheron" },
        { startTime = "15:22", finishTime = "17:43", job = "Mineur" },
        { startTime = "17:43", finishTime = "20:58", job = "Alchimiste" },
        { startTime = "20:58", finishTime = "23:22", job = "Bucheron" },
        { startTime = "23:22", finishTime = "05:12", job = "Pause" },
    },
    ["Mardi"] = {
        { startTime = "20:12", finishTime = "23:45", job = "Mineur" },
        { startTime = "06:07", finishTime = "08:50", job = "Alchimiste" }
    },
    ["Mercredi"] = {
        { startTime = "10:00", finishTime = "23:45", job = "Mineur" },
        { startTime = "23:45", finishTime = "08:50", job = "Alchimiste" }
    },
    ["Jeudi"] = {
        { startTime = "19:10", finishTime = "19:50", job = "Pause" },
        { startTime = "19:50", finishTime = "19:55", job = "Chasse au trésor" },
        { startTime = "13:13", finishTime = "13:14", job = "" }      
    },
    ["Vendredi"] = {
        { startTime = "06:10", finishTime = "10:30", job = "Mineur" },
        { startTime = "10:30", finishTime = "11:00", job = "Alchimiste" },
        { startTime = "11:00", finishTime = "12:00", job = "Bucheron" },
        { startTime = "12:00", finishTime = "13:24", job = "Pause" },

    },
    ["Samedi"] = {
        { startTime = "20:00", finishTime = "22:43", job = "Mineur" },
        { startTime = "22:43", finishTime = "00:02", job = "Alchimiste" }
    },
    ["Dimanche"] = {
        { startTime = "00:02", finishTime = "03:22", job = "Bucheron" },
        { startTime = "03:22", finishTime = "07:12", job = "Pause" },
        { startTime = "07:12", finishTime = "10:14", job = "Mineur" },
        { startTime = "10:14", finishTime = "12:04", job = "Alchimiste" },
        { startTime = "12:04", finishTime = "13:12", job = "Pause" },
        { startTime = "13:12", finishTime = "15:22", job = "Bucheron" },
        { startTime = "15:22", finishTime = "17:43", job = "Mineur" },
        { startTime = "17:43", finishTime = "20:58", job = "Alchimiste" },
        { startTime = "20:58", finishTime = "23:22", job = "Bucheron" },
        { startTime = "23:22", finishTime = "05:12", job = "Pause" }
    }
}

-- Monture

local minMountEnergy = 600
local maxMountEnergy = 6400

local ID_ITEM_FEED_MOUNT = { 1782 }

-- Script var

GATHER = {}
OPEN_BAGS = true

local lowDelay, baseDelay, longDelay = 250, 500, 1000

local name, level, kamas, isFreeMode

local teleported, tpBank = false, false

local currentJob, currentIdJob = "", 0

local nextTimeToReassignJob = ""

-- Chasse au trésor var

local roadLoaded, readyToHunt = false, false

-- Gather var

local MAX_PODS = 101

local tbLimit, nbBoucle, diffTime, jobTime = 0, 0, 0, 0

local initCheckTimePassZone = false

local hStartTPZ, mStartTPZ = 0, 0

local assignPathToGather, filterPathByTags, setPathToFarm = false, false, false

local pathIndex, lastPathIndex, beforeLastPathIndex

local PATH_FILTERED = {}

local MULTIPLE_MAP = {}
MULTIPLE_MAP.CurrentSteps = {}

-- Craft Var

local checkCraft, goCraft = false, false

local RESSOURCES_TO_FARM = {}

local MANUFACTURING_RECIPE = {}
MANUFACTURING_RECIPE.ING = {}
MANUFACTURING_RECIPE.quantityToCraft = 0

-- Sell var

local goSell, goBuy, checkInSell, updatedPriceItem = false, false, false, false

local hdvToGo = ""

local TRADE_ITEM = {}

TRADE_ITEM.SELL = {}
TRADE_ITEM.SELL.ressource = {}
TRADE_ITEM.SELL.consommable = {}
TRADE_ITEM.SELL.equipement = {}
TRADE_ITEM.SELL.rune = {}

TRADE_ITEM.BUY = {}
TRADE_ITEM.BUY.ressource = {}
TRADE_ITEM.BUY.consommable = {}
TRADE_ITEM.BUY.equipement = {}
TRADE_ITEM.BUY.rune = {}

TRADE_ITEM.IN_SELL = {}
TRADE_ITEM.IN_SELL.ressource = { checked = false, itemOnSale = false, updated = false }
TRADE_ITEM.IN_SELL.consommable = { checked = false, itemOnSale = false, updated = false }
TRADE_ITEM.IN_SELL.equipement = { checked = false, itemOnSale = false, updated = false }
TRADE_ITEM.IN_SELL.rune = { checked = false, itemOnSale = false, updated = false }

-- Main Function

function func:Move()
    if not scriptInit then
        self:Initialisation()
        scriptInit = true
    end
    
    if inventory:podsP() >= MAX_PODS then
        return self:Bank()
    end

    if os.date("%H:%M") == nextTimeToReassignJob then
        self:AssignJob(true)
    end

    if currentJob == "pause" then
        self:PauseScript()
    end

    if not checkCraft then
        if DEPOT_MAISON then
            if not teleported then
                return RETOUR_MAISON.TP()
            end
            return RETOUR_MAISON.PATH()
        else
            if not teleported then
                return RETOUR_BANK.TP()
            end
            return RETOUR_BANK.PATH()
        end
    end

    if goCraft then
        for kPath, vPath in pairs(PATH_CRAFT) do
            if kPath == currentJob then
                if not teleported then
                    return vPath.TP()
                end
                return vPath.PATH()
            end
        end
    end

    if (goSell or goBuy) or (not updatedPriceItem and self:HdvNeedUpdate()) then
        return self:TradeMode()
    end

    if mount:hasMount() then
        if self:MountNeedFeed() then
            for _, v in pairs(ID_ITEM_FEED_MOUNT) do
                if inventory:itemCount(v) > 0 then
                    mount:feedMount(v, inventory:itemCount(v))
                    return self:Move()
                end
            end
            self:Print("La monture a besoin d'energie !", "mount")
            checkCraft = false
            return self:FinDeBoucle()
        elseif not mount:isRiding() then
            mount:toggleRiding()
        end
    end

    if self:IsJob() then
        return self:GatherMode()
    elseif currentJob == "chasse au trésor" then
        return self:TreasureHunt()
    else
        self:Print("Pas de job", "Move", "error")
    end
end

function func:Bank()
    if DEPOT_MAISON then
        if not tpBank then
            return RETOUR_MAISON.TP()
        end
        return RETOUR_MAISON.PATH()
    else
        if not tpBank then
            return RETOUR_BANK.TP()
        end
        return RETOUR_BANK.PATH()
    end
end

function func:Lost()
    self:Print("Aucune action ne donne d'indications pour la carte " .. map:currentMap() .. " (" .. tostring(map:currentMapId()) .. ")", "LOST", "error")
    return self:FinDeBoucle()
end

function func:Initialisation()
    name = character:name()
    level = character:level()
    kamas = character:kamas()
    isFreeMode = character:freeMode()    
    self:AssignJob()
    self:StarterMsgInfo()
end

-- Gather

function func:GatherMode()

    if not assignPathToGather then
        self:AssignPathToGather()
    end

    if not filterPathByTags then
        self:FilterPathByTags()
    end

    if not setPathToFarm then
        self:SetPathToFarm(PATH_FILTERED)
    end

    if TIME_PASS_ZONE then
        self:CheckTimePassZone()
        jobTime = diffTime
    else
        jobTime = nbBoucle
    end

    if jobTime >= tbLimit then
        self:Print("Changement de zone !", "farm")
        self:FinDeBoucle()
    end
    
    if not teleported then
        return PATH_FILTERED[pathIndex].TP()
    end
    return MULTIPLE_MAP:Run(PATH_FILTERED[pathIndex].PATH())
end

function func:AssignPathToGather()
    pathIndex =  nil
    lastPathIndex = nil
    beforeLastPathIndex = nil
    self:deleteDoubleValue(RESSOURCES_TO_FARM)

    for _, vItem in pairs(self:GetTableJob(ITEM)) do
        if not self:CheckStock(vItem) then
            if ADD_ALL_PATH_OF_JOB and vItem.current < vItem.maxStock then
                table.insert(RESSOURCES_TO_FARM, vItem.name)
            end
        end
    end          

    self:SetGather()
    self:PathReplace()
    assignPathToGather = true
end

function func:FilterPathByTags()
    self:Print("Filtrage des PATH a farm", "path")
    PATH_FILTERED = {}

    for _, vTag in pairs(RESSOURCES_TO_FARM) do
        for _, vPath in pairs(self:GetTableJob(PATH_JOB)) do

            for _, vTagPath in pairs(vPath.tags) do
                if string.lower(vTag) == string.lower(vTagPath) then
                    table.insert(PATH_FILTERED, vPath)
                    self:Print(vPath.name.." ajouter au path a farm ", "path")
                    break                                                               
                end
            end
        end
    end

    filterPathByTags = true
end

function func:SetPathToFarm(tbl)
    local max = #tbl

    if pathIndex ~= nil then
        if lastPathIndex ~= nil then
            beforeLastPathIndex = lastPathIndex
        end
        lastPathIndex = pathIndex
    end

    if #tbl > 3 and beforeLastPathIndex ~= nil and lastPathIndex ~= nil and pathIndex ~= nil then
        while beforeLastPathIndex == pathIndex or lastPathIndex == pathIndex do
            pathIndex = self:GetRandomNumber(1, max)
        end
    elseif #tbl > 2 and lastPathIndex ~= nil and pathIndex ~= nil then
        while lastPathIndex == pathIndex do
            pathIndex = self:GetRandomNumber(1, max)
        end    
    else
        pathIndex = self:GetRandomNumber(1, max)
    end


    local boucleMax = self:GetRandomNumber(bMin, bMax)
    local timeMaxZone = self:GetRandomNumber(tMin, tMax)

    self:Print("Go " ..tbl[pathIndex].name, "farm")
    if TIME_PASS_ZONE then
        tbLimit = timeMaxZone
        self:Print("Vous allez passez " ..timeMaxZone.. " minutes dans la zone !", "farm")
    else
        tbLimit = boucleMax
        self:Print("Vous allez faire " ..boucleMax.. " boucle dans la zone !", "farm")
    end
    setPathToFarm = true
end

function func:CheckStock(vItem)
    local levelJob = job:level(currentIdJob)

    if vItem.current < vItem.minStock and levelJob >= vItem.lvlToFarm then
        self:Print("Stock de " ..vItem.name.. " incomplet ! minStock = " ..vItem.minStock.. ", Ajout des path contenant " ..vItem.name, "stock")
        table.insert(RESSOURCES_TO_FARM, vItem.name)
        return true
    end

    return false
end

function func:SetGather()
    local gatherPriority = {}

    if GATHER_ALL_RESOURCES_OF_JOB then
        for _, vItem in pairs(self:GetTableJob(ITEM)) do
            if vItem.current < vItem.maxStock then
                --self:Print(vItem.name..' added SetETG : '..vItem.gatherId, "dev")
                local insert = { id = vItem.gatherId, prio = vItem.priorityToGather }
                table.insert(gatherPriority, insert)
            else
                self:Print("MaxStock atteint pour la ressource "..vItem.name, 'stock')
            end
        end 
    else
        for _, vTag in pairs(RESSOURCES_TO_FARM) do
            --self:Print('Looking for '..vTag, 'dev')
    
            for _, vItem in pairs(self:GetTableJob(ITEM)) do
                if vItem.name == vTag and vItem.current < vItem.maxStock then
                    --self:Print(vItem.name..' added SetETG : '..vItem.gatherId, "dev")
                    local insert = { id = vItem.gatherId, prio = vItem.priorityToGather }
                    table.insert(gatherPriority, insert)
                    break
                elseif vItem.current < vItem.minStock then
                    self:Print("Stock de "..vItem.name..' incomplet, activation des path a farm pour la ressource', "stock")
                    local insert = { id = vItem.gatherId, prio = vItem.priorityToGather }
                    table.insert(gatherPriority, insert)
                    break
                end
            end 
        end
    end

    table.sort(gatherPriority, function(a, b)
            return a.prio > b.prio
        end
    )

    for _, v in pairs(gatherPriority) do
        table.insert(GATHER, v.id)
    end
end

function func:PathReplace()
    local levelJob = job:level(currentIdJob)

    if currentJob == "mineur" then
        if levelJob >= 20 and not mLvl20 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[2])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[1])
            mLvl20 = true
        end
        if levelJob >= 40 and not mLvl40 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[3])
            table.remove(PATH_JOB.mineur, 6)
            table.insert(PATH_JOB.mineur, 6, PATH_REPLACE.mineur[4])
            mLvl40 = true
        end
        if levelJob >= 60 and not mLvl60 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[5])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[6])
            table.remove(PATH_JOB.mineur, 7)
            table.insert(PATH_JOB.mineur, 7, PATH_REPLACE.mineur[20])
            table.remove(PATH_JOB.mineur, 13)
            table.insert(PATH_JOB.mineur, 13, PATH_REPLACE.mineur[7])
            mLvl60 = true
        end
        if levelJob >= 80 and not mLvl80 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[8])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[9])
            table.remove(PATH_JOB.mineur, 2)
            table.insert(PATH_JOB.mineur, 2, PATH_REPLACE.mineur[10])
            mLvl80 = true
        end
        if levelJob >= 120 and not mLvl120 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[11])
            mLvl120 = true
        end
        if levelJob >= 140 and not mLvl140 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[11])
            mLvl140 = true
        end
        if levelJob >= 160 and not mLvl160 then
            table.remove(PATH_JOB.mineur, 19)
            table.insert(PATH_JOB.mineur, 19, PATH_REPLACE.mineur[19])
            mLvl160 = true
        end
    end

    if PANDALA and not pandalaInsert then
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[13])
        table.insert(PATH_JOB.paysan, PATH_REPLACE.paysan[1])
        table.insert(PATH_JOB.alchimiste, PATH_REPLACE.alchimiste[1])
        pandalaInsert = true
    end

    if SAHARACH and not saharachInsert then
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[14])
        saharachInsert = true
    end

    if FRIGOST1 or FRIGOST2 or FRIGOST3 and not frigost1Insert then
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[15])
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[16])
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[17])       
        frigost1Insert = true
    end

    if FRIGOST2 or FRIGOST3 and not frigost2Insert then
        table.insert(PATH_JOB.mineur, PATH_REPLACE.mineur[18])
        frigost2Insert = true
    end
end

function MULTIPLE_MAP:Run(tab)
	local currentPos = map:currentMap()
	local currentMapId = tostring(map:currentMapId())

	if not self.CurrentSteps[currentMapId] then
		self.CurrentSteps[currentMapId] = 0
	end

	self.CurrentSteps[currentMapId] = self.CurrentSteps[currentMapId] + 1

	local action = nil
	local firstAction = nil
	local count = 0

	for _, v in pairs(tab) do
		if v.map == currentPos or v.map == currentMapId then
			count = count + 1
			if count == self.CurrentSteps[currentMapId] then
				action = v
				break
			elseif count == 1 then
				firstAction = v
			end
		end
	end

	if not action then
		if firstAction then
			action = firstAction
			self.CurrentSteps[currentMapId] = 1
		else
			return func:Lost()
		end
	end

	if type(action.path) == "function" then
		action.custom = action.path
		action.path = nil
	end

	return { action }
end

function MULTIPLE_MAP:Reset(tab)
	self.CurrentSteps = {}
end

-- Chasse au tresor

function func:TreasureHunt()
    if not treasure:isHunting() then
        return self:GetHunt()
    elseif not readyToHunt then
        return self:GoHunt()
    elseif readyToHunt then
        return self:Hunting()
    end  
end

function func:GetHunt()
    local changeMapCellId = { 433, 419, 405, 391, 377, 363, 349, 335, 321, 307, 293, 279 }
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            self:HavreSac()
        else
            self:OpenChest()
            teleported = true
            self:Print("Go récupérer une chasse", "move")
            return self:UseZaap(142087694)
        end
    end

    if map:currentMapId() == 128452097 and not treasure:isHunting() then -- Map Malle au tresor
        global:delay(self:GetRandomNumber(1526, 2438))
        map:useById(484993,-1)
        global:delay(self:GetRandomNumber(1526, 2438))
        readyToHunt, roadLoaded, teleported = false, false, false
        self:Print("La chasse a était récupérer", "move")
        return self:TreasureHunt()
    end

    if not treasure:isHunting() then
        return {
            { map = "142087694", path = "right("..changeMapCellId[self:GetRandomIndexTbl(#changeMapCellId)]..")" },
            { map = "142088206", path = "right("..changeMapCellId[self:GetRandomIndexTbl(#changeMapCellId)]..")" },
            { map = "142088718", door = "343" },
            { map = "128451073", path = "292" }
        }
    else
        return self:TreasureHunt()
    end   
end

function func:GoHunt()
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            self:HavreSac()
        else
            teleported = true
            treasureStartMapId = treasure:getStartMapId()
            self:Print("Go map départ de la chasse", "move")
            return self:UseZaap(treasureStartMapId)
        end
    end

    if not map:onMap(treasureStartMapId) then
        if not roadLoaded then
            if map:loadRoadToMapId(treasureStartMapId, false) then
                roadLoaded = true
            else
                self:Print("Impossible de charger le chemin vers le début de la chasse", nil, "error")
                return self:HuntError()
            end
        end
        while not map:onMap(treasureStartMapId) do
            map:moveRoadNext()
            teleported, roadLoaded = false, false
            return self:TreasureHunt()      
        end
    else
        func:Print("Arrivée sur la map de départ de la chasse", "move")
        readyToHunt = true
        roadLoaded = false
        return self:Hunting()
    end

    return self:Move()
end

function func:Hunting()
    if not roadLoaded then
        nextFlagMapId = treasure:getNextFlagMapId(false)
        if nextFlagMapId ~= -1 and nextFlagMapId ~= 0 then
            if map:loadRoadToMapId(nextFlagMapId, false) then
                roadLoaded = true
            else
                self:Print("Impossible de charger le chemin vers le prochain indice", nil, "error")
                return self:HuntError()
            end
        end
    end

    if treasure:isReadyToDig() then
        self:Print("Lancement du combat avec le coffre !", "fight")        
        readyToHunt, teleported, roadLoaded = false, false, false
        treasure:huntDig()
        return self:Move()
    end

    if nextFlagMapId == 0 then
        self:Print("Impossible d'obtenir la mapID du prochain indice", nil, "error")
        return self:HuntError()
    elseif nextFlagMapId == -1 then
        return self:InFlagMap()
    end

    local iter = 0

    while true do
        local dir = treasure:getNextFlagDirection()
        if treasure:isInFlagMap() then
            return self:InFlagMap()
        elseif nextFlagMapId == map:currentMapId() then
            roadLoaded = false
            return self:Hunting()
        end  
        map:moveRoadNext()
        iter = iter + 1
        self:Print("Apres moveRoadNext", nil, "error")       
        map:changeMap(dir)
        if iter == 2 then
            self:Print("Impossible d'obtenir la direction du prochain indice", nil, "error")
            return self:HuntError()
        end
    end   
end

function func:InFlagMap()
    treasure:huntFlag()
    roadLoaded = false
    self:Print("Jalon posée sur la carte "..map:currentMap(), "move")

    if treasure:isReadyToDig() then
        self:Print("Tout les indices sont sélectionnés, confirmation de la sélection", "move")
        treasure:huntDig()
    end
    return self:Hunting()
end

function func:HuntError()
    waitQuitHunt = true
    readyToHunt, teleported, roadLoaded, checkCraft = false, false, false, false
    local timeWaitToQuit = treasure:quitTry()
    self:Print("Attente de "..timeWaitToQuit.." minutes avant la reprise d'une nouvelle mission", nil, "error")
    global:delay(self:secondeToMs(timeWaitToQuit * 60))
    while timeWaitToQuit > 0 do
        timeWaitToQuit = treasure:quitTry()
        global:delay(self:secondeToMs(timeWaitToQuit * 60))
    end
    return self:FinDeBoucle()
end

function func:OpenChest()
    local idChest = { 15260, 15248, 15261, 15262, 15264, 15265, 15266, 15267, 15268, 15269, 15270 }

    local inInventory = function ()
        for _, id in pairs(idChest) do
            if inventory:itemCount(id) > 0 then
                return true
            end
        end
        return false
    end

    while inInventory() do
        for _, id in pairs(idChest) do
            if inventory:itemCount(id) > 0 then
                self:Print("Ouverture de "..inventory:itemNameId(id), "butin")
            end
            while inventory:itemCount(id) > 0 do
                inventory:useItem(id)
            end       
        end     
    end
end

-- Auto craft

function func:InBank()
    if exchange:storageKamas() > 0 then
        self:Print("Récupération des kamas dans la banque, kamas = "..exchange:storageKamas().." K", "bank")
        exchange:getKamas(0)
    end

    self:ResetCraftVar()
    self:SetCurrentItem()

    -- AutoCraft

    if AUTO_CRAFT and self:IsJob() then
        self:SortCraft()
        self:CheckPossibleCraft()
        local iter = 0

        while not goCraft and #RESSOURCES_TO_FARM == 0 and iter < 2 do
            iter = iter + 1
            if iter == 2 then
                self:Print("Aucun craft disponible désactivation temporaire de l'autoCraft !", "CRAFT", "error")
                AUTO_CRAFT = false
                GATHER_ALL_RESOURCES_OF_JOB = true
            else
                self:LoopEndCraft()
                self:CheckPossibleCraft()
            end
        end
    else
        GATHER_ALL_RESOURCES_OF_JOB = true
    end

    -- Monture

    if not goCraft and mount:hasMount() then
        if self:MountNeedFeed() then
            local totalNeedItem = math.floor((maxMountEnergy - mount:getEnergy()) / 20)

            for _, v in pairs(ID_ITEM_FEED_MOUNT) do
                if exchange:storageItemQuantity(v) > totalNeedItem then
                    exchange:getItem(v, totalNeedItem)
                end
            end
        end
    end

    -- AutoSell

    if AUTO_SELL and not goCraft then
        self:CheckItemToSell()
    end

    if AUTO_BUY and not goCraft then
        self:CheckItemToBuy()
    end

    global:leaveDialog()

    teleported = false
    tpBank = false
    filterPathByTags = false
    assignPathToGather = false
    updatedPriceItem = false

    checkCraft = true

    if goCraft or goSell or goBuy then
        MAX_PODS = 101
        map:changeMap('havenbag')
    else
        MAX_PODS = self:GetRandomNumber(pMin, pMax)
        self:Print("Prochain retour bank a "..MAX_PODS.."% de pods", "bank")
        self:FinDeBoucle()
    end

end

function func:SetCurrentItem()
    for _, vTable in pairs(ITEM) do
        for _, vItem in pairs(vTable) do
            if exchange:storageItemQuantity(vItem.id) ~= nil then
                vItem.current = exchange:storageItemQuantity(vItem.id)
            end
        end
    end
end

function func:Crafting()
    for _, v in pairs(MANUFACTURING_RECIPE.ING) do
        craft:putItem(tonumber(v.id), tonumber(v.nb))
        global:delay(baseDelay)
    end
    craft:changeQuantityToCraft(MANUFACTURING_RECIPE.quantityToCraft)
    global:delay(baseDelay)
    craft:ready()
end

function func:SortCraft()
    local levelJob = job:level(currentIdJob)

    for _, vCraft in pairs(self:GetTableJob(CRAFT)) do
        if vCraft.active and ( levelJob >= vCraft.lvlToDesactive ) then -- Desactivation
            self:Print("Desactivation du craft " ..vCraft.name.. " lvlToDesactive atteint", "craft")
            vCraft.active = false
        end
    end        
end

function func:LoopEndCraft()
    local levelJob = job:level(currentIdJob)

    for _, vCraft in pairs(self:GetTableJob(CRAFT)) do

        if currentJob == "bucheron" and levelJob < 10 then
            table.insert(TO_FARM, "Frene")
            break
        end

        if vCraft.tmpMax == nil then
            vCraft.tmpMax = vCraft.nbItemsBeforeNextCraft
        end

        vCraft.nbItemsBeforeNextCraft = vCraft.nbItemsBeforeNextCraft + vCraft.tmpMax

        if vCraft.crafted then
            vCraft.crafted = false
        end
    end
end

function func:CheckPossibleCraft()

    for iCraft, vCraft in pairs(self:GetTableJob(CRAFT)) do

        if vCraft.crafted == nil then
            vCraft.crafted = false
        end

        if currentJob == "bucheron" then
            if exchange:storageItemQuantity(vCraft.idItem) >= vCraft.nbItemsBeforeNextCraft then
                if vCraft.name == "Substrat de buisson" then
                    CRAFT.bucheron[2].crafted = true
                elseif vCraft.name == "Substrat de bocage" then
                    CRAFT.bucheron[4].crafted = true
                elseif vCraft.name == "Substrat de futaie" then
                    CRAFT.bucheron[6].crafted = true
                elseif vCraft.name == "Substrat de fascine" then
                    CRAFT.bucheron[8].crafted = true
                end
            end
        end

        if exchange:storageItemQuantity(vCraft.idItem) >= vCraft.nbItemsBeforeNextCraft then
            vCraft.crafted = true
        end
        
        --self:Print(vCraft.name .. " active = " .. tostring(vCraft.active) .. ", crafted = " .. tostring(vCraft.crafted) .. ", waitItemOfAnotherJob = " ..tostring(vCraft.waitItemOfAnotherJob))

        if vCraft.active and not vCraft.crafted and not vCraft.waitItemOfAnotherJob and job:level(currentIdJob) >= vCraft.minLevel then
            local lot, canCraft, tblIngredient, errMsg = self:CanCraft(vCraft.name)
            self:Print("Looking for craft " ..vCraft.name, "craft")

            if lot or canCraft then
                self:Print("Craft de " ..vCraft.name.. " disponible !", "craft")
                if errMsg then
                    self:Print(errMsg, "CRAFT", "error")
                end
                goCraft = true
            end

            for iIngredient, vIngredient in ipairs(vCraft.ingredient) do
                if goCraft then -- PickItem si craft disponible
                    MANUFACTURING_RECIPE.quantityToCraft = tblIngredient.quantityToCraft
                    table.insert(MANUFACTURING_RECIPE.ING, { id = vIngredient.idItem, nb = vIngredient.nbIng })
                    --print(tblIngredient[iIngredient])
                    exchange:getItem(vIngredient.idItem, tblIngredient.pickItem[iIngredient])
                elseif tblIngredient.pickItem[iIngredient] == 0 then -- Sinon Ajout a la table de recolte  
                    self:MissingIngredient(vCraft, vIngredient, iIngredient)
                end
            end                                        
        end
        --print('remove '..CRAFT_FILTERED[iCraft].name)
        if #RESSOURCES_TO_FARM > 0 or goCraft then
            break
        end
    end
end

function func:CanCraft(itemName)
    local errMsg
    local currentItem, clc = 0, 0
    local cantCraft, lotActive, goBreak = false, false, false
    local tblIngredient = {}
    tblIngredient.pickItem = {}
    tblIngredient.quantityToCraft = 0

    for _, vCraft in pairs(self:GetTableJob(CRAFT)) do -- Cherche l'item                
        if itemName == vCraft.name then

            if vCraft.toolCraft ~= nil then
                toolCraft = vCraft.toolCraft
            end

            for _, vIngredient in pairs(vCraft.ingredient) do -- Parcours les ingredient
                for _, itemTable in pairs(ITEM) do -- Calcul currentItem
                    for _, vItem in pairs(itemTable) do
                        if vItem.name == vIngredient.name then
                            if vItem.minStock ~= nil then
                                currentItem = exchange:storageItemQuantity(vItem.id) - vItem.minStock
                            else
                                currentItem = exchange:storageItemQuantity(vItem.id)
                            end
                            break
                        end
                    end
                end
                --print(currentItem)
                local maxInInventory = self:CalculMaxItemInInventory(vCraft.weight, vIngredient.nbIng)

                if vCraft.lot then -- Calcul du nombre d'ingredient a retourner si lot                           
                    clc = vCraft.lot * vIngredient.nbIng

                    if clc > maxInInventory then
                        local excess = clc - maxInInventory
                        clc = math.round(clc - excess, 10)
                        errMsg = "Impossible de craft "..vCraft.name.." par lot de "..vCraft.lot..", la quantité de lot demandé et trop grande par rapport au pods disponible, go craft par lot de " .. clc / vIngredient.nbIng
                    end
                    lotActive = true
                else -- Sinon calcul en fonction des pods disponible
                    clc = math.round(maxInInventory, 10)
                    --print("[DEV] Clc = " ..clc)
                end

                if clc > currentItem then
                    cantCraft = true
                    table.insert(tblIngredient.pickItem, 0)
                else
                    goBreak = true
                    tblIngredient.quantityToCraft = clc / vIngredient.nbIng
                    table.insert(tblIngredient.pickItem, clc)
                end

            end
        end
        if goBreak then
            break
        end
    end
    --printSimpleTable(tblIngredient)
    if not cantCraft and lotActive then
        return true, false, tblIngredient, errMsg
    elseif not cantCraft and not lotActive then
        return false, true, tblIngredient, errMsg
    else
        return false, false, tblIngredient, errMsg
    end              
end

function func:MissingIngredient(vCraft, vIngredient, iIngredient)
    local notNull = vCraft.ingredient[iIngredient].job ~= nil 

    if notNull and vCraft.ingredient[iIngredient].job == currentJob then
        self:Print("Manque de " ..vIngredient.name.. " pour craft " ..vCraft.name, "craft")
        table.insert(RESSOURCES_TO_FARM, vIngredient.name)
    elseif notNull and vCraft.ingredient[iIngredient].job == 'drop' then
        self:Print("Manque de " ..vIngredient.name.. " activation du mode combat", "craft")
        table.insert(RESSOURCES_TO_FARM, vIngredient.name)
        goDrop = true      
    elseif notNull and vCraft.ingredient[iIngredient].job == 'divers' then
        self:Print("Manque d'une ressource non recoltable ou craftable, ressource = " ..vIngredient.name.. " desactivation du craft " ..vCraft.name, "CRAFT", "error")
        vCraft.active = false
    elseif notNull and vCraft.ingredient[iIngredient].job == 'substrat' then
        self:Print("Manque de " ..vIngredient.name.. " pour craft " ..vCraft.name, "craft")
        vCraft.next = true
    else
        self:Print("Manque d'une ressource d'un autre metier, ressource = " ..vIngredient.name.. " desactivation temporaire du craft " ..vCraft.name, "craft")
        vCraft.waitItemOfAnotherJob = true
    end
end

function func:CalculMaxItemInInventory(totalWeightCraft, nbIng)
    return ((self:RemainingPods()) / totalWeightCraft) * nbIng
end

function func:RemainingPods()
    return math.round((inventory:podsMax() - inventory:pods()), 100) - 200
end

function func:ResetCraftVar()
    MANUFACTURING_RECIPE = {}
    MANUFACTURING_RECIPE.ING = {}
    MANUFACTURING_RECIPE.quantityToCraft = 0

    GATHER = {}
    RESSOURCES_TO_FARM = {}
end

function useWorkshop()
    if currentJob == "paysan" then
        map:useById(514876, -1)
        global:delay(baseDelay)
    elseif currentJob == "alchimiste" then
        map:useById(515549, -1)
        global:delay(baseDelay)
    elseif currentJob == "mineur" then
        map:useById(455855, -1)
        global:delay(baseDelay)
    elseif currentJob == "bucheron" then
        map:useById(515879, -1)
        global:delay(baseDelay)
    end

    func:Crafting()
    global:delay(baseDelay)
    global:leaveDialog()
    global:delay(baseDelay)
    goCraft = false
    checkCraft = false
    teleported = false
    func:HavreSac()
end

-- AutoSell

function func:TradeMode()
    if not teleported then
        return PATH_SELL.BONTA.TP()  
    end

    if not checkInSell then
        return self:CheckInSell()
    end

    if goSell then -- Vente des items
        while self:CheckIfThereAreItemsToTrade(TRADE_ITEM.SELL) do
            if not selectedHdv then
                hdvToGo = self:SelectHDV(TRADE_ITEM.SELL)
                selectedHdv = true

                return PATH_SELL.BONTA.GO_HDV(hdvToGo)
            else
                PATH_SELL.BONTA.USE_HDV("sell")
                self:UpdateSellItems()
                self:SellItem(TRADE_ITEM.SELL[hdvToGo])
                TRADE_ITEM.SELL[hdvToGo] = {}
                TRADE_ITEM.IN_SELL[hdvToGo].itemOnSale = true
                TRADE_ITEM.IN_SELL[hdvToGo].updated = true
                selectedHdv = false
                global:leaveDialog()  
            end
        end
        checkCraft = false
        goSell = false
    elseif goBuy then
        while self:CheckIfThereAreItemsToTrade(TRADE_ITEM.BUY) do
            if not selectedHdv then
                hdvToGo = self:SelectHDV(TRADE_ITEM.BUY)
                selectedHdv = true

                return PATH_SELL.BONTA.GO_HDV(hdvToGo)
            else
                PATH_SELL.BONTA.USE_HDV("buy")
                self:BuyItem(TRADE_ITEM.BUY[hdvToGo])
                TRADE_ITEM.BUY[hdvToGo] = {}
                selectedHdv = false
                global:leaveDialog()  
            end
        end
        checkCraft = false
        goBuy = false
    elseif not updatedPriceItem then
        for k, v in pairs(TRADE_ITEM.IN_SELL) do
            if not v.updated and v.itemOnSale then
                if not selectedHdv then
                    selectedHdv = true
        
                    return PATH_SELL.BONTA.GO_HDV(k)
                elseif selectedHdv then
                    PATH_SELL.BONTA.USE_HDV("sell")
                    if sale:itemsOnSale() > 0 then
                        self:UpdateSellItems()
                        v.updated = true
                    end
                    selectedHdv = false
                    global:leaveDialog()  
                end        
            end                   
        end

        for _, v in pairs(TRADE_ITEM.IN_SELL) do
            v.updated = false                  
        end

        updatedPriceItem = true
    end

    return self:FinDeBoucle()  
end

function func:CheckIfThereAreItemsToTrade(tbl)
    for kHdv, vTrade in pairs(tbl) do
        if #vTrade > 0 then 
            return true
        end
    end
    return false
end

function func:SelectHDV(tbl)
    for kHdv, vTrade in pairs(tbl) do
        if #vTrade > 0 then -- Il y a des item a vendre
            return kHdv -- Retourne le bon hdv
        end
    end
end

function func:CheckItemToSell()
    self:ResetSellVar()

    for _, v in pairs(ITEM_TO_SELL) do
        local lot = self:GetLot(v.lot)
        local nbItemToPick = math.floor(exchange:storageItemQuantity(v.idItem) / lot) * lot

        if exchange:storageItemQuantity(v.idItem) >= lot and (v.weight * nbItemToPick <= self:RemainingPods()) then
            self:Print("L'objet "..v.name.." peux etre mis en vente", "sell")
            exchange:getItem(v.idItem, nbItemToPick)

            table.insert(TRADE_ITEM.SELL[v.type], v)
            goSell = true
            MAX_PODS = 101
        end
    end  
end

function func:CheckItemToBuy()
    for _, v in pairs(ITEM_TO_BUY) do
        local itemQuantity = exchange:storageItemQuantity(v.idItem)

        if itemQuantity < v.minStock then
            self:Print("L'item "..v.name.." a besoin d'être acheter", 'buy')
            local quantityToBuy = math.ceil((v.minStock - itemQuantity) / self:GetLot(v.lot))

            for i = 0, quantityToBuy do
                if self:RemainingPods() < (v.weight * (quantityToBuy * self:GetLot(v.lot))) then
                    quantityToBuy = quantityToBuy - 1
                else
                    break
                end
            end

            if quantityToBuy == 0 then
                quantityToBuy = 1
            end
            
            local item = v
            item.quantity = quantityToBuy

            goBuy = true
            table.insert(TRADE_ITEM.BUY[v.type], item)
        end
    end
end

function func:GetLot(lot, index)
    if lot == 3 or lot == 100 then
        if index then
            return 3
        end
        return 100
    elseif lot == 2 or lot == 10 then
        if index then
            return 2
        end
        return 10
    else    
        return 1
    end
end

function func:SellItem(tbl)
    for _, vItemToSell in pairs(tbl) do
        local nbLotToSell = inventory:itemCount(vItemToSell.idItem) / self:GetLot(vItemToSell.lot)
        if nbLotToSell > sale:availableSpace() then
            nbLotToSell = sale:availableSpace()
        end
        if sale:availableSpace() == 0 then
            self:Print("Plus de place disponible dans l'hotel de vente", "SELL", "error")
            break
        end

        local i = 0
        while i ~= nbLotToSell do
            sale:sellItem(vItemToSell.idItem, self:GetLot(vItemToSell.lot), sale:getPriceItem(vItemToSell.idItem, self:GetLot(vItemToSell.lot, true)))
            i = i + 1
        end

        self:Print("L'objet "..vItemToSell.name.." a etait mis en vente x"..nbLotToSell.." pour le prix de "..sale:getPriceItem(vItemToSell.idItem, self:GetLot(vItemToSell.lot, true)))
    end
end

function func:BuyItem(tbl)
    for _, v in pairs(tbl) do
        for i = 0, v.quantity do
            sale:buyItem(v.idItem, self:GetLot(v.lot), v.maxPrice)
        end
    end
end

function func:UpdateSellItems()
    if sale:itemsOnSale() > 0 then
        for i = 1, sale:itemsOnSale() do -- Parcours les objet en ventes
            for _, v in pairs(ITEM_TO_SELL) do -- Parcours les objet a mettre en ventes
                if v.idItem == sale:getItemGID(i) then
                    local lot = self:GetLot(v.lot, true)
                    if sale:getPriceItem(v.idItem, lot) < sale:getItemPrice(i) then -- Prix a mettre a jour
                        if sale:getPriceItem(v.idItem, lot) > v.minPrice then
                            sale:editPrice(sale:getItemGUID(i), sale:getPriceItem(v.idItem, lot), self:GetLot(v.lot))
                            self:Print("Le prix de l'item "..v.name.." a etait modifier, prix = "..sale:getPriceItem(v.idItem, lot), "sell")
                        else
                            self:Print("Impossible de modifier le prix de l'item "..v.name.." le prix et en dessous de minPrice", "SELL", "error")
                        end
                    end
                end
            end         
        end
    end
end

function func:HdvNeedUpdate()
    for _, v in pairs(TRADE_ITEM.IN_SELL) do
        if (not v.updated and v.itemOnSale) or not v.checked then
            return true
        end                   
    end
    return false
end

function func:CheckInSell()
    for k, v in pairs(TRADE_ITEM.IN_SELL) do
        if not selectedHdv and not v.checked then
            selectedHdv = true
            v.checked = true

            return PATH_SELL.BONTA.GO_HDV(k)
        elseif selectedHdv then
            PATH_SELL.BONTA.USE_HDV("sell")
            if sale:itemsOnSale() > 0 then
                self:UpdateSellItems()
                v.itemOnSale = true
                v.updated = true
            end
            selectedHdv = false
            global:leaveDialog()
        end        
    end
    checkInSell = true
    return self:TradeMode()
end

function func:ResetSellVar()

    TRADE_ITEM.SELL = {}
    TRADE_ITEM.SELL.ressource = {}
    TRADE_ITEM.SELL.consommable = {}
    TRADE_ITEM.SELL.equipement = {}
    TRADE_ITEM.SELL.rune = {}
    
    TRADE_ITEM.BUY = {}
    TRADE_ITEM.BUY.ressource = {}
    TRADE_ITEM.BUY.consommable = {}
    TRADE_ITEM.BUY.equipement = {}
    TRADE_ITEM.BUY.rune = {}
    goSell, goBuy = false, false
end

-- Monture

function func:MountNeedFeed()
    if mount:getEnergy() < minMountEnergy then
        return true
    end
    return false
end

-- TP et havreSac

function func:HavreSac()
    self:CheckMapBeforeHavreSac()
    
    if map:currentMap() ~= "0,0" then
        map:changeMap('havenbag')
    end
end

function func:CheckMapBeforeHavreSac()
    local currentMapId = map:currentMapId()

    for _, v in pairs(MAPS_BEFORE_HAVENBAG) do
        if not v.map then
            self:Print("map = nil", "CheckMapBeforeHavreSac", "error")
        end
        if currentMapId == v.map then
            if v.path ~= nil then
                map:changeMap(v.path)
                break
            elseif v.door ~= nil then
                map:door(tonumber(v.door))
                break
            else
                self:Print("Impossible de trouvé le changeMap pour la map '"..v.map.."'", "CheckMapBeforeHavreSac", "error")
                break
            end
        end
    end
    global:delay(5000)
end

function func:UseZaap(idDest)
    local dest = "zaap("..idDest..")"
    return {{ map = map:currentMapId(), path = dest }}
end

function func:FinDeBoucle()
    nbBoucle = 0
    MULTIPLE_MAP:Reset()
    setPathToFarm = false
    teleported = false
    initCheckTimePassZone = false
    if map:currentMapId() ~= 162791424 then
        self:HavreSac()
        global:delay(mediumDelay)
    else
        return self:Move()
    end   
end

-- Gestion Temps, Assignation métier, Boucle, Reset var

function func:CheckTimePassZone()
    if not initCheckTimePassZone then
        hStartTPZ, mStartTPZ = self:GenerateDateTime("hm")
        diffTime = 0
        initCheckTimePassZone = true
    end

    local curH, curM = self:GenerateDateTime("hm")

    diffTime = self:DiffTime(hStartTPZ, mStartTPZ, curH, curM)
end

function func:AssignJob(newJob)
    local day = os.date("%A")
    local hour, minute = tonumber(self:GenerateDateTime("h")), tonumber(self:GenerateDateTime("m"))

    for kDay, vTbl in pairs(WORKTIME_JOB) do
        if string.lower(kDay) == string.lower(day) then
            local jobHourStartedTime, JobMinuteStartedTime = 0, 0
            local goBreak = false
            for _, v in pairs(vTbl) do
                local hourStart, minuteStart = tonumber(string.match(v.startTime, "%d%d")), tonumber(string.match(v.startTime, "%d%d", 2))
                local hourFinish, minuteFinish = tonumber(string.match(v.finishTime, "%d%d")), tonumber(string.match(v.finishTime, "%d%d", 2))
                if hourFinish == 0 then
                    hourFinish = 24
                end
                if ((hour == hourStart and minute >= minuteStart) or hour > hourStart) and ((hour == hourFinish and minute < minuteFinish - 1) or hour < hourFinish) then
                    currentJob = string.lower(v.job)
                    nextTimeToReassignJob = v.finishTime
                end
            end
        end
    end

    self:SetJobId()

    if newJob then
        self:Print("Changement de métier, go farm le métier "..currentJob, "job")
        self:ResetScript()
        return self:FinDeBoucle()
    end
end

function func:SetJobId()
    local tblJob = { ["mineur"] = 24, ["alchimiste"] = 26, ["paysan"] = 28, ["bucheron"] = 2 }
    for k, v in pairs(tblJob) do
        if k == currentJob then
            currentIdJob = v
            break
        end
    end
end

function func:IsJob()
    local notJob = { "chasse au trésor", "fight", "leveling" }
    local result = true
    for _, v in pairs(notJob) do
        if currentJob == v then
            result = false
            break
        end
    end
    return result
end

function func:GenerateDateTime(format)
    local dateTimeTable = os.date('*t')

    if format == "h" then
        return dateTimeTable.hour
    elseif format == "m" then
        return dateTimeTable.min
    elseif format == "s" then
        return dateTimeTable.sec
    elseif format == "hm" then
        return tonumber(dateTimeTable.hour), tonumber(dateTimeTable.min)
    elseif format == "ms" then
        return tonumber(dateTimeTable.min), tonumber(dateTimeTable.sec)
    elseif format == "hms" then
        return tonumber(dateTimeTable.hour), tonumber(dateTimeTable.min), tonumber(dateTimeTable.sec)
    end 
end
   
function func:AddZeroForLessThan10(number)
    if(tonumber(number) < 10) then
        return 0 .. number
    else
        return number
    end
end

function func:PauseScript()
    local hStart, mStart = self:GenerateDateTime("hm")
    local hFinish, mFinish = tonumber(string.match(nextTimeToReassignJob, "%d%d")), tonumber(string.match(nextTimeToReassignJob, "%d%d", 2))
    local timeToWait = self:DiffTime(hStart, mStart, hFinish, mFinish)
    self:Print("Deconnexion du bot pendant "..timeToWait.." minutes", "pause")
    self:ResetScript()
    global:reconnectBis(timeToWait)
end

function func:DiffTime(hStart, mStart, hFinish, mFinish)
    local diffTimeMin = 0
    while true do
        if hStart == hFinish and mStart == mFinish then
            return diffTimeMin
        end
        if mStart == 60 then
            hStart = hStart + 1
            mStart = 0
        end
        if hStart == 24 then
            hStart = 0
        end
        diffTimeMin = diffTimeMin + 1
        mStart = mStart + 1
    end
end

-- Autres

function func:GetTableJob(tbl)
    for kJob, vTable in pairs(tbl) do      
        if kJob == currentJob then
            return vTable
        end
    end
end

function func:StarterMsgInfo()
    self:Print("Hey "..name.." il est "..os.date("%H:%M").." go farm "..currentJob, "START")
end

function func:Print(msg, header, msgType)
    local job = currentJob
    local prefabStr = ""

    if job == nil then
        job = "currentJobNIL"
    end

    if header ~= nil then
        prefabStr = "["..string.upper(header).."]["..string.upper(job).."] "..msg
    else
        prefabStr = "["..string.upper(job).."] "..msg
    end

    if msgType == nil then
        global:printSuccess(prefabStr)
    elseif string.lower(msgType) == "normal" then
        global:printMessage(prefabStr)
    elseif string.lower(msgType) == "error" then
        global:printError("[ERROR]["..string.upper(job).."]["..header.."] "..msg)
    end
end

function func:GetRandomNumber(min, max)
    local rand = json.parse(developer:getRequest("http://www.randomnumberapi.com/api/v1.0/random?min="..tostring(min).."&max="..tostring(max).."&count=1"))  
    return rand[1]
end

function func:GetRandomIndexTbl(lenghtTbl)
    return self:GetRandomNumber(1, lenghtTbl)
end

function func:secondeToMs(seconde)
    return seconde * 1000
end

function func:deleteDoubleValue(tbl)
    local delCount = 0

    if #tbl > 1 then
        local tblCompare = tbl

        for _, vComp in pairs(tblCompare) do
            local count = 0
            for iTbl, vTbl in pairs(tbl) do
                if vComp == vTbl then
                    count = count + 1
                end
                if vComp == vTbl and count > 1 then
                    --print("[DEV] " ..vTbl.. " removed ! Count = " ..count, 2)
                    table.remove(tbl, iTbl - delCount)
                    delCount = delCount + 1
                end
            end
        end
    end

end

function func:ResetScript()
    pathIndex, lastPathIndex, beforeLastPathIndex = nil, nil, nil
    nbBoucle = 0
    checkCraft = false
    goCraft = false
    assignPathToGather = false
    filterPathByTags = false
    setPathToFarm = false
    MULTIPLE_MAP:Reset()
end

-- Global func

function bouclePlus() -- Incremente une boucle
    nbBoucle = nbBoucle + 1
    MULTIPLE_MAP:Reset()
end

function finDeBoucle() -- Reset de variables et teleporte au havre pour une nouvelle boucle
    return func:FinDeBoucle()
end

function Print(msg, header, msgType)
    local job = currentJob
    local prefabStr = ""

    if job == nil then
        job = "currentJobNIL"
    end

    if header ~= nil then
        prefabStr = "["..string.upper(header).."]["..string.upper(job).."] "..msg
    else
        prefabStr = "["..string.upper(job).."] "..msg
    end

    if msgType == nil then
        global:printSuccess(prefabStr)
    elseif string.lower(msgType) == "normal" then
        global:printMessage(prefabStr)
    elseif string.lower(msgType) == "error" then
        global:printError("[ERROR]["..string.upper(job).."]["..header.."] "..msg)
    end
end

function havreSac()
    func:CheckMapBeforeHavreSac()
    
    if map:currentMap() ~= "0,0" then
        map:changeMap('havenbag')
    end
end

function useZaap(idDest)
    local dest = "zaap("..idDest..")"
    return {{ map = map:currentMapId(), path = dest }}
end

function useBank()
    npc:npcBank(-1)
    exchange:putAllItems()
    return func:InBank()
end

function setTP()
    teleported = true
end

function setTpBank()
    tpBank = true
end

function math.sign(v) -- Dependance de math.round
    return (v >= 0 and 1) or -1
end

function math.round(v, bracket) -- Sert a arrondir un nombre
    bracket = bracket or 1
    return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end

-- Snow main func

function move()
    return func:Move()
end

function bank()
    return func:Bank()
end

function phenix()

end