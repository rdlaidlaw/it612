local scores = {88, 94, 76, 91}

for i, score in ipairs(scores) do
    print(i, score)
end

local defaults = {lang = "lua"}
local student = {name = "alice"}

setmetatable(student, {__index = defaults})

print(student.name)
print(student.lang)