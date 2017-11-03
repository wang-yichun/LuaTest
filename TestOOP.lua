-- region *.lua
-- Date
-- 此文件由[BabeLua]插件自动生成


-- Meta class
Shape = { area = 0, side_count = -1}
-- 基础类方法 new
function Shape:new(o, side)
    o = o or { }
    setmetatable(o, self)
    self.__index = self
    side = side or 0
    self.area = side * side
    return o
end
-- 基础类方法 printArea
function Shape:printArea()
    print("面积为 ", self.area)
end

-- 创建对象
myshape = Shape:new(nil, 10)
myshape:printArea()
table.print(myshape)

Square = Shape:new()
-- 派生类方法 new
function Square:new(o, side)
    o = o or Shape:new(o, side)
    local metatable={}
    metatable.__index=self
    setmetatable(o, metatable)
--    self.__index = self
    self.side_count = 2
    return o
end

-- 派生类方法 printArea
function Square:printArea()
    print("正方形面积为 ", self.area)
end

-- 创建对象
mysquare = Square:new(nil, 10)
mysquare:printArea()
table.print(mysquare)


Rectangle = Shape:new()
-- 派生类方法 new
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

-- 派生类方法 printArea
function Rectangle:printArea()
    print("矩形面积为 ", self.area)
end

-- 创建对象
myrectangle = Rectangle:new(nil, 10, 20)
myrectangle:printArea()
table.print(myrectangle)

-- endregion
