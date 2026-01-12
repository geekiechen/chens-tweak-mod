-- Copyright (c) 2025 GeekieChen
-- 此项目遵循 MIT 许可证，详见 LICENSE 文件。
data:extend{ -- a
    {
        type = "bool-setting",
        name = "enable-disable-crash-site",
        setting_type = "startup",
        default_value = false,
        order = "a-a"
    }, {
        type = "bool-setting",
        name = "enable-furnace-recipe-selection",
        setting_type = "startup",
        default_value = false,
        order = "a-c"
    }, {
        type = "bool-setting",
        name = "enable-clear-inventory",
        setting_type = "startup",
        default_value = false,
        order = "a-d"
    }, {
        type = "bool-setting",
        name = "enable-adjust-item-stack-size-in-machines",
        setting_type = "startup",
        default_value = false,
        order = "a-e"
    }, {
        type = "bool-setting",
        name = "enable-display-all-hidden-technologies",
        setting_type = "startup",
        default_value = false,
        order = "a-f"
    }, {
        type = "bool-setting",
        name = "enable-optimize-technology-tree",
        setting_type = "startup",
        default_value = false,
        order = "a-g"
    }, -- b
    {
        type = "bool-setting",
        name = "enable-disable-hand-crafting",
        setting_type = "startup",
        default_value = false,
        order = "b-a"
    }, -- y
    {
        type = "bool-setting",
        name = "enable-give-construction-robots-at-game-start",
        setting_type = "startup",
        default_value = false,
        order = "y-a"
    }, {
        type = "bool-setting",
        name = "enable-give-burner-mining-drill-at-game-start",
        setting_type = "startup",
        default_value = false,
        order = "y-b"
    }, {
        type = "bool-setting",
        name = "enable-give-weapon-at-game-start",
        setting_type = "startup",
        default_value = false,
        order = "y-c"
    }, {
        type = "bool-setting",
        name = "enable-automatically-researches-worker-robots-speed-at-game-start",
        setting_type = "startup",
        default_value = false,
        order = "y-d"
    }, -- z
    {
        type = "bool-setting",
        name = "enable-item-stack-size-multiplier",
        setting_type = "startup",
        default_value = false,
        order = "z-a"
    }, {
        type = "double-setting",
        name = "item-stack-size-multiplier",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 10,
        maximum_value = 2 ^ 32 - 1,
        order = "z-b"
    }, {
        type = "bool-setting",
        name = "enable-robot-speed-multiplier",
        setting_type = "startup",
        default_value = false,
        order = "z-c"
    }, {
        type = "double-setting",
        name = "robot-speed-multiplier",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 1,
        maximum_value = 2 ^ 32 - 1,
        order = "z-d"
    }, {
        type = "bool-setting",
        name = "enable-transport-belt-speed-multiplier",
        setting_type = "startup",
        default_value = false,
        order = "z-e"
    }, {
        type = "double-setting",
        name = "transport-belt-speed-multiplier",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 1,
        maximum_value = 2 ^ 32 - 1,
        order = "z-f"
    }, {
        type = "bool-setting",
        name = "enable-inserter-speed-multiplier",
        setting_type = "startup",
        default_value = false,
        order = "z-g"
    }, {
        type = "double-setting",
        name = "inserter-speed-multiplier",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 1,
        maximum_value = 2 ^ 32 - 1,
        order = "z-h"
    }, {
        type = "bool-setting",
        name = "enable-player-running-speed-multiplier",
        setting_type = "startup",
        default_value = false,
        order = "z-i"
    }, {
        type = "double-setting",
        name = "player-running-speed-multiplier",
        setting_type = "startup",
        minimum_value = 1,
        default_value = 1,
        maximum_value = 2 ^ 32 - 1,
        order = "z-j"
    }
}

data:extend{ -- a
    {
        type = "bool-setting",
        name = "enable-remove-decorations",
        setting_type = "runtime-global",
        default_value = false,
        order = "a-a"
    }
}
