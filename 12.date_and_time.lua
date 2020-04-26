local json = require("json")
--[[
练习 12.l ：请编写一个函数，该函数返回指定日期和时间后恰好一个月的日期和时间
（假设日期和时间使用数字形式表示）
]]
--[[
    表的形式不包括时区
    lua语言的2种表示形式：数字形式，表的形式{year=11111,month=11}
    函数：os.time([table])
    函数：os.date(fmt,数字形式)， UTC格式对其进行解析

    os.date()对于字段有限制；
    os.time()对于传入的字段不需要归一化；

]]
local t = os.date("*t")
print(t.day, t.month)
t.day = t.day - 40
print(t.day, t.month)
t = os.date("*t", os.time(t))
print(t.day, t.month)
local now = os.date("*t")
now.month = now.month + 1
print(os.date("%c", os.time(now)))
--[[
    练习 12.2 ：请编写一个函数，该函数返回指定日期是星期几（用整数表示， 表示星期
天）
]]
function wday(year, month, day)
    local d = {year = year, month = month, day = day}
    local date = os.date("*t", os.time(d))
    print(date.wday)
end
print("今天是一个星期的第几天：", wday(2020, 4, 26))
--[[
    练习 12.3 ：请编写一个函数，该函数的参数为一个日期和时间（使用数值表示），返回
当天中已经经过的秒数
]]
function seconds(date, time)
    local s, e, year, month, day = string.find(date, "^(%d+)/(%d+)/(%d+)$")
    local s, e, hour, minites, seconds = string.find(date, "^(%d+):(%d+):(%d+)$")
    local dt = {
        year = tonumber(year),
        month = tonumber(month),
        day = tonumber(day),
        hour = tonumber(hour),
        minites = tonumber(minites),
        seconds = tonumber(seconds)
    }
    print("相差的秒数：", math.abs(os.difftime(os.time(), os.time(dt))))
end
print(seconds("2022/2/1", "4:5:1"))
--[[
    练习 12.4 ：请编写一个函数，该函数的参数为年，返回该年中第一个星期五是第几天
]]
function friday(year)
    local date = {year = year, month = 1, day = 1}
    date = os.date("*t", os.time(date))
    date.day = date.day + 6 - date.wday
    date = os.date("*t", os.time(date))
    print(json.encode(date))
    print("第一个星期五是第几天：" .. date.yday)
end
friday(2020)
--[[
    练习 12.5 请编写一个函数，该函数用于计算两个指定日期之间相差的天数。
]]
function diffday(d1, d2)
    local s, e, year, month, day = string.find(d1, "^(%d+)/(%d+)/(%d+)$")
    local day1 = {year = year, month = month, day = day}
    s, e, year, month, day = string.find(d2, "^(%d+)/(%d+)/(%d+)$")
    local day2 = {year = year, month = month, day = day}
    print("相差的天数：", math.abs(os.difftime(os.time(day1), os.time(day2)) // 86400))
end
diffday("2019/12/1", "2020/4/26")
--[[
    练习 12.6 ：请编写一个函数，该函数用于计算两个指定日期之间相差的月份
]]
function diffmonth(m1, m2)
    local s, e, year, month, day = string.find(m1, "^(%d+)/(%d+)/(%d+)$")
    local day1 = {year = year, month = month, day = day}
    day1 = os.date("*t", os.time(day1))
    s, e, year, month, day = string.find(m2, "^(%d+)/(%d+)/(%d+)$")
    local day2 = {year = year, month = month, day = day}
    day2 = os.date("*t", os.time(day2))
    if day1.year > day2.year then
        print("相差的月数：", (12 * day1.year + day1.month) - (day2.year * 12 + day2.month))
    else
        print("相差的月数：", (12 * day2.year + day2.month) - (12 * day1.year + day1.month))
    end
end
diffmonth("2019/12/1", "2020/4/26")
--[[
    练习 12.7 ：向指定日期增加一个月再增加一天得到的结果，是否与先增加一天再增加一
个月得到的结果相同？
]]
function equal(d)
    local s, e, year, month, day = string.find(d, "^(%d+)/(%d+)/(%d+)$")
    local day1 = {year = year, month = month, day = day}
    day1 = os.date("*t", os.time(day1))
    day1.month = day1.month + 1
    day1 = os.date("*t", os.time(day1))
    day1.day = day1.day + 1
    day1 = os.time(day1)
    local day2 = {year = year, month = month, day = day}
    day2 = os.date("*t", os.time(day2))
    day2.day = day2.day + 1
    day2 = os.date("*t", os.time(day2))
    day2.month = day2.month + 1
    day2 = os.time(day2)
    return day1 == day2
end
print(equal("2020/4/26"))
--[[
    练习 12.8 ：请编写一个函数，该函数用于输出操作系统的时区
]]
print(os.date("%z", os.time()))
