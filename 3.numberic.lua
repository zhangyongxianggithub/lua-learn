--[[
练习 3. 1 ：以下哪些是有效的数值常量？它们的值分别是多少？
.0e12 .e12 0.0e 0x12 0xABFG 0xA FFFF 0xFFFFFFFF
0x 0x1P10 0.1e1 0x0. 1p1
p 是以2为底数的
--]]
print(0x1p10)

--[[
    解释下列表达式之所以得出相应结果的原因 。 
--]]
print(math.maxinteger *2,math.mininteger*2,math.maxinteger*math.maxinteger,math.mininteger *math.mininteger)
for i=-10,10 do
    print(i,i%3)
end
print(2^3^2,2^-3^4)
math.randomseed(os.time())
r=math.random(1,10 )
print(r)
a=math.random(1,10 )
print(a)