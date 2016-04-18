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
	--初始化权重值
	if not self.totalWeight then
		local totalWeight = 0
		for i=1,#self.children do
			local child = self.children[i]
			totalWeight = totalWeight + child.weight
		end
		self.totalWeight = totalWeight
	end
	--优先选择上次正在执行中的节点
	local childIndex = tick.agent:get("runningChild",tick.tree.id,self.id)
	if not childIndex then
		-- return self.children[childIndex]:execute(tick)
		local randomValue = math.random(1,self.totalWeight)
		local currentWeight = 0
		for i=1,#self.children do
			local child = self.children[i]
			currentWeight = currentWeight + child.weight
			if currentWeight >= randomValue then
				childIndex = i
				break
			end
		end
	end
	--从childIndex开始遍历执行execute，当某一节点返回非FAILURE的时候结束遍历并返回
	for i=childIndex,#self.children do
		local status = self:executeChild(i,tick)
		if status ~= b3.Com.FAILURE then
			return status
		end
	end
	--从1到 childIndex - 1 遍历
	for i=1,childIndex - 1 do
		local status = self:executeChild(i, tick)
		if status ~= b3.Com.FAILURE then
			return status
		end
	end
	
	return b3.Com.FAILURE
end

function WeightSelector:executeChild(index,tick)
	local status = self.children[index]:execute(tick)
	if status == b3.Com.RUNNING then
		tick.agent:set("runningChild",index,tick.tree.id,self.id)
	end
	return status
end

return WeightSelector