-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复Nanobots2的问题
if mods["Nanobots2"] then
    -- 修复科技的问题
    -- 修复nanobots的问题
    if data.raw.technology["nanobots"] then
        for i = #data.raw.technology["nanobots"].effects, 1, -1 do
            local effect = data.raw.technology["nanobots"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["nanobots"].effects, i)
                break
            end
        end
    end
end

-- 修复Mini_Trains的问题
if mods["Mini_Trains"] then
    -- 修复科技的问题
    -- 修复mini-trains的问题
    if data.raw.technology["mini-trains"] then
        for i = #data.raw.technology["mini-trains"].effects, 1, -1 do
            local effect = data.raw.technology["mini-trains"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["mini-trains"].effects, i)
                break
            end
        end
    end

    -- 修复railway的问题
    if data.raw.technology["railway"] then
        table.insert(data.raw.technology["railway"].prerequisites, "mini-trains")
    end
end

-- 修复Transport_Drones_Meglinge_Fork的问题
if mods["Transport_Drones_Meglinge_Fork"] then
    -- 修复科技的问题
    -- 修复transport-system的问题
    if data.raw.technology["transport-system"] then
        for i = #data.raw.technology["transport-system"].effects, 1, -1 do
            local effect = data.raw.technology["transport-system"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["transport-system"].effects, i)
                break
            end
        end
    end
end

-- 修复pycoalprocessing的问题
if mods["pycoalprocessing"] then
    -- 修复科技的问题
    -- 修复concrete的问题
    if data.raw.technology["concrete"] then
        for i = #data.raw.technology["concrete"].effects, 1, -1 do
            local effect = data.raw.technology["concrete"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["concrete"].effects, i)
                break
            end
        end
    end

    -- 修复circuit-network的问题
    if data.raw.technology["circuit-network"] then
        for i = #data.raw.technology["circuit-network"].effects, 1, -1 do
            local effect = data.raw.technology["circuit-network"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["circuit-network"].effects, i)
                break
            end
        end
    end

    -- 修复配方的问题
    -- 修复burner-inserter的问题
    if data.raw.recipe["burner-inserter"] then
        for _, ingredient in pairs(data.raw.recipe["burner-inserter"]
                                       .ingredients) do
            if ingredient.name == "iron-plate" then
                ingredient.amount = 1
            end

            if ingredient.name == "small-parts-01" then
                ingredient.amount = 1
            end
        end
    end
end

-- 修复pypetroleumhandling的问题
if mods["pypetroleumhandling"] then
    -- 修复配方的问题
    -- 修复transport-belt-2的问题
    if data.raw.recipe["transport-belt-2"] then
        table.insert(data.raw.recipe["transport-belt-2"].ingredients,
                     {type = "item", name = "electronic-circuit", amount = 3})
    end
end

-- 修复wood-logistics的问题
if mods["wood-logistics"] then
    -- 修复模组的问题
    -- 修复bobinserters的问题
    if mods["bobinserters"] then
        -- 修复科技的问题
        -- 修复bob-long-inserters-1的问题
        if data.raw.technology["bob-long-inserters-1"] then
            data.raw.technology["bob-long-inserters-1"].prerequisites = {
                "wood-logistics"
            }
        end

        -- 修复bob-near-inserters的问题
        if data.raw.technology["bob-near-inserters"] then
            data.raw.technology["bob-near-inserters"].prerequisites = {
                "wood-logistics"
            }
        end
    end

    -- 修复实体的问题
    -- 修复wood-underground-belt的问题
    if data.raw["underground-belt"] and
        data.raw["underground-belt"]["wood-underground-belt"] then
        data.raw["underground-belt"]["wood-underground-belt"].max_distance = 5
    end

    -- 修复科技的问题
    -- 修复logistics的问题
    if data.raw.technology["logistics"] then
        table.insert(data.raw.technology["logistics"].effects or {},
                     {type = "unlock-recipe", recipe = "underground-belt"})
    end

    -- 修复配方的问题
    -- 修复underground-belt的问题
    if data.raw.recipe["underground-belt"] then
        data.raw.recipe["underground-belt"].enabled = false
    end

    -- 修复lab的问题
    if data.raw.recipe["lab"] then
        for _, ingredient in ipairs(data.raw.recipe["lab"].ingredients) do
            if ingredient.name == "inserter" then
                ingredient.name = "burner-inserter"
                break
            end
        end

        table.insert(data.raw.recipe["lab"].ingredients,
                     {type = "item", name = "wood-transport-belt", amount = 4})
    end

    -- 修复transport-belt的问题
    if data.raw.recipe["transport-belt"] then
        table.insert(data.raw.recipe["transport-belt"].ingredients,
                     {type = "item", name = "electronic-circuit", amount = 1})
    end
