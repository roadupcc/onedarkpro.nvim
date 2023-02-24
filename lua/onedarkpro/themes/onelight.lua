---@diagnostic disable: missing-parameter
local meta = {
    name = "onelight",
    light = true,
}

local palette = {
    black = "#000000",
    gray = "#868686",
    red = "#fd2231",
    fg = "#000000",
    bg = "#ffffff",
    orange = "#aa7005",
    yellow = "#cc8b0e",
    purple = "#7e38e8",
    green = "#128409",
    cyan = "#1a99a9",
    blue = "#1179cb",

    white = "#fafafa",
    highlight = "#e2be7d",
    none = "NONE",
}

---Colors which are generated depending on the values in the palette
---@param palette table the theme's color palette
---@return table
local function generate(palette)
    local color = require("onedarkpro.lib.color")

    return {
        cursorline = palette.cursorline or color.darken(palette.bg, 0.97),
        color_column = palette.color_column or color.darken(palette.bg, 0.97),
        indentline = palette.indentline or color.darken(palette.bg, 0.93),
        selection = palette.selection or color.darken(palette.bg, 0.90),

        -- Git diff
        diff_add = palette.diff_add or "#cae3e8",
        diff_delete = palette.diff_delete or "#f5c6c6",
        diff_text = palette.diff_text or "#a6d0d8",

        -- Lualine colors
        bg_statusline = palette.bg_statusline or color.darken(palette.bg, 0.97),
        fg_gutter = palette.fg_gutter or color.darken(palette.bg, 0.90),

        -- Virtual text
        virtual_text_error = palette.virtual_text_error or color.lighten(palette.red, 0.6),
        virtual_text_warning = palette.virtual_text_warning or color.lighten(palette.yellow, 0.6),
        virtual_text_information = palette.virtual_text_information or color.lighten(palette.blue, 0.6),
        virtual_text_hint = palette.virtual_text_hint or color.lighten(palette.gray, 0.6),
    }
end

return {
    meta = meta,
    palette = palette,
    generated = function(palette)
        return generate(palette)
    end,
}
