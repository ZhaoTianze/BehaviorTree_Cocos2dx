--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 20:21:19
--
local Limiter = class("Limiter",b3.Decorator)

function Limiter:onCreate(properties)
	assert(properties.maxLoop,"maxLoop parameter in Limiter decorator is an obligatory parameter")
	self.maxLoop = properties.maxLoop
end

function Limiter:onOpen(tick)
	tick.agent:set("i",1,tick.tree.id,self.id)
end

function Limiter:onTick(tick)
	if not self.child then
		return b3.Com.ERROR
	end

	local i = tick.agent:get("i",tick.tree.id,self.id)

	if i < self.maxLoop then
		local status = self.child:execute(tick)

		if status == b3.Com.SUCCESS or status == b3.Com.FAILURE then
			tick.agent:set("i",i+1,tick.tree.id,self.id)
		end
		return status
	end
	return b3.Com.FAILURE
end

return Limiter