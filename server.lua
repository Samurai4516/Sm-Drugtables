ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('weed_table', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  TriggerClientEvent('sm:spawntable', source)
end)


ESX.RegisterUsableItem('meth_table', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('sm:spawntable2', source)
  end)

  RegisterNetEvent('sm:makeweed')
  AddEventHandler('sm:makeweed', function(itemName)
      local xPlayer = ESX.GetPlayerFromId(source)
      local recipe = nil
  
      for _, recipeData in pairs(Config.TableCrafting) do
          if recipeData.name == itemName then
              recipe = recipeData
              break
          end
      end
  
      if recipe then
          local hasAllRequiredItems = true
  
          for _, requiredItem in ipairs(recipe.requiredItems) do
              local inventoryItem = xPlayer.getInventoryItem(requiredItem.name)
              if not inventoryItem or inventoryItem.count < requiredItem.count then
                  hasAllRequiredItems = false
                  break
              end
          end
  
          if hasAllRequiredItems then
              if xPlayer.canCarryItem(recipe.producedItem, recipe.producedItemCount) then
                  TriggerClientEvent('sm:play:anim:client', source)
                  for _, requiredItem in ipairs(recipe.requiredItems) do
                      xPlayer.removeInventoryItem(requiredItem.name, requiredItem.count)
                  end
                  xPlayer.addInventoryItem(recipe.producedItem, recipe.producedItemCount)
              else
                  print("No inventory space for produced item")
              end
          else
              print("Insufficient required items")
          end
      else
          print("Invalid crafting recipe")
      end
  end)


  RegisterNetEvent('sm:makemeth')
  AddEventHandler('sm:makemeth', function(tableName)
      local xPlayer = ESX.GetPlayerFromId(source)
  
  
      local recipe = Config.TableCrafting[tableName]
  
      if recipe then
  
          local hasAllRequiredItems = true
  
          for _, requiredItem in ipairs(recipe.requiredItems) do
              local inventoryItem = xPlayer.getInventoryItem(requiredItem.name)
              if not inventoryItem or inventoryItem.count < requiredItem.count then
                  hasAllRequiredItems = false
                  break
              end
          end
  
          if hasAllRequiredItems then
              if xPlayer.canCarryItem(recipe.producedItem, recipe.producedItemCount) then
                  TriggerClientEvent('sm:play:anim:client', source)
                  for _, requiredItem in ipairs(recipe.requiredItems) do
                      xPlayer.removeInventoryItem(requiredItem.name, requiredItem.count)
                  end
                  xPlayer.addInventoryItem(recipe.producedItem, recipe.producedItemCount)
              else
                  print("No inventory space for produced item")
              end
          else
              print("Insufficient required items")
          end
      else
          print("Invalid crafting recipe")
      end
  end)
  
  