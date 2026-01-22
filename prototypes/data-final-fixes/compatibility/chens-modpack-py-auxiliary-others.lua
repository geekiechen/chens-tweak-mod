-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 pyhardmode 的问题
if mods["pyhardmode"] then
    -- 修复模组的问题
    -- 修复 aai-industry 的问题
    if mods["aai-industry"] then
        -- 修复科技的问题
        -- 修复 steam-power 的问题
        if data.raw.technology["steam-power"] then
            for i = #data.raw.technology["steam-power"].effects, 1, -1 do
                local effect = data.raw.technology["steam-power"].effects[i]
                if effect.type == "mining-with-fluid" then
                    table.remove(data.raw.technology["steam-power"].effects, i)
                    break
                end
            end
        end

        -- 修复 burner-mechanics 的问题
        if data.raw.technology["burner-mechanics"] then
            table.insert(data.raw.technology["burner-mechanics"].effects,
                         {type = "mining-with-fluid", modifier = true})
        end
    end
else
    -- 修复科技的问题
    -- 修复 mining-with-fluid 的问题
    if data.raw.technology["mining-with-fluid"] then
        table.insert(data.raw.technology["mining-with-fluid"].effects,
                     {type = "mining-with-fluid", modifier = true})
    end
end

-- 修复 248k-Redux 的问题
if mods["248k-Redux"] then
    -- 修复实体的问题
    -- 修复 labs 的问题
    local added_science_packs = {
        "automation-science-pack", "py-science-pack-1", "logistic-science-pack",
        "py-science-pack-2", "chemical-science-pack", "py-science-pack-3",
        "production-science-pack", "py-science-pack-4", "utility-science-pack",
        "space-science-pack", "fu_space_probe_science_item",
        "gr_materials_red_pack_item", "gr_materials_green_pack_item",
        "gr_materials_blue_pack_item", "gr_materials_purple_pack_item",
        "gr_materials_yellow_pack_item", "gr_materials_grey_pack_item",
        "gr_materials_white_pack_item"
    }

    local labs_blacklist = {}

    for _, pack in ipairs(added_science_packs) do
        for _, lab in pairs(data.raw.lab) do
            for _, lab_blacklist in ipairs(labs_blacklist) do
                if lab.name == lab_blacklist then goto skip end
            end

            lab.inputs = lab.inputs or {}

            for _, input in ipairs(lab.inputs) do
                if input == pack then goto skip end
            end

            table.insert(lab.inputs, pack)
            ::skip::
        end
    end
end

-- 修复 Mini_Trains 的问题
if mods["Mini_Trains"] then
    -- 修复科技的问题
    -- 修复 mini-trains 的问题
    if data.raw.technology["mini-trains"] then
        for i = #data.raw.technology["mini-trains"].effects, 1, -1 do
            local effect = data.raw.technology["mini-trains"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["mini-trains"].effects, i)
                break
            end
        end
    end

    -- 修复 railway 的问题
    if data.raw.technology["railway"] then
        if data.raw.technology["mini-trains"] then
            table.insert(data.raw.technology["railway"].prerequisites,
                         "mini-trains")
        end
    end
end

-- 修复 Transport_Drones_Meglinge_Fork 的问题
if mods["Transport_Drones_Meglinge_Fork"] then
    -- 修复科技的问题
    -- 修复 transport-system 的问题
    if data.raw.technology["transport-system"] then
        for i = #data.raw.technology["transport-system"].effects, 1, -1 do
            local effect = data.raw.technology["transport-system"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["transport-system"].effects, i)
                break
            end
        end

        if data.raw.technology["steel-processing"] then
            data.raw.technology["transport-system"].prerequisites = {
                "steel-processing"
            }
        end

        data.raw.technology["transport-system"].unit = {
            count = 200,
            ingredients = {{"automation-science-pack", 1}},
            time = 30
        }
    end
end

-- 修复 pycoalprocessing 的问题
if mods["pycoalprocessing"] then
    -- 修复科技的问题
    -- 修复 concrete 的问题
    if data.raw.technology["concrete"] then
        for i = #data.raw.technology["concrete"].effects, 1, -1 do
            local effect = data.raw.technology["concrete"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["concrete"].effects, i)
                break
            end
        end
    end

    -- 修复 circuit-network 的问题
    if data.raw.technology["circuit-network"] then
        for i = #data.raw.technology["circuit-network"].effects, 1, -1 do
            local effect = data.raw.technology["circuit-network"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["circuit-network"].effects, i)
                break
            end
        end
    end

    -- 修复 hidden-mining-fluid-autounlock 的问题
    if data.raw.technology["hidden-mining-fluid-autounlock"] then
        for i = #data.raw.technology["hidden-mining-fluid-autounlock"].effects, 1, -1 do
            local effect = data.raw.technology["hidden-mining-fluid-autounlock"]
                               .effects[i]
            if effect.type == "mining-with-fluid" then
                table.remove(
                    data.raw.technology["hidden-mining-fluid-autounlock"]
                        .effects, i)
                break
            end
        end
    end

    -- 修复配方的问题
    -- 修复 burner-inserter 的问题
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

