package.path="/usr/local/yingloong/deps/share/lua/5.1/?.lua;"..package.path
local dns_client = require("resty.dns.client")
dns_client.init()
list, err,try_list = dns_client.resolve("bjfk-rs11546.yz02")
print(tostring(list)..tostring(err)..tostring(try_list))
