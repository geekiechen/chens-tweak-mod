-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-py-sea-block-mod 的问题
if mods["chens-py-sea-block-mod"] then
    -- 修复模组的问题
    -- 修复 chens-tweak-mod 的问题
    if mods["chens-tweak-mod"] then
        -- 修复科技的问题
        -- 修复 basic-resources 的问题
        if data.raw.technology["basic-resources"] then
            table.insert(data.raw.technology["basic-resources"].effects,
                         {type = "unlock-recipe", recipe = "landfill"})
        end
    end

    -- 修复科技的问题
    -- 修复 landfill 的问题
    if data.raw.technology["landfill"] then
        for i = #data.raw.technology["landfill"].effects, 1, -1 do
            local effect = data.raw.technology["landfill"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "landfill" then
                table.remove(data.raw.technology["landfill"].effects, i)
                break
            end
        end

        if next(data.raw.technology["landfill"].effects or {}) == nil then
            for _, tech in pairs(data.raw.technology) do
                if tech.prerequisites and
                    table.contains(tech.prerequisites, "landfill") then
                    for i, prerequisite in ipairs(tech.prerequisites) do
                        if prerequisite == "landfill" then
                            table.remove(tech.prerequisites, i)
                            break
                        end
                    end

                    for _, prerequisite in ipairs(
                                               data.raw.technology["landfill"]
                                                   .prerequisites or {}) do
                        if not table.contains(tech.prerequisites, prerequisite) then
                            table.insert(tech.prerequisites, prerequisite)
                        end
                    end
                end
            end

            data.raw.technology["landfill"] = nil
        end
    end

    -- 修复配方的问题
    -- 修复 landfill 的问题
    if data.raw.recipe["landfill"] then
        data.raw.recipe["landfill"].ingredients = {
            {type = "item", name = "stone", amount = 5},
            {type = "item", name = "ash", amount = 10}
        }
    end
end

-- 修复 chens-tweak-mod 的问题
if mods["chens-tweak-mod"] then
    -- 修复科技的问题
    -- 修复 basic-resources 的问题
    if data.raw.technology["basic-resources"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-stick"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "bolts"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-gear-wheel"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "small-parts-01"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "copper-cable"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "inductor1-2"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "stone-furnace"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "iron-plate"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "copper-plate"})
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "stone-brick"})
    end
end

