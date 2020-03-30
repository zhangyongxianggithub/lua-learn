--[[
    第五章练习题
]]
-- 5.1
sunday="monday";monday="sunday"
t={sunday="monday",[sunday]=monday}
print(t.sunday,t[sunday],t[t.sunday])
-- 5.2 
a={};a.a=a
a.a.a.a=3
print(a,a.a)
-- 5.3 转义序列定义键与值
a={["\n"]="\n",["\t"]="\t"}
for k,v in pairs(a) do
    print(k:byte(),v:byte())
end
-- 5.6 array check
is_array=function(t)
    local size=#t
    local count=0
    for k,v in pairs(t) do
        count=count+1
    end
    return size == count
end
print(is_array({1,2,3,aaa="aaa"}))