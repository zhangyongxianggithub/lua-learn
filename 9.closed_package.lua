--[[
    练习9.1: 请编写一个函数integral，该函数以一个函数f为参数并返回其积分的近似值
--]]
function accumulate(f, s, e, delta)
    delta = delta or 1e-4
    return function()
        local sum = 0
        while s + delta <= e do
            s = s + delta
            sum = f(s) * delta
        end
        return sum
    end
end
--[[
9.2 如下的代码输出的什么结果
--]]
function F(x)
    return {
        set = function(y)
            x = y
        end,
        get = function()
            return x
        end
    }
end

o1 = F(10)
o2 = F(20)
print(o1.get(), o2.get())
o2.set(100)
o1.set(300)
print(o1.get(), o2.get())
