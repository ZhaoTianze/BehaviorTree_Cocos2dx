--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 12:31:24
--
local Decorator = class("Decorator",b3.BaseNode)

function Decorator:ctor(nodeData)
	Decorator.super.ctor(self,nodeData)
	self.category = b3.Com.DECORATOR
	self.child = nil --存放唯一子节点
end

return Decorator