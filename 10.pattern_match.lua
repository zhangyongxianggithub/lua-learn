--[[
10.1 请编写 个函数 split ，该函数接收两个 ，第一个参数是字符串，第二个
数是分隔符模式，函数的返回值 分隔符分割后的原始 符串中每一部分 序列
t = split (” a whole new wo ld ”，””）
-- t = ｛”a”，” whole ”，” new ”，” WO ld ”｝
你编写 函数是如何处理空字符串 的呢 是， 空字符串究竟是空序 an empty
sequence ）， 是一个具有空字符串的序列（ a sequence with one empty string ）呢?
--]]
local json = require("json")
function split(str, sep)
    local result = {}
    if not str or type(str) ~= "string" or str == "" then
        return result
    end
    
    if type(sep) ~= "string" or sep == "" then
        result[#result + 1] = str
        return result
    end
    --判断separator
    sep                 = sep or " "
    local start, length = 1, #str
    while start <= length do
        local i, j = string.find(str, sep, start)
        if not i or not j then
            if start <= length then
                local sep_str = string.sub(str, start, length)
                if sep_str ~= "" then
                    result[#result + 1] = sep_str
                end
            end
            break
        end
        local sep_str = string.sub(str, start, i - 1)
        if sep_str ~= "" then
            result[#result + 1] = sep_str
        end
        start = j + 1
    end
    return result
end
print(json.encode(split("1./2/3/4 /  67///", "/")))

--这个方法只适用于sep是单字符的情况
function split2(str, sep)
    local result = {}
    if not str or type(str) ~= "string" or str == "" then
        return result
    end
    
    if type(sep) ~= "string" or sep == "" then
        result[#result + 1] = str
        return result
    end
    --判断separator
    sep = sep or " "
    string.gsub(str, string.format("(.*)%s(.*)", sep), function(s1, s2)
        if s1 ~= "" then
            result[#result + 1] = o
        end
        if s2 ~= "" then
            result[#result + 1] = o
        end
    end)
    return result
end
print(json.encode(split2("31251281272166", "12")))

