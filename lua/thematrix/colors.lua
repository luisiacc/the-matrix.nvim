local util = require("thematrix.util")

local M = {}

local palette = {
  green0 = "#93ff93",
  green05 = "#56ff56",
  green = "#00ff00",
  green1 = "#008300",
  green2 = "#005c00",
  foreground = "#c0ffc0",
  background = "#101010",
  background_dark = "#010101",
  comment = "#6e8c6e",
  dark_green = "#044e04",
  gray1 = "#c0c8c0",
  gray2 = "#639a63",
  gray3 = "#545854",
  error = "#ff0000",
  highlight = "#232323",
  string = "#dae900",
}

palette.keyword = palette.gray1

-- these are backgrounds
palette.diff = {
  add = "#26332c",
  change = "#273842",
  delete = "#572E33",
  text = "#314753",
}
M.p = palette

function M.config(config)
  config = config or require("thematrix.config")
  local colors
  if config.use_original_palette then
    colors = original_palette
  else
    colors = palette
  end

  if config.transparent_mode then
    local transparent = {
      background = colors.none,
      background_dark = colors.none,
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end

  if config.color_overrides then
    for override_color, new_color in pairs(config.color_overrides) do
      colors[override_color] = new_color
    end
  end
  return colors
end

return M
