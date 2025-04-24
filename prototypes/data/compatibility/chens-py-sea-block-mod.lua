-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复chens-modpack-py-auxiliary-others的问题
if mods["chens-modpack-py-auxiliary-others"] then
    if mods["pycoalprocessing"] then
        -- 注册实体
        -- 注册evaporator-mk00
        local evaporator_mk00_entity
        if data.raw["assembling-machine"]["evaporator"] then
            evaporator_mk00_entity = table.deepcopy(
                                         data.raw["assembling-machine"]["evaporator"])
            evaporator_mk00_entity.name = "evaporator-mk00"
            evaporator_mk00_entity.icon = nil
            evaporator_mk00_entity.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            evaporator_mk00_entity.energy_source.type = "burner"
            evaporator_mk00_entity.energy_source.fuel_categories = {"chemical"}
            evaporator_mk00_entity.energy_source.fuel_inventory_size = 1
            evaporator_mk00_entity.energy_source.burnt_inventory_size = 1
            evaporator_mk00_entity.energy_source.burnt_result = "ash"
            evaporator_mk00_entity.minable = {
                mining_time = 1,
                result = "evaporator-mk00"
            }
            evaporator_mk00_entity.energy_usage = "500kW"
            evaporator_mk00_entity.next_upgrade = "evaporator"
            evaporator_mk00_entity.crafting_categories = {"evaporator"}

            if evaporator_mk00_entity.graphics_set and
                evaporator_mk00_entity.graphics_set.animation and
                evaporator_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(evaporator_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if evaporator_mk00_entity.graphics_set and
                evaporator_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(evaporator_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册distilator-mk00
        local distilator_mk00_entity
        if data.raw["assembling-machine"]["distilator"] then
            distilator_mk00_entity = table.deepcopy(
                                         data.raw["assembling-machine"]["distilator"])
            distilator_mk00_entity.name = "distilator-mk00"
            distilator_mk00_entity.icon = nil
            distilator_mk00_entity.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/distilator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            distilator_mk00_entity.energy_source.type = "burner"
            distilator_mk00_entity.energy_source.fuel_categories = {"chemical"}
            distilator_mk00_entity.energy_source.fuel_inventory_size = 1
            distilator_mk00_entity.energy_source.burnt_inventory_size = 1
            distilator_mk00_entity.energy_source.burnt_result = "ash"
            distilator_mk00_entity.minable = {
                mining_time = 1,
                result = "distilator-mk00"
            }
            distilator_mk00_entity.energy_usage = "500kW"
            distilator_mk00_entity.next_upgrade = "distilator"
            distilator_mk00_entity.crafting_categories = {"distilator"}

            if distilator_mk00_entity.graphics_set and
                distilator_mk00_entity.graphics_set.animation and
                distilator_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(distilator_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if distilator_mk00_entity.graphics_set and
                distilator_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(distilator_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册evaporator-mk00
        local evaporator_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-cp-buildings-mk01"] then
            evaporator_mk00_item_subgroup = table.deepcopy(
                                                data.raw["item-subgroup"]["py-cp-buildings-mk01"])
            evaporator_mk00_item_subgroup.name = "py-cp-buildings-mk00"
            evaporator_mk00_item_subgroup.group = "coal-processing"
        end

        -- 注册distilator-mk00
        local distilator_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-cp-buildings-mk01"] then
            distilator_mk00_item_subgroup = table.deepcopy(
                                                data.raw["item-subgroup"]["py-cp-buildings-mk01"])
            distilator_mk00_item_subgroup.name = "py-cp-buildings-mk00"
            distilator_mk00_item_subgroup.group = "coal-processing"
        end

        -- 注册物品
        -- 注册evaporator-mk00
        local evaporator_mk00_item
        if data.raw.item["evaporator"] then
            evaporator_mk00_item = table.deepcopy(data.raw.item["evaporator"])
            evaporator_mk00_item.name = "evaporator-mk00"
            evaporator_mk00_item.icon = nil
            evaporator_mk00_item.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }

            evaporator_mk00_item.place_result = "evaporator-mk00"
            evaporator_mk00_item.subgroup = "py-cp-buildings-mk00"
        end

        -- 注册distilator-mk00
        local distilator_mk00_item
        if data.raw.item["distilator"] then
            distilator_mk00_item = table.deepcopy(data.raw.item["distilator"])
            distilator_mk00_item.name = "distilator-mk00"
            distilator_mk00_item.icon = nil
            distilator_mk00_item.icons = {
                {
                    icon = "__pycoalprocessinggraphics__/graphics/icons/distilator.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }

            distilator_mk00_item.place_result = "distilator-mk00"
            distilator_mk00_item.subgroup = "py-cp-buildings-mk00"
            data.raw.item["distilator-mk00"] = distilator_mk00_item
        end

        -- 注册配方
        -- 注册evaporator-mk00
        local evaporator_mk00_recipe
        if data.raw.recipe["evaporator"] then
            evaporator_mk00_recipe = table.deepcopy(
                                         data.raw.recipe["evaporator"])
            evaporator_mk00_recipe.name = "evaporator-mk00"
            evaporator_mk00_recipe.ingredients = {
                {type = "item", name = "copper-plate", amount = 4},
                {type = "item", name = "iron-stick", amount = 2},
                {type = "item", name = "stone-furnace", amount = 1},
                {type = "item", name = "copper-cable", amount = 3},
                {type = "item", name = "small-parts-01", amount = 3}
            }
            evaporator_mk00_recipe.results = {
                {type = "item", name = "evaporator-mk00", amount = 1}
            }
            evaporator_mk00_recipe.enabled = false
        end

        -- 注册distilator-mk00
        local distilator_mk00_recipe
        if data.raw.recipe["distilator"] then
            distilator_mk00_recipe = table.deepcopy(
                                         data.raw.recipe["distilator"])
            distilator_mk00_recipe.name = "distilator-mk00"
            distilator_mk00_recipe.ingredients = {
                {type = "item", name = "stone-furnace", amount = 2},
                {type = "item", name = "iron-plate", amount = 4},
                {type = "item", name = "copper-cable", amount = 3},
                {type = "item", name = "pipe", amount = 3},
                {type = "item", name = "small-parts-01", amount = 2}
            }
            distilator_mk00_recipe.results = {
                {type = "item", name = "distilator-mk00", amount = 1}
            }
            distilator_mk00_recipe.enabled = false
        end

        data:extend({
            evaporator_mk00_entity, distilator_mk00_entity,
            evaporator_mk00_item_subgroup, distilator_mk00_item_subgroup,
            evaporator_mk00_item, distilator_mk00_item, evaporator_mk00_recipe,
            distilator_mk00_recipe
        })
    end

    if mods["pyrawores"] then
        -- 注册实体
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_entity
        if data.raw["assembling-machine"]["flotation-cell-mk01"] then
            flotation_cell_mk00_entity = table.deepcopy(
                                             data.raw["assembling-machine"]["flotation-cell-mk01"])
            flotation_cell_mk00_entity.name = "flotation-cell-mk00"
            flotation_cell_mk00_entity.icon = nil
            flotation_cell_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/flotation-cell-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            flotation_cell_mk00_entity.energy_source.type = "burner"
            flotation_cell_mk00_entity.energy_source.fuel_categories = {
                "chemical"
            }
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
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_entity
        if data.raw["assembling-machine"]["hydroclassifier-mk01"] then
            hydroclassifier_mk00_entity = table.deepcopy(
                                              data.raw["assembling-machine"]["hydroclassifier-mk01"])
            hydroclassifier_mk00_entity.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_entity.icon = nil
            hydroclassifier_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/hydroclassifier-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            hydroclassifier_mk00_entity.energy_source.type = "burner"
            hydroclassifier_mk00_entity.energy_source.fuel_categories = {
                "chemical"
            }
            hydroclassifier_mk00_entity.energy_source.fuel_inventory_size = 1
            hydroclassifier_mk00_entity.energy_source.burnt_inventory_size = 1
            hydroclassifier_mk00_entity.energy_source.burnt_result = "ash"
            hydroclassifier_mk00_entity.minable = {
                mining_time = 1,
                result = "hydroclassifier-mk00"
            }
            hydroclassifier_mk00_entity.energy_usage = "500kW"
            hydroclassifier_mk00_entity.next_upgrade = "hydroclassifier-mk01"
            hydroclassifier_mk00_entity.crafting_categories = {
                "hydroclassifier"
            }

            if hydroclassifier_mk00_entity.graphics_set and
                hydroclassifier_mk00_entity.graphics_set.animation and
                hydroclassifier_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(hydroclassifier_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if hydroclassifier_mk00_entity.graphics_set and
                hydroclassifier_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(hydroclassifier_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_entity
        if data.raw["assembling-machine"]["leaching-station-mk01"] then
            leaching_station_mk00_entity = table.deepcopy(
                                               data.raw["assembling-machine"]["leaching-station-mk01"])
            leaching_station_mk00_entity.name = "leaching-station-mk00"
            leaching_station_mk00_entity.icon = nil
            leaching_station_mk00_entity.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/leaching-station-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            leaching_station_mk00_entity.energy_source.type = "burner"
            leaching_station_mk00_entity.energy_source.fuel_categories = {
                "chemical"
            }
            leaching_station_mk00_entity.energy_source.fuel_inventory_size = 1
            leaching_station_mk00_entity.energy_source.burnt_inventory_size = 1
            leaching_station_mk00_entity.energy_source.burnt_result = "ash"
            leaching_station_mk00_entity.minable = {
                mining_time = 1,
                result = "leaching-station-mk00"
            }
            leaching_station_mk00_entity.energy_usage = "500kW"
            leaching_station_mk00_entity.next_upgrade = "leaching-station-mk01"
            leaching_station_mk00_entity.crafting_categories = {"leaching"}

            if leaching_station_mk00_entity.graphics_set and
                leaching_station_mk00_entity.graphics_set.animation and
                leaching_station_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(leaching_station_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if leaching_station_mk00_entity.graphics_set and
                leaching_station_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(leaching_station_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            flotation_cell_mk00_item_subgroup = table.deepcopy(
                                                    data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            flotation_cell_mk00_item_subgroup.name = "py-rawores-buildings-mk00"
            flotation_cell_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            hydroclassifier_mk00_item_subgroup = table.deepcopy(
                                                     data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            hydroclassifier_mk00_item_subgroup.name =
                "py-rawores-buildings-mk00"
            hydroclassifier_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-rawores-buildings-mk01"] then
            leaching_station_mk00_item_subgroup = table.deepcopy(
                                                      data.raw["item-subgroup"]["py-rawores-buildings-mk01"])
            leaching_station_mk00_item_subgroup.name =
                "py-rawores-buildings-mk00"
            leaching_station_mk00_item_subgroup.group = "py-rawores"
        end

        -- 注册物品
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_item
        if data.raw.item["flotation-cell-mk01"] then
            flotation_cell_mk00_item = table.deepcopy(
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
            flotation_cell_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_item
        if data.raw.item["hydroclassifier-mk01"] then
            hydroclassifier_mk00_item = table.deepcopy(
                                            data.raw.item["hydroclassifier-mk01"])
            hydroclassifier_mk00_item.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_item.icon = nil
            hydroclassifier_mk00_item.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/hydroclassifier-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            hydroclassifier_mk00_item.place_result = "hydroclassifier-mk00"
            hydroclassifier_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_item
        if data.raw.item["leaching-station-mk01"] then
            leaching_station_mk00_item = table.deepcopy(
                                             data.raw.item["leaching-station-mk01"])
            leaching_station_mk00_item.name = "leaching-station-mk00"
            leaching_station_mk00_item.icon = nil
            leaching_station_mk00_item.icons = {
                {
                    icon = "__pyraworesgraphics__/graphics/icons/leaching-station-mk01.png",
                    icon_size = 32,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            leaching_station_mk00_item.place_result = "leaching-station-mk00"
            leaching_station_mk00_item.subgroup = "py-rawores-buildings-mk00"
        end

        -- 注册配方
        -- 注册flotation-cell-mk00
        local flotation_cell_mk00_recipe
        if data.raw.recipe["flotation-cell-mk01"] then
            flotation_cell_mk00_recipe = table.deepcopy(
                                             data.raw.recipe["flotation-cell-mk01"])
            flotation_cell_mk00_recipe.name = "flotation-cell-mk00"
            flotation_cell_mk00_recipe.ingredients = {
                {type = "item", name = "iron-stick", amount = 4},
                {type = "item", name = "copper-plate", amount = 3},
                {type = "item", name = "stone", amount = 2},
                {type = "item", name = "bolts", amount = 3},
                {type = "item", name = "small-parts-01", amount = 2}
            }
            flotation_cell_mk00_recipe.results = {
                {type = "item", name = "flotation-cell-mk00", amount = 1}
            }
            flotation_cell_mk00_recipe.enabled = false
        end

        -- 注册hydroclassifier-mk00
        local hydroclassifier_mk00_recipe
        if data.raw.recipe["hydroclassifier-mk01"] then
            hydroclassifier_mk00_recipe = table.deepcopy(
                                              data.raw.recipe["hydroclassifier-mk01"])
            hydroclassifier_mk00_recipe.name = "hydroclassifier-mk00"
            hydroclassifier_mk00_recipe.ingredients = {
                {type = "item", name = "iron-plate", amount = 3},
                {type = "item", name = "stone", amount = 4},
                {type = "item", name = "copper-cable", amount = 2},
                {type = "item", name = "small-parts-01", amount = 3},
                {type = "item", name = "pipe", amount = 1}
            }
            hydroclassifier_mk00_recipe.results = {
                {type = "item", name = "hydroclassifier-mk00", amount = 1}
            }
            hydroclassifier_mk00_recipe.enabled = false
        end

        -- 注册leaching-station-mk00
        local leaching_station_mk00_recipe
        if data.raw.recipe["leaching-station-mk01"] then
            leaching_station_mk00_recipe = table.deepcopy(
                                               data.raw.recipe["leaching-station-mk01"])
            leaching_station_mk00_recipe.name = "leaching-station-mk00"
            leaching_station_mk00_recipe.ingredients = {
                {type = "item", name = "stone", amount = 5},
                {type = "item", name = "copper-plate", amount = 3},
                {type = "item", name = "iron-stick", amount = 2},
                {type = "item", name = "bolts", amount = 4},
                {type = "item", name = "small-parts-01", amount = 3}
            }
            leaching_station_mk00_recipe.results = {
                {type = "item", name = "leaching-station-mk00", amount = 1}
            }
            leaching_station_mk00_recipe.enabled = false
        end

        data:extend({
            flotation_cell_mk00_entity, hydroclassifier_mk00_entity,
            leaching_station_mk00_entity, flotation_cell_mk00_item_subgroup,
            hydroclassifier_mk00_item_subgroup,
            leaching_station_mk00_item_subgroup, flotation_cell_mk00_item,
            hydroclassifier_mk00_item, leaching_station_mk00_item,
            flotation_cell_mk00_recipe, hydroclassifier_mk00_recipe,
            leaching_station_mk00_recipe
        })
    end

    if mods["pyalienlife"] then
        -- 注册实体
        -- 注册biofactory-mk00
        local biofactory_mk00_entity
        if data.raw["assembling-machine"]["biofactory-mk01"] then
            biofactory_mk00_entity = table.deepcopy(
                                         data.raw["assembling-machine"]["biofactory-mk01"])
            biofactory_mk00_entity.name = "biofactory-mk00"
            biofactory_mk00_entity.icon = nil
            biofactory_mk00_entity.icons = {
                {
                    icon = "__pyalienlifegraphics__/graphics/icons/biofactory-mk01.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }
            biofactory_mk00_entity.energy_source.type = "burner"
            biofactory_mk00_entity.energy_source.fuel_categories = {"chemical"}
            biofactory_mk00_entity.energy_source.fuel_inventory_size = 1
            biofactory_mk00_entity.energy_source.burnt_inventory_size = 1
            biofactory_mk00_entity.energy_source.burnt_result = "ash"
            biofactory_mk00_entity.minable = {
                mining_time = 1,
                result = "biofactory-mk00"
            }
            biofactory_mk00_entity.energy_usage = "500kW"
            biofactory_mk00_entity.next_upgrade = "biofactory-mk01"
            biofactory_mk00_entity.crafting_categories = {"biofactory"}

            if biofactory_mk00_entity.graphics_set and
                biofactory_mk00_entity.graphics_set.animation and
                biofactory_mk00_entity.graphics_set.animation.layers then
                for _, layer in pairs(biofactory_mk00_entity.graphics_set
                                          .animation.layers) do
                    if layer.tint then
                        layer.tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
                    end
                end
            end

            if biofactory_mk00_entity.graphics_set and
                biofactory_mk00_entity.graphics_set.working_visualisations then
                for _, visual in pairs(biofactory_mk00_entity.graphics_set
                                           .working_visualisations) do
                    if visual.animation and visual.animation.layers then
                        for _, layer in pairs(visual.animation.layers) do
                            if layer.tint then
                                layer.tint = {
                                    r = 0.5,
                                    g = 0.5,
                                    b = 0.5,
                                    a = 1.0
                                }
                            end
                        end
                    end
                end
            end
        end

        -- 注册物品子组
        -- 注册biofactory-mk00
        local biofactory_mk00_item_subgroup
        if data.raw["item-subgroup"]["py-alienlife-buildings-mk01"] then
            biofactory_mk00_item_subgroup = table.deepcopy(
                                                data.raw["item-subgroup"]["py-alienlife-buildings-mk01"])
            biofactory_mk00_item_subgroup.name = "py-alienlife-buildings-mk00"
            biofactory_mk00_item_subgroup.group = "py-alienlife"
        end

        -- 注册物品
        -- 注册biofactory-mk00
        local biofactory_mk00_item
        if data.raw.item["biofactory-mk01"] then
            biofactory_mk00_item = table.deepcopy(
                                       data.raw.item["biofactory-mk01"])
            biofactory_mk00_item.name = "biofactory-mk00"
            biofactory_mk00_item.icon = nil
            biofactory_mk00_item.icons = {
                {
                    icon = "__pyalienlifegraphics__/graphics/icons/biofactory-mk01.png",
                    icon_size = 64,
                    tint = {r = 0.4, g = 0.4, b = 0.4, a = 1}
                }
            }

            biofactory_mk00_item.place_result = "biofactory-mk00"
            biofactory_mk00_item.subgroup = "py-alienlife-buildings-mk00"
        end

        -- 注册配方
        -- 注册biofactory-mk00
        local biofactory_mk00_recipe
        if data.raw.recipe["biofactory-mk01"] then
            biofactory_mk00_recipe = table.deepcopy(
                                         data.raw.recipe["biofactory-mk01"])
            biofactory_mk00_recipe.name = "biofactory-mk00"
            biofactory_mk00_recipe.ingredients = {
                {type = "item", name = "stone-furnace", amount = 1},
                {type = "item", name = "iron-stick", amount = 3},
                {type = "item", name = "copper-plate", amount = 2},
                {type = "item", name = "small-parts-01", amount = 3},
                {type = "item", name = "bolts", amount = 2}
            }
            biofactory_mk00_recipe.results = {
                {type = "item", name = "biofactory-mk00", amount = 1}
            }
            biofactory_mk00_recipe.enabled = false
        end

        data:extend({
            biofactory_mk00_entity, biofactory_mk00_item_subgroup,
            biofactory_mk00_item, biofactory_mk00_recipe
        })
    end

    -- 注册物品
    data:extend({ -- 注册污泥
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
        }, -- 注册有机燃料
        {
            type = "item",
            name = "organic-fuel",
            icon = "__chens-tweak-mod__/graphics/icons/organic-fuel.png",
            subgroup = "raw-resource",
            order = "a",
            stack_size = 100,
            fuel_category = "chemical",
            fuel_value = "5MJ"
        }
    })

    -- 注册配方
    -- evaporator
    if data.raw["recipe-category"]["evaporator"] then
        data:extend({ -- 注册污泥和有机废料
            {
                type = "recipe",
                name = "sludge",
                order = "a",
                category = "evaporator",
                energy_required = 1.75,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {
                        type = "item",
                        name = "sludge",
                        amount = 1,
                        probability = 0.9
                    }, {type = "item", name = "organic-waste", amount = 1},
                    {
                        type = "item",
                        name = "organic-waste",
                        amount = 1,
                        probability = 0.75
                    }
                },
                main_product = "sludge",
                enabled = true
            }
        })
    end

    -- biofactory
    if data.raw["recipe-category"]["biofactory"] then
        data:extend({ -- 注册原木
            {
                type = "recipe",
                name = "early-log",
                order = "a",
                category = "biofactory",
                energy_required = 16,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {type = "item", name = "log", amount = 1},
                    {
                        type = "item",
                        name = "saps",
                        amount = 1,
                        probability = 0.1
                    }
                },
                main_product = "log",
                enabled = false
            }, -- 注册海藻和鱼
            {
                type = "recipe",
                name = "starting-seaweed",
                order = "a",
                category = "biofactory",
                energy_required = 16,
                ingredients = {{type = "fluid", name = "water", amount = 200}},
                results = {
                    {type = "item", name = "seaweed", amount = 1},
                    {
                        type = "item",
                        name = "fish",
                        amount = 1,
                        probability = 0.05
                    }
                },
                main_product = "seaweed",
                enabled = false
            }
        })
    end

    -- hydroclassifier
    if data.raw["recipe-category"]["hydroclassifier"] then
        data:extend({ -- 注册铁矿
            {
                type = "recipe",
                name = "early-iron-ore",
                order = "a",
                category = "hydroclassifier",
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
                category = "hydroclassifier",
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
                category = "hydroclassifier",
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
                category = "hydroclassifier",
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
                category = "hydroclassifier",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "carbolic-oil", amount = 3}
                },
                results = {{type = "item", name = "kerogen", amount = 1}},
                main_product = "kerogen",
                enabled = false
            }
        })
    end

    -- nursery
    if data.raw["recipe-category"]["nursery"] then
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
    end

    -- flotation
    if data.raw["recipe-category"]["flotation"] then
        data:extend({ -- 注册铝矿
            {
                type = "recipe",
                name = "early-aluminium-ore",
                order = "a",
                category = "flotation",
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
                category = "flotation",
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
                category = "flotation",
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
                category = "flotation",
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
                category = "flotation",
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
                category = "flotation",
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
                category = "flotation",
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
    end

    -- leaching
    if data.raw["recipe-category"]["leaching"] then
        data:extend({ -- 注册天然硼砂
            {
                type = "recipe",
                name = "early-raw-borax",
                order = "a",
                category = "leaching",
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
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "coal-gas", amount = 4}
                },
                results = {{type = "item", name = "ore-quartz", amount = 1}},
                main_product = "ore-quartz",
                enabled = false
            }, -- 注册稀土矿
            {
                type = "recipe",
                name = "early-rare-earth-ore",
                order = "a",
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "naphtha", amount = 10}
                },
                results = {{type = "item", name = "rare-earth-ore", amount = 1}},
                main_product = "rare-earth-ore",
                enabled = false
            }, -- 注册铀矿
            {
                type = "recipe",
                name = "early-uranium-ore",
                order = "a",
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "sulfuric-acid", amount = 8}
                },
                results = {{type = "item", name = "uranium-ore", amount = 1}},
                main_product = "uranium-ore",
                enabled = false
            }, -- 注册锑矿
            {
                type = "recipe",
                name = "early-antimonium-ore",
                order = "a",
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "syngas", amount = 7}
                },
                results = {{type = "item", name = "antimonium-ore", amount = 1}},
                main_product = "antimonium-ore",
                enabled = false
            }, -- 注册铌矿
            {
                type = "recipe",
                name = "early-niobium-ore",
                order = "a",
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "refsyngas", amount = 6}
                },
                results = {{type = "item", name = "niobium-ore", amount = 1}},
                main_product = "niobium-ore",
                enabled = false
            }, -- 注册钼矿
            {
                type = "recipe",
                name = "early-molybdenum-ore",
                order = "a",
                category = "leaching",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "sludge", amount = 1},
                    {type = "fluid", name = "gasoline", amount = 7}
                },
                results = {{type = "item", name = "molybdenum-ore", amount = 1}},
                main_product = "molybdenum-ore",
                enabled = false
            }
        })
    end

    -- distilator
    if data.raw["recipe-category"]["distilator"] then
        data:extend({ -- 注册有机燃料
            {
                type = "recipe",
                name = "organic-fuel",
                order = "a",
                category = "distilator",
                energy_required = 2,
                ingredients = {
                    {type = "item", name = "organic-waste", amount = 5}
                },
                results = {{type = "item", name = "organic-fuel", amount = 1}},
                main_product = "organic-fuel",
                enabled = false
            }
        })
    end

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
                {type = "unlock-recipe", recipe = "early-copper-ore"},
                {type = "unlock-recipe", recipe = "distilator-mk00"},
                {type = "unlock-recipe", recipe = "organic-fuel"}
            },
            order = "a",
            localised_description = {"technology-description.basic-resources"}
        }
    })
end
