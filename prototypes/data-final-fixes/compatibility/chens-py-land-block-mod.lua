-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复设置的问题
if settings.startup["enable-no-resource"].value then
    -- 修复模组的问题
    -- 修复Waterfill_v17的问题
    if mods["Waterfill_v17"] then
        data.raw.technology["waterfill"].unit = {
            count = 50,
            ingredients = {{"automation-science-pack", 1}},
            time = 25
        }
    end
end
