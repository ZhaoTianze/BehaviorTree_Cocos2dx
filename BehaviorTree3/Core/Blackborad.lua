--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 14:08:24
--
local Blackborad = class("Blackborad")

function Blackborad:ctor()
	self.baseMemory = {}
	self.treeMemory = {}
end

--[[Internal method to retrieve the tree context memory. If the memory does
not exist, this method creates it.

@method _getTreeMemory
@param {string} treeScope The id of the tree in scope.
@return {Object} The tree memory.
@protected
]]

function Blackborad:getTreeMemory_(treeScope)
	if not self.treeMemory[treeScope] then
		self.treeMemory[treeScope] = {}
		self.treeMemory[treeScope].nodeMemory = {}
		self.treeMemory[treeScope].openNodes = {}
		self.traversalDepth = 0
		self.traversalCycle = 0
	end
	return self.treeMemory[treeScope]
end

--[[Internal method to retrieve the node context memory, given the tree 
memory. If the memory does not exist, this method creates is.

@method _getNodeMemory
@param {String} treeMemory the tree memory.
@param {String} nodeScope The id of the node in scope.
@return {Object} The node memory.
@protected
]]

function Blackborad:getNodeMemory_(treeeMemory, nodeScope)
	local memory = treeeMemory.nodeMemory
	memory[nodeScope] = memory[nodeScope] or {} 
	return memory[nodeScope]
end


--[[Internal method to retrieve the context memory. If treeScope and 
nodeScope are provided, this method returns the per node per tree 
memory. If only the treeScope is provided, it returns the per tree 
memory. If no parameter is provided, it returns the global memory. 
Notice that, if only nodeScope is provided, this method will still 
return the global memory.

@method _getMemory
@param {String} treeScope The id of the tree scope.
@param {String} nodeScope The id of the node scope.
@return {Object} A memory object.
@protected
]]

function Blackborad:getMemory_(treeScope,nodeScope)
	local memory = self.baseMemory
	if treeScope then
		memory = self:getTreeMemory_(treeScope)
		if nodeScope then
			assert(memory,string.format("treeMemory = %s",tostring(memory)))
			memory = self:getNodeMemory_(memory, nodeScope)
		end
	end
	return memory
end

--[[Stores a value in the blackboard. If treeScope and nodeScope are 
provided, this method will save the value into the per node per tree 
memory. If only the treeScope is provided, it will save the value into 
the per tree memory. If no parameter is provided, this method will save 
the value into the global memory. Notice that, if only nodeScope is 
provided (but treeScope not), this method will still save the value into
the global memory.

@method set
@param {String} key The key to be stored.
@param {String} value The value to be stored.
@param {String} treeScope The tree id if accessing the tree or node 
                          memory.
@param {String} nodeScope The node id if accessing the node memory.
]]


function Blackborad:set(key,value,treeScope, nodeScope)
	local memory = self:getMemory_(treeScope, nodeScope)
	memory[key] = value
end

--[[Retrieves a value in the blackboard. If treeScope and nodeScope are
provided, this method will retrieve the value from the per node per tree
memory. If only the treeScope is provided, it will retrieve the value
from the per tree memory. If no parameter is provided, this method will
retrieve from the global memory. If only nodeScope is provided (but
treeScope not), this method will still try to retrieve from the global
memory.

@method get
@param {String} key The key to be retrieved.
@param {String} treeScope The tree id if accessing the tree or node 
                          memory.
@param {String} nodeScope The node id if accessing the node memory.
@return {Object} The value stored or undefined.
]]

function Blackborad:get(key,treeScope,nodeScope)
	local memory = self:getMemory_(treeScope, nodeScope)
	return memory[key]
end

return Blackborad