function test( ... )
    for _,v in pairs({...})do
        print(_,v)
    end
end
print(test(1,2,nil,4,5))
local json=require("..json")
t={['$1111']='ddasd'}
print(json.encode(t))
function deep_copy(object)      
    local search_table = {}  

    local function local_copy(object)  
        if type(object) ~= "table" then  
            return object         
        end  
        local new_table = {}  
        search_table[object] = new_table  
        for k, v in pairs(object) do  
            new_table[local_copy(k)] = local_copy(v)  
        end     
       
        return setmetatable(new_table, getmetatable(object))      
    end    
  
    return local_copy(object)  
end   
print(tostring(deep_copy(nil)))