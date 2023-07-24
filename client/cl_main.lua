local catalogVehicle = nil

function SpawnCatalogVehicle(modelName, vehicleProps)
    local model = joaat(modelName)
    local coords = Config.VehicleSpawn
    local heading = coords.w
    lib.requestModel(model)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, false, false)
    lib.setVehicleProperties(vehicle, vehicleProps or {})
    SetVehicleEngineOn(vehicle, true, true, false)
    FreezeEntityPosition(vehicle, true)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleLights(vehicle, 2)
    SetEntityAsMissionEntity(vehicle, true, false)
    SetModelAsNoLongerNeeded(model)
    catalogVehicle = vehicle
end

function RemoveSpawnedVehicle()
    if catalogVehicle ~= nil then
        DeleteVehicle(catalogVehicle)
        catalogVehicle = nil
    end
end

RegisterNUICallback('catalog:previous', function(data, cb)
    local currentId = data.current
    local vehData = lib.callback.await('catalog:handleChange', false, currentId, 'previous')
    if not vehData then
        cb('error')
        return
    end
    RemoveSpawnedVehicle()
    SpawnCatalogVehicle(vehData.model, Config.Vehicles[vehData.id].props)
    SendNUIMessage({
        action = 'updateSelected',
        data = {
            vehicle = vehData
        }
    })
    cb('ok')
end)

RegisterNUICallback('catalog:next', function(data, cb)
    local currentId = data.current
    local vehData = lib.callback.await('catalog:handleChange', false, currentId, 'next')
    if not vehData then
        cb('error')
        return
    end
    RemoveSpawnedVehicle()
    SpawnCatalogVehicle(vehData.model, Config.Vehicles[vehData.id].props)
    SendNUIMessage({
        action = 'updateSelected',
        data = {
            vehicle = vehData
        }
    })
    cb('ok')
end)
