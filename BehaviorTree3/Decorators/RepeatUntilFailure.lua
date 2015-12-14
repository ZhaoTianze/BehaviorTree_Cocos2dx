--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 20:42:15
--
local RepeatUntilFailure = class("RepeatUntilFailure",b3.Decorator)

function RepeatUntilFailure:onCreate(properties)
	assert(properties.maxLoop,"maxLoop parameter in maxLoop decorator is an obligatory parameter")
	self.maxLoop = properties.maxLoop or -1
end

function RepeatUntilFailure:onOpen(tick)
	tick.agent:set("i",1,tick.tree.id,self.id)
end

function RepeatUntilFailure:onTick(tick)
	if not self.child then
		return b3.Com.ERROR
	end
	local i = tick.agent:get("i",tick.tree.id,self.id)
	local status = b3.Com.ERROR

	while self.maxLoop < 0 or i < self.maxLoop do
		status = self.child:execute(tick)
		if status == b3.Com.SUCCESS then
			i = i + 1
		else
			break
		end
	end
	tick.agent:set("i",i,tick.tree.id,self.id)
	return status
end

return RepeatUntilFailure