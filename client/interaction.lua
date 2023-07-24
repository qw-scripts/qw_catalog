local object = nil

local function createInteraction()
    local model = joaat(Config.Interaction.prop)
    local coords = Config.Interaction.coords
    local heading = coords.w
    lib.requestModel(model)
    local obj = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, false, true, true)
    SetEntityHeading(obj, heading)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    object = obj

    local options = {
        {
            label = 'Open Catalog',
            name = 'catalog:open',
            icon = 'fas fa-car',
            distance = 1.5,
            event = 'catalog:triggeredCommand'
        }
    }
    exports.ox_target:addLocalEntity(obj, options)
end

local function removeInteraction()
    if object ~= nil then
        exports.ox_target:removeLocalEntity(object, 'catalog:open')
        DeleteEntity(object)
        object = nil
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        createInteraction()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        removeInteraction()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createInteraction()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    removeInteraction()
end)
