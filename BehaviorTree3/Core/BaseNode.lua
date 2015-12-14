--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-02 15:16:40
--
local BaseNode = class("BaseNode")

function BaseNode:ctor(nodeData)
	nodeData = nodeData or {}
	self.id 		  = nodeData.id or b3.Com.createUUID()
	self.name 		  = nodeData.name or ""
	self.title 		  = nodeData.title or ""
	self.description  = nodeData.description or ""
	self.parameters   = nodeData.parameters or {}
	self.properties   = nodeData.properties or {}
	self.category 	  = nil
	self.weight 	  = nodeData.properties.weight or b3.Com.Default_Weight --随机权重

	self:onCreate(self.properties)
end

function BaseNode:onCreate(nodeData)
end

function BaseNode:execute(tick)
	--Enter
	self:enter(tick)
	--open
	if not tick.agent:get("isOpen",tick.tree.id,self.id) then
		self:open(tick)
	end
	--tick
	local status = self:tick(tick)
	--close
	if status ~= b3.Com.RUNNING then
		self:close(tick)
	end
	--exit
	self:exit(tick)

	return status
end

--[[Wrapper for enter method.
@method _enter
@param {Tick} tick A tick instance.
@protected
]]
function BaseNode:enter(tick)
	tick:enterNode(self)
	self:onEnter(tick)
end

--[[Wrapper for enter method.
@method _enter
@param {Tick} tick A tick instance.
@protected
]]
function BaseNode:open(tick)
	tick:openNode(self)
	tick.agent:set("isOpen", true, tick.tree.id, self.id)
	self:onOpen(tick)
end

--[[Wrapper for tick method.
@method _tick
@param {Tick} tick A tick instance.
@return {Constant} A state constant.
@protected
]]
function BaseNode:tick(tick)
	local result = self:onTick(tick)
	tick:tickNode(self,result)
	return result
end

--[[Wrapper for close method.
@method _close
@param {Tick} tick A tick instance.
@protected
]]
function BaseNode:close(tick)
	tick:closeNode(self)
	tick.agent:set("isOpen", false, tick.tree.id, self.id)
	self:onClose(tick)
end

--[[
Wrapper for exit method.
@method _exit
@param {Tick} tick A tick instance.
@protected
]]
function BaseNode:exit(tick)
	tick:exitNode(self)
	self:onExit(tick)
end

--[[
Enter method, override this to use. It is called every time a node is 
asked to execute, before the tick itself.
@method enter
@param {Tick} tick A tick instance.
]]
function BaseNode:onEnter(tick)
end

--[[
Open method, override this to use. It is called only before the tick 
callback and only if the not isn't closed.
Note: a node will be closed if it returned `b3.RUNNING` in the tick.
@method open
@param {Tick} tick A tick instance.
]]
function BaseNode:onOpen(tick)
end

--[[
Tick method, override this to use. This method must contain the real 
execution of node (perform a task, call children, etc.). It is called
every time a node is asked to execute.
@method tick
@param {Tick} tick A tick instance.
]]
function BaseNode:onTick(tick)
end
--[[
Close method, override this to use. This method is called after the tick
callback, and only if the tick return a state different from 
`b3.RUNNING`.
@method close
@param {Tick} tick A tick instance.
]]
function BaseNode:onClose(tick)
end
--[[
Exit method, override this to use. Called every time in the end of the 
execution.
@method exit
@param {Tick} tick A tick instance.
]]
function BaseNode:onExit(tick)
end

return BaseNode