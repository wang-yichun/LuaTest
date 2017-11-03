--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

local Something = {}

function Something:new ()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.name = 'default name'
    return obj
end

function Something:print_name ()
    print ('Something.print_name: ' .. self.name)
end

return Something

--endregion
