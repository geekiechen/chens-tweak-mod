-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复pypostprocessing的问题
if mods["pypostprocessing"] then
    -- 修复模组的问题
    -- 修复chens-tweak-mod的问题
    if mods["chens-tweak-mod"] then
        -- 修复设置的问题
        -- 修复enable-robot-speed-multiplier的问题
        data.raw["bool-setting"]["enable-robot-speed-multiplier"].default_value =
            false
        data.raw["bool-setting"]["enable-robot-speed-multiplier"].hidden = true

        -- 修复robot-speed-multiplier的问题
        data.raw["double-setting"]["robot-speed-multiplier"].default_value = 1
        data.raw["double-setting"]["robot-speed-multiplier"].hidden = true
    end

    -- 修复设置的问题
    -- 修复pypp-extended-recipe-signals的问题
    data.raw["bool-setting"]["pypp-extended-recipe-signals"].default_value =
        true
end

-- 修复wood-logistics的问题
if mods["wood-logistics"] then
    -- 修复设置的问题
    -- 修复wood-logistics-lumber-mill的问题
    data.raw["bool-setting"]["wood-logistics-lumber-mill"].default_value = false

    -- 修复wood-logistics-belts-circuits的问题
    data.raw["bool-setting"]["wood-logistics-belts-circuits"].default_value =
        true

    -- 修复wood-logistics-nerf-small-electric-pole的问题
    data.raw["bool-setting"]["wood-logistics-nerf-small-electric-pole"]
        .default_value = false

    -- 修复wood-logistics-big-electric-pole的问题
    data.raw["bool-setting"]["wood-logistics-big-electric-pole"].default_value =
        true

    -- 修复wood-logistics-big-electric-pole-modify的问题
    data.raw["bool-setting"]["wood-logistics-big-electric-pole-modify"]
        .default_value = true
end

-- 修复Mini-Trains-Lead-the-Way的问题
if mods["Mini-Trains-Lead-the-Way"] then
    -- 修复设置的问题
    -- 修复mtlw-nerf-mini-trains的问题
    data.raw["bool-setting"]["mtlw-nerf-mini-trains"].default_value = true
end