end

-- 修复ElectricFurnacesRevamp的问题
if mods["ElectricFurnacesRevamp"] then
    -- 修复科技的问题
    -- 修复electronics的问题
    if data.raw.technology["electronics"] then
        data.raw.technology["electronics"].effects =
            data.raw.technology["electronics"].effects or {}
        table.insert(data.raw.technology["electronics"].effects, {
            type = "unlock-recipe",
            recipe = "electric-stone-furnace"
        })
        table.insert(data.raw.technology["electronics"].effects,
                     {type = "unlock-recipe", recipe = "electric-boiler"})
    end

    -- 修复配方的问题
    if data.raw.recipe["electric-stone-furnace"] then
        data.raw.recipe["electric-stone-furnace"].enabled = false
    end

    if data.raw.recipe["electric-boiler"] then
        data.raw.recipe["electric-boiler"].enabled = false
    end
end

-- 修复aai-loaders的问题
if mods["aai-loaders"] then
    -- 修复实体的问题
    -- 修复aai-loader的问题
    if data.raw["loader-1x1"] then
        for _, item in pairs(data.raw["loader-1x1"]) do
            if item.speed then item.speed = item.speed * 2 end
        end
    end
end

-- 修复easyvoid的问题
if mods["easyvoid"] then
    -- 修复科技的问题
    -- 修复void的问题
    if data.raw.technology["void"] then
        data.raw.technology["void"].prerequisites = {"automation"}
    end
end

-- 修复loaders-modernized的问题
if mods["loaders-modernized"] then
    -- 修复配方的问题
    -- 修复wood-mdrn-loader的问题
    if data.raw.recipe["wood-mdrn-loader"] then
        for _, ingredient in ipairs(data.raw.recipe["wood-mdrn-loader"]
                                        .ingredients) do
            if ingredient.name == "inserter" then
                ingredient.name = "burner-inserter"
                break
            end
        end
    end

    -- 修复mdrn-loader的问题
    if data.raw.recipe["mdrn-loader"] then
        table.insert(data.raw.recipe["mdrn-loader"].ingredients,
                     {type = "item", name = "wood-mdrn-loader", amount = 1})
    end
end

-- 修复earlier-teleporters_redux的问题
if mods["earlier-teleporters_redux"] then
    -- 修复科技的问题
    -- 修复teleporter的问题
    if data.raw.technology["teleporter"] then
        data.raw.technology["teleporter"].prerequisites = {"electronics"}
    end
end

-- 修复实体的问题
-- 修复transport-belt的问题
if data.raw["transport-belt"] then
    for _, item in pairs(data.raw["transport-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复underground-belt的问题
if data.raw["underground-belt"] then
    for _, item in pairs(data.raw["underground-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复loader的问题
if data.raw["loader"] then
    for _, item in pairs(data.raw["loader"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复splitter的问题
if data.raw["splitter"] then
    for _, item in pairs(data.raw["splitter"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复inserter的问题
if data.raw["inserter"] then
    for _, item in pairs(data.raw["inserter"]) do
        if item.rotation_speed then
            item.rotation_speed = item.rotation_speed * 1.5
        end
    end
end

-- 修复underground-belt的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["underground-belt"] then
    data.raw["underground-belt"]["underground-belt"].max_distance = 10
end

-- 修复fast-underground-belt的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["fast-underground-belt"] then
    data.raw["underground-belt"]["fast-underground-belt"].max_distance = 20
end

-- 修复express-underground-belt的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["express-underground-belt"] then
    data.raw["underground-belt"]["express-underground-belt"].max_distance = 40
end

-- 修复物品的问题
-- 修复iron-plate的问题
if data.raw.item["iron-plate"] then
    data.raw.item["iron-plate"].icon = "__base__/graphics/icons/iron-plate.png"
    data.raw.item["iron-plate"].icon_size = 64
end

-- 修复copper-plate的问题
if data.raw.item["copper-plate"] then
    data.raw.item["copper-plate"].icon =
        "__base__/graphics/icons/copper-plate.png"
    data.raw.item["copper-plate"].icon_size = 64
end

-- 自动排序科技效果
if data.raw.technology then
    for _, technology in pairs(data.raw.technology) do
        if technology.effects then
            local unlock_recipes = {}
            local other_effects = {}

            for _, effect in pairs(technology.effects) do
                if effect.type == "unlock-recipe" then
                    table.insert(unlock_recipes, effect)
                else
                    table.insert(other_effects, effect)
                end
            end

            table.sort(unlock_recipes,
                       function(a, b) return a.recipe < b.recipe end)

            technology.effects = other_effects
            for _, effect in ipairs(unlock_recipes) do
                table.insert(technology.effects, effect)
            end
        end
    end
end
