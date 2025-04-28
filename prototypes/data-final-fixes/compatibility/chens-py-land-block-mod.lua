-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复earlier-teleporters_redux的问题
if mods["earlier-teleporters_redux"] then
    -- 修复科技的问题
    -- 修复teleporter的问题
    if data.raw.technology["teleporter"] then
        data.raw.technology["teleporter"].prerequisites = {"electronics"}
    end
end
