local cam = nil

local function createCatalogCamera(veh)
    FreezeEntityPosition(cache.ped, true)
    local camCoords = Config.Camera.start
    local camPoint = Config.Camera.point
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x, camCoords.y, camCoords.z, 0.00, 0.00, 0.00, 75.00,
        false, 0)
    PointCamAtCoord(cam, camPoint.x, camPoint.y, camPoint.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 300, true, true)
    SetFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.00, 0.00, 0.00)
end

local function removeCatalogCamera()
    DoScreenFadeOut(250)
    Wait(1000)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    RenderScriptCams(false, false, 1, true, true)
    ClearFocus()
    FreezeEntityPosition(cache.ped, false)
    DoScreenFadeIn(250)
end

local function startCatalog()
    local vehicles = lib.callback.await('catalog:getVehicles', false)
    if #vehicles == 0 then
        return
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openUI',
        data = {
            vehicles = vehicles
        }
    })
    Wait(500)
    createCatalogCamera()
    Wait(250)
    SpawnCatalogVehicle(vehicles[1].model, Config.Vehicles[1].props)
end

RegisterNetEvent('catalog:triggeredCommand', function()
    startCatalog()
end)

RegisterNUICallback('catalog:closeUI', function(_, cb)
    SetNuiFocus(false, false)
    removeCatalogCamera()
    RemoveSpawnedVehicle()
    cb('ok')
end)
