--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

local OOPTools = require 'MyOOP/OOPTools'

local Superman = {}

local Person = require 'MyOOP/Person'

function Superman:new ()
    local obj = { base = Person:new() }
    setmetatable(obj, self)
    
    OOPTools.CreateChildClassIndex(self)
    return obj
end

return Superman
--endregion
