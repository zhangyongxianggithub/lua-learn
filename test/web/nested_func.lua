#!/usr/bin/env lua

local function make_uri_handler(controllername, method_Name)
    -- local function uri_handler()
    --     print("uri handler name " .. name)
    --     -- TODO 在这里调用api真正的业务代码
    -- end
    -- return uri_handler

    return function()
        print("uri handler name " .. name)

        -- pre

        -- TODO 在这里调用api真正的业务代码
        -- lookup
        local req_context = {}
        local api_hander = xxxxx() -- function(store) {   return function(res, resp, next)  }
        api_hander(req_context)(nil, nil, nil)
        -- todo 构造chain
        -- local wrapped = make_chain(midwares, api_handler)
        -- wrapped(req_context)(nil, nil, nil)

        -- post
    end
end

print("before make uri handler")

local handler1 = make_uri_handler("uri-count")
handler1()

local handler2 = make_uri_handler("access-count")
handler2()
