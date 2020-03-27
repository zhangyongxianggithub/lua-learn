local input='1,2,3'
local delimiter=','
local a,b=string.find( input,delimiter, 0, true )
print(a,b)
t={2,3}
local message = ""
t={"1","2","3"}
for i,v in ipairs(t) do
    message= message..","..tostring(v)
end
message=string.sub( message,2,-1)
print(message)

local dkjson = require("dkjson")

x={}
x.var_ctx={
    uri = '/app1/web/index.html',
         uri = '/app1/api/abc/2/4?sdf',
         query_params = {
             name = "lisi"
         },
         request_method = 'GET'
     }
x.locations={
         ['/'] = {
             rules = {
                 {
                     service_key = 'a_com_root',
                     link_type = 'and',
                     conditions = {
                         {
                             variable = 'uri',
                             ['function'] = 'lua_regex',
                             value = '.*'
                         }
                     }
                 }
             }
         },
         ['/app1/'] = {
             rules = {
                 {
                     service_key = 'a_com_web',
                     link_type = 'and',
                     conditions = {
                         {
                             variable = 'relative_path',
                             ['function'] = 'lua_regex',
                             value = '^web/index.html$'
                         },
                         {
                             variable = 'query_params',
                             key = 'name',
                             ['function'] = 'equal',
                             value = 'lisi'
                         },
                         {
                             variable = 'request_method',
                             ['function'] = 'in_comma_splited_arr',
                             value = 'GET,POST'
                         },
                     }
                 },
                 {
                     service_key = 'a_com_api',
                     link_type = 'and',
                     conditions = {
                         {
                             variable = 'relative_path',
                             ['function'] = 'lua_regex',
                             value = '^api/*'
                         }
                     }
                 }
             }
         }
     }
local str = dkjson.encode(x,{indent = true})
print(str) 

local dkjson=require("dkjson")
local str=[[{
 "var_ctx":{
      "query_params":{
        "name":"lisi"
      },
      "request_method":"GET",
      "relative_path":"web/index.html",
      "uri":"/app1/web/index.html"
    },
    "rule":{
      "function":"lua_regex",
      "value":"^web/index.html",
      "variable":"relative_path"
    }
  }]]
local data, pos, err=dkjson.decode(str, 1, nil)
print(data.rule['function'])
