-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
script.on_init(function()
    -- 禁用坠机现场
    if settings.startup["enable-disable-crash-site"].value or
        script.active_mods["chens-py-sea-block-mod"] then
        if remote.interfaces.freeplay then
            -- 禁用坠机现场
            if remote.interfaces.freeplay.set_disable_crashsite then
                remote.call("freeplay", "set_disable_crashsite", true)
            end

            -- 清空创建的物品
            local created_items = remote.call("freeplay", "get_created_items")
            for k in pairs(created_items) do created_items[k] = nil end
            remote.call("freeplay", "set_created_items", created_items)

            -- 清空碎片物品
            local debris_items = remote.call('freeplay', 'get_debris_items')
            for k in pairs(debris_items) do debris_items[k] = nil end
            remote.call('freeplay', 'set_debris_items', debris_items)
        end
    end

    if script.active_mods["chens-py-sea-block-mod"] or
        (script.active_mods["chens-py-land-block-mod"] and
            settings.startup["enable-no-resource"].value) then
        settings.startup["enable-disable-crash-site"].value = true
        settings.startup["enable-give-burner-mining-drill-at-game-start"].value =
            false
    end

    if settings.startup["enable-give-construction-robots-at-game-start"].value then
        local force = game.forces.player

        if script.active_mods["Krastorio2"] then
            for i = 1, 7 do
                local tech_name = "worker-robots-speed-" .. i
                if force.technologies[tech_name] then
                    force.technologies[tech_name].researched = true
                end
            end
        else
            for i = 1, 5 do
                local tech_name = "worker-robots-speed-" .. i
                if force.technologies[tech_name] then
                    force.technologies[tech_name].researched = true
                end
            end
        end
    end

    if settings.global["enable-remove-decorations"].value then
        for _, surface in pairs(game.surfaces) do
            surface.destroy_decoratives {}
        end
    end
end)

script.on_configuration_changed(function()
    if settings.global["enable-remove-decorations"].value then
        for _, surface in pairs(game.surfaces) do
            surface.destroy_decoratives {}
        end
    end
end)

function on_player_creation(player)
    if settings.startup["enable-clear-inventory"].value or
        settings.startup["enable-give-construction-robots-at-game-start"].value or
        settings.startup["enable-give-weapon-at-game-start"].value then
        -- 移除玩家的盔甲
        if player.character and
            player.get_inventory(defines.inventory.character_armor)
                .get_item_count() > 0 then
            player.get_inventory(defines.inventory.character_armor).clear()
        end

        -- 清空玩家的主要库存
        player.get_inventory(defines.inventory.character_main).clear()
    end

    if settings.startup["enable-give-construction-robots-at-game-start"].value then
        -- 插入新的物品
        if script.active_mods["pyalternativeenergy"] then
            player.insert {name = "light-armor", count = 1}
            player.insert {name = "py-construction-robot-mk04", count = 10}
        elseif script.active_mods["5dim_logistic"] then
            player.insert {name = "modular-armor", count = 1}
            player.insert {name = "5d-construction-robot-10", count = 10}
        elseif script.active_mods["Krastorio2"] then
            player.insert {name = "modular-armor", count = 1}
            player.insert {name = "construction-robot", count = 20}
        else
            player.insert {name = "modular-armor", count = 1}
            player.insert {name = "construction-robot", count = 10}
        end

        -- 插入指定数量的装备到角色网格
        local function insert_equipment(grid, equipment_name, count)
            for i = 1, count do grid.put({name = equipment_name}) end
        end

        -- 获取角色盔甲的网格
        local grid = player.get_inventory(defines.inventory.character_armor)[1]
                         .grid

        -- 插入设备到网格
        if script.active_mods["pyalternativeenergy"] then
            insert_equipment(grid, "solar-panel-equipment", 16)
            insert_equipment(grid, "night-vision-equipment", 1)
            insert_equipment(grid, "personal-roboport-equipment", 1)
        elseif script.active_mods["Krastorio2"] then
            insert_equipment(grid, "solar-panel-equipment", 9)
            insert_equipment(grid, "battery-equipment", 1)
            insert_equipment(grid, "personal-roboport-equipment", 1)
            insert_equipment(grid, "night-vision-equipment", 1)
        else
            insert_equipment(grid, "solar-panel-equipment", 15)
            insert_equipment(grid, "night-vision-equipment", 1)
            insert_equipment(grid, "battery-equipment", 1)
            insert_equipment(grid, "personal-roboport-equipment", 1)
        end
    end

    if settings.startup["enable-give-burner-mining-drill-at-game-start"].value then
        if not (script.active_mods["chens-py-sea-block-mod"] or
            (script.active_mods["chens-py-land-block-mod"] and
                settings.startup["enable-no-resource"].value)) then
            player.insert {name = "burner-mining-drill", count = 10}
        end
    end

    if settings.startup["enable-give-weapon-at-game-start"].value then
        player.insert {name = "pistol", count = 1}
        player.insert {name = "firearm-magazine", count = 5}
    end

    if settings.startup["enable-disable-hand-crafting"].value then
        player.insert {name = "assembling-machine-1", count = 1}
    end

    if script.active_mods["chens-modpack-py-auxiliary-others"] then
        if script.active_mods["pyhardmode"] and
            not (script.active_mods["chens-py-sea-block-mod"] or
                script.active_mods["chens-py-land-block-mod"]) then
            player.insert {name = "offshore-pump", count = 1}
        end
    end

    if script.active_mods["chens-py-sea-block-mod-core"] then
        if script.active_mods["chens-py-sea-block-mod"] then
            player.insert {name = "offshore-pump", count = 1}
            player.insert({name = "evaporator-mk00", count = 1})
            player.insert {name = "fuelmix-solid", count = 1}
            player.insert {name = "landfill", count = 500}
        elseif script.active_mods["chens-py-land-block-mod"] and
            settings.startup["enable-no-resource"].value then
            player.insert {name = "offshore-pump", count = 1}
            player.insert({name = "evaporator-mk00", count = 1})
            player.insert {name = "fuelmix-solid", count = 1}
        end
    end
end

script.on_event(defines.events.on_cutscene_cancelled, function(event)
    -- 单人游戏
    local player = game.players[event.player_index]
    if player.character == nil then return end
    on_player_creation(player)
end)

script.on_event(defines.events.on_player_created, function(event)
    -- 多人游戏
    local player = game.players[event.player_index]
    if player.character == nil then return end
    on_player_creation(player)
end)
