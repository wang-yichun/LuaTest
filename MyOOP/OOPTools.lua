--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

local OOPTools = {}

function OOPTools.CreateChildClassIndex (obj)
    obj.__index = function(table, key)
        local mt = getmetatable(table)
        if mt[key] ~= nil then
            return mt[key]
        else
            return table.base[key]
        end
    end
    obj.__newindex = function(table, key, value)
        local mt = getmetatable(table)
        if mt[key] ~= nil then
            mt[key] = value
        else
            table.base[key] = value
        end
    end
end

return OOPTools

--endregion