-- 修复 pyalienlife 的问题
if mods["pyalienlife"] then
    -- 修复实体的问题
    -- 修复 biofactory-mk01 的问题
    if data.raw["assembling-machine"]["biofactory-mk01"] then
        data.raw["assembling-machine"]["biofactory-mk01"].crafting_speed = 2
    end

    -- 修复 biofactory-mk02 的问题
    if data.raw["assembling-machine"]["biofactory-mk02"] then
        data.raw["assembling-machine"]["biofactory-mk02"].crafting_speed = 3
    end

    -- 修复 biofactory-mk03 的问题
    if data.raw["assembling-machine"]["biofactory-mk03"] then
        data.raw["assembling-machine"]["biofactory-mk03"].crafting_speed = 4
    end

    -- 修复 biofactory-mk04 的问题
    if data.raw["assembling-machine"]["biofactory-mk04"] then
        data.raw["assembling-machine"]["biofactory-mk04"].crafting_speed = 5
    end

    -- 修复科技的问题
    -- 修复 botany-mk01 的问题
    if data.raw.technology["botany-mk01"] then
        for i = #data.raw.technology["botany-mk01"].effects, 1, -1 do
            local effect = data.raw.technology["botany-mk01"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe ==
                "botanical-nursery" then
                table.remove(data.raw.technology["botany-mk01"].effects, i)
                break
            end
        end
    end

    -- 修复 mining-with-fluid 的问题
    if data.raw.technology["mining-with-fluid"] then
        table.insert(data.raw.technology["mining-with-fluid"].effects,
                     {type = "unlock-recipe", recipe = "early-aluminium-ore"})
        table.insert(data.raw.technology["mining-with-fluid"].effects,
                     {type = "unlock-recipe", recipe = "early-tin-ore"})
        table.insert(data.raw.technology["mining-with-fluid"].effects,
                     {type = "unlock-recipe", recipe = "flotation-cell-mk00"})
    end

    -- 修复 glass 的问题
    if data.raw.technology["glass"] then
        table.insert(data.raw.technology["glass"].effects,
                     {type = "unlock-recipe", recipe = "leaching-station-mk00"})
        table.insert(data.raw.technology["glass"].effects,
                     {type = "unlock-recipe", recipe = "early-quartz-ore"})
    end

    -- 修复 moss-mk01 的问题
    if data.raw.technology["moss-mk01"] then
        table.insert(data.raw.technology["moss-mk01"].effects,
                     {type = "unlock-recipe", recipe = "starting-moss"})
    end

    -- 修复配方的问题
    -- 修复 biofactory-mk01 的问题
    if data.raw.recipe["biofactory-mk01"] then
        table.insert(data.raw.recipe["biofactory-mk01"].ingredients,
                     {type = "item", name = "biofactory-mk00", amount = 1})
    end
end

-- 修复 pyalternativeenergy 的问题
if mods["pyalternativeenergy"] then
    -- 修复科技的问题
    -- 修复 uranium-processing 的问题
    if data.raw.technology["uranium-processing"] then
        table.insert(data.raw.technology["uranium-processing"].effects,
                     {type = "unlock-recipe", recipe = "early-uranium-ore"})
    end

    -- 修复 antimony-mk01 的问题
    if data.raw.technology["antimony-mk01"] then
        table.insert(data.raw.technology["antimony-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-antimonium-ore"})
    end

    -- 修复配方的问题
    -- 修复 stone-brick 的问题
    if data.raw.recipe["stone-brick"] then
        data.raw.recipe["stone-brick"].enabled = false
    end
end

-- 修复 pypetroleumhandling 的问题
if mods["pypetroleumhandling"] then
    -- 修复科技的问题
    -- 修复 kerogen 的问题
    if data.raw.technology["kerogen"] then
        table.insert(data.raw.technology["kerogen"].effects,
                     {type = "unlock-recipe", recipe = "early-kerogen"})
    end

    -- 修复配方的问题
    -- 修复 bolts 的问题
    if data.raw.recipe["bolts"] then data.raw.recipe["bolts"].enabled = false end

    -- 修复 small-parts-01 的问题
    if data.raw.recipe["small-parts-01"] then
        data.raw.recipe["small-parts-01"].enabled = false
    end

    -- 修复 burner-mining-drill 的问题
    if data.raw.recipe["burner-mining-drill"] then
        data.raw.recipe["burner-mining-drill"].enabled = false
    end
end

-- 修复 pyrawores 的问题
if mods["pyrawores"] then
    -- 修复实体的问题
    -- 修复 flotation-cell-mk01 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk01"] then
        data.raw["assembling-machine"]["flotation-cell-mk01"].crafting_speed = 2
    end

    -- 修复 flotation-cell-mk02 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk02"] then
        data.raw["assembling-machine"]["flotation-cell-mk02"].crafting_speed = 3
    end

    -- 修复 flotation-cell-mk03 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk03"] then
        data.raw["assembling-machine"]["flotation-cell-mk03"].crafting_speed = 4
    end

    -- 修复 flotation-cell-mk04 的问题
    if data.raw["assembling-machine"]["flotation-cell-mk04"] then
        data.raw["assembling-machine"]["flotation-cell-mk04"].crafting_speed = 5
    end

    -- 修复 hydroclassifier-mk01 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk01"] then
        data.raw["assembling-machine"]["hydroclassifier-mk01"].crafting_speed =
            2
    end

    -- 修复 hydroclassifier-mk02 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk02"] then
        data.raw["assembling-machine"]["hydroclassifier-mk02"].crafting_speed =
            3
    end

    -- 修复 hydroclassifier-mk03 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk03"] then
        data.raw["assembling-machine"]["hydroclassifier-mk03"].crafting_speed =
            4
    end

    -- 修复 hydroclassifier-mk04 的问题
    if data.raw["assembling-machine"]["hydroclassifier-mk04"] then
        data.raw["assembling-machine"]["hydroclassifier-mk04"].crafting_speed =
            5
    end

    -- 修复 leaching-station-mk01 的问题
    if data.raw["assembling-machine"]["leaching-station-mk01"] then
        data.raw["assembling-machine"]["leaching-station-mk01"].crafting_speed =
            2
    end

    -- 修复 leaching-station-mk02 的问题
    if data.raw["assembling-machine"]["leaching-station-mk02"] then
        data.raw["assembling-machine"]["leaching-station-mk02"].crafting_speed =
            3
    end

    -- 修复 leaching-station-mk03 的问题
    if data.raw["assembling-machine"]["leaching-station-mk03"] then
        data.raw["assembling-machine"]["leaching-station-mk03"].crafting_speed =
            4
    end

    -- 修复 leaching-station-mk04 的问题
    if data.raw["assembling-machine"]["leaching-station-mk04"] then
        data.raw["assembling-machine"]["leaching-station-mk04"].crafting_speed =
            5
    end

    -- 修复科技的问题
    -- 修复 solder-mk01 的问题
    if data.raw.technology["solder-mk01"] then
        table.insert(data.raw.technology["solder-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-lead-ore"})
        table.insert(data.raw.technology["solder-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-zinc-ore"})
    end

    -- 修复 chromium-mk01 的问题
    if data.raw.technology["chromium-mk01"] then
        table.insert(data.raw.technology["chromium-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-chromium-ore"})
    end

    -- 修复 alloys-mk01 的问题
    if data.raw.technology["alloys-mk01"] then
        table.insert(data.raw.technology["alloys-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-titanium-ore"})
    end

    -- 修复 nickel-mk01 的问题
    if data.raw.technology["nickel-mk01"] then
        table.insert(data.raw.technology["nickel-mk01"].effects,
                     {type = "unlock-recipe", recipe = "early-nickel-ore"})
    end

    -- 修复 machines-mk02 的问题
    if data.raw.technology["machines-mk02"] then
        for i = #data.raw.technology["machines-mk02"].effects, 1, -1 do
            local effect = data.raw.technology["machines-mk02"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe ==
                "leaching-station-mk01" then
                table.remove(data.raw.technology["machines-mk02"].effects, i)
                break
            end
        end
    end

    -- 修复 machines-mk01 的问题
    if data.raw.technology["machines-mk01"] then
        table.insert(data.raw.technology["machines-mk01"].effects,
                     {type = "unlock-recipe", recipe = "leaching-station-mk01"})
    end

    -- 修复配方的问题
    -- 修复 iron-plate 的问题
    if data.raw.recipe["iron-plate"] then
        data.raw.recipe["iron-plate"].enabled = false
    end

    -- 修复 copper-plate 的问题
    if data.raw.recipe["copper-plate"] then
        data.raw.recipe["copper-plate"].enabled = false
    end

    -- 修复 flotation-cell-mk01 的问题
    if data.raw.recipe["flotation-cell-mk01"] then
        table.insert(data.raw.recipe["flotation-cell-mk01"].ingredients,
                     {type = "item", name = "flotation-cell-mk00", amount = 1})
    end

    -- 修复 leaching-station-mk01 的问题
    if data.raw.recipe["leaching-station-mk01"] then
        table.insert(data.raw.recipe["leaching-station-mk01"].ingredients, {
            type = "item",
            name = "leaching-station-mk00",
            amount = 1
        })
    end

    -- 修复 hydroclassifier-mk01 的问题
    if data.raw.recipe["hydroclassifier-mk01"] then
        for i, ingredient in pairs(data.raw.recipe["hydroclassifier-mk01"]
                                       .ingredients) do
            if ingredient.name == "flotation-cell-mk01" then
                data.raw.recipe["hydroclassifier-mk01"].ingredients[i] = {
                    type = "item",
                    name = "hydroclassifier-mk00",
                    amount = ingredient.amount
                }
            end
        end
    end
end

-- 修复 pycoalprocessing 的问题
if mods["pycoalprocessing"] then
    -- 修复实体的问题
    -- 修复 distilator 的问题
    if data.raw["assembling-machine"]["distilator"] then
        data.raw["assembling-machine"]["distilator"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            burnt_result = "ash"
        }
    end

    -- 修复 evaporator 的问题
    if data.raw["assembling-machine"]["evaporator"] then
        data.raw["assembling-machine"]["evaporator"].crafting_speed = 2
    end

    -- 修复 evaporator-mk02 的问题
    if data.raw["assembling-machine"]["evaporator-mk02"] then
        data.raw["assembling-machine"]["evaporator-mk02"].crafting_speed = 3
    end

    -- 修复 evaporator-mk03 的问题
    if data.raw["assembling-machine"]["evaporator-mk03"] then
        data.raw["assembling-machine"]["evaporator-mk03"].crafting_speed = 4
    end

    -- 修复 evaporator-mk04 的问题
    if data.raw["assembling-machine"]["evaporator-mk04"] then
        data.raw["assembling-machine"]["evaporator-mk04"].crafting_speed = 5
    end

    -- 修复科技的问题
    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "starting-native-flora"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "starting-seaweed"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "log-wood"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "botanical-nursery"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "burner-inserter"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "burner-mining-drill"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "early-log"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "wooden-chest"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "hydroclassifier-mk00"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "evaporator-mk00"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "biofactory-mk00"})
    end

    -- 修复 coal-processing-1 的问题
    if data.raw.technology["coal-processing-1"] then
        table.insert(data.raw.technology["coal-processing-1"].effects,
                     {type = "unlock-recipe", recipe = "early-raw-coal"})
        table.insert(data.raw.technology["coal-processing-1"].effects,
                     {type = "unlock-recipe", recipe = "organic-fuel"})
    end

    -- 修复 steam-power 的问题
    if data.raw.technology["steam-power"] then
        for i = #data.raw.technology["steam-power"].effects, 1, -1 do
            local effect = data.raw.technology["steam-power"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "inductor1-2" then
                table.remove(data.raw.technology["steam-power"].effects, i)
            end
        end
    end

    -- 修复 niobium 的问题
    if data.raw.technology["niobium"] then
        table.insert(data.raw.technology["niobium"].effects,
                     {type = "unlock-recipe", recipe = "early-niobium-ore"})
    end

    -- 修复配方的问题
    -- 修复 log-wood 的问题
    if data.raw.recipe["log-wood"] then
        data.raw.recipe["log-wood"].enabled = false
    end

    -- 修复 copper-cable 的问题
    if data.raw.recipe["copper-cable"] then
        data.raw.recipe["copper-cable"].enabled = false
    end

    -- 修复 burner-inserter 的问题
    if data.raw.recipe["burner-inserter"] then
        data.raw.recipe["burner-inserter"].enabled = false
    end

    -- 修复 botanical-nursery 的问题
    if data.raw.recipe["botanical-nursery"] then
        for i = #data.raw.recipe["botanical-nursery"].ingredients, 1, -1 do
            local ingredient =
                data.raw.recipe["botanical-nursery"].ingredients[i]
            local name = ingredient[1] or ingredient.name
            if name == "glass" or name == "fluid-drill-mk01" or name ==
                "soil-extractor-mk01" then
                table.remove(data.raw.recipe["botanical-nursery"].ingredients, i)
            end
        end
    end

    -- 修复 evaporator 的问题
    if data.raw.recipe["evaporator"] then
        table.insert(data.raw.recipe["evaporator"].ingredients,
                     {type = "item", name = "evaporator-mk00", amount = 1})
    end
end

-- 修复 pyindustry 的问题
if mods["pyindustry"] then
    -- 修复配方的问题
    -- 修复 stone-furnace 的问题
    if data.raw.recipe["stone-furnace"] then
        data.raw.recipe["stone-furnace"].enabled = false
    end

    -- 修复 pipe 的问题
    if data.raw.recipe["pipe"] then data.raw.recipe["pipe"].enabled = false end

    -- 修复 pipe-to-ground 的问题
    if data.raw.recipe["pipe-to-ground"] then
        data.raw.recipe["pipe-to-ground"].enabled = false
    end

    -- 修复 iron-gear-wheel 的问题
    if data.raw.recipe["iron-gear-wheel"] then
        data.raw.recipe["iron-gear-wheel"].enabled = false
    end

    -- 修复 iron-stick 的问题
    if data.raw.recipe["iron-stick"] then
        data.raw.recipe["iron-stick"].enabled = false
    end
end

-- 修复 pyhightech 的问题
if mods["pyhightech"] then
    -- 修复科技的问题
    -- 修复 rare-earth-tech 的问题
    if data.raw.technology["rare-earth-tech"] then
        table.insert(data.raw.technology["rare-earth-tech"].effects,
                     {type = "unlock-recipe", recipe = "early-rare-earth-ore"})
    end
end

-- 修复 pyfusionenergy 的问题
if mods["pyfusionenergy"] then
    -- 修复科技的问题
    -- 修复 boron 的问题
    if data.raw.technology["boron"] then
        table.insert(data.raw.technology["boron"].effects,
                     {type = "unlock-recipe", recipe = "early-raw-borax"})
    end

    -- 修复 molybdenum-processing 的问题
    if data.raw.technology["molybdenum-processing"] then
        table.insert(data.raw.technology["molybdenum-processing"].effects,
                     {type = "unlock-recipe", recipe = "early-molybdenum-ore"})
    end
end

-- 修复 wood-logistics 的问题
if mods["wood-logistics"] then
    -- 修复科技的问题
    -- 修复 automation-science-pack 的问题
    if data.raw.technology["automation-science-pack"] then
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "wood-transport-belt"})
        table.insert(data.raw.technology["automation-science-pack"].effects,
                     {type = "unlock-recipe", recipe = "lumber"})
    end

    -- 修复配方的问题
    -- 修复 wooden-chest 的问题
    if data.raw.recipe["wooden-chest"] then
        data.raw.recipe["wooden-chest"].enabled = false
    end

    -- 修复 lumber 的问题
    if data.raw.recipe["lumber"] then
        data.raw.recipe["lumber"].enabled = false
    end

    -- 修复 wood-transport-belt 的问题
    if data.raw.recipe["wood-transport-belt"] then
        data.raw.recipe["wood-transport-belt"].enabled = false
    end
end

-- 修复科技的问题
-- 修复 steam-power 的问题
if data.raw.technology["steam-power"] then
    table.insert(data.raw.technology["steam-power"].prerequisites,
                 "basic-resources")
end
