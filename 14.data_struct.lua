local json = require("json")
-- 常规的矩阵实现方式
-- 换算成单行的实现方式
--[[function testMatrix(N,M)
    local mt = {}
    for i = 1, N do
        -- 创建矩阵
        local aux = (i-1) *M
        for j = 1, M do
            mt[aux + j]=0
        end
    end
    return mt
end
print(json.encode(testMatrix(3,3)))
--]]
--[[
    练习 14.1 ：请编写一个函数，该函数用于两个稀疏矩阵相加
--]]
function add(m1, m2)
    local m = {}
    for k, r in pairs(m1) do
        local row = {}
        m[k] = row
        for c, v in ipairs(r) do
            row[c] = v
        end
        for c, v in ipairs(m2[k]) do
            if row[c] then
                row[c] = row[c] + v
            else
                row[c] = v
            end
        end
    end
    return m;
end

--[[
    练习 14.2 ：改写示例 14.2 中队列的实现，使得当队列为空时两个索引都返回0
    
    改写了一下，双向写入应该都没问题
-- ]]
function listNew()
    return { first = 0, last = 0 }
end
function pushFirst(list, value)
    list[list.first] = value
    if list.first == list.last then
        -- 判断是否是空
        list.last = list.last + 1
    end
    list.first = list.first - 1
end
function pushLast(list, value)
    list[list.last] = value
    if list.first == list.last then
        list.first = list.first - 1
    end
    list.last = list.last + 1
end
function popFirst(list)
    if list.first >= list.last then
        error("queue is empty")
    end
    local first_value=list.first+1;
    local value = list[first_value]
    list[first_value] = nil
    list.first = first_value
    return value
end
function popLast()
    if list.last <= list.first then
        error("queue is empty")
    end
    local value = list[list.last-1]
    list[list.last-1] = nil
    list.last = list.last - 1
    return value
end


