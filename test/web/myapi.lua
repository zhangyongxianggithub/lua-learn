
local BaseController = require('base_controller')

local api = BaseController.new("node-api")

api:get("/node/ping", function(store)
    return function(req, res, next)
        -- 初始版本，我们不需要用req, res, next参数，以后用
        
        print("do web api /node/ping works")
    end
end)

api:when({'GET', 'POST'}, "/node/pong/。*", function(store)
    return function(req, res, next)
        -- 初始版本，我们不需要用req, res, next参数，以后用
        
        print("do web api /node/pong works")
    end
end)

return api