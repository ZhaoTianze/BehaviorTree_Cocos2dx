--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 17:01:32
--
local Wait = class("Wait",b3.Action)

function Wait:onCreate(properties)
	self.endTime = properties.milliseconds or 0
end

function Wait:onOpen(tick)
	local startTime = os.time()
	tick.agent:set("startTime",startTime, tick.tree.id, self.id)
end

function Wait:onTick(tick)
	local currTime = os.time()
	local startTime = tick.agent:get("startTime",tick.tree.id,self.id)
	if currTime - startTime > self.endTime then
		return b3.Com.SUCCESS
	end
	return b3.Com.RUNNING
end

return Wait