-- 修复 pypetroleumhandling 的问题
if mods["pypetroleumhandling"] then
    -- 修复配方的问题
    -- 修复 transport-belt-2 的问题
    if data.raw.recipe["transport-belt-2"] then
        if data.raw.item["electronic-circuit"] then
            table.insert(data.raw.recipe["transport-belt-2"].ingredients, {
                type = "item",
                name = "electronic-circuit",
                amount = 3
            })
        end
    end
end

-- 修复 wood-logistics 的问题
if mods["wood-logistics"] then
    -- 修复模组的问题
    -- 修复 bobinserters 的问题
    if mods["bobinserters"] then
        -- 修复科技的问题
        -- 修复 bob-long-inserters-1 的问题
        if data.raw.technology["bob-long-inserters-1"] then
            data.raw.technology["bob-long-inserters-1"].prerequisites = {
                "wood-logistics"
            }
        end

        -- 修复 bob-near-inserters 的问题
        if data.raw.technology["bob-near-inserters"] then
            data.raw.technology["bob-near-inserters"].prerequisites = {
                "wood-logistics"
            }
        end
    end

    -- 修复 bobtech 的问题
    if mods["bobtech"] then
        -- 修复配方的问题
        -- 修复 lab 的问题
        if data.raw.recipe["lab"] then
            if data.raw.item["transport-belt"] then
                table.insert(data.raw.recipe["lab"].ingredients, {
                    type = "item",
                    name = "transport-belt",
                    amount = 4
                })
            end
        end
    else
        -- 修复配方的问题
        -- 修复 lab 的问题
        if data.raw.recipe["lab"] then
            for _, ingredient in ipairs(data.raw.recipe["lab"].ingredients) do
                if ingredient.name == "inserter" then
                    ingredient.name = "burner-inserter"
                    break
                end
            end

            if data.raw.item["wood-transport-belt"] then
                table.insert(data.raw.recipe["lab"].ingredients, {
                    type = "item",
                    name = "wood-transport-belt",
                    amount = 4
                })
            end
        end
    end

    -- 修复 aai-industry 的问题
    if mods["aai-industry"] then
        -- 修复科技的问题
        -- 修复 wood-logistics 的问题
        if data.raw.technology["wood-logistics"] then
            if data.raw.technology["basic-wood-logistics"] then
                table.insert(
                    data.raw.technology["wood-logistics"].prerequisites,
                    "basic-wood-logistics")
            end
        end
    end

    -- 修复实体的问题
    -- 修复 wood-underground-belt 的问题
    if data.raw["underground-belt"] and
        data.raw["underground-belt"]["wood-underground-belt"] then
        data.raw["underground-belt"]["wood-underground-belt"].max_distance = 5
    end

    -- 修复科技的问题
    -- 修复 logistics 的问题
    if data.raw.technology["logistics"] then
        if data.raw.recipe["underground-belt"] then
            table.insert(data.raw.technology["logistics"].effects,
                         {type = "unlock-recipe", recipe = "underground-belt"})
        end
    end

    -- 修复配方的问题
    -- 修复 underground-belt 的问题
    if data.raw.recipe["underground-belt"] then
        data.raw.recipe["underground-belt"].enabled = false
    end

    -- 修复 transport-belt 的问题
    if data.raw.recipe["transport-belt"] then
        if data.raw.item["electronic-circuit"] then
            table.insert(data.raw.recipe["transport-belt"].ingredients, {
                type = "item",
                name = "electronic-circuit",
                amount = 1
            })
        end
    end
end

