--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 11:40:57
--
local Composite = class("Composite",b3.BaseNode)

function Composite:ctor(nodeData)
	Composite.super.ctor(self,nodeData)
	self.category = b3.Com.COMPOSITE
	self.children = {} --存放子节点
end

return Composite