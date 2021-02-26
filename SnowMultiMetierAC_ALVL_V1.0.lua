-- Trajet réaliser par yaya#6140 

-- Option User

local GATHER_ALL_RESOURCES_OF_JOB, tmpGatherAll = true, nil
local ADD_ALL_PATH_OF_JOB = false
local DEPOT_MAISON = false
local AUTO_CRAFT, tmpAutoCraft = true, nil
local AUTO_SELL = true
local MAX_PODS = 100
local timeZoneMode = false

local minMountEnergy = 2000 -- Energy minimum de la monture avant de la nourir
local maxMountEnergy = 6400 -- Energy max de la monture

local PANDALA = true
local SAHARACH = true
local FRIGOST1 = false
local FRIGOST2 = false
local FRIGOST3 = false

local bMin, bMax = 2, 4
local tMin, tMax = 8, 17
local mMin, mMax = 60, 90 -- Temp d'arret du trajet si un modo et present sur le serveur (en minute)
local pMin, pMax = 84, 95

local WORKTIME = {
	{
		job = "chasse au tresor",
		debut = "00:00",
		fin = "02:22"
	},
	{
		job = "mineur",
		debut = "02:22",
		fin = "04:12",
	},
	{
		job = "chasse au tresor",
		debut = "04:12",
		fin = "08:56"
	},
	{
		job = "mineur",
		debut = "08:56",
		fin = "11:42"
	},
	{
		job = "chasse au tresor",
		debut = "11:42",
		fin = "14:25",
	},
	{
		job = "chasse au tresor",
		debut = "14:25",
		fin = "17:26"
	},
	{
		job = "chasse au tresor",
		debut = "17:26",
		fin = "21:24"
	},
	{
		job = "mineur",
		debut = "21:24",
		fin = "22:12",
	},
	{
		job = "chasse au tresor",
		debut = "22:12",
		fin = "00:00"
	},
}

-- Script var

local PATH_JOB, PATH_REPLACE, PATH_FIGHT, PATH_CRAFT, CRAFT, ITEM, RETOUR_BANK = dofile("F:\\DofusBotting\\LuaScript\\SnowScript + IA\\MultiMetier\\PATH_JOB.lua")

local MULTIPLE_MAP = {}
MULTIPLE_MAP.CurrentSteps = {}

local shortDelay, baseDelay, longDelay = 250, 1000, 5000

local name, level, lifePoints, maxLifePoints, experience, energyPoints, kamas, breed, isFreeMode

-- Craft

local checkCraft, goCraft, goCheckStock, goDrop = false, false, false, false, false

local toolCraft, quantityToCraft

-- Temps et gestion zones

local setPathToFarm, filterPathByTags = false, false

local scriptInit, initStartedTime, teleported = false, false, false

local heure, minute, lastMinute
local diffTime, startedTime, lastGoodTime

local pathIndex, tbLimit, jobTime, nbBoucle

local currentJob, currentIdJob, currentMapId, currentMode, lastCurrentMode
local lastNameZone, beforeLastNameZone

-- Chasse au tresor

local readyToHunt, roadLoaded, teleported, waitQuitHunt = false, false, false, false

local nextFlagMapId, treasureStartMapId, treasureFailTimeMinute

-- Monture

local mountNeedFeed = false

local itemFeed =  {
    name = inventory:itemNameId(1782),
    idItem = 1782,
    minStock = 1000,
    maxPrice = 10000,
    weight = 2,
    lot = 3
}


-- Module

local ITEM_TO_BUY = {}
local SELL, ITEM_TO_SELL, POSSIBLE_ITEM_TO_SELL
local goSell, goBuy = false, false

-- Snow var

GATHER = {}
OPEN_BAGS = true

local RETOUR_MAISON = {
    ["TP"] = function()
        if map:currentMapId() ~= 162791424 then
            havreSac()

        elseif map:currentMapId() == 162791424 then
            print("[INFO] Go bank !")
            teleported = true
            global:clickPosition(185,290) -- Debug zaap
            global:delay(baseDelay)
            map:changeMap("zaap(110,190,xxxxxxxxxx)") -- Zaap de destination
        end
    end,
    ["PATH"] = function()
        idZaapi = "maison"
        return {
        { map = "xxxxxx", custom = zaapiToPath }, -- Début du retour maison
        { map = "xxxxxx", changeMap = "bottom" },
        { map = "xxxxxx", changeMap = "right" },
        { map = "xxxxxx", custom = maison }, -- A lancer devant la maison
        { map = "xxxxxx", custom = maison}, -- A lancer dedans la maison
        { map = "xxxxxx", custom = maison }, -- A lancer devant la maison
        { map = "xxxxxx", custom = maison}, -- A lancer dedans la maison
    }
    end
}

local MAPS_BEFORE_HAVENBAG = {

    { map = 165153537, path = "left" },

    --Mine Ebbernard

    { map = 29622275, path = "450" },
    { map = 29622272, path = "450" },
    { map = 29622531, path = "450" },
    { map = 29622534, path = "424" },

    -- Mine manganese ile dragoeuf

    { map = 86246410, path = "431" },

    -- Mine Bwork
 
    { map = 104860165, path = "444" },
    { map = 104859139, path = "444" },
    { map = 104860169, path = "263" },
    { map = 104861193, path = "254" },
    { map = 104859145, path = "457" },
    { map = 104858121, path = "507" },
    { map = 104861189, path = "451" },
    { map = 104862213, path = "376" },
    { map = 104858119, path = "207" },
   
    -- Mine Maksage
   
    { map = 57017861, path = "270" },
    { map = 56886787, path = "396" },
    { map = 56885763, path = "436" },
    { map = 57016837, path = "401" },
    { map = 57016835, path = "409" },
    { map = 57017859, path = "395" },
   
    -- Malle au tresor

    { map = 128452097, path = "504" },
    { map = 128451073, door = "549" },

    -- Zone astrub

    { map = 188745734, path = "bottom" },

    -- Territoire des porco
   
    { map = 72619524, path = "left" },

}

