--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

require 'tools/print_table'

local ReactiveProperty = require 'Reactive/ReactiveProperty'

local rp1 = ReactiveProperty:New(1)

local x = rp1:Subscribe(function(v)
    print 'on next'
    table.print(v)
end, function()
    print 'on error'
end, function()
    print 'on completed'
end)

rp1:Subscribe(function(v)
    print 'on next3'
    table.print(v)
end, function()
    print 'on error3'
end, function()
    print 'on completed3'
end)

rp1:set(2)
rp1:set(0)

rp1_dp:unsubscribe()

rp1:set(3)

rp1:Subscribe(function(v)
    print 'on next2'
    table.print(v)
end, function()
    print 'on error2'
end, function()
    print 'on completed2'
end)


rp1:set(4)
rp1:set(5)

os.execute('pause')
--endregion
