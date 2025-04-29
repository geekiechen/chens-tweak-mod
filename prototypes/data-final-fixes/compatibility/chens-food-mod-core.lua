-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 space-age 或 enable-all-feature-flags 的问题
if mods["space-age"] or mods["enable-all-feature-flags"] then
    -- 修复物品的问题
    -- 修复 apple 的问题
    if data.raw.capsule["apple"] then
        data.raw.capsule["apple"].spoil_result = "rotten-apple"
        data.raw.capsule["apple"].spoil_ticks = 36000
    end
end
