-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
if settings.startup["disable-hand-crafting"].value then
    data:extend({{type = "recipe-category", name = "disable-hand-crafting"}})

    data.raw.character.character.crafting_categories = {"disable-hand-crafting"}
end

if settings.startup["furnace-recipe-select"].value then
    if data.raw.furnace then
        for name, entity in pairs(data.raw.furnace) do
            local furnace = table.deepcopy(entity)
            furnace.type = "assembling-machine"
            data:extend{furnace}
            data.raw.furnace[name] = nil
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
