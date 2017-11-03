--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

require 'tools/print_table'

local Something = require 'MyOOP/Something'
local Person = require 'MyOOP/Person'
local Superman = require 'MyOOP/Superman'

local something1 = Something:new()
local something2 = Something:new()
local person1 = Person:new()
person1.name = "ethan"
local person2 = Person:new()
person2.name = "ethan2"
person2.nickname = 'nn2'

person1:print_name()
person2:print_name()

local superman1 = Superman:new()
superman1:print_name()

table.print(person1)
table.print(person2)
table.print(superman1)

os.execute('pause')


--endregion
