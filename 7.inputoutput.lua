#!/usr/bin/env lua

io.input("7.inputoutput.lua")
io.output("7.inputoutput.lua.bak")
io.write("1232333\n", "234", "23111", "\n")
io.write("sin(3)=", math.sin(3), "\n")
io.write(string.format("sin(3) = %.4f\n", math.sin(3)))
-- local long_str = io.read("a")
-- long_str =
--     long_str:gsub(
--     "([\128-\255=])",
--     function(c)
--         return string.format("%02X", string.byte(c))
--     end
-- )
-- print(long_str)
for count = 1, math.huge do
    local line = io.read("L")
    if line then
        io.write(string.format("%6d ", count), line)
    else
        break
    end
end

--[[
第7章，输入与输出
--]]
-- 练习7.1 读取一个文件按照字母表排序重写文件，不带参数从标准输入写到标准输出，如果传入一个参数，从文件读取写入标准输出，2个文件的参数的话，从第一个文件写入到第二个文件
