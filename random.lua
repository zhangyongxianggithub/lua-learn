local STATUS = { 200, 202, 404, 500, 502, 403, 302, 307 }
math.randomseed(os.time())
print(STATUS[math.random(8)])