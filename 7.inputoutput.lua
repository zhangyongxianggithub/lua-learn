--[[
练习7.1: 请编写一个程序，该程序读取一个文本文件然后将每行的内容按照字母表顺
序排序后重写该文件 如果在调用时不带参数，则从标准输入读取并向标准输出写入；如果
在调用时传入一个文件名作为参数，则从该文件中读取并向标准输出写入；如果在调用时传
人两个文件名作为参数，则从第 个文件读取并将结果写入到第二个文件中
练习7.2: ：请改写上面的程序，使得当指定的输出文件已经存在时，要求用户进行确认
]]
function sort(file, write_back_file)
    if file ~= nil then
        io.input(io.open(file, "r"))
    end

    if write_back_file ~= nil then
        local output = io.open(write_back_file, "r+")
        if output then
            local current_stream = io.input()
            io.input(io.stdin)
            print("the file " .. write_back_file .. " exists, write it? [yes|no]")
            if io.read("l") == "no" then
                os.exit(0)
            end
            print("write file again！！")
            io.input(current_stream)
        else
            output = io.open(write_back_file, "w")
        end
        io.output(output)
    end
    local lines = {}
    for line in io.lines() do
        table.insert(lines, line)
    end
    table.sort(lines)
    for index, line in ipairs(lines) do
        io.write(line .. "\n")
    end
end
--sort(nil,"test.txt")
--[[
7.4 请编写一个程序，该程序输出 个文本文件的最后一行 当文件较大且可以
使用 seek 时，请尝试避免读取 个文件
7.5 ：请将上面的程序修改得更加通用，使其可以输出一个文本文件的最后
时，当文件较大且可以使用 seek 时，请尝试避免读取整个文件
--]]
function read_last_n_lines(file, n)
    local stream, error, mode = io.open(file, "r")
    if not stream then
        return nil, error
    end
    if not n or math.type(n) ~= "integer" or n < 1 then
        return nil, "n is not a valid number"
    end
    local size = stream:seek("end")
    local last_line = ""
    for po = size, 0, -1 do
        stream:seek("set", po)
        if stream:read(1) == "\n" or po == 0 then
            n = n - 1
            if n == 0 or po == 0 then
                last_line = stream:read("a")
                break
            end
        end
    end
    return last_line
end

print("last line is \n" .. read_last_n_lines("test.txt", 3))
--[[
7.6：使用函数 as.execute io.popen ，分别编写用于创建目录 删除目录和输出
目录内容的函数
]]
function createDir(name)
    local ok, msg, state = os.execute("mkdir " .. name)
    return ok, msg, state
end
print(createDir("test1"))

function deleteDir(name)
    local ok, msg, state = os.execute("rm -rf " .. name)
    return ok, msg, state
end
print(createDir("test1"))
function show(name)
    local result = io.popen("ls " .. name, "r")
    local text = ""
    for line in result:lines() do
        text = text .. tostring(line) .. "\n"
    end
    return text
end
print(show("test"))
os.execute("mv 7.inputoutput.lua test/")
