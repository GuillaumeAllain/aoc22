local file = vim.fn.readfile("data/day1.dat")
local num = 0
local nummax = { 0, 0, 0 }
local function listmax(localtable, localnummax)
    for i = 1, 3 do
        if localnummax > localtable[i] then
            for j = 3, i + 1, -1 do
                localtable[j] = localtable[j - 1]
            end
            localtable[i] = localnummax
            break
        end
    end
    return localtable
end

for _, line in ipairs(file) do
    if line == "" then
        nummax = listmax(nummax, num)
        num = 0
    else
        num = num + tonumber(line)
    end
end
nummax = listmax(nummax, num)

print(nummax[1])
print(nummax[1] + nummax[2] + nummax[3])