-- 修复 ElectricFurnacesRevamp 的问题
if mods["ElectricFurnacesRevamp"] then
    -- 修复科技的问题
    -- 修复 electronics 的问题
    if data.raw.technology["electronics"] then
        if data.raw.recipe["electric-stone-furnace"] then
            table.insert(data.raw.technology["electronics"].effects, {
                type = "unlock-recipe",
                recipe = "electric-stone-furnace"
            })
        end

        if data.raw.recipe["electric-boiler"] then
            table.insert(data.raw.technology["electronics"].effects,
                         {type = "unlock-recipe", recipe = "electric-boiler"})
        end
    end

    -- 修复配方的问题
    if data.raw.recipe["electric-stone-furnace"] then
        data.raw.recipe["electric-stone-furnace"].enabled = false
    end

    if data.raw.recipe["electric-boiler"] then
        data.raw.recipe["electric-boiler"].enabled = false
    end
end

-- 修复 aai-loaders 的问题
if mods["aai-loaders"] then
    -- 修复实体的问题
    -- 修复 aai-loader 的问题
    if data.raw["loader-1x1"] then
        for _, item in pairs(data.raw["loader-1x1"]) do
            if item.speed then item.speed = item.speed * 2 end
        end
    end
end

-- 修复 easyvoid 的问题
if mods["easyvoid"] then
    -- 修复科技的问题
    -- 修复 void 的问题
    if data.raw.technology["void"] then
        data.raw.technology["void"].prerequisites = {"automation"}
    end
end

-- 修复 loaders-modernized 的问题
if mods["loaders-modernized"] then
    -- 修复配方的问题
    -- 修复 wood-mdrn-loader 的问题
    if data.raw.recipe["wood-mdrn-loader"] then
        for _, ingredient in ipairs(data.raw.recipe["wood-mdrn-loader"]
                                        .ingredients) do
            if ingredient.name == "inserter" then
                ingredient.name = "burner-inserter"
                break
            end
        end
    end

    -- 修复 mdrn-loader 的问题
    if data.raw.recipe["mdrn-loader"] then
        if data.raw.item["wood-mdrn-loader"] then
            table.insert(data.raw.recipe["mdrn-loader"].ingredients,
                         {type = "item", name = "wood-mdrn-loader", amount = 1})
        end
    end
end

-- 修复 earlier-teleporters_redux 的问题
if mods["earlier-teleporters_redux"] then
    -- 修复科技的问题
    -- 修复 teleporter 的问题
    if data.raw.technology["teleporter"] then
        data.raw.technology["teleporter"].prerequisites = {"electronics"}
    end
end

-- 修复 bobtech 的问题
if mods["bobtech"] then
    -- 修复模组的问题
    -- 修复 pycoalprocessing 的问题
    if mods["pycoalprocessing"] then
        -- 修复科技的问题
        -- 修复 steam-power 的问题
        if data.raw.technology["steam-power"] then
            for i = #data.raw.technology["steam-power"].effects, 1, -1 do
                local effect = data.raw.technology["steam-power"].effects[i]
                if effect.type == "unlock-recipe" and effect.recipe ==
                    "small-electric-pole" then
                    table.remove(data.raw.technology["steam-power"].effects, i)
                    break
                end
            end
        end

        -- 修复 automation-science-pack 的问题
        if data.raw.technology["automation-science-pack"] then
            for i = #data.raw.technology["automation-science-pack"].effects, 1, -1 do
                local effect = data.raw.technology["automation-science-pack"]
                                   .effects[i]
                if effect.type == "unlock-recipe" and effect.recipe == "lab" then
                    table.remove(data.raw.technology["automation-science-pack"]
                                     .effects, i)
                    break
                end
            end
        end
    end

    -- 修复 wood-logistics 的问题
    if mods["wood-logistics"] then
        -- 修复配方的问题
        -- 修复 bob-burner-lab 的问题
        if data.raw.recipe["bob-burner-lab"] then
            if data.raw.item["wood-transport-belt"] then
                table.insert(data.raw.recipe["bob-burner-lab"].ingredients, {
                    type = "item",
                    name = "wood-transport-belt",
                    amount = 4
                })
            end
        end
    end

    -- 修复科技的问题
    -- 修复 bob-electricity 的问题
    if data.raw.technology["bob-electricity"] then
        for i = #data.raw.technology["bob-electricity"].effects, 1, -1 do
            local effect = data.raw.technology["bob-electricity"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "copper-cable" or effect.recipe ==
                    "lighted-small-electric-pole") then
                table.remove(data.raw.technology["bob-electricity"].effects, i)
            end
        end
    end

    -- 修复配方的问题
    -- 修复 bob-burner-lab 的问题
    if data.raw.recipe["bob-burner-lab"] then
        if data.raw.item["burner-inserter"] then
            table.insert(data.raw.recipe["bob-burner-lab"].ingredients,
                         {type = "item", name = "burner-inserter", amount = 4})
        end
    end
end

