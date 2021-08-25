local Utils = {}

local has_notify, notify = pcall(require, "notify")

local run_cmd = function(str)
	if str then
		return { str }
	else
		return nil
	end
end

if has_notify then
	run_cmd = function(string)
		return {
			string,
			notify(type(string), "info"),
		}
	end
end
--  vim.inspect(table)
Utils.use = function(conf)
	local new_conf = {}
	if type(conf) == "string" then
		new_conf[1] = conf
	else
		new_conf = conf
	end
	new_conf.run = function(plugin)
		notify(table.concat(plugin.messages, "\n"), "info", { title = plugin.short_name })
	end
	local pkr_use = require("packer").use
	return pkr_use(new_conf)
end

return Utils
