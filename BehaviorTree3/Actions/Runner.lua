--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-03 16:57:35
--
local Runner = class("Runner",b3.Action)

function Runner:onTick(tick)
	return b3.Com.RUNNING
end

return Runner