-- 修复chens-py-sea-block-mod设置的问题
if mods["chens-py-sea-block-mod"] then
    -- 修复chens-tweak-mod模组的问题
    if mods["chens-tweak-mod"] then
        table.insert(data.raw.technology["basic-resources"].effects,
                     {type = "unlock-recipe", recipe = "landfill"})
    end
end

-- 修复chens-tweak-mod模组的问题
if mods["chens-tweak-mod"] then
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

-- 修复pyalienlife模组的问题
if mods["pyalienlife"] then
    -- 修复科技的问题
    -- 修复botany-mk01的问题
    for i = #data.raw.technology["botany-mk01"].effects, 1, -1 do
        local effect = data.raw.technology["botany-mk01"].effects[i]
        if effect.type == "unlock-recipe" and effect.recipe ==
            "botanical-nursery" then
            table.remove(data.raw.technology["botany-mk01"].effects, i)
            break
        end
    end

    -- 修复mining-with-fluid的问题
    table.insert(data.raw.technology["mining-with-fluid"].effects,
                 {type = "unlock-recipe", recipe = "early-aluminium-ore"})
    table.insert(data.raw.technology["mining-with-fluid"].effects,
                 {type = "unlock-recipe", recipe = "early-tin-ore"})

    -- 修复moss-mk01的问题
    table.insert(data.raw.technology["moss-mk01"].effects,
                 {type = "unlock-recipe", recipe = "starting-moss"})

    -- 修复glass的问题
    table.insert(data.raw.technology["glass"].effects,
                 {type = "unlock-recipe", recipe = "early-quartz-ore"})

    -- 修复fluid-drill的问题
    for i = 1, 4 do
        local base_name = "fluid-drill-mk0" .. i
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end
end

-- 修复pyalternativeenergy模组的问题
if mods["pyalternativeenergy"] then
    -- 修复科技的问题
    -- 修复ree-mining-drill的问题
    for i = 1, 4 do
        local base_name = "ree-mining-drill-mk0" .. i
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复uranium-processing的问题
    table.insert(data.raw.technology["uranium-processing"].effects,
                 {type = "unlock-recipe", recipe = "early-uranium-ore"})

    -- 修复antimony-mk01的问题
    table.insert(data.raw.technology["antimony-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-antimonium-ore"})

    -- 修复ree-mining-drill的问题
    for i = 1, 4 do
        local base_name = "ree-mining-drill-mk0" .. i
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复uranium-mining-drill的问题
    do
        local base_name = "uranium-mining-drill"
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复antimony-drill的问题
    for i = 1, 4 do
        local base_name = "antimony-drill-mk0" .. i
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复配方的问题
    -- 修复stone-brick的问题
    data.raw.recipe["stone-brick"].enabled = false
end

-- 修复pypetroleumhandling模组的问题
if mods["pypetroleumhandling"] then
    -- 修复科技的问题
    -- 修复kerogen的问题
    table.insert(data.raw.technology["kerogen"].effects,
                 {type = "unlock-recipe", recipe = "early-kerogen"})

    -- 修复配方的问题
    -- 修复bolts的问题
    data.raw.recipe["bolts"].enabled = false

    -- 修复small-parts-01的问题
    data.raw.recipe["small-parts-01"].enabled = false

    -- 修复burner-mining-drill的问题
    data.raw.recipe["burner-mining-drill"].enabled = false
end

-- 修复pyrawores模组的问题
if mods["pyrawores"] then
    -- 修复实体的问题
    -- 修复flotation-cell-mk01的问题
    data.raw["assembling-machine"]["flotation-cell-mk01"].crafting_speed = 2

    -- 修复flotation-cell-mk02的问题
    data.raw["assembling-machine"]["flotation-cell-mk02"].crafting_speed = 3

    -- 修复flotation-cell-mk03的问题
    data.raw["assembling-machine"]["flotation-cell-mk03"].crafting_speed = 4

    -- 修复flotation-cell-mk04的问题
    data.raw["assembling-machine"]["flotation-cell-mk04"].crafting_speed = 5

    -- 修复科技的问题
    -- 修复solder-mk01的问题
    table.insert(data.raw.technology["solder-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-lead-ore"})
    table.insert(data.raw.technology["solder-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-zinc-ore"})

    -- 修复chromium-mk01的问题
    table.insert(data.raw.technology["chromium-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-chromium-ore"})

    -- 修复alloys-mk01的问题
    table.insert(data.raw.technology["alloys-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-titanium-ore"})

    -- 修复nickel-mk01的问题
    table.insert(data.raw.technology["nickel-mk01"].effects,
                 {type = "unlock-recipe", recipe = "early-nickel-ore"})

    -- 修复配方的问题
    -- 修复iron-plate的问题
    data.raw.recipe["iron-plate"].enabled = false

    -- 修复copper-plate的问题
    data.raw.recipe["copper-plate"].enabled = false

    -- 修复flotation-cell-mk01的问题
    table.insert(data.raw.recipe["flotation-cell-mk01"].ingredients,
                 {type = "item", name = "flotation-cell-mk00", amount = 1})
end

