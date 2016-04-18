--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-02 15:35:49
-- BehaviorTree3 init && require lua file
b3         				= {}
b3.Com 					= require('cocos.framework.BehaviorTree3.Com')
		
--core		
b3.BaseNode 			= require('cocos.framework.BehaviorTree3.Core.BaseNode')
b3.Action 				= require('cocos.framework.BehaviorTree3.Core.Action')
b3.Decorator 			= require('cocos.framework.BehaviorTree3.Core.Decorator')
b3.Condition 			= require('cocos.framework.BehaviorTree3.Core.Condition')
b3.Composite 			= require('cocos.framework.BehaviorTree3.Core.Composite')
b3.BehaviorTree 		= require('cocos.framework.BehaviorTree3.Core.BehaviorTree')
b3.Blackborad 			= require('cocos.framework.BehaviorTree3.Core.Blackborad')
b3.Tick 				= require('cocos.framework.BehaviorTree3.Core.Tick')
		
--Action		
b3.Error 				= require('cocos.framework.BehaviorTree3.Actions.Error')
b3.Failer 				= require('cocos.framework.BehaviorTree3.Actions.Failer')
b3.Runner 				= require('cocos.framework.BehaviorTree3.Actions.Runner')
b3.Succeeder 			= require('cocos.framework.BehaviorTree3.Actions.Succeeder')
b3.Wait 				= require('cocos.framework.BehaviorTree3.Actions.Wait')
		
--Composites		
b3.Sequence 			= require('cocos.framework.BehaviorTree3.Composites.Sequence')
b3.Priority 			= require('cocos.framework.BehaviorTree3.Composites.Priority')
b3.MemSequence 			= require('cocos.framework.BehaviorTree3.Composites.MemSequence')
b3.MemPriority  		= require('cocos.framework.BehaviorTree3.Composites.MemPriority')
b3.WeightSelector 		= require('cocos.framework.BehaviorTree3.Composites.WeightSelector')
		
--Decorators		
b3.Inverter 			= require('cocos.framework.BehaviorTree3.Decorators.Inverter')
b3.Limiter 				= require('cocos.framework.BehaviorTree3.Decorators.Limiter')
b3.MaxTime 				= require('cocos.framework.BehaviorTree3.Decorators.MaxTime')
b3.Repeater 			= require('cocos.framework.BehaviorTree3.Decorators.Repeater')
b3.RepeatUntilFailure 	= require('cocos.framework.BehaviorTree3.Decorators.RepeatUntilFailure')
b3.RepeatUntilSuccess 	= require('cocos.framework.BehaviorTree3.Decorators.RepeatUntilSuccess')
