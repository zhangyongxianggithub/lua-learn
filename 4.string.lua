--练习1： 2种打印字符串的方式
local str = [=[
    <![CDATA[
        Hello world
    ]]
]=]
local str_other = "<![CDATA[\n\tHello world\n]]"
print(str)
print(str)
-- 编写一个函数插入字符串
local insert = function(str, position, substr)
    if (position < 1 or position > #str) then
        return str
    end
    return str:sub(1, position - 1) .. substr .. str:sub(position, -1)
end
print(insert("123", 1, "4"))
-- 使用utf-8编码的方式实现同样的逻辑
--[[
local utf8=require("utf8")
local utf8_insert = function(utf8_str, position, substr)
    if (position < 1 or position > #str) then
        return str
    end
    return utf8.sub(utf8_str, 1, position - 1) .. substr .. utf8.sub(utf8_str, 1, -1)
end
print(utf8_insert("我问问", 1, '我是'))
--]]
-- 是否是回文字符串
local ispali = function(str)
    local max = #str// 2
    for index = 1, max do
        if (str:sub(index, index) ~= str:sub(-index, -index)) then
            return false
        end
    end
    return true
end

local ispali_other = function(str)
    return str == str:reverse()
end
print(ispali("abba"))
print(ispali_other("abba"))
