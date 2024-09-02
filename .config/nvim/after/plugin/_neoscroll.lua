local neoscroll = require('neoscroll')
local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 80 }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 80 }) end;
  ["zt"]    = function() neoscroll.zt({ half_win_duration = 80 }) end;
  ["zz"]    = function() neoscroll.zz({ half_win_duration = 80 }) end;
  ["zb"]    = function() neoscroll.zb({ half_win_duration = 80 }) end;
}

local modes = { 'n', 'v', 'x' }

for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
