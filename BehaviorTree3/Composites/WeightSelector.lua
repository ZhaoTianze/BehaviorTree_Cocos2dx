--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-04 11:00:50
--
local WeightSelector = class("WeightSelector",b3.Composite)

function WeightSelector:onOpen(tick)
	printf("WeightSelector:onOpen")
	tick.agent:set("runningChild",nil,tick.tree.id,self.id)
end

function WeightSelector:onTick(tick)
	--优先选择上次正在执行中的节点
	local childIndex = tick.agent:get("runningChild",tick.tree.id,self.id)
	if childIndex then
		return self.children[childIndex]:execute(tick)
	end
	if not self.totalWeight then
		local totalWeight = 0
		for i=1,#self.children do
			local child = self.children[i]
			totalWeight = totalWeight + child.weight
		end
		self.totalWeight = totalWeight
	end
	local randomValue = math.random(1,self.totalWeight)
	local currentWeight = 0
	for i=1,#self.children do
		local child = self.children[i]
		currentWeight = currentWeight + child.weight
		if currentWeight >= randomValue then
			printf("选择节点：%d",i)
			local status = child:execute(tick)
			printf("status = %d", status)
			if status == b3.Com.RUNNING then
				printf("设置running节点")
				tick.agent:set("runningChild",i,tick.tree.id,self.id)
			end
			return status
		end
	end
	return b3.Com.ERROR
end

return WeightSelector