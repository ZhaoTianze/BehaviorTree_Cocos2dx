--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 20:26:26
--
local MaxTime = class("MaxTime",b3.Decorator)

function MaxTime:onCreate(properties)
	assert(properties.maxTime, "maxTime parameter in MaxTime decorator is an obligatory parameter")
	self.maxTime = params.maxTime
end

function MaxTime:onOpen(tick)
	local startTime = os.time()
	tick.agent:set("startTime",startTime,tick.tree.id,self.id)
end

function MaxTime:onTick(tick)
	if not self.child then
		return b3.Com.ERROR
	end

	local currTime = os.time()
	local startTime = tick.agent:get("startTime",tick.tree.id,self.id)

	if currTime - startTime > self.maxTime then
		return b3.Com.FAILURE
	end

	local status = self.child:execute(tick)
	
	return status
end

return MaxTime