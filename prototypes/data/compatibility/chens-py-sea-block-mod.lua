-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
if mods["chens-modpack-py-auxiliary-others"] then
    if mods["pycoalprocessing"] then
        -- 注册实体
        -- 注册washer-mk00
        local washer_mk00_entity = table.deepcopy(
                                       data.raw["assembling-machine"]["washer"])
        washer_mk00_entity.name = "washer-mk00"
        washer_mk00_entity.icon =
            "__chens-tweak-mod__/graphics/icons/washer-mk00.png"
        washer_mk00_entity.energy_source.type = "burner"
        washer_mk00_entity.energy_source.fuel_categories = {"chemical"}
        washer_mk00_entity.energy_source.fuel_inventory_size = 1
        washer_mk00_entity.energy_source.burnt_inventory_size = 1
        washer_mk00_entity.energy_source.burnt_result = "ash"
        washer_mk00_entity.minable = {mining_time = 1, result = "washer-mk00"}
        washer_mk00_entity.next_upgrade = "washer"
        washer_mk00_entity.crafting_speed = 0.5
        washer_mk00_entity.crafting_categories = {"washer"}

        if washer_mk00_entity.graphics_set and
            washer_mk00_entity.graphics_set.animation and
            washer_mk00_entity.graphics_set.animation.layers then
            for _, layer in pairs(washer_mk00_entity.graphics_set.animation
                                      .layers) do
                if layer.tint then
                    layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                end
            end
        end

        if washer_mk00_entity.graphics_set and
            washer_mk00_entity.graphics_set.working_visualisations then
            for _, visual in pairs(washer_mk00_entity.graphics_set
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
        -- 注册washer-mk00
        local washer_mk00_item_subgroup = table.deepcopy(
                                              data.raw["item-subgroup"]["py-cp-buildings-mk01"])
        washer_mk00_item_subgroup.name = "py-cp-buildings-mk00"
        washer_mk00_item_subgroup.group = "production"

        -- 注册物品
        -- 注册washer-mk00
        local washer_mk00_item = table.deepcopy(data.raw.item["washer"])
        washer_mk00_item.name = "washer-mk00"
        washer_mk00_item.icon =
            "__chens-tweak-mod__/graphics/icons/washer-mk00.png"
        washer_mk00_item.place_result = "washer-mk00"
        washer_mk00_item.subgroup = "py-cp-buildings-mk00"

        -- 注册配方
        -- 注册washer-mk00
        local washer_mk00_recipe = table.deepcopy(data.raw.recipe["washer"])
        washer_mk00_recipe.name = "washer-mk00"
        washer_mk00_recipe.ingredients = {
            {type = "item", name = "pipe", amount = 2},
            {type = "item", name = "iron-plate", amount = 3},
            {type = "item", name = "small-parts-01", amount = 3}
        }
        washer_mk00_recipe.results = {
            {type = "item", name = "washer-mk00", amount = 1}
        }
        washer_mk00_recipe.enabled = false

        data:extend({
            washer_mk00_entity, washer_mk00_item_subgroup, washer_mk00_item,
            washer_mk00_recipe
        })
    end
end

-- 注册配方
data:extend({
    -- 注册原木
    {
        type = "recipe",
        name = "early-log",
        order = "a",
        category = "washer",
        energy_required = 16,
        ingredients = {{type = "fluid", name = "water", amount = 200}},
        results = {
            {type = "item", name = "log", amount = 1},
            {type = "item", name = "saps", amount = 1, probability = 0.1}
        },
        main_product = "log",
        enabled = false
    }, -- 注册石矿和干酪根
    {
        type = "recipe",
        name = "early-stone",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {{type = "fluid", name = "water", amount = 200}},
        results = {
            {
                type = "item",
                name = "stone",
                amount_min = 1,
                amount_max = 3,
                probability = 0.8
            }, {type = "item", name = "kerogen", amount_min = 1, amount_max = 3}
        },
        main_product = "stone",
        enabled = true
    }, -- 注册原煤
    {
        type = "recipe",
        name = "early-raw-coal",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "water", amount = 200}
        },
        results = {
            {
                type = "item",
                name = "raw-coal",
                amount_min = 1,
                amount_max = 3,
                probability = 0.8
            }
        },
        main_product = "raw-coal",
        enabled = false
    }, -- 注册铁矿
    {
        type = "recipe",
        name = "early-iron-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "water", amount = 200}
        },
        results = {
            {
                type = "item",
                name = "iron-ore",
                amount_min = 1,
                amount_max = 3,
                probability = 0.6
            }
        },
        main_product = "iron-ore",
        enabled = false
    }, -- 注册铜矿
    {
        type = "recipe",
        name = "early-copper-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "water", amount = 200}
        },
        results = {
            {
                type = "item",
                name = "copper-ore",
                amount_min = 1,
                amount_max = 3,
                probability = 0.4
            }
        },
        main_product = "copper-ore",
        enabled = false
    }, -- 注册稀土矿
    {
        type = "recipe",
        name = "early-rare-earth-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "naphtha", amount = 100}
        },
        results = {
            {
                type = "item",
                name = "rare-earth-ore",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "rare-earth-ore",
        enabled = false
    }, -- 注册铝矿
    {
        type = "recipe",
        name = "early-aluminium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "coal-gas", amount = 100}
        },
        results = {
            {
                type = "item",
                name = "ore-aluminium",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "ore-aluminium",
        enabled = false
    }, -- 注册天然硼砂
    {
        type = "recipe",
        name = "early-raw-borax",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "syngas", amount = 100}
        },
        results = {
            {type = "item", name = "raw-borax", amount_min = 1, amount_max = 3}
        },
        main_product = "raw-borax",
        enabled = false
    }, -- 注册铬矿
    {
        type = "recipe",
        name = "early-chromium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "syngas", amount = 40}
        },
        results = {
            {
                type = "item",
                name = "ore-chromium",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "ore-chromium",
        enabled = false
    }, -- 注册铅矿
    {
        type = "recipe",
        name = "early-lead-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "acetylene", amount = 100}
        },
        results = {
            {type = "item", name = "ore-lead", amount_min = 1, amount_max = 3}
        },
        main_product = "ore-lead",
        enabled = false
    }, -- 注册镍矿
    {
        type = "recipe",
        name = "early-nickel-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "syngas", amount = 40}
        },
        results = {
            {type = "item", name = "ore-nickel", amount_min = 1, amount_max = 3}
        },
        main_product = "ore-nickel",
        enabled = false
    }, -- 注册铌矿
    {
        type = "recipe",
        name = "early-niobium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "refsyngas", amount = 60}
        },
        results = {
            {
                type = "item",
                name = "niobium-ore",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "niobium-ore",
        enabled = false
    }, -- 注册锡矿
    {
        type = "recipe",
        name = "early-tin-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "steam", amount = 100}
        },
        results = {
            {type = "item", name = "ore-tin", amount_min = 1, amount_max = 3}
        },
        main_product = "ore-tin",
        enabled = false
    }, -- 注册钛矿
    {
        type = "recipe",
        name = "early-titanium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "acetylene", amount = 40}
        },
        results = {
            {
                type = "item",
                name = "ore-titanium",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "ore-titanium",
        enabled = false
    }, -- 注册锌矿
    {
        type = "recipe",
        name = "early-zinc-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "aromatics", amount = 40}
        },
        results = {
            {type = "item", name = "ore-zinc", amount_min = 1, amount_max = 3}
        },
        main_product = "ore-zinc",
        enabled = false
    }, -- 注册石英矿
    {
        type = "recipe",
        name = "early-quartz-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "coal-gas", amount = 300}
        },
        results = {
            {type = "item", name = "ore-quartz", amount_min = 1, amount_max = 3}
        },
        main_product = "ore-quartz",
        enabled = false
    }, -- 注册铀矿
    {
        type = "recipe",
        name = "early-uranium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "sulfuric-acid", amount = 100}
        },
        results = {
            {
                type = "item",
                name = "uranium-ore",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "uranium-ore",
        enabled = false
    }, -- 注册锑矿
    {
        type = "recipe",
        name = "early-antimonium-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "syngas", amount = 100}
        },
        results = {
            {
                type = "item",
                name = "antimonium-ore",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "antimonium-ore",
        enabled = false
    }, -- 注册钼矿
    {
        type = "recipe",
        name = "early-molybdenum-ore",
        order = "a",
        category = "washer",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "stone", amount = 1},
            {type = "fluid", name = "gasoline", amount = 100}
        },
        results = {
            {
                type = "item",
                name = "molybdenum-ore",
                amount_min = 1,
                amount_max = 3
            }
        },
        main_product = "molybdenum-ore",
        enabled = false
    }, -- 注册海藻和鱼
    {
        type = "recipe",
        name = "starting-seaweed",
        order = "a",
        category = "washer",
        energy_required = 16,
        ingredients = {{type = "fluid", name = "water", amount = 200}},
        results = {
            {type = "item", name = "seaweed", amount = 1},
            {type = "item", name = "fish", amount = 1, probability = 0.05}
        },
        main_product = "seaweed",
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
            {type = "fluid", name = "water", amount = 100}
        },
        results = {{type = "item", name = "native-flora", amount = 3}},
        main_product = "native-flora",
        enabled = false
    }, -- 注册苔藓
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
    }
})

-- 注册科技
data:extend({
    -- 注册基本资源
    {
        type = "technology",
        name = "basic-resources",
        icon = "__pypetroleumhandlinggraphics__/graphics/icons/kerogen.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {},
        research_trigger = {type = "craft-item", item = "kerogen", count = 10},
        effects = {
            {type = "unlock-recipe", recipe = "early-iron-ore"},
            {type = "unlock-recipe", recipe = "early-copper-ore"},
            {type = "unlock-recipe", recipe = "early-raw-coal"},
            {type = "unlock-recipe", recipe = "early-log"}
        },
        order = "a",
        localised_description = {"technology-description.basic-resources"}
    }
})
