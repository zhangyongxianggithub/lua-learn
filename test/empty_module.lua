_M={}
local mt = { __index = _M }

function _M.new()
    return setmetatable({}, mt)
end
function _M.empty()
end
return _M