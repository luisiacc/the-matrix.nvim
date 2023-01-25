local util = require("thematrix.util")
local theme = require("thematrix.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
