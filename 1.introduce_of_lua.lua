--[[
    author: zhangyongxiang
--]]
--[[
  练习1: 阶乘函数
--]]

fact = function(n)
    if n <= 0 then
        return 1
    else
        return fact(n - 1) * n
    end
end
print("输入一个数字：")
n=io.read("*n")
print(fact(n))

--[[
    type(nil) ==  "nil" type(nil)==nil
--]]
--[[
print script name
--]]
print(arg[0])