-- 修复pycoalprocessing模组的问题
if mods["pycoalprocessing"] then
    -- 修复科技的问题
    -- 修复automation-science-pack的问题
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "starting-native-flora"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "starting-seaweed"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "log-wood"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "botanical-nursery"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "flotation-cell-mk00"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "burner-inserter"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "burner-mining-drill"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "early-log"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "wooden-chest"})

    -- 修复coal-processing-1的问题
    table.insert(data.raw.technology["coal-processing-1"].effects,
                 {type = "unlock-recipe", recipe = "early-raw-coal"})

    -- 修复steam-power的问题
    for i = #data.raw.technology["steam-power"].effects, 1, -1 do
        local effect = data.raw.technology["steam-power"].effects[i]
        if effect.type == "unlock-recipe" and effect.recipe == "inductor1-2" then
            table.remove(data.raw.technology["steam-power"].effects, i)
        end
    end

    -- 修复niobium的问题
    table.insert(data.raw.technology["niobium"].effects,
                 {type = "unlock-recipe", recipe = "early-niobium-ore"})

    -- 修复borax-mine的问题
    for i = 1, 4 do
        local base_name = i == 1 and "borax-mine" or "borax-mine-mk0" .. i
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复niobium-mine的问题
    do
        local base_name = "niobium-mine"
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end

    -- 修复配方的问题
    -- 修复log-wood的问题
    data.raw.recipe["log-wood"].enabled = false

    -- 修复copper-cable的问题
    data.raw.recipe["copper-cable"].enabled = false

    -- 修复burner-inserter的问题
    data.raw.recipe["burner-inserter"].enabled = false

    -- 修复botanical-nursery的问题
    for i = #data.raw.recipe["botanical-nursery"].ingredients, 1, -1 do
        local ingredient = data.raw.recipe["botanical-nursery"].ingredients[i]
        local name = ingredient[1] or ingredient.name
        if name == "glass" or name == "fluid-drill-mk01" or name ==
            "soil-extractor-mk01" then
            table.remove(data.raw.recipe["botanical-nursery"].ingredients, i)
        end
    end

end

-- 修复pyindustry模组的问题
if mods["pyindustry"] then
    -- 修复配方的问题
    -- 修复stone-furnace的问题
    data.raw.recipe["stone-furnace"].enabled = false

    -- 修复pipe的问题
    data.raw.recipe["pipe"].enabled = false

    -- 修复pipe-to-ground的问题
    data.raw.recipe["pipe-to-ground"].enabled = false

    -- 修复iron-gear-wheel的问题
    data.raw.recipe["iron-gear-wheel"].enabled = false

    -- 修复iron-stick的问题
    data.raw.recipe["iron-stick"].enabled = false
end

-- 修复pyhightech模组的问题
if mods["pyhightech"] then
    -- 修复科技的问题
    -- 修复rare-earth-tech的问题
    table.insert(data.raw.technology["rare-earth-tech"].effects,
                 {type = "unlock-recipe", recipe = "early-rare-earth-ore"})
end

-- 修复pyfusionenergy模组的问题
if mods["pyfusionenergy"] then
    -- 修复科技的问题
    -- 修复boron的问题
    table.insert(data.raw.technology["boron"].effects,
                 {type = "unlock-recipe", recipe = "early-raw-borax"})

    -- 修复molybdenum-processing的问题
    table.insert(data.raw.technology["molybdenum-processing"].effects,
                 {type = "unlock-recipe", recipe = "early-molybdenum-ore"})

    -- 修复mo-mine的问题
    do
        local base_name = "mo-mine"
        local assembler_name = base_name .. "-assembler"

        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe ==
                        base_name then

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name
                        })

                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = assembler_name .. "-reverse"
                        })
                        break
                    end
                end
            end
        end
    end
end

-- 修复wood-logistics模组的问题
if mods["wood-logistics"] then
    -- 修复科技的问题
    -- 修复automation-science-pack的问题
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "wood-transport-belt"})
    table.insert(data.raw.technology["automation-science-pack"].effects,
                 {type = "unlock-recipe", recipe = "lumber"})

    -- 修复配方的问题
    -- 修复wooden-chest的问题
    data.raw.recipe["wooden-chest"].enabled = false

    -- 修复lumber的问题
    data.raw.recipe["lumber"].enabled = false

    -- 修复wood-transport-belt的问题
    data.raw.recipe["wood-transport-belt"].enabled = false
end

-- 修复科技的问题
-- 修复landfill的问题
for i = #data.raw.technology["landfill"].effects, 1, -1 do
    local effect = data.raw.technology["landfill"].effects[i]
    if effect.type == "unlock-recipe" and effect.recipe == "landfill" then
        table.remove(data.raw.technology["landfill"].effects, i)
        break
    end
end

if data.raw.technology["landfill"] and
    next(data.raw.technology["landfill"].effects or {}) == nil then
    for _, tech in pairs(data.raw.technology) do
        if tech.prerequisites and table.contains(tech.prerequisites, "landfill") then
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

-- 修复steam-power的问题
table.insert(data.raw.technology["steam-power"].prerequisites, "basic-resources")

-- 修复配方的问题
-- 修复landfill的问题
if data.raw.recipe["landfill"] then
    data.raw.recipe["landfill"].ingredients = {}
    table.insert(data.raw.recipe["landfill"].ingredients,
                 {type = "item", name = "stone", amount = 3})
end