local TO_FARM, ING_TO_CRAFT, PATH_FILTERED, tblIndexAddedPath = {}, {}, {}, {}

-- Main

function initialization()
    if AUTO_SELL then
        SELL, ITEM_TO_SELL = dofile("F:\\DofusBotting\\LuaScript\\SnowScript + IA\\MultiMetier\\SELL_ITEM.lua")
    end
    tmpGatherAll = GATHER_ALL_RESOURCES_OF_JOB
    tmpAutoCraft = AUTO_CRAFT
    name = character:name()
    level = character:level()
    lifePoints = character:lifePoints()
    maxLifePoints = character:maxLifePoints()
    experience = character:experience()
    energyPoints = character:energyPoints()
    kamas = character:kamas()
    breed = character:breed()
    isFreeMode = character:freeMode()
    assignWork()
    print("[START] Hello "..name.." tu est lvl "..level.." tu as "..kamas.."K sur toi, metier selectionner "..currentJob.." bon bottage ! ^-^", 2)
    sortCraft()
    --developer:registerMessage("MapComplementaryInformationsDataMessage", cbMapComplementaryInfo)
    --developer:registerMessage("GameMapMovementMessage", cbGameMapMoveMessage)
    --developer:registerMessage("GameMapMovementConfirmMessage", cbGameMapMoveConfirmMessage)
    --developer:registerMessage("StatedElementUpdateedMessage", cbStatedElemUpdtMsg)
end

function move()
    --global:delay(getRandomNumber(267, 972))

    HARVESTABLE_ELEMENTS = {}

    if global:isModeratorPresent(5) and not moderator then
        goSell = true
        teleported = false
        moderator = true
    end

	local mapId = map:currentMapId()

	heure, minute = Time()

    if not scriptInit then
        initialization()
        scriptInit = true
    end

    -- Gestion metier

    if lastMinute ~= minute and not goCraft then
        lastMinute = minute
        sortCraft()
        if not treasure:isHunting() then
            assignWork()
        end
    end

    -- Bank

    if inventory:podsP() > MAX_PODS then
        return bank()
    end

    gestionMonture()

    -- Gestion craft

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

    -- Gestion commerce

    if goSell then
        if not teleported then
            return SELL.PATH.BONTA.TP()
        end
        if not inHDV then
            return SELL.PATH.BONTA.GO_HDV('ressource')     
        end
        SELL.PATH.BONTA.HDV("sell")
    end

    if goBuy then
        if not teleported then
            return SELL.PATH.BONTA.TP()
        end
        if not inHDV then
            return SELL.PATH.BONTA.GO_HDV('ressource')     
        end
        SELL.PATH.BONTA.HDV("buy")
    end

    if waitQuitHunt then
        local tryTimeToWait = treasure:quitTry()
        print("[INFO]["..string.upper(currentJob).."] Abandon de la chasse dans "..tryTimeToWait.." minutes", 3)
        while tryTimeToWait > 0 do
            global:delay(tryTimeToWait * 60000)
            tryTimeToWait = treasure:quitTry()
        end
        waitQuitHunt = false
    end

    -- Gestion mode

    if currentJob == "leveling" or currentJob == "combat" then
        return fightMode()
    elseif currentJob == "chasse au tresor" then
        return TreasureHunt()
    else
        return GatherMode()
    end

    return lost()
end

function lost()
    print('[LOST] Bot perdu sur la map ( mapId = '..map:currentMapId()..", Pos = "..map:currentMap().." ) metier = "..currentJob.." path = "..PATH_FILTERED[pathIndex].name, 3)
    return {{ map = map:currentMapId(), custom = finDeBoucle }}
end

function bank()
	if not tpBank then
		return RETOUR_BANK.TP()
	else
		return RETOUR_BANK.PATH()
	end
end

function phenix()
end

-- Gather

function GatherMode()

    --if goDrop then
        --fightMode()
    --end

    if not Started then
        pathIndex =  nil
        lastNameZone = nil
        beforeLastNameZone = nil
        Started = true
    end

    if goCheckStock then
        CheckStock()
    end

    if not filterPathByTags then
        FilterPath()
    end

    if not setPathToFarm then
        SetPath(PATH_FILTERED)
    end

    if timeZoneMode then
        timeZone()
        jobTime = diffTime
    else
        jobTime = nbBoucle
    end

    if jobTime >= tbLimit then
        print("[INFO]["..string.upper(currentJob).."] Changement de zone !")
        finDeBoucle()
    end
    
    if not teleported then
        return PATH_FILTERED[pathIndex].TP()
    end
    developer:suspendScriptUntil("MapComplementaryInformationsDataMessage", 1, false)
    --checkMapComplementaryInfo()
    return MULTIPLE_MAP:Run(PATH_FILTERED[pathIndex].PATH())
end

function CheckStockBis(vItem)
    local levelJob = job:level(currentIdJob)

    local tmpN = ""

    if vItem.current < vItem.minStock and levelJob >= vItem.lvlToFarm then
        print("[INFO]["..string.upper(currentJob).."] Stock de " ..vItem.name.. " incomplet ! minStock = " ..vItem.minStock.. ", Ajout des path contenant " ..vItem.name)
        tmpN = vItem.name
        table.insert(GATHER, vItem.gatherId)
        table.insert(TO_FARM, vItem.name)
        return true
    end

    return false
end

function CheckStock()
    local levelJob = job:level(currentIdJob)

    killDoubleValue(TO_FARM)

    for kTable, vTable in pairs(ITEM) do

        if kTable == currentJob then

            for _, vItem in pairs(vTable) do

                if not CheckStockBis(vItem) then
                    if GATHER_ALL_RESOURCES_OF_JOB then
                        table.insert(GATHER, vItem.gatherId)
                    end

                    if ADD_ALL_PATH_OF_JOB then
                        table.insert(TO_FARM, vItem.name)
                    end
                end
            end          
        end
    end

    SetETG()
    UnsetETG()
    killDoubleValue(GATHER)
    PathReplace()
    goCheckStock = false
end

