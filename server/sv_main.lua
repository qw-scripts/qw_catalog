local QBCore = exports['qb-core']:GetCoreObject()

if not LoadResourceFile(lib.name, 'html/js/index.js') then
    error('Unable to load UI. Build boilerplate or download the latest release.')
end


lib.addCommand('open-ui', {
    help = 'open the ui',
    restricted = false,
}, function(source)
    TriggerClientEvent('boilerplate:triggeredCommand', source)
    return true
end)
