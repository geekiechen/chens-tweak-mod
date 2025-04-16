-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
if mods["chens-modpack-py-auxiliary-others"] then
    if mods["pyrawores"] then
        -- 注册实体
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_entity = table.deepcopy(
                                               data.raw["assembling-machine"]["flotation-cell-mk01"])
        flotation_cell_mk00_entity.name = "flotation-cell-mk00"
        flotation_cell_mk00_entity.icon = nil
        flotation_cell_mk00_entity.icons = {
            {
                icon = "__pyraworesgraphics__/graphics/icons/flotation-cell-mk01.png",
                icon_size = 32,
                tint = {r = 0.5, g = 0.5, b = 0.5, a = 1}
            }
        }
        flotation_cell_mk00_entity.energy_source.type = "burner"
        flotation_cell_mk00_entity.energy_source.fuel_categories = {"chemical"}
        flotation_cell_mk00_entity.energy_source.fuel_inventory_size = 1
        flotation_cell_mk00_entity.energy_source.burnt_inventory_size = 1
        flotation_cell_mk00_entity.energy_source.burnt_result = "ash"
        flotation_cell_mk00_entity.minable = {
            mining_time = 1,
            result = "flotation-cell-mk00"
        }
        flotation_cell_mk00_entity.energy_usage = "500kW"
        flotation_cell_mk00_entity.next_upgrade = "flotation-cell-mk01"
        flotation_cell_mk00_entity.crafting_categories = {"flotation"}

        if flotation_cell_mk00_entity.graphics_set and
            flotation_cell_mk00_entity.graphics_set.animation and
            flotation_cell_mk00_entity.graphics_set.animation.layers then
            for _, layer in pairs(flotation_cell_mk00_entity.graphics_set
                                      .animation.layers) do
                if layer.tint then
                    layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                end
            end
        end

        if flotation_cell_mk00_entity.graphics_set and
            flotation_cell_mk00_entity.graphics_set.working_visualisations then
            for _, visual in pairs(flotation_cell_mk00_entity.graphics_set
                                       .working_visualisations) do
                if visual.animation and visual.animation.layers then
                    for _, layer in pairs(visual.animation.layers) do
                        if layer.tint then
                            layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item_subgroup = table.deepcopy(
                                                      data.raw["item-subgroup"]["py-cp-buildings-mk01"])
        flotation_cell_mk00_item_subgroup.name = "py-cp-buildings-mk00"
        flotation_cell_mk00_item_subgroup.group = "production"

        -- 注册物品
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item = table.deepcopy(
                                             data.raw.item["flotation-cell-mk01"])
        flotation_cell_mk00_item.name = "flotation-cell-mk00"
        flotation_cell_mk00_item.icon = nil
        flotation_cell_mk00_item.icons = {
            {
                icon = "__pyraworesgraphics__/graphics/icons/flotation-cell-mk01.png",
                icon_size = 32,
                tint = {r = 0.5, g = 0.5, b = 0.5, a = 1}
            }
        }

        flotation_cell_mk00_item.place_result = "flotation-cell-mk00"
        flotation_cell_mk00_item.subgroup = "py-cp-buildings-mk00"

        -- 注册配方
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_recipe = table.deepcopy(
                                               data.raw.recipe["flotation-cell-mk01"])
        flotation_cell_mk00_recipe.name = "flotation-cell-mk00"
        flotation_cell_mk00_recipe.ingredients = {
            {type = "item", name = "pipe", amount = 3},
            {type = "item", name = "iron-plate", amount = 3},
            {type = "item", name = "small-parts-01", amount = 3}
        }
        flotation_cell_mk00_recipe.results = {
            {type = "item", name = "flotation-cell-mk00", amount = 1}
        }
        flotation_cell_mk00_recipe.enabled = false

        data:extend({
            flotation_cell_mk00_entity, flotation_cell_mk00_item_subgroup,
            flotation_cell_mk00_item, flotation_cell_mk00_recipe
        })

    end

    if mods["pyalienlife"] then
        for i = 1, 4 do
            local base_name = "fluid-drill-mk0" .. i
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"fluid-drill-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.fluid_boxes = {table.deepcopy(entity.input_fluid_box)}
            entity.fluid_boxes[1].production_type = "input"
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        -- 注册配方类型
        data:extend({ -- 注册fluid-drill-crafting
            {type = "recipe-category", name = "fluid-drill-crafting"}
        })
    end

    if mods["pyalternativeenergy"] then
        for i = 1, 4 do
            local base_name = "ree-mining-drill-mk0" .. i
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"ree-mining-drill-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.fluid_boxes = {table.deepcopy(entity.input_fluid_box)}
            entity.fluid_boxes[1].production_type = "input"
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        do
            local base_name = "uranium-mining-drill"
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"uranium-mining-drill-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        for i = 1, 4 do
            local base_name = "antimony-drill-mk0" .. i
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"antimony-drill-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        -- 注册配方类型
        data:extend({ -- 注册ree-mining-drill-crafting
            {type = "recipe-category", name = "ree-mining-drill-crafting"},
            -- 注册uranium-mining-drill-crafting
            {type = "recipe-category", name = "uranium-mining-drill-crafting"},
            -- 注册antimony-drill-crafting
            {type = "recipe-category", name = "antimony-drill-crafting"}
        })
    end

    if mods["pycoalprocessing"] then
        for i = 1, 4 do
            local base_name = i == 1 and "borax-mine" or "borax-mine-mk0" .. i
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"borax-mine-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.fluid_boxes = {table.deepcopy(entity.input_fluid_box)}
            entity.fluid_boxes[1].production_type = "input"
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        do
            local base_name = "niobium-mine"
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"niobium-mine-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.fluid_boxes = {table.deepcopy(entity.input_fluid_box)}
            entity.fluid_boxes[1].production_type = "input"
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        -- 注册配方类型
        data:extend({ -- 注册borax-mine-crafting
            {type = "recipe-category", name = "borax-mine-crafting"},
            -- 注册niobium-mine
            {type = "recipe-category", name = "niobium-mine-crafting"}
        })
    end

    if mods["pyfusionenergy"] then
        do
            local base_name = "mo-mine"
            local assembler_name = base_name .. "-assembler"

            -- 注册实体
            local entity = table.deepcopy(data.raw["mining-drill"][base_name])
            entity.type = "assembling-machine"
            entity.name = assembler_name
            entity.minable = {mining_time = 1, result = assembler_name}
            entity.crafting_categories = {"mo-mine-crafting"}
            entity.crafting_speed = entity.mining_speed
            entity.module_slots = 2
            entity.allowed_effects = {
                "speed", "productivity", "consumption", "pollution"
            }
            entity.resource_categories = nil
            entity.mining_speed = nil

            -- 注册物品
            local item = table.deepcopy(data.raw.item[base_name])
            item.name = assembler_name
            item.place_result = assembler_name

            -- 注册配方
            local recipe = {
                type = "recipe",
                name = assembler_name,
                category = "crafting",
                ingredients = {{type = "item", name = base_name, amount = 1}},
                results = {{type = "item", name = assembler_name, amount = 1}},
                main_product = assembler_name,
                energy_required = 1,
                enabled = false
            }

            -- 注册反向配方
            local reverse_recipe = {
                type = "recipe",
                name = assembler_name .. "-reverse",
                category = "crafting",
                ingredients = {
                    {type = "item", name = assembler_name, amount = 1}
                },
                results = {{type = "item", name = base_name, amount = 1}},
                main_product = base_name,
                energy_required = 1,
                enabled = false
            }

            data:extend({entity, item, recipe, reverse_recipe})
        end

        -- 注册配方类型
        data:extend({ -- 注册mo-mine
            {type = "recipe-category", name = "mo-mine-crafting"}
        })
    end

    -- 注册配方
    -- flotation
    data:extend({
        -- 注册污泥和有机废料
        {
            type = "recipe",
            name = "sludge",
            order = "a",
            category = "flotation",
            energy_required = 1.75,
            ingredients = {{type = "fluid", name = "water", amount = 200}},
            results = {
                {type = "item", name = "sludge", amount = 1, probability = 0.6},
                {type = "item", name = "sludge", amount = 1, probability = 0.3},
                {type = "item", name = "organic-waste", amount = 1},
                {
                    type = "item",
                    name = "organic-waste",
                    amount = 1,
                    probability = 0.7
                }
            },
            main_product = "sludge",
            enabled = true
        }, -- 注册铁矿
        {
            type = "recipe",
            name = "early-iron-ore",
            order = "a",
            category = "flotation",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "water", amount = 10}
            },
            results = {{type = "item", name = "iron-ore", amount = 1}},
            main_product = "iron-ore",
            enabled = false
        }, -- 注册铜矿
        {
            type = "recipe",
            name = "early-copper-ore",
            order = "a",
            category = "flotation",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "water", amount = 10}
            },
            results = {{type = "item", name = "copper-ore", amount = 1}},
            main_product = "copper-ore",
            enabled = false
        }, -- 注册石矿
        {
            type = "recipe",
            name = "early-stone",
            order = "a",
            category = "flotation",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "water", amount = 10}
            },
            results = {{type = "item", name = "stone", amount = 1}},
            main_product = "stone",
            enabled = false
        }, -- 注册原煤
        {
            type = "recipe",
            name = "early-raw-coal",
            order = "a",
            category = "flotation",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "water", amount = 10}
            },
            results = {{type = "item", name = "raw-coal", amount = 1}},
            main_product = "raw-coal",
            enabled = false
        }, -- 注册干酪根
        {
            type = "recipe",
            name = "early-kerogen",
            order = "a",
            category = "flotation",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "carbolic-oil", amount = 3}
            },
            results = {{type = "item", name = "kerogen", amount = 1}},
            main_product = "kerogen",
            enabled = false
        }, -- 注册原木
        {
            type = "recipe",
            name = "early-log",
            order = "a",
            category = "flotation",
            energy_required = 16,
            ingredients = {{type = "fluid", name = "water", amount = 200}},
            results = {
                {type = "item", name = "log", amount = 1},
                {type = "item", name = "saps", amount = 1, probability = 0.1}
            },
            main_product = "log",
            enabled = false
        }, -- 注册海藻和鱼
        {
            type = "recipe",
            name = "starting-seaweed",
            order = "a",
            category = "flotation",
            energy_required = 16,
            ingredients = {{type = "fluid", name = "water", amount = 200}},
            results = {
                {type = "item", name = "seaweed", amount = 1},
                {type = "item", name = "fish", amount = 1, probability = 0.05}
            },
            main_product = "seaweed",
            enabled = false
        }
    })

    -- nursery
    data:extend({ -- 注册苔藓
        {
            type = "recipe",
            name = "starting-moss",
            order = "a",
            category = "nursery",
            energy_required = 20,
            ingredients = {
                {type = "item", name = "seaweed", amount = 1},
                {type = "item", name = "stone", amount = 5},
                {type = "fluid", name = "water", amount = 100}
            },
            results = {{type = "item", name = "moss", amount = 3}},
            main_product = "moss",
            enabled = false
        }, -- 注册原生花卉
        {
            type = "recipe",
            name = "starting-native-flora",
            order = "a",
            category = "nursery",
            energy_required = 8,
            ingredients = {
                {type = "item", name = "seaweed", amount = 1},
                {type = "item", name = "soil", amount = 5},
                {type = "fluid", name = "water", amount = 200}
            },
            results = {{type = "item", name = "native-flora", amount = 3}},
            main_product = "native-flora",
            enabled = false
        }
    })

    -- fluid-drill-crafting
    data:extend({ -- 注册铝矿
        {
            type = "recipe",
            name = "early-aluminium-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "coal-gas", amount = 10}
            },
            results = {{type = "item", name = "ore-aluminium", amount = 1}},
            main_product = "ore-aluminium",
            enabled = false
        }, -- 注册锡矿
        {
            type = "recipe",
            name = "early-tin-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "steam", amount = 10}
            },
            results = {{type = "item", name = "ore-tin", amount = 1}},
            main_product = "ore-tin",
            enabled = false
        }, -- 注册锌矿
        {
            type = "recipe",
            name = "early-zinc-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "aromatics", amount = 4}
            },
            results = {{type = "item", name = "ore-zinc", amount = 1}},
            main_product = "ore-zinc",
            enabled = false
        }, -- 注册铅矿
        {
            type = "recipe",
            name = "early-lead-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "acetylene", amount = 10}
            },
            results = {{type = "item", name = "ore-lead", amount = 1}},
            main_product = "ore-lead",
            enabled = false
        }, -- 注册钛矿
        {
            type = "recipe",
            name = "early-titanium-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "acetylene", amount = 4}
            },
            results = {{type = "item", name = "ore-titanium", amount = 1}},
            main_product = "ore-titanium",
            enabled = false
        }, -- 注册镍矿
        {
            type = "recipe",
            name = "early-nickel-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "syngas", amount = 4}
            },
            results = {{type = "item", name = "ore-nickel", amount = 1}},
            main_product = "ore-nickel",
            enabled = false
        }, -- 注册铬矿
        {
            type = "recipe",
            name = "early-chromium-ore",
            order = "a",
            category = "fluid-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "syngas", amount = 4}
            },
            results = {{type = "item", name = "ore-chromium", amount = 1}},
            main_product = "ore-chromium",
            enabled = false
        }
    })

    -- ree-mining-drill-crafting
    data:extend({ -- 注册稀土矿
        {
            type = "recipe",
            name = "early-rare-earth-ore",
            order = "a",
            category = "ree-mining-drill-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "naphtha", amount = 10}
            },
            results = {{type = "item", name = "rare-earth-ore", amount = 1}},
            main_product = "rare-earth-ore",
            enabled = false
        }
    })

    -- borax-mine-crafting
    data:extend({ -- 注册天然硼砂
        {
            type = "recipe",
            name = "early-raw-borax",
            order = "a",
            category = "borax-mine-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "syngas", amount = 3}
            },
            results = {{type = "item", name = "raw-borax", amount = 1}},
            main_product = "raw-borax",
            enabled = false
        }, -- 注册石英矿
        {
            type = "recipe",
            name = "early-quartz-ore",
            order = "a",
            category = "borax-mine-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "coal-gas", amount = 4}
            },
            results = {{type = "item", name = "ore-quartz", amount = 1}},
            main_product = "ore-quartz",
            enabled = false
        }
    })

    -- uranium-mining-drill-crafting
    data:extend({ -- 注册铀矿
        {
            type = "recipe",
            name = "early-uranium-ore",
            order = "a",
            category = "uranium-mining-drill-crafting",
            energy_required = 2,
            ingredients = {{type = "item", name = "sludge", amount = 1}},
            results = {{type = "item", name = "uranium-ore", amount = 1}},
            main_product = "uranium-ore",
            enabled = false
        }
    })

    -- antimony-drill-crafting
    data:extend({ -- 注册锑矿
        {
            type = "recipe",
            name = "early-antimonium-ore",
            order = "a",
            category = "antimony-drill-crafting",
            energy_required = 2,
            ingredients = {{type = "item", name = "sludge", amount = 1}},
            results = {{type = "item", name = "antimonium-ore", amount = 1}},
            main_product = "antimonium-ore",
            enabled = false
        }
    })

    -- niobium-mine-crafting
    data:extend({ -- 注册铌矿
        {
            type = "recipe",
            name = "early-niobium-ore",
            order = "a",
            category = "niobium-mine-crafting",
            energy_required = 2,
            ingredients = {
                {type = "item", name = "sludge", amount = 1},
                {type = "fluid", name = "refsyngas", amount = 6}
            },
            results = {{type = "item", name = "niobium-ore", amount = 1}},
            main_product = "niobium-ore",
            enabled = false
        }
    })

    -- mo-mine-crafting
    data:extend({ -- 注册钼矿
        {
            type = "recipe",
            name = "early-molybdenum-ore",
            order = "a",
            category = "mo-mine-crafting",
            energy_required = 2,
            ingredients = {{type = "item", name = "sludge", amount = 1}},
            results = {{type = "item", name = "molybdenum-ore", amount = 1}},
            main_product = "molybdenum-ore",
            enabled = false
        }
    })

    -- 注册科技
    data:extend({
        -- 注册基本资源
        {
            type = "technology",
            name = "basic-resources",
            icon = "__chens-tweak-mod__/graphics/icons/sludge.png",
            prerequisites = {},
            research_trigger = {
                type = "craft-item",
                item = "sludge",
                count = 10
            },
            effects = {
                {type = "unlock-recipe", recipe = "early-stone"},
                {type = "unlock-recipe", recipe = "early-iron-ore"},
                {type = "unlock-recipe", recipe = "early-copper-ore"}
            },
            order = "a",
            localised_description = {"technology-description.basic-resources"}
        }
    })
end

-- 注册物品
data:extend({
    -- 注册污泥
    {
        type = "item",
        name = "sludge",
        icon = "__chens-tweak-mod__/graphics/icons/sludge.png",
        subgroup = "raw-resource",
        order = "a",
        stack_size = 100
    }, -- 注册有机废料
    {
        type = "item",
        name = "organic-waste",
        icon = "__chens-tweak-mod__/graphics/icons/organic-waste.png",
        subgroup = "raw-resource",
        order = "a",
        stack_size = 100,
        fuel_category = "chemical",
        fuel_value = "1.25MJ"
    }
})