function FilterPath()
    print("[INFO]["..string.upper(currentJob).. "] Filtrage des PATH a farm")
    killDoubleValue(TO_FARM)
    --printSimpleTable(TO_FARM)
    PATH_FILTERED = {}
    tblIndexAddedPath = {}
    while true do
        if #TO_FARM > 0 then
            for kJob, vTable in pairs(PATH_JOB) do
                local goBreak = false
                if kJob == currentJob then
                    for iTag, vTag in pairs(TO_FARM) do
                        for iPath, vPath in pairs(vTable) do
                            if not AlreadyAdded(iPath) then
                                --global:printMessage("Looking for add "..vPath.name)
                                goBreak = false
                                for _, vTagPath in pairs(vPath.tags) do
                                    if goBreak then
                                        break
                                    end
                                    if vTag == vTagPath then
                                        table.insert(tblIndexAddedPath, iPath)
                                        table.insert(PATH_FILTERED, vPath)
                                        --global:printMessage(vPath.name.." added vTag : "..vTag.." vTagPath : "..vTagPath)
                                        goBreak = true
                                        break                                                               
                                    end
                                end
                            end
                        end
                    end
                end
                if goBreak then
                    break
                end
            end
        end
        if #PATH_FILTERED == 0 then
            for k, vTbl in pairs(ITEM) do
                if currentJob == k then
                    for _, v in pairs(vTbl) do
                        if v.lvlToFarm <= job:level(currentIdJob) then
                            table.insert(TO_FARM, v.name)
                        end
                    end
                end
            end
        else
            break
        end
    end
    --print('end filter', 2)
    filterPathByTags = true
end

function SetPath(tbl)

    local max = #tbl
    local rand 
    local lastPathIndex
    if pathIndex ~= nil then
        beforeLastNameZone = lastNameZone
        lastNameZone = tbl[pathIndex].name
        lastPathIndex = pathIndex
    end

    if #tbl > 3 and lastNameZone ~= nil and beforeLastNameZone ~= nil and pathIndex ~= nil and pathIndex ~= lastPathIndex then
        while lastNameZone == tbl[pathIndex].name and beforeLastNameZone == tbl[pathIndex].name do
            pathIndex = getRandomNumber(1, max)
        end
    elseif #tbl > 2 and lastNameZone ~= nil and pathIndex ~= nil and pathIndex ~= lastPathIndex then
        while lastNameZone == tbl[pathIndex].name do
            pathIndex = getRandomNumber(1, max)
        end
    else
        pathIndex = getRandomNumber(1, max)
    end


    local boucleMax = getRandomNumber(bMin, bMax)
    local timeMaxZone = getRandomNumber(tMin, tMax)
    print("[INFO]["..string.upper(currentJob).."] Go " ..tbl[pathIndex].name, 2)
    if timeZoneMode or currentMode == "fight" then
        tbLimit = timeMaxZone
        if currentMode == "fight" then
            ZoneToFarm = tbl[pathIndex].subArea
            --print(ZoneToFarm)
        end
        print("[INFO]["..string.upper(currentJob).."] Vous allez passez " ..timeMaxZone.. " minutes dans la zone !", 2)
    else
        tbLimit = boucleMax
        print("[INFO]["..string.upper(currentJob).."] Vous allez faire " ..boucleMax.. " boucle dans la zone !", 2)
    end
    setPathToFarm = true
end

function SetETG() -- Assigne les ressources a recolter dans GATHER
    for kTable, vTable in pairs(ITEM) do
        if kTable == currentJob then
            if #TO_FARM > 0 then
                for _, vTag in pairs(TO_FARM) do
                    --global:printMessage('Looking for '..vTag)
                    for _, vItem in pairs(vTable) do
                        --global:printMessage('vTag : '..vTag..' vItem : '..vItem.name)
                        if vItem.name == vTag then
                            if not AlreadyAddedGatherId(vItem.gatherId) then
                                print(vItem.name..' added SetETG : '..vItem.gatherId, 2)
                                table.insert(GATHER, vItem.gatherId)
                            else
                                print("Gather ID AlreadyAdded")
                            end
                            break
                        end
                    end 
                end
            end
        end
    end
end

function AlreadyAddedGatherId(gatherIdToCheck)
    for _, v in pairs(GATHER) do
        if v == gatherIdToCheck then
            return true
        end
    end

    return false
end

function UnsetETG() -- Desactive la recolte d'une ressource si maxStock atteint
    for keyTable, vTable in pairs(ITEM) do
        if keyTable == currentJob then
            for kItem, vItem in pairs(vTable) do
                if vItem.gatherId ~= nil and vItem.maxStock ~= nil and (vItem.maxStock <= vItem.current) then
                    print("[INFO]["..string.upper(currentJob).."] Desactivation de la recolte de " ..vItem.name.. " maxStock atteint !", 2)
                    vItem.forceFarm = false
                    for i, v in pairs(TO_FARM) do
                        if v == vItem.name then
                            table.remove(TO_FARM, i)
                            print("TO_FARM removed", 2)
                        end
                    end
                    for iGather, vGather in pairs(GATHER) do
                        if vGather == vItem.gatherId then
                            table.remove(GATHER, iGather)
                            print("GATHER removed", 2)
                            break
                        end
                    end
                end
            end
        end
    end
end

function AlreadyAdded(index)
    if #tblIndexAddedPath > 0 then
        for _, v in pairs(tblIndexAddedPath) do
            if v == index then
                return true
            end
        end
    end
    return false
end

