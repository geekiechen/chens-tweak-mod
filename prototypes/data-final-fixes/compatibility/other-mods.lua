-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
-- 修复模组的问题
-- 修复 ElectricFurnacesRevamp 的问题
if mods["ElectricFurnacesRevamp"] then
    -- 修复科技的问题
    -- 修复 steam-power 的问题
    if data.raw.technology["steam-power"] then
        if data.raw.technology["steam-power"].effects then
            if data.raw.recipe["electric-stone-furnace"] then
                table.insert(data.raw.technology["steam-power"].effects, {
                    type = "unlock-recipe",
                    recipe = "electric-stone-furnace"
                })
            end

            if data.raw.recipe["electric-boiler"] then
                table.insert(data.raw.technology["steam-power"].effects, {
                    type = "unlock-recipe",
                    recipe = "electric-boiler"
                })
            end
        end
    end

    -- 修复配方的问题
    -- 修复 electric-stone-furnace 的问题
    if data.raw.recipe["electric-stone-furnace"] then
        data.raw.recipe["electric-stone-furnace"].enabled = false
    end

    -- 修复 electric-boiler 的问题
    if data.raw.recipe["electric-boiler"] then
        data.raw.recipe["electric-boiler"].enabled = false
    end
end
