require("tmcsantos")

local has = vim.fn.has
local is_mac = has "macunix"

if is_mac then
  require('tmcsantos.macos')
end

