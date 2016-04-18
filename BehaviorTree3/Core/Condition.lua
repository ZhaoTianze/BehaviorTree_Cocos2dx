--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 15:03:13
--
local Condition = class("Condition",b3.BaseNode)

function Condition:ctor(nodeData)
	Condition.super.ctor(self,nodeData)
	self.category = b3.Com.CONDITION
end

function Condition:onTick(tick)
	return b3.Com.SUCCESS
end

return Condition