-- region *.lua
-- Date
-- 此文件由[BabeLua]插件自动生成

require 'tools/print_table'

print '--- Test 1'

other = { foo = 3 }
t = setmetatable( { }, { __index = other })
print(t.foo, t.bar)
table.print(t)

print '--- Test 2'

mytable = setmetatable( { key1 = "value1" }, {
    __index = function(mytable, key)
        if key == "key2" then
            return { mytable.key1, mytable.key3, "metatablevalue" }
        elseif key == 'key3' then
            return 'value3'
        end
    end
} )

table.print(mytable.key1, mytable.key2)


print '--- Test 3'

mymetatable = { }
mytable = setmetatable( { key1 = "value1" }, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1, mymetatable.key1)

table.print(mytable, mymetatable)

print '--- Test 4'

mytable = setmetatable( { key1 = "value1" }, {
    __newindex = function(mytable, key, value)
        -- 一次原始的访问
        -- 对于__newindex元方法，可以调用rawset(t, k, v)函数，它可以不涉及任何元方法而直接设置table t中与key k相关联的value v
        rawset(mytable, key, "\"" .. value .. "\"")

    end
} )

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1, mytable.key2)

print '--- Test 5'
-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 两表相加操作
mytable = setmetatable( { 1, 2, 3 }, {
    __add = function(mytable, newtable)
        for i = 1, table_maxn(newtable) do
            table.insert(mytable, table_maxn(mytable) + 1, newtable[i])
        end
        return mytable
    end
} )

secondtable = { 4, 5, 6 }

mytable = mytable + secondtable
table.print(mytable)

print '--- Test 6'
-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 定义元方法__call
mytable = setmetatable({10}, {
  __call = function(mytable, newtable)
    sum = 0
    for i = 1, table_maxn(mytable) do
        sum = sum + mytable[i]
    end
    for i = 1, table_maxn(newtable) do
        sum = sum + newtable[i]
    end
    return sum
  end
})
newtable = {10,20,30}
print(mytable(newtable))


print '--- Test 7'
mytable = setmetatable({ 10, 20, 30 }, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
        sum = sum + v
    end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable)

print '--- Test OOP'
require 'TestOOP'

os.execute('pause')
-- endregion
