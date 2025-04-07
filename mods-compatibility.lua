-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复chens-modpack-py-auxiliary-others模组的问题
if mods["chens-modpack-py-auxiliary-others"] then
    -- 修复land-block的问题
    if settings.startup["terrain-selection"].value == "land-block" then
        -- 注册地图预设
        data:extend({
            {
                type = "noise-expression",
                name = "chens-tweak-mod_land_block",
                intended_property = "elevation",
                expression = "1"
            }, {
                type = "map-gen-presets",
                name = "default",
                default = {default = true, order = "a"},
                ["chens-tweak-mod-land-block"] = {
                    order = "b",
                    basic_settings = {
                        property_expression_names = {
                            elevation = "chens-tweak-mod_land_block"
                        },
                        autoplace_settings = {
                            entity = {
                                treat_missing_as_default = false,
                                settings = {
                                    fish = {frequency = 0},
                                    seaweed = {frequency = 0}
                                }
                            }
                        },
                        autoplace_controls = {["enemy-base"] = {frequency = 0}}
                    }
                }
            }
        })
    end

    -- 修复land-block-no-resource的问题
    if settings.startup["terrain-selection"].value == "land-block-no-resource" then
        -- 注册地图预设
        data:extend({
            {
                type = "noise-expression",
                name = "chens-tweak-mod_land_block_no_resource",
                intended_property = "elevation",
                expression = "1"
            }, {
                type = "map-gen-presets",
                name = "default",
                default = {default = true, order = "a"},
                ["chens-tweak-mod-land-block-no-resource"] = {
                    order = "b",
                    basic_settings = {
                        property_expression_names = {
                            elevation = "chens-tweak-mod_land_block_no_resource"
                        },
                        cliff_settings = {cliff_elevation_interval = 0},
                        autoplace_settings = {
                            entity = {
                                treat_missing_as_default = false,
                                settings = {
                                    fish = {frequency = 0},
                                    seaweed = {frequency = 0}
                                }
                            }
                        },
                        autoplace_controls = {
                            trees = {frequency = 0},
                            rocks = {frequency = 0},
                            ["enemy-base"] = {frequency = 0}
                        },
                        starting_area = 0,
                        starting_points = {{x = 0, y = 0}}
                    }
                }
            }
        })

        for name, _ in pairs(data.raw.resource) do
            if data.raw["autoplace-control"][name] then
                data.raw["map-gen-presets"].default["chens-tweak-mod-land-block-no-resource"]
                    .basic_settings.autoplace_controls[name] = {frequency = 0}
            end

            if data.raw.resource[name].autoplace and
                data.raw.resource[name].autoplace.probability_expression then
                data.raw.resource[name].autoplace.probability_expression = "0"
            end
        end
    end

    -- 修复sea-block的问题
    if settings.startup["terrain-selection"].value == "sea-block" then
        -- 注册地图预设
        data:extend({
            {
                type = "noise-expression",
                name = "chens-tweak-mod_sea_block",
                intended_property = "elevation",
                expression = "if(abs(x - 2) <= 2, if(abs(y - 2) <= 2, 2, -1), -1)"
            }, {
                type = "map-gen-presets",
                name = "default",
                default = {default = true, order = "a"},
                ["chens-tweak-mod-sea-block"] = {
                    order = "b",
                    basic_settings = {
                        property_expression_names = {
                            elevation = "chens-tweak-mod_sea_block"
                        },
                        cliff_settings = {cliff_elevation_interval = 0},
                        autoplace_settings = {
                            entity = {
                                treat_missing_as_default = false,
                                settings = {
                                    fish = {frequency = 0},
                                    seaweed = {frequency = 0}
                                }
                            }
                        },
                        autoplace_controls = {
                            water = {frequency = 6, size = 6},
                            trees = {frequency = 0},
                            rocks = {frequency = 0},
                            ["enemy-base"] = {frequency = 0}
                        },
                        starting_area = 0,
                        starting_points = {{x = 0, y = 0}}
                    }
                }
            }
        })

        for name, _ in pairs(data.raw.resource) do
            if data.raw["autoplace-control"][name] then
                data.raw["map-gen-presets"].default["chens-tweak-mod-sea-block"]
                    .basic_settings.autoplace_controls[name] = {frequency = 0}
            end

            if data.raw.resource[name].autoplace and
                data.raw.resource[name].autoplace.probability_expression then
                data.raw.resource[name].autoplace.probability_expression = "0"
            end
        end
    end

    -- 修复sea-block和land-block-no-resource的问题
    if settings.startup["terrain-selection"].value == "sea-block" or
        settings.startup["terrain-selection"].value == "land-block-no-resource" then
        -- 修复sea-block设置的问题
        if settings.startup["terrain-selection"].value == "sea-block" then
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
                         {type = "unlock-recipe", recipe = "wooden-chest"})
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
            table.insert(data.raw.technology["mining-with-fluid"].effects, {
                type = "unlock-recipe",
                recipe = "early-aluminium-ore"
            })
            table.insert(data.raw.technology["mining-with-fluid"].effects,
                         {type = "unlock-recipe", recipe = "early-tin-ore"})

            -- 修复moss-mk01的问题
            table.insert(data.raw.technology["moss-mk01"].effects,
                         {type = "unlock-recipe", recipe = "starting-moss"})

            -- 修复glass的问题
            table.insert(data.raw.technology["glass"].effects,
                         {type = "unlock-recipe", recipe = "early-quartz-ore"})
        end
        -- 修复pyalternativeenergy模组的问题
        if mods["pyalternativeenergy"] then
            -- 修复配方的问题
            -- 修复stone-brick的问题
            data.raw.recipe["stone-brick"].enabled = false
        end

        -- 修复pycoalprocessing模组的问题
        if mods["pycoalprocessing"] then
            -- 修复实体的问题
            -- 修复washer的问题
            data.raw["assembling-machine"]["washer"].fluid_boxes = {
                {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {-1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "output",
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    pipe_picture = py.pipe_pictures("assembling-machine-2", nil,
                                                    {-0.05, -0.8}, nil, nil,
                                                    pipes),
                    volume = 100,
                    pipe_connections = {
                        {
                            flow_direction = "output",
                            position = {1.5, -2.5},
                            direction = defines.direction.north
                        }
                    }
                }
            }

            -- 修复washer-mk02的问题
            data.raw["assembling-machine"]["washer-mk02"].fluid_boxes = {
                {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {-1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "output",
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    pipe_picture = py.pipe_pictures("assembling-machine-2", nil,
                                                    {-0.05, -0.8}, nil, nil,
                                                    pipes),
                    volume = 100,
                    pipe_connections = {
                        {
                            flow_direction = "output",
                            position = {1.5, -2.5},
                            direction = defines.direction.north
                        }
                    }
                }
            }

            -- 修复washer-mk03的问题
            data.raw["assembling-machine"]["washer-mk03"].fluid_boxes = {
                {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {-1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "output",
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    pipe_picture = py.pipe_pictures("assembling-machine-2", nil,
                                                    {-0.05, -0.8}, nil, nil,
                                                    pipes),
                    volume = 100,
                    pipe_connections = {
                        {
                            flow_direction = "output",
                            position = {1.5, -2.5},
                            direction = defines.direction.north
                        }
                    }
                }
            }

            -- 修复washer-mk04的问题
            data.raw["assembling-machine"]["washer-mk04"].fluid_boxes = {
                {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "input",
                    pipe_picture = py.pipe_pictures("assembling-machine-2",
                                                    {1.17, 2.78}, {-0.05, -0.8},
                                                    nil, nil, pipes2),
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    volume = 1000,
                    pipe_connections = {
                        {
                            flow_direction = "input",
                            position = {-1.5, 2.5},
                            direction = defines.direction.south
                        }
                    }
                }, {
                    production_type = "output",
                    pipe_covers = py.pipe_covers(true, true, true, true),
                    pipe_picture = py.pipe_pictures("assembling-machine-2", nil,
                                                    {-0.05, -0.8}, nil, nil,
                                                    pipes),
                    volume = 100,
                    pipe_connections = {
                        {
                            flow_direction = "output",
                            position = {1.5, -2.5},
                            direction = defines.direction.north
                        }
                    }
                }
            }

            -- 修复科技的问题
            -- 修复automation-science-pack的问题
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "starting-native-flora"
            })
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "starting-seaweed"})
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "log-wood"})
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "botanical-nursery"})
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "washer-mk00"})
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {type = "unlock-recipe", recipe = "burner-inserter"})
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "burner-mining-drill"
            })

            -- 修复steam-power的问题
            for i = #data.raw.technology["steam-power"].effects, 1, -1 do
                local effect = data.raw.technology["steam-power"].effects[i]
                if effect.type == "unlock-recipe" and effect.recipe ==
                    "inductor1-2" then
                    table.remove(data.raw.technology["steam-power"].effects, i)
                end
            end

            -- 修复niobium的问题
            table.insert(data.raw.technology["niobium"].effects,
                         {type = "unlock-recipe", recipe = "early-niobium-ore"})

            -- 修复配方的问题
            -- 修复log-wood的问题
            data.raw.recipe["log-wood"].enabled = false

            -- 修复copper-cable的问题
            data.raw.recipe["copper-cable"].enabled = false

            -- 修复burner-inserter的问题
            data.raw.recipe["burner-inserter"].enabled = false

            -- 修复botanical-nursery的问题
            for i = #data.raw.recipe["botanical-nursery"].ingredients, 1, -1 do
                local ingredient = data.raw.recipe["botanical-nursery"]
                                       .ingredients[i]
                local name = ingredient[1] or ingredient.name
                if name == "glass" or name == "fluid-drill-mk01" or name ==
                    "soil-extractor-mk01" then
                    table.remove(data.raw.recipe["botanical-nursery"]
                                     .ingredients, i)
                end
            end

            -- 修复washer的问题
            table.insert(data.raw.recipe["washer"].ingredients,
                         {type = "item", name = "washer-mk00", amount = 1})
        end

        -- 修复pypetroleumhandling模组的问题
        if mods["pypetroleumhandling"] then
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
            -- 修复科技的问题
            -- 修复solder-mk01的问题
            table.insert(data.raw.technology["solder-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-lead-ore"})
            table.insert(data.raw.technology["solder-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-zinc-ore"})

            -- 修复chromium-mk01的问题
            table.insert(data.raw.technology["chromium-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-chromium-ore"
            })

            -- 修复alloys-mk01的问题
            table.insert(data.raw.technology["alloys-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-titanium-ore"
            })

            -- 修复nickel-mk01的问题
            table.insert(data.raw.technology["nickel-mk01"].effects,
                         {type = "unlock-recipe", recipe = "early-nickel-ore"})

            -- 修复配方的问题
            -- 修复iron-plate的问题
            data.raw.recipe["iron-plate"].enabled = false

            -- 修复copper-plate的问题
            data.raw.recipe["copper-plate"].enabled = false
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
        end

        -- 修复pyhightech模组的问题
        if mods["pyhightech"] then
            -- 修复科技的问题
            -- 修复rare-earth-tech的问题
            table.insert(data.raw.technology["rare-earth-tech"].effects, {
                type = "unlock-recipe",
                recipe = "early-rare-earth-ore"
            })
        end

        -- 修复pyfusionenergy模组的问题
        if mods["pyfusionenergy"] then
            -- 修复科技的问题
            -- 修复boron的问题
            table.insert(data.raw.technology["boron"].effects,
                         {type = "unlock-recipe", recipe = "early-raw-borax"})

            -- 修复molybdenum-processing的问题
            table.insert(data.raw.technology["molybdenum-processing"].effects, {
                type = "unlock-recipe",
                recipe = "early-molybdenum-ore"
            })
        end

        -- 修复pyalternativeenergy模组的问题
        if mods["pyalternativeenergy"] then
            -- 修复科技的问题
            -- 修复uranium-processing的问题
            table.insert(data.raw.technology["uranium-processing"].effects,
                         {type = "unlock-recipe", recipe = "early-uranium-ore"})

            -- 修复antimony-mk01的问题
            table.insert(data.raw.technology["antimony-mk01"].effects, {
                type = "unlock-recipe",
                recipe = "early-antimonium-ore"
            })
        end

        -- 修复wood-logistics模组的问题
        if mods["wood-logistics"] then
            -- 修复科技的问题
            -- 修复automation-science-pack的问题
            table.insert(data.raw.technology["automation-science-pack"].effects,
                         {
                type = "unlock-recipe",
                recipe = "wood-transport-belt"
            })

            -- 修复basic-resources的问题
            table.insert(data.raw.technology["basic-resources"].effects,
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

        -- 修复steam-power的问题
        table.insert(data.raw.technology["steam-power"].prerequisites,
                     "basic-resources")

        -- 修复配方的问题
        -- 修复landfill的问题
        if data.raw.recipe["landfill"] then
            data.raw.recipe["landfill"].ingredients = {}
            table.insert(data.raw.recipe["landfill"].ingredients,
                         {type = "item", name = "stone", amount = 3})
        end
    end

    -- 修复Nanobots2模组的问题
    if mods["Nanobots2"] then
        -- 修复科技的问题
        -- 修复nanobots的问题
        for i = #data.raw.technology["nanobots"].effects, 1, -1 do
            local effect = data.raw.technology["nanobots"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["nanobots"].effects, i)
                break
            end
        end
    end

    -- 修复Mini_Trains模组的问题
    if mods["Mini_Trains"] then
        -- 修复科技的问题
        -- 修复mini-trains的问题
        for i = #data.raw.technology["mini-trains"].effects, 1, -1 do
            local effect = data.raw.technology["mini-trains"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["mini-trains"].effects, i)
                break
            end
        end
    end

    -- 修复Transport_Drones_Meglinge_Fork模组的问题
    if mods["Transport_Drones_Meglinge_Fork"] then
        -- 修复科技的问题
        -- 修复transport-system的问题
        for i = #data.raw.technology["transport-system"].effects, 1, -1 do
            local effect = data.raw.technology["transport-system"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["transport-system"].effects, i)
                break
            end
        end

        table.insert(data.raw.technology["transport-system"].prerequisites,
                     "logistic-science-pack")
    end

    -- 修复pycoalprocessing模组的问题
    if mods["pycoalprocessing"] then
        -- 修复科技的问题
        -- 修复concrete的问题
        for i = #data.raw.technology["concrete"].effects, 1, -1 do
            local effect = data.raw.technology["concrete"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["concrete"].effects, i)
                break
            end
        end

        -- 修复circuit-network的问题
        for i = #data.raw.technology["circuit-network"].effects, 1, -1 do
            local effect = data.raw.technology["circuit-network"].effects[i]
            if effect.type == "unlock-recipe" and effect.recipe == "iron-stick" then
                table.remove(data.raw.technology["circuit-network"].effects, i)
                break
            end
        end

        -- 修复配方的问题
        -- 修复burner-inserter的问题
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

    -- 修复pyindustry模组的问题
    if mods["pyindustry"] then
        -- 修复配方的问题
        -- 修复iron-stick的问题
        data.raw.recipe["iron-stick"].enabled = false
    end

    -- 修复pypetroleumhandling模组的问题
    if mods["pypetroleumhandling"] then
        -- 修复配方的问题
        -- 修复transport-belt-2的问题
        table.insert(data.raw.recipe["transport-belt-2"].ingredients,
                     {type = "item", name = "electronic-circuit", amount = 3})
    end

    -- 修复wood-logistics模组的问题
    if mods["wood-logistics"] then
        -- 修复bobinserters模组的问题
        if mods["bobinserters"] then
            -- 修复科技的问题
            -- 修复bob-long-inserters-1的问题
            data.raw.technology["bob-long-inserters-1"].prerequisites = {
                "wood-logistics"
            }

            -- 修复bob-near-inserters的问题
            data.raw.technology["bob-near-inserters"].prerequisites = {
                "wood-logistics"
            }
        end

        -- 修复实体的问题
        -- 修复wood-underground-belt的问题
        data.raw["underground-belt"]["wood-underground-belt"].max_distance = 5

        -- 修复科技的问题
        -- 修复logistics的问题
        table.insert(data.raw.technology["logistics"].effects,
                     {type = "unlock-recipe", recipe = "underground-belt"})

        -- 修复配方的问题
        -- 修复underground-belt的问题
        data.raw.recipe["underground-belt"].enabled = false

        -- 修复lab的问题
        if data.raw.recipe["lab"] and data.raw.recipe["lab"].ingredients then
            for _, ingredient in ipairs(data.raw.recipe["lab"].ingredients) do
                if ingredient.name == "inserter" then
                    ingredient.name = "burner-inserter"
                    break
                end
            end
        end

        table.insert(data.raw.recipe["lab"].ingredients,
                     {type = "item", name = "wood-transport-belt", amount = 4})

        -- 修复transport-belt的问题
        table.insert(data.raw.recipe["transport-belt"].ingredients,
                     {type = "item", name = "electronic-circuit", amount = 1})
    end

    -- 修复ElectricFurnacesRevamp模组的问题
    if mods["ElectricFurnacesRevamp"] then
        -- 修复科技的问题
        -- 修复electronics的问题
        table.insert(data.raw.technology["electronics"].effects, {
            type = "unlock-recipe",
            recipe = "electric-stone-furnace"
        })
        table.insert(data.raw.technology["electronics"].effects,
                     {type = "unlock-recipe", recipe = "electric-boiler"})

        -- 修复配方的问题
        -- 修复electric-stone-furnace的问题
        data.raw.recipe["electric-stone-furnace"].enabled = false

        -- 修复electric-boiler的问题
        data.raw.recipe["electric-boiler"].enabled = false
    end

    -- 修复aai-loaders模组的问题
    if mods["aai-loaders"] then
        -- 修复实体的问题
        -- 修复aai-loader的问题
        for _, item in pairs(data.raw["loader-1x1"]) do
            if item.speed then item.speed = item.speed * 2 end
        end
    end

    -- 修复easyvoid模组的问题
    if mods["easyvoid"] then
        -- 修复科技的问题
        -- 修复void的问题
        data.raw.technology["void"].prerequisites = {"automation"}
    end

    -- 修复实体的问题
    -- 修复transport-belt的问题
    for _, item in pairs(data.raw["transport-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end

    -- 修复underground-belt的问题
    for _, item in pairs(data.raw["underground-belt"]) do
        if item.speed then item.speed = item.speed * 2 end
    end

    -- 修复loader的问题
    for _, item in pairs(data.raw["loader"]) do
        if item.speed then item.speed = item.speed * 2 end
    end

    -- 修复splitter的问题
    for _, item in pairs(data.raw["splitter"]) do
        if item.speed then item.speed = item.speed * 2 end
    end

    -- 修复inserter的问题
    for _, item in pairs(data.raw["inserter"]) do
        if item.rotation_speed then
            item.rotation_speed = item.rotation_speed * 1.5
        end
    end

    -- 修复underground-belt的问题
    data.raw["underground-belt"]["underground-belt"].max_distance = 10

    -- 修复fast-underground-belt的问题
    data.raw["underground-belt"]["fast-underground-belt"].max_distance = 20

    -- 修复express-underground-belt的问题
    data.raw["underground-belt"]["express-underground-belt"].max_distance = 40

    -- 自动排序科技效果
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

    -- 修复物品的问题
    -- 修复iron-plate的问题
    data.raw.item["iron-plate"].icon = "__base__/graphics/icons/iron-plate.png"
    data.raw.item["iron-plate"].icon_size = 64

    -- 修复copper-plate的问题
    data.raw.item["copper-plate"].icon =
        "__base__/graphics/icons/copper-plate.png"
    data.raw.item["copper-plate"].icon_size = 64
else
    -- 修复ElectricFurnacesRevamp模组的问题
    if mods["ElectricFurnacesRevamp"] then
        -- 修复科技的问题
        -- 修复steam-power的问题
        table.insert(data.raw.technology["steam-power"].effects, {
            type = "unlock-recipe",
            recipe = "electric-stone-furnace"
        })
        table.insert(data.raw.technology["steam-power"].effects,
                     {type = "unlock-recipe", recipe = "electric-boiler"})

        --  修复配方的问题
        -- 修复electric-stone-furnace的问题
        data.raw.recipe["electric-stone-furnace"].enabled = false

        -- 修复electric-boiler的问题
        data.raw.recipe["electric-boiler"].enabled = false
    end
end