function PathReplace()
    local levelJob = job:level(currentIdJob)

    if currentJob == "mineur" then
        if levelJob >= 20 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[2])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[1])
        end
        if levelJob >= 40 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[3])
            table.remove(PATH_JOB.mineur, 6)
            table.insert(PATH_JOB.mineur, 6, PATH_REPLACE.mineur[4])
        end
        if levelJob >= 60 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[5])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[6])
            table.remove(PATH_JOB.mineur, 8)
            table.insert(PATH_JOB.mineur, 8, PATH_REPLACE.mineur[20])
            table.remove(PATH_JOB.mineur, 13)
            table.insert(PATH_JOB.mineur, 13, PATH_REPLACE.mineur[7])
        end
        if levelJob >= 80 then
            table.remove(PATH_JOB.mineur, 3)
            table.insert(PATH_JOB.mineur, 3, PATH_REPLACE.mineur[8])
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[9])
            table.remove(PATH_JOB.mineur, 2)
            table.insert(PATH_JOB.mineur, 2, PATH_REPLACE.mineur[10])
        end
        if levelJob >= 120 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[11])
        end
        if levelJob >= 140 then
            table.remove(PATH_JOB.mineur, 4)
            table.insert(PATH_JOB.mineur, 4, PATH_REPLACE.mineur[11])
        end
        if levelJob >= 160 then
            table.remove(PATH_JOB.mineur, 19)
            table.insert(PATH_JOB.mineur, 19, PATH_REPLACE.mineur[19])
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

-- Chasse au tresor

function TreasureHunt()
    openChest()
    gestionMonture()
    if not treasure:isHunting() then
        return getHunt()
    elseif not readyToHunt then
        return goHunt()
    elseif readyToHunt then
        return hunting()
    end
end

function getHunt()
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            havreSac()
        else
            teleported = true
            print("[INFO]["..string.upper(currentJob).."] Go récupérer une chasse")
            return useZaap(142087694)
        end
    end

    if map:currentMapId() == 128452097 and not treasure:isHunting() then -- Map Malle au tresor
        global:delay(getRandomNumber(1526, 2438))
        map:useById(484993,-1)
        global:delay(getRandomNumber(1526, 2438))
        readyToHunt, roadLoaded, teleported = false, false, false
        print("[INFO]["..string.upper(currentJob).."] La chasse a était récupérer")
        return TreasureHunt()
    end

    if not treasure:isHunting() then
        return {
            { map = "142087694", path = "right" },
            { map = "142088206", path = "right" },
            { map = "142088718", door = "343" },
            { map = "128451073", path = "292" }
        }
    else
        return TreasureHunt()
    end
end

function goHunt()
    
    if not teleported then
        if map:currentMapId() ~= 162791424 then
            havreSac()
        else
            teleported = true
            treasureStartMapId = treasure:getStartMapId()
            print("[INFO]["..string.upper(currentJob).."] Go map départ de la chasse")
            return useZaap(treasureStartMapId)
        end
    end

    if not map:onMap(treasureStartMapId) then
        if not roadLoaded then
            if map:loadRoadToMapId(treasureStartMapId, false) then
                roadLoaded = true
            else
                print("[ERROR]["..string.upper(currentJob).."] Impossible de charger le chemin vers le début de la chasse", 3)
            end
        end
        while not map:onMap(treasureStartMapId) do
            map:moveRoadNext()
            teleported, roadLoaded = false, false
            return TreasureHunt()      
        end
    else
        print("[INFO]["..string.upper(currentJob).."] Arrivée sur la map de départ de la chasse")
        readyToHunt = true
        roadLoaded = false
        return hunting()         
    end

    return move()
end

function hunting()

    if not roadLoaded then
        nextFlagMapId = treasure:getNextFlagMapId(false)
        if nextFlagMapId ~= -1 and nextFlagMapId ~= 0 then
            if map:loadRoadToMapId(nextFlagMapId, false) then
                roadLoaded = true
            else
                print("[ERROR]["..string.upper(currentJob).."] Impossible de charger le chemin vers le prochain indice", 3)
            end
        end
    end

    if treasure:isReadyToDig() then
        print("[INFO]["..string.upper(currentJob).."] Lancement du combat avec le coffre !")        
        readyToHunt, teleported, roadLoaded = false, false, false
        treasure:huntDig()
        return move()
    end

    if nextFlagMapId == 0 then
        print("[INFO]["..string.upper(currentJob).."] Impossible d'obtenir la mapID du prochain indice", 3)
        waitQuitHunt = true
        treasureFailTimeMinute = Time("m")
        readyToHunt, teleported, roadLoaded, checkCraft = false, false, false, false
        return finDeBoucle()
    elseif nextFlagMapId == -1 then
        return inFlagMap()
    end

    local iter = 0

    while true do
        local dir = treasure:getNextFlagDirection()
        if treasure:isInFlagMap() then
            return inFlagMap()
        elseif nextFlagMapId == map:currentMapId() then
            roadLoaded = false
            return hunting()
        end  
        map:moveRoadNext()
        print("Apres moveRoadNext", 3)       
        map:changeMap(dir)
    end
end

function inFlagMap()
    treasure:huntFlag()
    roadLoaded = false
    print("[INFO]["..string.upper(currentJob).."] Jalon posée sur la carte "..map:currentMap())

    if treasure:isReadyToDig() then
        print("[INFO]["..string.upper(currentJob).."] Tout les indices sont sélectionnés, confirmation de la sélection")
        treasure:huntDig()
    end
    return hunting()
end

function openChest()
    useAllItems(15260) -- Coffre rouillé
    useAllItems(15248) -- Coffre insignifiant 
    useAllItems(15261) -- Coffre intrigant
    useAllItems(15262) -- Coffre surprenant
    useAllItems(15264) -- Coffre solide
    useAllItems(15265) -- Coffre lourd
    useAllItems(15266) -- Coffre étincelant
    useAllItems(15267) -- Coffre imposant
    useAllItems(15268) -- Coffre impressionnant
    useAllItems(15269) -- Coffre magistral
    useAllItems(15270) -- Coffre de lotterie
end

function useAllItems(iditem)
    while inventory:itemCount(iditem) > 0 do
        inventory:useItem(iditem)
    end
end

-- Auto craft

