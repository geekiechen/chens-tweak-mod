-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 pypostprocessing 的问题
if mods["pypostprocessing"] then
    -- 修复模组的问题
    -- 修复 chens-tweak-mod 的问题
    if mods["chens-tweak-mod"] then
        -- 修复设置的问题
        -- 修复 enable-robot-speed-multiplier 的问题
        if data.raw["bool-setting"]["enable-robot-speed-multiplier"] then
            data.raw["bool-setting"]["enable-robot-speed-multiplier"]
                .default_value = false
            data.raw["bool-setting"]["enable-robot-speed-multiplier"].hidden =
                true
        end

        -- 修复 robot-speed-multiplier 的问题
        if data.raw["double-setting"]["robot-speed-multiplier"] then
            data.raw["double-setting"]["robot-speed-multiplier"].default_value =
                1
            data.raw["double-setting"]["robot-speed-multiplier"].hidden = true
        end
    end

    -- 修复设置的问题
    -- 修复 pypp-extended-recipe-signals 的问题
    if data.raw["bool-setting"]["pypp-extended-recipe-signals"] then
        data.raw["bool-setting"]["pypp-extended-recipe-signals"].default_value =
            true
    end
end

-- 修复 wood-logistics 的问题
if mods["wood-logistics"] then
    -- 修复设置的问题
    -- 修复 wood-logistics-lumber-mill 的问题
    if data.raw["bool-setting"]["wood-logistics-lumber-mill"] then
        data.raw["bool-setting"]["wood-logistics-lumber-mill"].default_value =
            false
    end

    -- 修复 wood-logistics-woodtronics 的问题
    if data.raw["bool-setting"]["wood-logistics-woodtronics"] then
        data.raw["bool-setting"]["wood-logistics-woodtronics"].default_value =
            false
    end

    -- 修复 wood-logistics-belts-circuits 的问题
    if data.raw["bool-setting"]["wood-logistics-belts-circuits"] then
        data.raw["bool-setting"]["wood-logistics-belts-circuits"].default_value =
            true
    end

    -- 修复 wood-logistics-nerf-small-electric-pole 的问题
    if data.raw["bool-setting"]["wood-logistics-nerf-small-electric-pole"] then
        data.raw["bool-setting"]["wood-logistics-nerf-small-electric-pole"]
            .default_value = false
    end
end

-- 修复 Mini-Trains-Lead-the-Way 的问题
if mods["Mini-Trains-Lead-the-Way"] then
    -- 修复设置的问题
    -- 修复 mtlw-nerf-mini-trains 的问题
    if data.raw["bool-setting"]["mtlw-nerf-mini-trains"] then
        data.raw["bool-setting"]["mtlw-nerf-mini-trains"].default_value = true
    end
end

-- 修复 loaders-modernized 的问题
if mods["loaders-modernized"] then
    -- 修复设置的问题
    -- 修复 mdrn-enable-chute 的问题
    if data.raw["bool-setting"]["mdrn-enable-chute"] then
        data.raw["bool-setting"]["mdrn-enable-chute"].default_value = false
        data.raw["bool-setting"]["mdrn-enable-chute"].hidden = true
    end
end
