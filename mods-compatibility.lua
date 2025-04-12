-- Copyright (c) 2025 JackieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复chens-py-sea-block-mod模组和chens-py-land-block-mod模组的问题
if mods["chens-py-sea-block-mod"] or (mods["chens-py-land-block-mod"] and
    settings.startup["enable-no-resource"].value) then
    require("prototypes/data-final-fixes/compatibility/chens-py-sea-block-mod")

end

-- 修复chens-modpack-py-auxiliary-others模组的问题
if mods["chens-modpack-py-auxiliary-others"] then
    require(
        "prototypes/data-final-fixes/compatibility/chens-modpack-py-auxiliary-others")
else
    -- 修复ElectricFurnacesRevamp模组的问题
    if mods["ElectricFurnacesRevamp"] then
        require(
            "prototypes/data-final-fixes/compatibility/ElectricFurnacesRevamp")
    end
end
