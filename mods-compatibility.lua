-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 chens-modpack-py-auxiliary-others 的问题
if mods["chens-modpack-py-auxiliary-others"] then
    require(
        "prototypes/data-final-fixes/compatibility/chens-modpack-py-auxiliary-others")
else
    require("prototypes/data-final-fixes/compatibility/other-mods")
end

-- 修复 chens-food-mod-core 的问题
if mods["chens-food-mod-core"] then
    require("prototypes/data-final-fixes/compatibility/chens-food-mod-core")
end

-- 修复 chens-color-tile-mod 的问题
if mods["chens-color-tile-mod"] then
    require("prototypes/data-final-fixes/compatibility/chens-color-tile-mod")
end

-- 修复 chens-py-sea-block-mod 和 chens-py-land-block-mod 的问题
if mods["chens-py-sea-block-mod"] or (mods["chens-py-land-block-mod"] and
    settings.startup["enable-no-resource"].value) then
    require("prototypes/data-final-fixes/compatibility/chens-py-sea-block-mod")
end
