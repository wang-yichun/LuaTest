-- region *.lua
-- Date
-- 此文件由[BabeLua]插件自动生成

require 'tools/print_table'

local ReactiveCommand = require 'Reactive/ReactiveCommand'

local rc1 = ReactiveCommand:New()

rc1:Subscribe( function(p)
    print ('on next', p.v)
    p.r.c = p.r.c == nil and 1 or p.r.c + 1
end , function()
    print 'on error'
end , function()
    print 'on completed'
end )

local rc1_dp = rc1:Subscribe( function(p)
    print ('on next2', p.v)
    p.r.c = p.r.c == nil and 1 or p.r.c + 1
end , function()
    print 'on error2'
end , function()
    print 'on completed2'
end )

local _, result = rc1:Execute( { a = 1, b = 2 })
table.print(result)

rc1_dp:unsubscribe()

local _, result = rc1:Execute( { a = 1, b = 2 })
table.print(result)



os.execute('pause')
-- endregion