-- 修复 aai-industry 的问题
if mods["aai-industry"] then
    -- 修复模组的问题
    -- 修复 chens-py-sea-block-mod 或 chens-py-land-block-mod 的问题
    if not mods["chens-py-sea-block-mod"] or
        (mods["chens-py-land-block-mod"] and
            settings.startup["enable-no-resource"].value) then
        -- 修复配方的问题
        -- 修复 pipe 的问题
        data.raw.recipe["pipe"].enabled = true

        -- 修复 pipe-to-ground 的问题
        data.raw.recipe["pipe-to-ground"].enabled = true

        -- 修复 small-electric-pole 的问题
        data.raw.recipe["small-electric-pole"].enabled = true
    end

    -- 修复实体的问题
    -- 修复 burner-lab 的问题
    if data.raw["lab"]["lab"] then
        local burner_lab = table.deepcopy(data.raw["lab"]["lab"])
        burner_lab.name = "burner-lab"
        burner_lab.icon =
            "__pycoalprocessinggraphics__/graphics/icons/lab-mk01.png"
        burner_lab.minable = {mining_time = 0.2, result = "burner-lab"}
        burner_lab.energy_source = {
            type = "burner",
            fuel_categories = {
                "chemical",
                data.raw["fuel-category"]["processed-chemical"] and
                    "processed-chemical"
            },
            effectivity = 0.9,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash",
            emissions_per_minute = {pollution = 4},
            light_flicker = {
                minimum_light_size = 1,
                light_intensity_to_size_coefficient = 0.25,
                color = {1, 0.4, 0},
                minimum_intensity = 0.1,
                maximum_intensity = 0.3
            }
        }
        data.raw["lab"]["burner-lab"] = burner_lab
    end

    -- 修复 offshore-pump 的问题
    if data.raw["offshore-pump"]["offshore-pump"] then
        data.raw["offshore-pump"]["offshore-pump"].energy_source = {
            type = "void"
        }
    end

    -- 修复科技的问题
    -- 修复 sand-processing 的问题
    if data.raw.technology["sand-processing"] then
        for i = #data.raw.technology["sand-processing"].effects, 1, -1 do
            local effect = data.raw.technology["sand-processing"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(data.raw.technology["sand-processing"].effects, i)
            end
        end

        if next(data.raw.technology["sand-processing"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "sand-processing") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "sand-processing" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["sand-processing"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["sand-processing"] = nil
        end
    end

    -- 修复 glass-processing 的问题
    if data.raw.technology["glass-processing"] then
        for i = #data.raw.technology["glass-processing"].effects, 1, -1 do
            local effect = data.raw.technology["glass-processing"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(data.raw.technology["glass-processing"].effects, i)
            end
        end

        if next(data.raw.technology["glass-processing"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "glass-processing") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "glass-processing" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["glass-processing"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["glass-processing"] = nil
        end
    end

    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        if data.raw.technology["burner-mechanics"] then
            table.insert(data.raw.technology["automation-science-pack"]
                             .prerequisites, "burner-mechanics")
        end

        data.raw.technology["automation-science-pack"].research_trigger = {
            type = "craft-item",
            item = "burner-lab",
            count = 1
        }
    end

    -- 修复 electricity 的问题
    if data.raw.technology["electricity"] then
        for i = #data.raw.technology["electricity"].effects, 1, -1 do
            local effect = data.raw.technology["electricity"].effects[i]
            if effect.type == "unlock-recipe" and
                (effect.recipe == "small-electric-pole" or effect.recipe ==
                    "electric-motor" or effect.recipe == "inserter") then
                table.remove(data.raw.technology["electricity"].effects, i)
            end
        end
    end

    -- 修复 steam-power 的问题
    if data.raw.technology["steam-power"] then
        for i = #data.raw.technology["steam-power"].prerequisites, 1, -1 do
            local prerequisite = data.raw.technology["steam-power"]
                                     .prerequisites[i]
            if prerequisite == "fluid-handling" then
                table.remove(data.raw.technology["steam-power"].prerequisites, i)
                break
            end
        end

        if data.raw.recipe["electric-motor"] then
            table.insert(data.raw.technology["steam-power"].effects,
                         {type = "unlock-recipe", recipe = "electric-motor"})
        end

        if data.raw.recipe["offshore-pump"] then
            table.insert(data.raw.technology["steam-power"].effects,
                         {type = "unlock-recipe", recipe = "offshore-pump"})
        end

        data.raw.technology["steam-power"].unit = nil

        data.raw.technology["steam-power"].research_trigger = {
            type = "craft-item",
            item = "copper-plate",
            count = 10
        }
    end

    -- 修复 basic-logistics 的问题
    if data.raw.technology["basic-logistics"] then
        for i = #data.raw.technology["basic-logistics"].prerequisites, 1, -1 do
            local prerequisite = data.raw.technology["basic-logistics"]
                                     .prerequisites[i]
            if prerequisite == "basic-wood-logistics" then
                table.remove(data.raw.technology["basic-logistics"]
                                 .prerequisites, i)
                break
            end
        end

        if data.raw.technology["electronics"] then
            table.insert(data.raw.technology["basic-logistics"].prerequisites,
                         "electronics")
        end

        if data.raw.technology["wood-logistics"] then
            table.insert(data.raw.technology["basic-logistics"].prerequisites,
                         "wood-logistics")
        end

        data.raw.technology["basic-logistics"].research_trigger = nil

        data.raw.technology["basic-logistics"].unit = {
            count = 50,
            ingredients = {{"automation-science-pack", 1}},
            time = 30
        }
    end

    -- 修复 logistics 的问题
    if data.raw.technology["logistics"] then
        if data.raw.technology["basic-logistics"] then
            table.insert(data.raw.technology["logistics"].prerequisites,
                         "basic-logistics")
        end
    end

    -- 修复 electronics 的问题
    if data.raw.technology["electronics"] then
        for i = #data.raw.technology["electronics"].effects, 1, -1 do
            local effect = data.raw.technology["electronics"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe ==
                "electronic-circuit-wood" then
                table.remove(data.raw.technology["electronics"].effects, i)
                break
            end
        end
    end

    -- 修复 basic-fluid-handling 的问题
    if data.raw.technology["basic-fluid-handling"] then
        for i = #data.raw.technology["basic-fluid-handling"].effects, 1, -1 do
            local effect =
                data.raw.technology["basic-fluid-handling"].effects[i]
            if effect.type == "unlock-recipe" then
                table.remove(
                    data.raw.technology["basic-fluid-handling"].effects, i)
            end
        end

        if next(data.raw.technology["basic-fluid-handling"].effects or {}) ==
            nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "basic-fluid-handling") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "basic-fluid-handling" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["basic-fluid-handling"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            if data.raw.technology[prerequisite] then
                                table.insert(tech.prerequisites, prerequisite)
                            end
                        end
                    end
                end
            end

            data.raw.technology["basic-fluid-handling"] = nil
        end
    end
end

-- 修复实体的问题
-- 修复 transport-belt 的问题
if data.raw["transport-belt"] then
    for _, item in pairs(data.raw["transport-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复 underground-belt 的问题
if data.raw["underground-belt"] then
    for _, item in pairs(data.raw["underground-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复 loader 的问题
if data.raw["loader"] then
    for _, item in pairs(data.raw["loader"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复 splitter 的问题
if data.raw["splitter"] then
    for _, item in pairs(data.raw["splitter"]) do
        if item.speed then item.speed = item.speed * 2 end
    end
end

-- 修复 inserter 的问题
if data.raw["inserter"] then
    for _, item in pairs(data.raw["inserter"]) do
        if item.rotation_speed then
            item.rotation_speed = item.rotation_speed * 1.5
        end
    end
end

-- 修复 underground-belt 的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["underground-belt"] then
    data.raw["underground-belt"]["underground-belt"].max_distance = 10
end

-- 修复 fast-underground-belt 的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["fast-underground-belt"] then
    data.raw["underground-belt"]["fast-underground-belt"].max_distance = 20
end

-- 修复 express-underground-belt 的问题
if data.raw["underground-belt"] and
    data.raw["underground-belt"]["express-underground-belt"] then
    data.raw["underground-belt"]["express-underground-belt"].max_distance = 40
end

-- 修复物品的问题
-- 修复 iron-plate 的问题
if data.raw.item["iron-plate"] then
    data.raw.item["iron-plate"].icon = "__base__/graphics/icons/iron-plate.png"
    data.raw.item["iron-plate"].icon_size = 64
end

-- 修复 copper-plate 的问题
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
                    if data.raw.recipe[effect.recipe] then
                        table.insert(unlock_recipes, effect)
                    end
                else
                    table.insert(other_effects, effect)
                end
            end

            table.sort(unlock_recipes,
                       function(a, b) return a.recipe < b.recipe end)

            technology.effects = other_effects
            for _, effect in ipairs(unlock_recipes) do
                if data.raw.recipe[effect.recipe] then
                    table.insert(technology.effects, effect)
                end
            end
        end
    end
end
