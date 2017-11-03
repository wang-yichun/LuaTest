-- region *.lua
-- Date
-- ���ļ���[BabeLua]����Զ�����

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

mytable.newkey = "��ֵ2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "��ֵ1"
print(mytable.key1, mymetatable.key1)

table.print(mytable, mymetatable)

print '--- Test 4'

mytable = setmetatable( { key1 = "value1" }, {
    __newindex = function(mytable, key, value)
        -- һ��ԭʼ�ķ���
        -- ����__newindexԪ���������Ե���rawset(t, k, v)�����������Բ��漰�κ�Ԫ������ֱ������table t����key k�������value v
        rawset(mytable, key, "\"" .. value .. "\"")

    end
} )

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1, mytable.key2)

print '--- Test 5'
-- ����������ֵ��table.maxn��Lua5.2���ϰ汾�����޷�ʹ��
-- �Զ�������������ֵ���� table_maxn����������Ԫ�ظ���
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- ������Ӳ���
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
-- ����������ֵ��table.maxn��Lua5.2���ϰ汾�����޷�ʹ��
-- �Զ�������������ֵ���� table_maxn����������Ԫ�ظ���
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- ����Ԫ����__call
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
    return "������Ԫ�صĺ�Ϊ " .. sum
  end
})
print(mytable)

print '--- Test OOP'
require 'TestOOP'

os.execute('pause')
-- endregion
