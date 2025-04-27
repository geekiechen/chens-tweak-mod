-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
if settings.startup["enable-disable-hand-crafting"].value then
    data:extend({{type = "recipe-category", name = "disable-hand-crafting"}})

    data.raw.character.character.crafting_categories = {
        "enable-disable-hand-crafting"
    }
end

if settings.startup["enable-furnace-recipe-select"].value then
    if data.raw.furnace then
        for name, entity in pairs(data.raw.furnace) do
            local furnace = table.deepcopy(entity)
            furnace.type = "assembling-machine"
            data:extend{furnace}
            data.raw.furnace[name] = nil
        end
    end
end

if settings.startup["enable-technology-tree-optimize"].value then
    -- 建立科研包配方到解锁它的科技的映射
    local science_pack_unlockers = {}
    for name, tech in pairs(data.raw.technology) do
        if tech.effects then
            for _, effect in ipairs(tech.effects) do
                if effect.type == "unlock-recipe" then
                    local recipe_name = effect.recipe
                    if not science_pack_unlockers[recipe_name] then
                        science_pack_unlockers[recipe_name] = name
                    end
                end
            end
        end
    end

    for name, tech in pairs(data.raw.technology) do
        if tech.prerequisites then
            local all_dependencies = {}

            -- 递归收集所有依赖
            local stack = {}
            for _, prereq in ipairs(tech.prerequisites) do
                table.insert(stack, prereq)
            end

            while #stack > 0 do
                local current = table.remove(stack)
                if not all_dependencies[current] then
                    all_dependencies[current] = true
                    local current_tech = data.raw.technology[current]
                    if current_tech and current_tech.prerequisites then
                        for _, p in ipairs(current_tech.prerequisites) do
                            table.insert(stack, p)
                        end
                    end
                end
            end

            -- 补齐科研包对应的前置
            if tech.unit and tech.unit.ingredients then
                local existing_packs = {}
                for dep_name in pairs(all_dependencies) do
                    local dep_tech = data.raw.technology[dep_name]
                    if dep_tech and dep_tech.unit and dep_tech.unit.ingredients then
                        for _, pack in ipairs(dep_tech.unit.ingredients) do
                            existing_packs[pack[1]] = true
                        end
                    end
                end

                for _, pack in ipairs(tech.unit.ingredients) do
                    local pack_name = pack[1]
                    if not existing_packs[pack_name] then
                        local unlocker = science_pack_unlockers[pack_name]
                        if unlocker and data.raw.technology[unlocker] then
                            if not tech.prerequisites then
                                tech.prerequisites = {}
                            end
                            local already = false
                            for _, p in ipairs(tech.prerequisites) do
                                if p == unlocker then
                                    already = true
                                end
                            end
                            if not already then
                                table.insert(tech.prerequisites, unlocker)
                            end
                        end
                    end
                end
            end

            -- 优化前置：去除冗余
            local to_remove = {}
            for _, prereq in ipairs(tech.prerequisites) do
                local prereq_tech = data.raw.technology[prereq]
                if prereq_tech and prereq_tech.prerequisites then
                    for _, sub_prereq in ipairs(prereq_tech.prerequisites) do
                        if all_dependencies[sub_prereq] then
                            for _, direct_prereq in ipairs(tech.prerequisites) do
                                if direct_prereq == sub_prereq then
                                    to_remove[sub_prereq] = true
                                end
                            end
                        end
                    end
                end
            end

            for remove_name in pairs(to_remove) do
                for i = #tech.prerequisites, 1, -1 do
                    if tech.prerequisites[i] == remove_name then
                        table.remove(tech.prerequisites, i)
                    end
                end
            end
        end
    end
end

if settings.startup["enable-machine-item-stack-size-tweak"].value then
    if data.raw.recipe then
        for _, recipe in pairs(data.raw.recipe) do
            recipe.allow_inserter_overload = false
        end
    end
end

