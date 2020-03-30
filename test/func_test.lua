

local match_res = string.find('cookies/dadas', '^cookies/.*')
print(match_res)

t={1,2, 3,[5]=22,ddd='dadsa',[11]=22}
print(#t)
for i,v in ipairs(t) do
    print(i,v)
end

for i,v in pairs(t) do
    print(i,v)
end