-- to use this module in another .lua file, use:
-- local object = require 'object'

local object = {}

function object:new(t)
	return setmetatable(t or {}, { __index = self, __call = self.new })
end

function object:clone()
	local t = {}
	for k, v in pairs(self) do
		t[k] = v
	end
	return setmetatable(t, getmetatable(self))
end

return setmetatable(object, { __call = object.new })
