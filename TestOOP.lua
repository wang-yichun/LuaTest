-- region *.lua
-- Date
-- ���ļ���[BabeLua]����Զ�����


-- Meta class
Shape = { area = 0, side_count = -1}
-- �����෽�� new
function Shape:new(o, side)
    o = o or { }
    setmetatable(o, self)
    self.__index = self
    side = side or 0
    self.area = side * side
    return o
end
-- �����෽�� printArea
function Shape:printArea()
    print("���Ϊ ", self.area)
end

-- ��������
myshape = Shape:new(nil, 10)
myshape:printArea()
table.print(myshape)

Square = Shape:new()
-- �����෽�� new
function Square:new(o, side)
    o = o or Shape:new(o, side)
    local metatable={}
    metatable.__index=self
    setmetatable(o, metatable)
--    self.__index = self
    self.side_count = 2
    return o
end

-- �����෽�� printArea
function Square:printArea()
    print("���������Ϊ ", self.area)
end

-- ��������
mysquare = Square:new(nil, 10)
mysquare:printArea()
table.print(mysquare)


Rectangle = Shape:new()
-- �����෽�� new
function Rectangle:new(o, length, breadth)
    o = o or Shape:new(o)
    local metatable={}
    metatable.__index=self
    setmetatable(o, metatable)
   -- self.__index = self
    self.area = length * breadth
    self.side_count = 2
    return o
end

-- �����෽�� printArea
function Rectangle:printArea()
    print("�������Ϊ ", self.area)
end

-- ��������
myrectangle = Rectangle:new(nil, 10, 20)
myrectangle:printArea()
table.print(myrectangle)

-- endregion
