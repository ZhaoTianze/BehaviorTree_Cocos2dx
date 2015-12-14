--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 18:10:49
--
local MemSequence = class("MemSequence",b3.Composite)

function MemSequence:onOpen(tick)
	tick.agent:set("runningChild",1,tick.tree.id,self.id)
end

function MemSequence:onTick(tick)
	local child = tick.agent:get("runningChild",tick.tree.id,self.id)
	for i=child,#self.children do
		local status = self.children[i]:execute(tick)

		if status ~= b3.Com.SUCCESS then
			if status == b3.Com.RUNNING then
				tick.agent:set("runningChild",i,tick.tree.id,self.id)
			end
			return status
		end
	end
	return b3.Com.SUCCESS
end

return MemSequence