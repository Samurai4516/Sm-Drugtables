RegisterNetEvent('sm:spawntable', function()
    lib.progressBar({
        duration = 4000,
        label = 'Placing table...',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = 'weapon@w_sp_jerrycan',
            clip = 'discard_crouch'
        },
    })

    local modelHash = "prop_ven_market_table1"
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(1)
        end
    end

    local offsetCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)

    local obj = CreateObject(modelHash, offsetCoords, true) 
    PlaceObjectOnGroundProperly(obj)
end)



RegisterNetEvent('sm:spawntable2', function()
    local Prop2 = {
        'prop_table_03'
    }
    
    exports.ox_target:addModel(Prop2, {
        {
            name = 'prop_ven_market_table1',
            icon = 'fa-solid fa-flask-vial',
            label = 'Use table',
            event = 'sm:openmenu2',
        }
    })
    lib.progressBar({
        duration = 4000,
        label = 'Placing table...',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = 'weapon@w_sp_jerrycan',
            clip = 'discard_crouch'
        },
    })

    local modelHash = "prop_table_03"
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(1)
        end
    end

    local offsetCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)

    local obj = CreateObject(modelHash, offsetCoords, true) 
    PlaceObjectOnGroundProperly(obj)
end)



local Prop = {
    'prop_ven_market_table1'
}

exports.ox_target:addModel(Prop, {
    {
        name = 'prop_ven_market_table1',
        icon = 'fa-solid fa-cannabis',
        label = 'Use table',
        event = 'sm:openmenu',
    }
})




lib.registerContext({
    id = 'menu2',
    title = 'Drug lab',
    options = {
      {
        title = 'Drug table',
        description = 'Make Meth',
        icon = 'fa-solid fa-flask-vial',
        onSelect = function()
          TriggerServerEvent('sm:makemeth', 'meth_table')
        end,
      },
      {
        title = 'Drug table',
        description = 'Pickup tabel',
        icon = 'fa-solid fa-flask-vial',
        onSelect = function()
            TriggerEvent('sm:play:anim:client2')
            Wait(5000)
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local radius = 5.0
            local prop = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, radius, GetHashKey("prop_table_03"), false, false, false)
            if prop ~= 0 then
                DeleteObject(prop)
            end
        end,
      }
    }
})

  


lib.registerContext({
    id = 'menu1',
    title = 'Drug lab',
    options = {
      {
        title = 'Drug table',
        description = 'Make Weed',
        icon = 'fa-solid fa-cannabis',
        onSelect = function()
          TriggerServerEvent('sm:makeweed')
        end,
      },
      {
        title = 'Drug table',
        description = 'Pickup tabel',
        icon = 'fa-solid fa-cannabis',
        onSelect = function()
            TriggerEvent('sm:play:anim:client2')
            Wait(5000)
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local radius = 5.0
            local prop = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, radius, GetHashKey("prop_ven_market_table1"), false, false, false)
            if prop ~= 0 then
                DeleteObject(prop)
            end
        end,
      }
    }
})

RegisterNetEvent('sm:openmenu', function()
    lib.showContext('menu1')
end)

RegisterNetEvent('sm:openmenu2', function()
    lib.showContext('menu2')
end)

RegisterNetEvent("sm:play:anim:client", function()
    local ped = GetPlayerPed(-1)

    local animDict = "anim@gangops@facility@servers@bodysearch@"
    local animName = "player_search"

    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Wait(500)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    lib.progressBar({
        duration = 5000,
        label = 'Making Drugs',
    })

    Wait(5000)

    ClearPedTasks(ped)
end)


RegisterNetEvent("sm:play:anim:client2", function()
    local ped = GetPlayerPed(-1)

    local animDict = "anim@gangops@facility@servers@bodysearch@"
    local animName = "player_search"

    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Wait(500)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    lib.progressBar({
        duration = 5000,
        label = 'Picking up tabel...',
    })

    Wait(5000)

    ClearPedTasks(ped)
end)