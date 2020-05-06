--[[
    author: zhangyongxiang
]]
--[[
练习 13.1 ：请编写一个函数，该函数用于进行无符号整型数的取模运算
]]
function unsigned_mod(n,mod)
    if n<0 then
        return n-(2^64 - 1 + n)%mod
    else
        return n%mod
    end
end
print(unsigned_mod(-3,10))

