--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 16:22:09
-- 

--[[A new Tick object is instantiated every tick by BehaviorTree. It is passed
as parameter to the nodes through the tree during the traversal.

The role of the Tick class is to store the instances of tree, debug, 
target and blackboard. So, all nodes can access these informations.

For internal uses, the Tick also is useful to store the open node after 
the tick signal, in order to let `BehaviorTree` to keep track and close 
them when necessary.

This class also makes a bridge between nodes and the debug, passing the 
node state to the debug if the last is provided.

@module b3
@class Tick
]]

local Tick = class("Tick")

function Tick:ctor()
    --[[
    The tree reference.
    @property {b3.BehaviorTree} tree
    @readOnly
    ]]
	self.tree = nil
	--[[
    The debug reference.
    @property {Object} debug
    @readOnly
    ]]
    self.debug = nil
    --[[
    The agent object reference. Which include a blackboard
    @property {Object} target
    @readOnly
    ]]
    self.agent = nil
    --[[
    
    ]]
    self.worldBlackboard = nil
    --[[
    The list of open nodes. Update during the tree traversal.
	@property {Array} _openNodes
	@protected
	@readOnly
    ]]
    self.openNodes = {}
    --[[
    The number of nodes entered during the tick. Update during the tree 
    traversal.
    
    @property {Integer} _nodeCount
    @protected
    @readOnly
    ]]
    self.nodeCount = 0
end

function Tick:reset()
	self.tree = nil
	self.openNodes = {}
	self.nodeCount = 0
end
--[[
Called when entering a node (called by BaseNode).
@method _enterNode
@param {Object} node The node that called this method.
@protected
]]
function Tick:enterNode(node)
	self.nodeCount = self.nodeCount + 1
	table.insert(self.openNodes,node)
	--TODO:call debug here
end
--[[
Called when entering a node (called by BaseNode).
@method _enterNode
@param {Object} node The node that called this method.
@protected
]]
function Tick:openNode(node)
	--TODO:call debug here
end
--[[
Callback when ticking a node (called by BaseNode).
@method _tickNode
@param {Object} node The node that called this method.
@protected
]]
function Tick:tickNode(node,result)
	--TODO:call debug here
end
--[[
Callback when closing a node (called by BaseNode).
@method _closeNode
@param {Object} node The node that called this method.
@protected
]]
function Tick:closeNode(node)
	--remove last node
	table.remove(self.openNodes,#self.openNodes)
	--TODO:call debug here
end
--[[
Callback when exiting a node (called by BaseNode).
@method _exitNode
@param {Object} node The node that called this method.
@protected
]]
function Tick:exitNode(node)
	--TODO:call debug here
end
return Tick