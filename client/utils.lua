local function openUi()
    SetNuiFocus(true, true)
    SendNuiMessage(json.encode({
        action = 'openUI',
        data = nil
    }))
end

RegisterNetEvent('boilerplate:triggeredCommand', function()
    openUi()
end)

RegisterNUICallback('boilerplate:closeUI', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)
