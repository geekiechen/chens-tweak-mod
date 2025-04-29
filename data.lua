-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-py-sea-block-mod 和 chens-py-land-block-mod 的问题
if mods["chens-py-sea-block-mod"] or (mods["chens-py-land-block-mod"] and
    settings.startup["enable-no-resource"].value) then
    require("prototypes/data/compatibility/chens-py-sea-block-mod")
end
