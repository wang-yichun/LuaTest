--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
local OOPTools = require 'MyOOP/OOPTools'

local Person = {}

local Something = require 'MyOOP/Something'

function Person:new () 
    local obj = { base = Something:new() }
    setmetatable(obj, self)
    OOPTools.CreateChildClassIndex(self)
    return obj
end

function Person:print_name ()
    self.base:print_name()
    print ('Person:print_name: ' .. self.name)
end

return Person 

--endregion
