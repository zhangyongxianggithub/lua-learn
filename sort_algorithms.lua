function sum(data)
    if #data == 1 then
        return data[1]
    else
        return table.remove(data) + sum(data)
    end
end
print(sum({ 1, 2, 3 }))
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
print(length({ 2, 3, 4, 5 }))

function max_number(data)
    if #data == 1 then
        return data[1]
    else
        local max = table.remove(data)
        local sub_max = max_number(data)
        if max < sub_max then
            return sub_max
        end
        return max
    end
end
print(max_number({ 2, 8, 1, 9 }))

local function swap(array, left, right)
    local tmp = array[left]
    array[left] = array[right]
    array[right] = tmp
end

local function sort(array)
    local pivotValue = array[1]
    local left = 2
    local right = #array
    while left <= right do
        while left <= right and array[left] < pivotValue do
            left = left + 1
        end
        --保持稳定
        while left <= right and array[right] >= pivotValue do
            right = right - 1
        end
        if left <= right then
            swap(array, left, right)
        end
    end
    swap(array, 1, right)
    return right
end
--[[
    快速排序
--]]
function quick_sort(array)
    local start = 1
    local length = #array
    if length > start then
        local pivot = sort(array);
        if start < pivot then
            local left = table.move(array, start, pivot - 1, 1, {})
            table.move(quick_sort(left), start, pivot - 1, 1, array)
        end

        if pivot < length then
            local right = table.move(array, pivot + 1, length, 1, {})
            table.move(quick_sort(right), 1, #right, pivot + 1, array)
        end
    end
    return array
end
print(require("json").encode(quick_sort({ 4, 3, 9, 6, 1, 7, 5 })))

function selection_sort(array)
    for index = 1, #array - 1 do
        local leftSmallest = index
        for leftIndex = leftSmallest + 1, #array do
            if array[leftIndex] < array[leftSmallest] then
                leftSmallest = leftIndex
            end
            swap(array, leftSmallest, index)
        end
    end
    return array
end
print(require("json").encode(selection_sort({ 4, 3, 9, 6, 1, 7, 5 })))
return {
    quick_sort = quick_sort,
    selection_sort = selection_sort,
}
