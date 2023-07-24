local function getVehicleData(model, class, id)
    local vehDetails = QBCore.Shared.Vehicles[model]
    return {
        id = id,
        model = model,
        name = vehDetails["name"] or 'Unknown',
        brand = vehDetails["brand"] or 'Unknown',
        price = vehDetails["price"] or 0,
        class = class
    }
end

lib.callback.register('catalog:getVehicles', function(source)
    local vehicles = {}
    for i = 1, #Config.Vehicles do
        local vehicle = Config.Vehicles[i]

        if vehicle.inStock then
            vehicles[#vehicles + 1] = getVehicleData(vehicle.model, vehicle.class, i)
        end
    end

    return vehicles
end)

lib.callback.register('catalog:handleChange', function(source, currentId, direction)
    if direction == 'next' then
        local nextId = tonumber(currentId) + 1
        if nextId > #Config.Vehicles then
            nextId = 1
        end
        local nextVeh = Config.Vehicles[nextId]
        if nextVeh == nil then
            local firstVeh = Config.Vehicles[1]
            return getVehicleData(firstVeh.model, firstVeh.class, 1)
        end

        return getVehicleData(nextVeh.model, nextVeh.class, nextId)
    else
        local prevId = tonumber(currentId) - 1
        if prevId < 1 then
            prevId = #Config.Vehicles
        end
        local prevVeh = Config.Vehicles[prevId]
        if prevVeh == nil then
            local lastVeh = Config.Vehicles[#Config.Vehicles]
            return getVehicleData(lastVeh.model, lastVeh.class, #Config.Vehicles)
        end

        return getVehicleData(prevVeh.model, prevVeh.class, prevId)
    end
end)