function inCoffre()
    local levelJob
    local reCheck = false

    if currentMode ~= 'fight' and currentJob ~= "chasse au tresor" then
         levelJob = job:level(currentIdJob)
    end
    -- Remise a zero des var et update ITEM
        TO_FARM = {}
        GATHER = {}
        ING_TO_CRAFT = {}
        ITEM_TO_BUY = {}
        POSSIBLE_ITEM_TO_SELL = {}
        setItem()

        if mountNeedFeed then 
            local storageQuantity = exchange:storageItemQuantity(itemFeed.idItem)

            if storageQuantity < itemFeed.minStock then
                local quantityToBuy = math.ceil((itemFeed.minStock - storageQuantity) / 100)

                for i = 0, quantityToBuy do
                    if podsRestant() < (itemFeed.weight * (quantityToBuy * 100)) then
                        quantityToBuy = quantityToBuy - 1
                    else
                        break
                    end
                end

                if quantityToBuy == 0 then
                    quantityToBuy = 1
                end
                
                local item = itemFeed
                item.quantity = quantityToBuy

                goBuy = true
                table.insert(ITEM_TO_BUY, item)
            end

            if not goBuy then
                local totalNeedItem = math.floor((maxMountEnergy - mount:getEnergy()) / 20)
                exchange:getItem(itemFeed.idItem, totalNeedItem)
            end

        else --Vérif si craft disponible et assignation des path si aucun craft disponible

            if AUTO_CRAFT and currentMode ~= 'fight' and currentJob ~= "chasse au tresor" then
                
                checkPossibleCraft()

                local iter = 0

                while not goCraft and #TO_FARM == 0 and iter < 2 do
                    iter = iter + 1
                    if iter == 2 then
                        print("[INFO]["..string.upper(currentJob).."] Aucun craft disponible desactivation temporaire de l'autoCraft !", 2)
                        AUTO_CRAFT = false
                        GATHER_ALL_RESOURCES_OF_JOB = true
                    else
                        tailEndCraft()
                        checkPossibleCraft()
                    end
                end

            elseif currentMode == 'gather' then
                for kTable, vTable in pairs(ITEM) do
                    if kTable == currentJob then
                        for _, vItem in pairs(vTable) do
                            if vItem.name == tag then
                                table.insert(TO_FARM, vItem.gatherId)
                            end
                        end
                    end
                end
            end

            -- Check vente

            if AUTO_SELL and not goCraft and not goBuy then
                checkPossibleSell()
            end
        end

    -- Fin fonction

        global:leaveDialog()

        teleported = false
        tpBank = false
        messageBank = false
        filterPathByTags = false

        goCheckStock = true

        if not goBuy then
            goSell = true
        end

        if reCheck then
            checkCraft = false
        else
            checkCraft = true
        end
        if goCraft then
            MAX_PODS = 101
            if currentJob == "alchimiste" or currentJob == "paysan" and not DEPOT_MAISON then
                teleported = true
                map:door("424")
                global:delay(baseDelay)
            else
                map:changeMap('havenbag')
            end
        else
            MAX_PODS = getRandomNumber(pMin, pMax)
            finDeBoucle()
        end
end

function checkPossibleCraft()
    for kJob, vTable in pairs(CRAFT) do
        if kJob == currentJob then

            for iCraft, vCraft in pairs(vTable) do
                local next = false

                if vCraft.next == nil then
                    vCraft.next = false
                end

                if goCraft then
                    break
                end

                if currentJob == "bucheron" then
                    if exchange:storageItemQuantity(vCraft.idItem) >= vCraft.nbItemsBeforeNextCraft then
                        if vCraft.name == "Substrat de buisson" then
                            CRAFT.bucheron[2].next = true
                        elseif vCraft.name == "Substrat de bocage" then
                            CRAFT.bucheron[4].next = true
                        elseif vCraft.name == "Substrat de futaie" then
                            CRAFT.bucheron[6].next = true
                        elseif vCraft.name == "Substrat de fascine" then
                            CRAFT.bucheron[8].next = true
                        end
                    end
                end

                if exchange:storageItemQuantity(vCraft.idItem) >= vCraft.nbItemsBeforeNextCraft then
                    vCraft.next = true
                end

                next = vCraft.next

                if vCraft.active and exchange:storageItemQuantity(vCraft.idItem) < vCraft.nbItemsBeforeNextCraft and not next and not vCraft.waitItemOfAnotherJob then
                    local lot, canCraft, tblIngredient = canCraft(vCraft.name, currentJob)
                    print("[INFO]["..string.upper(currentJob).."] Looking for craft " ..vCraft.name, 2)

                    if lot or canCraft then
                        print("[INFO]["..string.upper(currentJob).."] Craft de " ..vCraft.name.. " disponible !", 2)
                        goCraft = true
                    end

                    for iIngredient, vIngredient in ipairs(vCraft.ingredient) do
                        if goCraft then -- PickItem si craft disponible
                            table.insert(ING_TO_CRAFT, { id = vIngredient.idItem, nb = vIngredient.nbIng })
                            --print(tblIngredient[iIngredient])
                            exchange:getItem(vIngredient.idItem, tblIngredient[iIngredient])
                        elseif tblIngredient[iIngredient] == 0 then -- Sinon Ajout a la table de recolte  
                            missingIngredient(vCraft, vIngredient, iIngredient)
                        end
                    end                                        
                end
                --print('remove '..CRAFT_FILTERED[iCraft].name)
                if #TO_FARM > 0 then
                    break
                end
            end
        end
    end
end

function checkPossibleSell()
    POSSIBLE_ITEM_TO_SELL = {}
    for _, v in pairs(ITEM_TO_SELL) do
        local lot
        if v.lot == 3 then
            lot = 100
        elseif v.lot == 2 then
            lot = 10
        else    
            lot = 1
        end

        local nbItemToPick = math.floor(exchange:storageItemQuantity(v.idItem) / lot) * lot

        if exchange:storageItemQuantity(v.idItem) >= lot and (v.weight * nbItemToPick <= podsRestant()) then
            print("[VENTE] L'objet "..v.name.." peux etre mis en vente")
            exchange:getItem(v.idItem, nbItemToPick)
            table.insert(POSSIBLE_ITEM_TO_SELL, v)
        end
    end
    if #POSSIBLE_ITEM_TO_SELL > 0 then
        MAX_PODS = 101
    end
end

