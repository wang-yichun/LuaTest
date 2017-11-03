
local Rx = require 'LuaScriptsRxLua/rx'

local ReactiveProperty = { }

function ReactiveProperty:New(initialValue, canPublishValueOnSubscribe)

    if canPublishValueOnSubscribe == nil then canPublishValueOnSubscribe = true end

    local rp = { }
    setmetatable(rp, self)
    self.__index = self

    rp.publisher = nil
    rp.isDisposed = false
    rp.canPublishValueOnSubscribe = canPublishValueOnSubscribe

    rp:SetValue(initialValue)
    return rp
end

function ReactiveProperty:SetValue(value)
    if self.value ~= value then
        self.lastValue = self.value
        self.value = value
        if self.isDisposed then return end
        if self.publisher ~= nil then
            self.publisher:onNext( { v = self.value, lv = self.lastValue })
        end
    end
end

ReactiveProperty.set = ReactiveProperty.SetValue

function ReactiveProperty:SetValueAndForceNotify(value)
    self.value = value
    if self.isDisposed then return end
    if self.publisher ~= nil then
        self.publisher:onNext( { v = self.value, lv = self.lastValue })
    end
end

ReactiveProperty.forceSet = ReactiveProperty.SetValueAndForceNotify

function ReactiveProperty:GetValue()
    return self.value
end

ReactiveProperty.get = ReactiveProperty.GetValue

function ReactiveProperty:Subscribe(onNext, onError, onCompleted)
    if self.publisher == nil then
        self.publisher = Rx.Subject.create()
    end

    local disposable = self.publisher:subscribe(onNext, onError, onCompleted)
    if self.canPublishValueOnSubscribe then
        self.publisher:onNext( { v = self.value, lv = self.lastValue })
    end

    return disposable;
end

function ReactiveProperty:Complete()
    self.publisher:onCompleted()
    self.publisher = nil;
end

function ReactiveProperty:Dispose()
    if not self.isDisposed then
        self.isDisposed = true
        if self.publisher ~= nil then
            self.publisher:onCompleted()
        end
        self.publisher = nil;
    end
end

return ReactiveProperty