-- Add LuaRocks path to package.path
package.path = package.path .. ";/home/crohrmoser/.luarocks/share/lua/5.1/?.lua"
package.path = package.path .. ";/home/crohrmoser/.luarocks/share/lua/5.1/?/init.lua"
package.cpath = package.cpath .. ";/home/crohrmoser/.luarocks/lib/lua/5.1/?.so"

require("config.maps")
require("config.settings")
require("config.lazy")