function tailEndCraft()
    local levelJob

    if currentMode ~= 'fight' then
         levelJob = job:level(currentIdJob)
    end

    CRAFT.bucheron[2].next = false
    CRAFT.bucheron[4].next = false
    CRAFT.bucheron[6].next = false
    CRAFT.bucheron[8].next = false
    for kTblCraft, vTblCraft in pairs(CRAFT) do
        if currentJob == "bucheron" and levelJob < 10 then
            table.insert(TO_FARM, "Frene")
            break
        end
        if kTblCraft == currentJob then
            for _, vCraft in pairs(vTblCraft) do
                if vCraft.tmpMax == nil then
                    vCraft.tmpMax = vCraft.nbItemsBeforeNextCraft
                end
                vCraft.nbItemsBeforeNextCraft = vCraft.nbItemsBeforeNextCraft + vCraft.tmpMax
                if vCraft.next then
                    vCraft.next = false
                end
            end
        end
    end
end

function sortCraft()
    if tmpAutoCraft and currentIdJob ~= nil then
        local levelJob = job:level(currentIdJob)

        for kJob, vTable in pairs(CRAFT) do
            if kJob == currentJob then
                for _, vCraft in pairs(vTable) do
                    if vCraft.active and ( levelJob >= vCraft.lvlToDesactive ) then -- Desactivation
                        print("[INFO]["..string.upper(currentJob).."] Desactivation du craft " ..vCraft.name.. " lvlToDesactive atteint", 2)
                        vCraft.active = false
                    end
                end
            end
        end
    end
end

function setItem()
    for _, vTable in pairs(ITEM) do
        for _, vItem in pairs(vTable) do
            if exchange:storageItemQuantity(vItem.id) ~= nil then
                vItem.current = exchange:storageItemQuantity(vItem.id)
                --print(vItem.name.. " = " ..vItem.current)
            end
        end
    end
end

function canCraft(itemName, job) -- Verifie si un craft et possible en fonction du nom de l'item passez en parametre et le metier actuelle passez en parametre
    local currentItem, clc = 0, 0
    local cantCraft, lotActive = false, false
    local tblIngredient = {}
    for kJob, vTable in pairs(CRAFT) do -- Cherche le metier actuelle
        if kJob == job then 
            for _, vItem in pairs(vTable) do -- Cherche l'item
                if itemName == vItem.name then

                    if vItem.toolCraft ~= nil then
                        toolCraft = vItem.toolCraft
                    end
                    for _, vIngredient in pairs(vItem.ingredient) do -- Parcours les ingredient
                        for _, itemTable in pairs(ITEM) do -- Calcul currentItem
                            for _, j in pairs(itemTable) do
                                if j.name == vIngredient.name then
                                    if j.minStock ~= nil then
                                        currentItem = j.current - j.minStock
                                    else
                                        currentItem = j.current
                                    end
                                end
                            end
                        end
                        --print(currentItem)
                        if vItem.lot then -- Calcul du nombre d'ingredient a retourner si lot
                            clc = vItem.lot * vIngredient.nbIng
                            lotActive = true
                        else -- Sinon calcul en fonction des pods disponible
                            clc = calculMaxItemInInventory(vItem.weight, vIngredient.nbIng)
                            clc = math.round(clc, 10)
                            --print("[DEV] Clc = " ..clc)
                        end
                        if clc > currentItem then
                            cantCraft = true
                            table.insert(tblIngredient, 0)
                        else
                            quantityToCraft = clc / vIngredient.nbIng
                            table.insert(tblIngredient, clc)
                        end
                    end
                end
            end
        end
    end
    --printSimpleTable(tblIngredient)
    if not cantCraft and lotActive then
        return true, false, tblIngredient
    elseif not cantCraft and not lotActive then
        return false, true, tblIngredient
    else
        return false, false, tblIngredient
    end              
end

function missingIngredient(vCraft, vIngredient, iIngredient)
    local notNull = vCraft.ingredient[iIngredient].job ~= nil 

    if notNull and vCraft.ingredient[iIngredient].job == currentJob then
        print("[INFO]["..string.upper(currentJob).."] Manque de " ..vIngredient.name.. " pour craft " ..vCraft.name, 2)
        table.insert(TO_FARM, vIngredient.name)
    elseif notNull and vCraft.ingredient[iIngredient].job == 'divers' then
        print("[INFO]["..string.upper(currentJob).."] Manque d'une ressource non recoltable ou craftable, ressource = " ..vIngredient.name.. " desactivation du craft " ..vCraft.name, 2)
        vCraft.active = false
    elseif notNull and vCraft.ingredient[iIngredient].job == 'drop' then
        print("[INFO]["..string.upper(currentJob).."] Manque de " ..vIngredient.name.. " activation du mode combat", 2)
        table.insert(TO_FARM, vIngredient.name)
        goDrop = true
    else
        if notNull and vCraft.ingredient[iIngredient].job == 'substrat' then
            print("[INFO]["..string.upper(currentJob).."] Manque de " ..vIngredient.name.. " pour craft " ..vCraft.name, 2)
            vCraft.next = true
        else
            print("[INFO]["..string.upper(currentJob).."] Manque d'une ressource d'un autre metier, ressource = " ..vIngredient.name.. " desactivation temporaire du craft " ..vCraft.name, 2)
            vCraft.waitItemOfAnotherJob = true
        end
    end
end

function useWorkshop() -- clickPosition dans les atelier
    if currentJob == "paysan" then
        map:useById(514876, -1)
        global:delay(baseDelay)
    elseif currentJob == "alchimiste" then
        map:useById(515515, -1)
        global:delay(baseDelay)
    elseif currentJob == "mineur" then
        map:useById(455855, -1)
        global:delay(baseDelay)
    elseif currentJob == "bucheron" then
        map:useById(515879, -1)
        global:delay(baseDelay)
    end

    crafting()
    global:delay(baseDelay)
    global:leaveDialog()
    global:delay(baseDelay)
    goCraft = false
    checkCraft = false
    teleported = false
    havreSac()
end

function crafting()
    for _, v in pairs(ING_TO_CRAFT) do
        --print(v.id..' '..v.nb..' '..quantityToCraft)
        craft:putItem(tonumber(v.id), tonumber(v.nb))
        global:delay(baseDelay)
    end
    craft:changeQuantityToCraft(quantityToCraft)
    global:delay(baseDelay)
    craft:ready()
