local _M = {}
local mt = { __index = _M }

function _M.new(name)
    local self = {
        name = name
    }
    return setmetatable(self, mt)
end

function _M.get(self, path_pattern, handler)
    self.when({'GET'}, path_pattern, handler)
end

-- 
function _M.when(self, methods, path_pattern, handler)
    -- TODO 注册到uri_route中
end

return _M