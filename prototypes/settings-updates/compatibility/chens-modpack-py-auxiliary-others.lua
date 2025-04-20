-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复pypostprocessing的问题
if mods["pypostprocessing"] then
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
end