end

function podsRestant() -- Calcul les pods et les arrondi 
    return  math.round((inventory:podsMax() - inventory:pods()), 100) - 100
end

function calculMaxItemInInventory(poidTotalDesRessource, nbRessource) -- Calcul le nombre de ressource que peut porter le bot
    return ((podsRestant() - 200) / poidTotalDesRessource) * nbRessource
end

function useBank()
    npc:npcBank(-1)
    exchange:putAllItems()
    inCoffre()
end

-- Auto vente

function getLot(nb)
    if nb == 3 then
        return 100
    elseif nb == 2 then
        return 10
    elseif nb == 1 then
        return 1
    else
        return nb
    end
end

function sellItem()
    -- Update des prix

    if SELL.itemsOnSale() > 0 then
        for i = 1, SELL.itemsOnSale() do -- Parcours les objet en ventes
            for _, v in pairs(ITEM_TO_SELL) do -- Parcours les objet a mettre en ventes
                if v.idItem == SELL.getItemGID(i) then
                    local lot = getLot(v.lot)
                    if SELL.getPriceItem(v.idItem, lot) < SELL.getItemPrice(i) then -- Prix a mettre a jour
                        if SELL.getPriceItem(v.idItem, lot) > v.minPrice then
                            SELL.editPrice(SELL.getItemGUID(i), SELL.getPriceItem(v.idItem, lot), lot)
                            print("[VENTE] Le prix de l'item "..v.name.." a etait modifier, prix = "..SELL.getPriceItem(v.idItem, lot))
                        else
                            print("[VENTE] Impossible de modifier le prix de l'item "..v.name.." le prix et en dessous de minPrice", 3)
                        end
                    end
                end
            end         
        end
    end

    -- Mise en vente

    for _, vItemToSell in pairs(POSSIBLE_ITEM_TO_SELL) do
        local nbLotToSell = inventory:itemCount(vItemToSell.idItem) / getLot(vItemToSell.lot)
        print('nbLotToSell = '..nbLotToSell)

        if nbLotToSell > SELL.availableSpace() then
            nbLotToSell = SELL.availableSpace()
        end
        
        if SELL.availableSpace() == 0 then
            print("[VENTE] Plus de place disponible dans l'hotel de vente", 3)
            break
        end

        if nbLotToSell == 1 then
            SELL.sellItem(vItemToSell.idItem, getLot(vItemToSell.lot), SELL.getPriceItem(vItemToSell.idItem, getLot(vItemToSell.lot)))
        else
            for i = 1, nbLotToSell do
                SELL.sellItem(vItemToSell.idItem, getLot(vItemToSell.lot), SELL.getPriceItem(vItemToSell.idItem, getLot(vItemToSell.lot)))
            end
        end

        print("[VENTE] L'objet "..vItemToSell.name.." a etait mis en vente x"..nbLotToSell.." pour le prix de "..SELL.getPriceItem(vItemToSell.idItem, getLot(vItemToSell.lot)))
    end

    global:leaveDialog()

    inHDV = false
    goSell = false
    teleported = false
    MAX_PODS = getRandomNumber(pMin, pMax)
    if global:isModeratorPresent(5) then
        local timeDeco = getRandomNumber(mMin, mMax)
        print('[ALERT] Un moderateur et present sur le serveur deconnexion pendant '..timeDeco.." minutes !")
        moderator = false
        global:reconnectBis(timeDeco)
    end
    finDeBoucle()
end

function buyItem()
    for _, v in pairs(ITEM_TO_BUY) do
        for i = 1, v.quantity do
            sale:buyItem(v.idItem, getLot(v.lot), v.maxPrice)
        end
    end

    global:leaveDialog()

    inHDV = false
    goBuy = false
    checkCraft = false
    teleported = false
    MAX_PODS = getRandomNumber(pMin, pMax)
    if global:isModeratorPresent(5) then
        local timeDeco = getRandomNumber(mMin, mMax)
        print('[ALERT] Un moderateur et present sur le serveur deconnexion pendant '..timeDeco.." minutes !")
        moderator = false
        global:reconnectBis(timeDeco)
    end
    return finDeBoucle()
end

-- Gestion monture

function gestionMonture()
    if mount:hasMount() then
        local itemCount = inventory:itemCount(itemFeed.idItem)
       
        if itemCount > 0 then
            mount:feedMount(itemFeed.idItem, itemCount)
            mountNeedFeed = false
        end    

        local mountEnergy = mount:getEnergy()

        -- Chevauche la monture
        if not mount:isRiding() and mountEnergy > 0 then
            mount:toggleRiding()
        end
        
        if mountEnergy < minMountEnergy and not mountNeedFeed and not treasure:isHunting() then
            print("[MONTURE] La monture a besoin d'énergie")
            mountNeedFeed = true
            return finDeBoucle()
        end
    end
end

-- TP et Reset var

function useZaap(idDest)
    local dest = "zaap("..tostring(idDest)..")"
    return {{ map = map:currentMapId(), path = dest }}
end

function havreSac()
    checkMapBeforeHavreSac()
    
    if map:currentMap() ~= "0,0" then
        map:changeMap('havenbag')
    end
end

function checkMapBeforeHavreSac()
    local currentMapId = map:currentMapId()

    for _, v in pairs(MAPS_BEFORE_HAVENBAG) do
        if currentMapId == v.map then
            if v.path ~= nil then
                map:changeMap(v.path)
                break
            elseif v.door ~= nil then
                map:door(tonumber(v.door))
                break
            else
                print("[ERROR] func checkMapBeforeHavreSac(), impossible de trouvé le changeMap pour la map '"..v.map.."'", 3)
                break
            end
        end
    end
    global:delay(5000)
end

function setTP()
    teleported = true
end

function setTpBank()
    tpBank = true
end

function finDeBoucle() -- Reset de variables et teleporte au havre pour une nouvelle boucle
    nbBoucle = 0
    MULTIPLE_MAP:Reset()
    setPathToFarm = false
    teleported = false
    resetFuncTimeZone()
    if map:currentMapId() ~= 162791424 then
        havreSac()
        global:delay(mediumDelay)
    else
        return move()
    end
