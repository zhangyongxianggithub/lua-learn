

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

function DeepCopy(object)      
    local SearchTable = {}  

    local function Func(object)  
        if type(object) ~= "table" then  
            return object         
        end  
        local NewTable = {}  
        SearchTable[object] = NewTable  
        for k, v in pairs(object) do  
            NewTable[Func(k)] = Func(v)  
        end     
       
        return setmetatable(NewTable, getmetatable(object))      
    end    
  
    return Func(object)  
end   