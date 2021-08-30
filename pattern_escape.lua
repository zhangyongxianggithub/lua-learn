local mete_char = {
    ["("] = true,
    [")"] = true,
    ["."] = true,
    ["%"] = true,
    ["+"] = true,
    ["-"] = true,
    ["*"] = true,
    ["?"] = true,
    ["["] = true,
    ["^"] = true,
    ["$"] = true
}

local function escape(str)
    local final_str = ""
    for index = 1, #str do
        local char = string.sub(str, index, index)
        if mete_char[char] then
            final_str = final_str .. "%" .. char
        else
            final_str = final_str .. char
        end
    end
    return final_str
end
print(escape("()"))
pattern = string.format("^%s(%%d*)(.*)%s$", escape("[[]]11"), escape("1212"))
print(pattern)
print(string.find("[[]]11111231{}}111121212", pattern))
