
local Rx = require 'LuaScriptsRxLua/rx'

local ReactiveCommand = { }

function ReactiveCommand:New()

    local rc = { }
    setmetatable(rc, self)
    self.__index = self

    rc.trigger = nil
    rc.isDisposed = false
    rc.canExecuteOnSubscribe = canExecuteOnSubscribe

    return rc
end

function ReactiveCommand:Execute(...)
    if self.isDisposed then return false end
    if self.trigger ~= nil then
        local p = { v = ..., r = { } }
        self.trigger:onNext(p)
        return true, p.r
    end
    return false
end

function ReactiveCommand:Subscribe(onNext)
    if self.trigger == nil then
        self.trigger = Rx.Subject.create()
    end
    local disposable = self.trigger:subscribe(onNext, onError, onCompleted)
    return disposable
end

function ReactiveCommand:Complete()
    if self.trigger ~= nil then
        self.trigger:onCompleted()
    end
    self.trigger = nil
end

function ReactiveCommand:Dispose()
    if self.isDisposed then return end
    self.isDisposed = true
end

return ReactiveCommand