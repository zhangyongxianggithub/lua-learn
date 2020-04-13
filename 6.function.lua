--[[
    第六章 函数练习题
--]]
-- 练习1:打印数组的函数
function print_array(a)
    for _,v in ipairs(a) do
        print(v)
    end
end
print_array{1,2,4}
--练习2: 可变数据去掉第一个值
function trim_first(...)
    local args= {...}
    table.remove( args, 1)
    return args
end
json=require("json")
print(json.encode(trim_first(2,3,4)))