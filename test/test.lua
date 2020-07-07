local m = require("math")
print(m.sin(3.14))
function test(param)
    print(param)
end
test(nil, "second param")

list = { val = 1, next = { val = 2, next = { val = 3 } } }

function getnext(head, node)
    return node.next
end
function traverse(list)
    return getnext, nil, list
end
for node in traverse(list) do
    print(node.val)
end