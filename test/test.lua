io.input("data.txt")
local f=io.open("data.txt")
-- 需要调用冒号的操作,预定义的流的句柄：stdin,stdout,stderr
local text=f:read("a")
io.stderr:write(text)
print(text)