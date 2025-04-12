-- 修复科技的问题
-- 修复steam-power的问题
table.insert(data.raw.technology["steam-power"].effects,
             {type = "unlock-recipe", recipe = "electric-stone-furnace"})
table.insert(data.raw.technology["steam-power"].effects,
             {type = "unlock-recipe", recipe = "electric-boiler"})

--  修复配方的问题
-- 修复electric-stone-furnace的问题
data.raw.recipe["electric-stone-furnace"].enabled = false

-- 修复electric-boiler的问题
data.raw.recipe["electric-boiler"].enabled = false
