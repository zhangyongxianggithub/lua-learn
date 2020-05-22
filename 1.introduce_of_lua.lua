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
n = io.read("*n")
print(fact(n))

--[[
    type(nil) ==  "nil" type(nil)==nil
--]]
--[[
练习 1.8 请编写一个可以打 出脚本自身名称的程序（事先不知道脚本自身的名称）
--]]
print(arg[0])
for k, v in pairs(arg) do
    print(k, v)
end
