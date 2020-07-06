function sum(data)
    if #data == 1 then
        return data[1]
    else
        return table.remove(data) + sum(data)
    end
end
print(sum({1, 2, 3}))
function length(data)
    if data == nil then
        return 0
    elseif #data == 1 then
        return 1;
    else
        table.remove(data)
        return 1 + length(data)
    end
end
print(length({2, 3, 4, 5}))

function max_number(data)
    if #data == 1 then
        return data[1]
    else
        local max = table.remove(data)
        local sub_max = max_number(data)
        if max < sub_max then return sub_max end
        return max
    end
end
print(max_number({2,8,1,9}))