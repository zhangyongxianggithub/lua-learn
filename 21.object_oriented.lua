Account={balance=0}
function  Account.withdraw( v )
    Account.balance=Account.balance-v
end
function Account:deposit(v)
    self.balance=self.balance+v
end
print(Account.balance)
Account.withdraw(100.00)


local mt={__index=Account}
function Account.new(o)
    o=o or {}
    o=setmetatable(o, mt)
    return o;
end
a=Account.new({balance=1})
a:deposit(100)
print(a.balance)