local maxStackSize = 2147483647
local maxRobotSpeed = 2147483647
local maxTransportBeltSpeed = 2147483647
local maxInserterSpeed = 2147483647
local maxPlayerSpeed = 2147483647

if settings.startup["enable-item-stack-size-multiplier"].value then
    local itemStackSizeMultiplier =
        settings.startup["item-stack-size-multiplier"].value

    for _, itemType in pairs(data.raw) do
        for _, item in pairs(itemType) do
            if item.stack_size and item.stack_size ~= 1 then
                item.stack_size = math.min(item.stack_size *
                                               itemStackSizeMultiplier,
                                           maxStackSize)
            end
        end
    end
end

if settings.startup["enable-transport-belt-speed-multiplier"].value then
    local transportBeltSpeedMultiplier =
        settings.startup["transport-belt-speed-multiplier"].value

    if data.raw["transport-belt"] then
        for _, item in pairs(data.raw["transport-belt"]) do
            if item.speed then
                item.speed = item.speed * transportBeltSpeedMultiplier
                if item.speed > maxTransportBeltSpeed then
                    item.speed = maxTransportBeltSpeed
                end
            end
        end
    end

    if data.raw["underground-belt"] then
        for _, item in pairs(data.raw["underground-belt"]) do
            if item.speed then
                item.speed = item.speed * transportBeltSpeedMultiplier
                if item.speed > maxTransportBeltSpeed then
                    item.speed = maxTransportBeltSpeed
                end
            end
        end
    end

    if data.raw["loader"] then
        for _, item in pairs(data.raw["loader"]) do
            if item.speed then
                item.speed = item.speed * transportBeltSpeedMultiplier
                if item.speed > maxTransportBeltSpeed then
                    item.speed = maxTransportBeltSpeed
                end
            end
        end
    end

    if data.raw["splitter"] then
        for _, item in pairs(data.raw["splitter"]) do
            if item.speed then
                item.speed = item.speed * transportBeltSpeedMultiplier
                if item.speed > maxTransportBeltSpeed then
                    item.speed = maxTransportBeltSpeed
                end
            end
        end
    end
end

if settings.startup["enable-inserter-speed-multiplier"].value then
    local inserterSpeedMultiplier =
        settings.startup["inserter-speed-multiplier"].value

    if data.raw.inserter then
        for _, item in pairs(data.raw.inserter) do
            if item.rotation_speed then
                item.rotation_speed = item.rotation_speed *
                                          inserterSpeedMultiplier
                if item.rotation_speed > maxInserterSpeed then
                    item.rotation_speed = maxInserterSpeed
                end
            end
        end
    end
end

if settings.startup["enable-player-running-speed-multiplier"].value then
    local playerSpeedMultiplier =
        settings.startup["player-running-speed-multiplier"].value

    if data.raw.character["character"] then
        data.raw.character["character"].running_speed =
            data.raw.character["character"].running_speed *
                playerSpeedMultiplier
        if data.raw.character["character"].running_speed > maxPlayerSpeed then
            data.raw.character["character"].running_speed = maxPlayerSpeed
        end
    end
end

if not mods["pypostprocessing"] and
    settings.startup["enable-robot-speed-multiplier"].value then
    local robotSpeedMultiplier = settings.startup["robot-speed-multiplier"]
                                     .value

    if data.raw["logistic-robot"] then
        for _, robot in pairs(data.raw["logistic-robot"]) do
            robot.speed = robot.speed * robotSpeedMultiplier
            if robot.speed > maxRobotSpeed then
                robot.speed = maxRobotSpeed
            end
        end
    end

    if data.raw["construction-robot"] then
        for _, robot in pairs(data.raw["construction-robot"]) do
            robot.speed = robot.speed * robotSpeedMultiplier
            if robot.speed > maxRobotSpeed then
                robot.speed = maxRobotSpeed
            end
        end
    end
end

require("mods-compatibility")
