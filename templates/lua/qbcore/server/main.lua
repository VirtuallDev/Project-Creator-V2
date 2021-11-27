QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- usable functions:

function getItem(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    local count = 0
    for k,v in pairs(player['PlayerData']['Items']) do
        if v.name == item then
            count += v.amount

        end
    end

    return { name = item, count = count }
end

function getPlayerName(source):
    local player = QBCore.Functions.GetPlayer(source)

    return { name = player['PlayerData']['firstName'] + player['PlayerData']['lastName']}
end