end

function resetFuncTimeZone() -- Reset les variable de la fonction timeZone
    initStartedTime = false
    diffTime = 0
    lastGoodTime = 0
end

function resetWaitItemOfAnotherJobAndNext()
    for kJob, vTable in pairs(CRAFT) do
        if kJob == lastJob then
            for _, vItem in pairs(vTable) do
                vItem.waitItemOfAnotherJob = false
                vItem.next = false
            end
        end
    end
end

-- Gestion temps et metier

function Time(format) -- Renvoie l'heure sous forme de number
    local currentTime = os.date('%H:%M')
    local heure = tonumber(string.match(currentTime, "%d%d"))
    local minutes = tonumber(string.match(currentTime, "%d%d", 2))

    if heure == 0 then
        heure = 24
    end

    if format == "m" then
        return minutes
    elseif format == "h" then
        return heure
    else
        return heure, minutes
    end
end

function timeZone() -- Verifie le temps passez dans une zone
    if not initStartedTime then
        startedTime = minute
        initStartedTime = true
    end

    diffTime = minute - startedTime

    if diffTime < 0 then
        startedTime = minute
        diffTime = lastGoodTime + 2
    end

    lastGoodTime = diffTime
end

function assignWork() -- Assigne le metier en fonction de l'heure actuelle

    --print("ici")

    local lastJob = nil

    if currentJob ~= nil then
        lastJob = currentJob
    end

    for _, v in ipairs(WORKTIME) do

        if #WORKTIME == 1 then
            currentJob = v.job
            break
        else
            local heureDebut, minuteDebut = tonumber(string.match(v.debut, "%d%d")), tonumber(string.match(v.debut, "%d%d", 2))
            local heureFin, minuteFin = tonumber(string.match(v.fin, "%d%d")), tonumber(string.match(v.fin, "%d%d", 2))
            if heureFin == 0 then
                heureFin = 24
            end
            if heureDebut == 0 then
                heureDebut = 24
            end

            if ((heure >= heureDebut and minute >= minuteDebut) or heure > heureDebut) and (( heure == heureFin and minute < minuteFin) or heure < heureFin) then
                currentJob = v.job
                if v.forceGatherAllRessourcesOfJob ~= nil and v.forceGatherAllRessourcesOfJob then
                    GATHER_ALL_RESOURCES_OF_JOB = v.forceGatherAllRessourcesOfJob
                else
                    GATHER_ALL_RESOURCES_OF_JOB = tmpGatherAll
                end
                break
            elseif heureDebut > heureFin and ((heure == heureDebut and minute >= minuteDebut) or (heure > heureDebut or heure < heureFin)) and ((heure == heureFin and minute < minuteFin) or (heure >= heureDebut or heure < heureFin)) then
                currentJob = v.job
                if v.forceGatherAllRessourcesOfJob ~= nil and v.forceGatherAllRessourcesOfJob then
                    GATHER_ALL_RESOURCES_OF_JOB = v.forceGatherAllRessourcesOfJob
                else
                    GATHER_ALL_RESOURCES_OF_JOB = tmpGatherAll
                end
                break
            end
        end       
    end

    assignIdJob()

    if lastJob ~= nil then
        if lastJob ~= currentJob then
            print("[INFO] Changement de metier ! Go farm " ..currentJob, 2)
            checkCraft = false
            pathIndex = nil
            sortCraft()
            resetWaitItemOfAnotherJobAndNext()
            finDeBoucle()
        end
    end
    --print(currentJob)
end

function assignIdJob()
    if currentJob == "mineur" then
        currentIdJob = 24
        currentMode = "gather"
    elseif currentJob == "bucheron" then
        currentIdJob = 2
        currentMode = "gather"
    elseif currentJob == "alchimiste" then
        currentIdJob = 26
        currentMode = "gather"
    elseif currentJob == "paysan" then
        currentIdJob = 28
        currentMode = "gather"
    else
        currentMode = "fight"
    end
end

-- Autre

function GetServer()
    local message = developer:historicalMessage("SelectedServerDataExtendedMessage")[1]
    for str in message.address:gmatch("[%a]+") do
        return str:gsub("^%l", string.upper)
    end
end

function AntiModo()
    local response = developer:getRequest("https://panel.snowbot.eu/api/moderatorCheckerPC/checkModerator.php?gameServer="..GetServer())
    
    if #response > 0 then
        if map:currentMap() ~= "0,0" then
            print("[ALERT] Un modérateur est présent sur ton serveur !", 3)
            global:delay(getRandomNumber(10000, 27000))
            havreSac()
        else
            local timeToWait = getRandomNumber(mMin, mMax)
            print("[ALERT] Arret du trajet pendant "..timeToWait.." minutes !" , 3)
            global:reconnectBis(timeToWait)
        end

    end
end

function bouclePlus() -- Incremente une boucle
    nbBoucle = nbBoucle + 1
    MULTIPLE_MAP:Reset()
end

function killDoubleValue(tbl)
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
                    table.remove(tbl, iTbl)
                end
            end
        end
    end
end

function print(str, messageType)
	-- 1 = Normal Print, 2 Sucess print, 3 Error print
	if not messageType then
		messageType = 2
	end

	if messageType == 1 then
		global:printMessage(str)
	elseif messageType == 2 then
		global:printSuccess(str)
	else
		global:printError(str)
	end
end

function math.sign(v) -- Dependance de math.round
    return (v >= 0 and 1) or -1
end

function math.round(v, bracket) -- Sert a arrondir un nombre
    bracket = bracket or 1
    return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end

function getRandomNumber(min, max)
    local rand = json.parse(developer:getRequest("http://www.randomnumberapi.com/api/v1.0/random?min="..min.."&max="..max.."&count=1" ))  
    return rand[1]
end

-- TOM LA VACHETTE func

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
			print("[AVERTISSEMENT] Aucune action ne donne d'indications pour la carte " .. currentPos .. " (" .. currentMapId .. ")", 3)
			return lost()
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