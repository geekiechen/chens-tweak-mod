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