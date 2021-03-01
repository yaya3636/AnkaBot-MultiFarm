-- Custom Gather Func

local HARVESTABLE_ELEMENTS = {}

local isMoving, isHappened = false, false

function harvest()
    --print("try gather")
    for _, vElements in pairs(HARVESTABLE_ELEMENTS) do
        if vElements.elementId ~= -1 and vElements.mapId == map:currentMapId() then
            local adjacentCellId = getAdjacentCellId(vElements.cellId)
            local sendMessage = developer:createMessage("InteractiveUseRequestMessage")
            sendMessage.elemId = vElements.elementId
            sendMessage.skillInstanceUid = vElements.skillInstanceUid

            for _, adjCell in pairs(adjacentCellId) do
                isMoving = false
                isHappened = false
                map:moveToCell(adjCell)
                developer:suspendScriptUntil("GameMapMovementMessage", 1, false)
                --print('isMoving = '..tostring(isMoving))
                if isMoving then
                    --print("wait 4s confirm movementMess")
                    --print(vElements.elementId)
                    --print(vElements.skillInstanceUid)
                    developer:suspendScriptUntil("GameMapMovementConfirmMessage", 1, false)
                    --print("isHappened = "..tostring(isHappened))
                    if isHappened then
                        developer:sendMessage(sendMessage)
                        --print("Message sended")
                        developer:suspendScriptUntil("ObtainedItemMessage", 5000, false)
                        break
                    end
                end
            end
        end
    end
end

function sortHarvest()

    for _, v in pairs(HARVESTABLE_ELEMENTS) do
         v.dist = countDistance(v.cellId)
    end

    table.sort(HARVESTABLE_ELEMENTS, function(a, b)
        return a.dist < b.dist
    end)
    --print("table trier")
end

function countDistance(cellIdDest)
    local currentCell = map:currentCell()
    local count = 0

    if cellIdDest > currentCell then
        for i = currentCell, 559 do
            count = count + 1
            if cellIdDest == i then
                --print("dist = "..count)
                return count
            end
            if i % 28 == 0  then
                --print("+ 1 rang")
                count = count - 13
            end
        end
    else
        for i = currentCell, 0, -1 do
            count = count + 1
            if cellIdDest == i then
                --print("dist = "..count)
                return count
            end
            if i % 28 == 0 then
                --print("+ 1 rang")
                count = count - 13
            end
        end
    end
end

function cbMapComplementaryInfo(message)
    isMoving = false

    if teleported and setPathToFarm then

        local arrGid =  message.integereractiveElements
        local arrCid = message.statedElements

        for _, vGid in ipairs(arrGid) do
            --print(vGid.elementTypeId.." onCurrentMap =  "..tostring(vGid.onCurrentMap)..' typeof = '..developer:typeOf(vGid))
            if vGid.onCurrentMap and developer:typeOf(vGid) == "InteractiveElementWithAgeBonus" then
                if canGather(vGid.elementTypeId) then
                    for _, vCid in pairs(arrCid) do
                        if vGid.elementId == vCid.elementId then
                            local elem = {}
                            elem.cellId = vCid.elementCellId
                            elem.elementId = vGid.elementId
                            elem.mapId = map:currentMapId()
                            for _, v in pairs(vGid.enabledSkills) do
                                elem.skillInstanceUid = v.skillInstanceUid
                            end
                            if elem.skillInstanceUid ~= nil then
                                table.insert(HARVESTABLE_ELEMENTS, elem)
                            end
                        end
                    end
                end
            end
        end

        sortHarvest()
        harvest()
    end
end

function cbStatedElemUpdtMsg(message)
    --print("cbStatedElemUpdtMsg")
    local data = message.statedElement
    --print(data.elementId)
    for i, v in pairs(HARVESTABLE_ELEMENTS) do
        if data.elementId == v.elementId and data.elementCellId == v.cellId and not data.onCurrentMap then
            --print(v.elementId..' removed')
            v.elementId = -1
            break

        end
    end
end

function cbGameMapMoveMessage()
    isMoving = true
    --print('move')
end

function cbGameMapMoveConfirmMessage()
    isHappened = true
    --print("Arrivé sur la cellule")
end

function canGather(gatherId)
    --print('Custom gather')
    for _, v in pairs(GATHER) do
        --print('lookin for '..gatherId..' trying '..v)
        if v == gatherId then
            --global:printSuccess('v = '..v..' id = '..gatherId)
            return true
        end
    end
    return false
end

function getAdjacentCellId(cellId)
    local ret = {}

    ret.left = cellId - 1
    ret.right = cellId + 1
    ret.top = cellId - 28
    ret.bottom = cellId + 28

    ret.leftTop = cellId - 14
    ret.rightTop = cellId - 13
    ret.leftBottom = cellId + 14
    ret.rightBottom = cellId + 15

    return ret
end